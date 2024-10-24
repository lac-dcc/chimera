module top
#(parameter param100 = ({((((8'ha3) ? (8'hb3) : (8'hbf)) ? (8'hab) : (|(8'hbf))) ? (&((8'hb2) == (8'hbc))) : {((8'hb5) ? (8'h9c) : (8'ha4)), {(8'h9f)}})} ? {((((8'hb8) ~^ (8'ha6)) >= (|(8'hb5))) > ((~^(8'h9e)) ~^ ((7'h44) * (8'hbb)))), (({(8'ha3), (8'h9f)} ? ((8'hbd) ? (7'h42) : (8'hb7)) : ((8'haa) >> (8'hb6))) << (8'had))} : (8'hb5)), 
parameter param101 = (param100 ? (param100 ? ((8'hb5) <<< (~^param100)) : (-({param100, param100} - (^(8'ha2))))) : (((8'hb8) ? {{param100, param100}} : (~(param100 + (7'h43)))) ? (~|{(param100 * (8'ha1)), (param100 ? param100 : param100)}) : param100)))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire [(3'h7):(1'h0)] wire99;
  wire signed [(3'h7):(1'h0)] wire98;
  wire signed [(3'h5):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire [(5'h13):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire [(5'h15):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire5;
  wire [(4'hb):(1'h0)] wire4;
  reg [(2'h2):(1'h0)] reg97 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(4'hc):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg13 = (1'h0);
  reg [(4'hd):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'hd):(1'h0)] reg9 = (1'h0);
  assign y = {wire99,
                 wire98,
                 wire94,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg97,
                 reg96,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire4 = $unsigned({$unsigned({wire0}), $unsigned((^~wire0))});
  assign wire5 = ($unsigned(($unsigned({(8'ha5), (8'had)}) > ({wire4,
                     wire4} - wire4))) ~^ wire3[(4'hd):(2'h3)]);
  assign wire6 = $signed(wire2);
  assign wire7 = $unsigned($signed((((wire1 ? wire0 : (8'hb2)) ?
                         $unsigned((8'ha7)) : (wire2 || wire2)) ?
                     $signed(wire2) : $signed($signed(wire5)))));
  assign wire8 = wire0;
  always
    @(posedge clk) begin
      reg9 <= wire7[(1'h1):(1'h1)];
      reg10 <= ({$signed(((^~(8'hbc)) >> (wire4 ~^ wire7)))} ?
          ($signed(((wire7 ? wire3 : wire7) & (wire6 ?
              wire3 : wire3))) << ($unsigned(wire7[(3'h7):(3'h5)]) + wire7[(1'h1):(1'h0)])) : $signed((~|$signed((^wire3)))));
      reg11 <= ((~wire0[(2'h2):(2'h2)]) != wire1);
      reg12 <= ((+wire7) ?
          (wire0 ?
              ($signed(wire6) << ($unsigned(wire1) ^~ (wire3 ?
                  reg11 : wire6))) : (((wire5 ? wire2 : reg10) ~^ ((8'hbc) ?
                      wire1 : (8'ha6))) ?
                  $signed({reg10}) : $signed(reg10))) : (+$unsigned($unsigned((wire5 ?
              wire5 : reg11)))));
    end
  always
    @(posedge clk) begin
      reg13 <= (~reg10);
      reg14 <= {$signed($unsigned($signed($unsigned(wire0)))),
          ((7'h41) ? (~&wire0) : (~&{{wire5, wire4}, wire8}))};
      reg15 <= $unsigned(wire5[(1'h1):(1'h0)]);
    end
  assign wire16 = ({$signed(($unsigned(wire6) ?
                          $unsigned(wire2) : wire5))} ^~ (~|(reg11[(4'hf):(4'he)] && (&$unsigned((7'h43))))));
  assign wire17 = {wire2,
                      $signed($signed((reg9 <<< ((8'ha1) ? wire0 : (7'h41)))))};
  assign wire18 = wire5[(5'h11):(3'h6)];
  assign wire19 = (((-wire3[(1'h0):(1'h0)]) != ((8'hb9) ?
                          $signed((reg11 ^~ wire2)) : $signed($unsigned(wire3)))) ?
                      (reg13 & (!reg10)) : {(((reg12 & wire18) + $signed(reg15)) & reg15)});
  assign wire20 = {((reg10[(4'hf):(1'h0)] > reg10[(4'ha):(3'h6)]) - wire3[(4'hd):(1'h1)])};
  assign wire21 = ($signed($unsigned($unsigned($signed(wire19)))) + wire8[(1'h1):(1'h0)]);
  assign wire22 = $unsigned(wire4);
  module23 #() modinst95 (wire94, clk, wire0, wire17, wire16, wire3);
  always
    @(posedge clk) begin
      reg96 <= wire8[(4'h8):(2'h2)];
      reg97 <= ($unsigned($signed(reg15[(3'h6):(3'h6)])) >> wire1[(4'h8):(3'h4)]);
    end
  assign wire98 = (^~wire17);
  assign wire99 = (!wire2[(2'h2):(1'h0)]);
endmodule

module module23  (y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire27;
  input wire [(5'h15):(1'h0)] wire26;
  input wire [(4'hf):(1'h0)] wire25;
  input wire signed [(5'h10):(1'h0)] wire24;
  wire signed [(2'h3):(1'h0)] wire93;
  wire signed [(4'hd):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire [(4'ha):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire64;
  wire signed [(4'hc):(1'h0)] wire63;
  wire signed [(3'h5):(1'h0)] wire62;
  wire [(4'hf):(1'h0)] wire61;
  wire signed [(4'h8):(1'h0)] wire59;
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire89,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire59,
                 (1'h0)};
  module28 #() modinst60 (.wire31(wire24), .clk(clk), .wire30(wire25), .wire29((8'h9e)), .y(wire59), .wire32(wire26), .wire33(wire27));
  assign wire61 = $unsigned($unsigned($unsigned(wire26[(5'h15):(4'hf)])));
  assign wire62 = (($signed(wire26) || wire26[(3'h5):(1'h0)]) ?
                      (&$unsigned(wire61[(2'h2):(1'h1)])) : $signed($unsigned($unsigned($signed(wire26)))));
  assign wire63 = (8'ha1);
  assign wire64 = wire62;
  module65 #() modinst90 (.wire66(wire25), .wire68(wire62), .y(wire89), .wire69(wire24), .clk(clk), .wire67(wire64));
  assign wire91 = wire89;
  assign wire92 = $signed((wire64[(4'hc):(4'h8)] ?
                      wire59[(2'h3):(1'h0)] : $unsigned(((wire89 ?
                          (8'h9d) : wire89) | ((8'hb2) ? wire91 : wire24)))));
  assign wire93 = ($signed((~wire89[(4'ha):(4'h9)])) ?
                      wire62 : ((&(^wire27)) ~^ wire27));
endmodule

module module65
#(parameter param87 = (((-(~((8'hb4) <<< (8'hbc)))) * (((^(8'hbc)) & ((8'hbd) ? (7'h44) : (8'hb4))) ? ({(8'hb3)} ? (&(8'ha2)) : ((7'h44) << (8'hab))) : {((8'ha5) - (8'ha3)), (!(8'hb9))})) ? (^((((8'hb9) > (7'h40)) || (-(8'hb2))) >> ({(8'hb5), (8'ha3)} ? ((8'ha3) ? (8'ha7) : (8'hba)) : {(8'hb4)}))) : (~^((~^(~|(8'hbb))) < (((8'ha0) ~^ (8'hb3)) <= ((8'hba) != (8'hb5)))))), 
parameter param88 = (((((param87 ? (8'h9c) : param87) ? (param87 || (8'h9c)) : (param87 >>> param87)) | (|(|param87))) ? (-((param87 << param87) ? {param87} : (param87 >> param87))) : param87) ? (({param87, (param87 ? param87 : (8'ha0))} ? {(~|param87)} : ((param87 * param87) ^ (param87 < param87))) ? param87 : (param87 & ((!(7'h41)) - param87))) : (&({(param87 ? param87 : param87)} + param87))))
(y, clk, wire69, wire68, wire67, wire66);
  output wire [(32'hba):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire69;
  input wire [(3'h5):(1'h0)] wire68;
  input wire [(5'h12):(1'h0)] wire67;
  input wire [(4'hf):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire84;
  wire signed [(4'ha):(1'h0)] wire83;
  wire [(3'h7):(1'h0)] wire82;
  wire signed [(4'h8):(1'h0)] wire80;
  wire signed [(4'hd):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire72;
  wire [(3'h7):(1'h0)] wire71;
  wire [(4'h9):(1'h0)] wire70;
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(4'he):(1'h0)] reg73 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire80,
                 wire79,
                 wire78,
                 wire72,
                 wire71,
                 wire70,
                 reg81,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 (1'h0)};
  assign wire70 = ((+wire66) ?
                      wire68[(2'h2):(2'h2)] : $signed($unsigned(((wire68 ?
                              wire68 : wire69) ?
                          (wire67 || wire68) : (wire67 <= wire67)))));
  assign wire71 = {((8'hbf) ?
                          (($unsigned(wire69) || wire67) ?
                              ({wire68} << wire68) : $unsigned((wire70 ?
                                  (8'hae) : wire70))) : (wire69[(4'hb):(2'h3)] || {((8'hb0) && wire68),
                              $signed(wire66)})),
                      ((wire66[(1'h1):(1'h1)] ?
                          (wire69[(3'h4):(2'h2)] >>> $unsigned(wire67)) : (-$signed(wire68))) <<< {($unsigned((8'ha9)) ~^ (wire66 ?
                              wire68 : wire66)),
                          wire69[(1'h1):(1'h0)]})};
  assign wire72 = {($signed(((wire71 ? wire67 : wire70) ?
                          (wire68 + wire66) : (wire70 ~^ wire66))) >>> wire66)};
  always
    @(posedge clk) begin
      reg73 <= {$unsigned({wire72, (!{wire68})}),
          ({(wire66[(1'h1):(1'h0)] >= {(8'hbb), wire70}),
                  wire67[(4'h8):(3'h7)]} ?
              (wire72 ?
                  (wire67 ?
                      (^~wire71) : wire72[(4'hd):(3'h7)]) : (^~{(8'hab)})) : (wire68[(1'h0):(1'h0)] ?
                  {(wire70 ? wire66 : wire69),
                      (wire67 && wire69)} : {(&wire67)}))};
      reg74 <= $unsigned($signed(((8'hae) ?
          $signed(wire67) : wire68[(1'h1):(1'h0)])));
      reg75 <= $signed((&{{$signed(wire72), wire70[(2'h3):(1'h1)]}}));
      reg76 <= wire66;
      reg77 <= ($signed({$signed(reg76),
              ((reg74 == reg75) * (reg73 << (7'h42)))}) ?
          (8'haf) : $unsigned((^~(8'ha4))));
    end
  assign wire78 = ((~|(^~wire71[(3'h7):(3'h4)])) > (+wire72));
  assign wire79 = $signed(({(^$unsigned(wire71)),
                      ($unsigned(reg73) <= wire66)} && $signed(reg74[(2'h2):(1'h0)])));
  assign wire80 = $unsigned((wire67[(5'h11):(1'h0)] ?
                      wire70 : $unsigned(wire79)));
  always
    @(posedge clk) begin
      reg81 <= (~&wire80);
    end
  assign wire82 = $unsigned(reg75[(1'h0):(1'h0)]);
  assign wire83 = (+(8'had));
  assign wire84 = (8'hab);
  assign wire85 = wire68;
  assign wire86 = reg81[(2'h3):(2'h3)];
endmodule

module module28  (y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h11e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire [(4'h8):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(4'he):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(3'h4):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire36;
  wire [(3'h7):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire34;
  reg [(5'h10):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(2'h3):(1'h0)] reg49 = (1'h0);
  reg [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'hb):(1'h0)] reg39 = (1'h0);
  reg [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire53,
                 wire52,
                 wire51,
                 wire36,
                 wire35,
                 wire34,
                 reg55,
                 reg54,
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
                 reg38,
                 reg37,
                 (1'h0)};
  assign wire34 = (^$signed(wire29));
  assign wire35 = wire32[(2'h3):(2'h3)];
  assign wire36 = (((($unsigned(wire31) ^ (8'hb7)) ?
                              {wire31[(1'h0):(1'h0)],
                                  (wire31 ?
                                      wire30 : wire34)} : $signed(wire32)) ?
                          ({(&wire30)} >>> wire30[(3'h6):(3'h4)]) : (+{$unsigned(wire33)})) ?
                      (($signed(wire29[(4'h8):(2'h2)]) ?
                              $unsigned(wire31) : ($unsigned(wire34) ?
                                  wire31 : (|(8'hb8)))) ?
                          (&$signed((wire32 ?
                              wire32 : (8'hb6)))) : $unsigned(({wire31,
                                  wire33} ?
                              wire33 : (wire34 ? wire33 : wire34)))) : wire34);
  always
    @(posedge clk) begin
      reg37 <= $unsigned(((wire36[(3'h5):(3'h4)] ?
              (^wire34) : $unsigned({wire35, wire35})) ?
          $signed((^~(~^wire30))) : (wire33[(3'h6):(1'h1)] ?
              (-(wire34 ~^ wire35)) : wire30[(2'h2):(2'h2)])));
      reg38 <= wire35[(3'h5):(3'h5)];
      if ({(~|($signed(reg37) ?
              $unsigned((wire33 > wire33)) : ((wire32 * wire29) & $unsigned((8'haf)))))})
        begin
          reg39 <= (wire29[(4'hb):(4'hb)] || {($signed(wire30[(3'h7):(3'h6)]) ?
                  (wire34 ?
                      $unsigned(wire31) : {(8'ha6),
                          wire31}) : wire35[(1'h0):(1'h0)])});
          reg40 <= wire36;
        end
      else
        begin
          reg39 <= reg38[(3'h7):(3'h6)];
          reg40 <= ({(^$unsigned((reg39 || (8'ha3)))),
                  (-($unsigned(reg39) ? wire35 : $signed(reg40)))} ?
              wire33[(3'h4):(1'h1)] : $unsigned(((-$signed(reg37)) ?
                  $signed(reg40[(1'h1):(1'h0)]) : wire36[(2'h3):(2'h3)])));
        end
    end
  always
    @(posedge clk) begin
      reg41 <= (wire35[(2'h2):(1'h1)] || (reg39 == $signed(wire35[(1'h1):(1'h1)])));
      if ((wire31 * $signed(reg37[(1'h1):(1'h1)])))
        begin
          reg42 <= $unsigned(wire33);
          reg43 <= wire33[(2'h2):(1'h0)];
          reg44 <= wire29;
          reg45 <= $signed((^~(reg40 <<< $signed($unsigned(wire36)))));
          if (((($signed((|wire34)) ?
              $unsigned(wire29) : $unsigned(reg42)) ~^ (^~(((8'ha7) ?
                  wire34 : wire31) ?
              $signed(wire35) : $unsigned(reg45)))) <= $unsigned($signed($signed(reg44[(3'h4):(2'h2)])))))
            begin
              reg46 <= (wire30[(4'h8):(3'h7)] && (({((8'ha7) - wire36)} * $unsigned(wire30[(1'h1):(1'h0)])) != $signed((-$unsigned((8'hb9))))));
              reg47 <= (((~^((reg42 ?
                      reg37 : wire31) != (reg40 != wire29))) < (($signed(wire33) ?
                          wire32 : (reg39 | reg44)) ?
                      {{wire32}} : $unsigned($signed(wire35)))) ?
                  reg41[(1'h1):(1'h0)] : $unsigned($unsigned($signed((~^reg38)))));
              reg48 <= {wire35, $unsigned(reg45)};
              reg49 <= $unsigned(((|$unsigned($signed(wire36))) ?
                  {{wire29},
                      ((reg48 ?
                          reg38 : wire30) << {reg43})} : (-(&reg39[(4'h9):(4'h9)]))));
              reg50 <= wire30;
            end
          else
            begin
              reg46 <= (reg48 + reg38[(4'h9):(3'h6)]);
              reg47 <= wire36;
            end
        end
      else
        begin
          reg42 <= ($signed(reg49) < wire33[(3'h6):(3'h5)]);
          reg43 <= $signed(reg37[(1'h0):(1'h0)]);
          reg44 <= $signed(wire34);
          reg45 <= (8'hb7);
          reg46 <= reg45;
        end
    end
  assign wire51 = $unsigned((~&$unsigned($signed((-reg45)))));
  assign wire52 = (~^(reg43[(1'h0):(1'h0)] == (^~reg42[(3'h6):(2'h2)])));
  assign wire53 = (~&(~|{(~^(&wire52)), (^~(reg40 ~^ reg50))}));
  always
    @(posedge clk) begin
      reg54 <= ((reg46 ?
              $signed($signed((~wire32))) : ({$unsigned(wire32),
                      $unsigned(reg50)} ?
                  $unsigned($signed(wire36)) : ((|reg37) ^ reg50[(3'h6):(3'h4)]))) ?
          ({reg49} ?
              ({$unsigned(wire29)} ^ (wire29[(3'h4):(2'h2)] ^~ {wire51,
                  (8'hae)})) : (~^$signed($signed(wire31)))) : reg44);
      reg55 <= ($unsigned($unsigned($unsigned((+reg44)))) ^~ reg40);
    end
  assign wire56 = ($unsigned(($unsigned((wire51 <<< (7'h44))) && wire33[(1'h0):(1'h0)])) >> reg48);
  assign wire57 = wire56;
  assign wire58 = $unsigned(reg38[(4'hc):(2'h3)]);
endmodule
