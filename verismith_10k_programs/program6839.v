module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hed):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire115;
  wire [(4'h9):(1'h0)] wire107;
  wire signed [(4'ha):(1'h0)] wire106;
  wire [(4'hb):(1'h0)] wire105;
  wire signed [(2'h3):(1'h0)] wire102;
  wire signed [(4'ha):(1'h0)] wire101;
  wire signed [(4'hb):(1'h0)] wire100;
  wire signed [(4'hd):(1'h0)] wire99;
  wire signed [(5'h12):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire96;
  reg signed [(4'h8):(1'h0)] reg114 = (1'h0);
  reg [(4'hc):(1'h0)] reg113 = (1'h0);
  reg [(4'h8):(1'h0)] reg112 = (1'h0);
  reg [(4'hf):(1'h0)] reg111 = (1'h0);
  reg [(5'h13):(1'h0)] reg110 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg109 = (1'h0);
  reg [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg104 = (1'h0);
  reg [(4'hb):(1'h0)] reg103 = (1'h0);
  assign y = {wire116,
                 wire115,
                 wire107,
                 wire106,
                 wire105,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire96,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg104,
                 reg103,
                 (1'h0)};
  module5 #() modinst97 (wire96, clk, wire3, wire1, wire2, wire4, wire0);
  assign wire98 = wire4;
  assign wire99 = $unsigned(wire2);
  assign wire100 = (^$unsigned(wire98[(5'h10):(5'h10)]));
  assign wire101 = $unsigned(wire96[(2'h3):(2'h3)]);
  assign wire102 = wire3[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg103 <= ($unsigned(wire1[(4'hb):(4'hb)]) + $signed(wire100));
      reg104 <= wire100[(2'h3):(2'h2)];
    end
  assign wire105 = $signed($unsigned(((~&((8'h9c) ?
                       wire96 : wire102)) ^ $signed((wire1 ? wire3 : wire0)))));
  assign wire106 = wire99[(4'h9):(1'h1)];
  assign wire107 = (wire101[(3'h7):(3'h7)] ?
                       wire98 : {$unsigned(wire0[(4'hb):(1'h0)])});
  always
    @(posedge clk) begin
      reg108 <= $signed(wire98);
      reg109 <= $signed(wire3[(4'he):(3'h4)]);
      reg110 <= wire96;
      if (wire107)
        begin
          reg111 <= (wire2[(3'h4):(1'h1)] ?
              ((($unsigned(wire0) * (~^wire101)) ?
                      (((8'ha8) ?
                          wire107 : wire2) ^ $signed(reg110)) : (!(wire100 ?
                          wire106 : wire101))) ?
                  ($unsigned((wire106 ? wire102 : reg110)) ?
                      $unsigned((wire99 != wire4)) : wire0[(4'h9):(3'h4)]) : wire100) : (|{wire3}));
          reg112 <= reg109;
          reg113 <= (~reg104);
        end
      else
        begin
          if ($signed($unsigned(($unsigned(wire0) ?
              reg103 : (^~(reg108 ? wire4 : wire4))))))
            begin
              reg111 <= (wire107 ?
                  {(wire106[(4'ha):(3'h4)] ? $unsigned((7'h43)) : (8'ha2)),
                      {$unsigned((wire106 ?
                              reg113 : (8'ha7)))}} : reg109[(2'h2):(1'h0)]);
              reg112 <= ((reg104[(4'hb):(4'h9)] ?
                      wire96[(1'h1):(1'h1)] : wire96) ?
                  $unsigned((~^$unsigned($signed(wire98)))) : wire4[(2'h2):(2'h2)]);
            end
          else
            begin
              reg111 <= (reg110[(4'hb):(4'h8)] << $unsigned((~(wire96 << {reg110,
                  wire100}))));
              reg112 <= wire107;
            end
        end
      reg114 <= ($unsigned(reg109) < (-((~&(wire1 ? reg103 : (8'ha5))) ?
          ((reg112 ? wire2 : reg110) ^~ $signed(wire3)) : ($signed(wire100) ?
              (wire105 ? wire100 : reg111) : wire107))));
    end
  assign wire115 = wire99;
  assign wire116 = (~^($signed($signed($signed(wire0))) - (-((wire105 ?
                           (8'hb5) : wire100) ?
                       reg114 : wire2))));
endmodule

module module5
#(parameter param95 = (((((!(8'hb4)) ? ((8'ha9) ? (8'hb6) : (8'h9f)) : {(8'hb9), (8'hbd)}) & (((8'hb8) <= (8'hbc)) ^ ((8'hae) ? (7'h43) : (8'hae)))) <<< (!(~|{(8'hab), (8'ha6)}))) & (((((8'haa) ? (8'hbc) : (8'hac)) - ((8'hb1) == (8'hb2))) ? {{(8'hb9), (7'h41)}, ((8'hb9) | (8'h9e))} : (!((8'ha2) <= (8'h9e)))) ? (({(8'hb7)} ? ((8'ha8) >> (8'hbe)) : (!(7'h41))) ? (+{(8'hb7)}) : ({(8'ha3), (8'ha7)} >>> ((8'hbd) | (8'h9e)))) : ({((8'hbe) << (8'h9d)), (8'hb8)} ~^ (8'hb4)))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h182):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire6;
  wire signed [(5'h14):(1'h0)] wire94;
  wire [(3'h7):(1'h0)] wire93;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(5'h11):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(4'hf):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire71;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(4'ha):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire67;
  wire [(5'h10):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  wire signed [(3'h7):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire23;
  reg [(3'h7):(1'h0)] reg92 = (1'h0);
  reg [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(4'hf):(1'h0)] reg90 = (1'h0);
  reg [(5'h15):(1'h0)] reg89 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg88 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg83 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg81 = (1'h0);
  reg [(3'h7):(1'h0)] reg80 = (1'h0);
  reg [(5'h11):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  reg [(5'h11):(1'h0)] reg77 = (1'h0);
  reg [(4'ha):(1'h0)] reg76 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg75 = (1'h0);
  assign y = {wire94,
                 wire93,
                 wire87,
                 wire86,
                 wire85,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire67,
                 wire27,
                 wire26,
                 wire25,
                 wire23,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
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
                 (1'h0)};
  module11 #() modinst24 (.y(wire23), .wire12(wire8), .wire15(wire7), .wire13(wire10), .wire14(wire9), .clk(clk));
  assign wire25 = wire7;
  assign wire26 = $signed(wire6);
  assign wire27 = wire7;
  module28 #() modinst68 (wire67, clk, wire27, wire6, wire9, wire8);
  assign wire69 = wire7;
  assign wire70 = {($unsigned((wire9[(2'h3):(1'h1)] >= (wire25 ?
                              wire23 : wire27))) ?
                          (-(~(7'h41))) : (wire8 ?
                              wire8[(2'h2):(1'h0)] : $signed((wire7 << wire7)))),
                      {$unsigned((8'hb8))}};
  assign wire71 = wire23;
  assign wire72 = wire7[(4'hc):(2'h2)];
  assign wire73 = (wire26 && wire25);
  assign wire74 = $signed(wire6);
  always
    @(posedge clk) begin
      reg75 <= ((wire27 | wire27[(4'h8):(3'h5)]) ?
          $signed($signed($unsigned(wire27[(4'hd):(4'hd)]))) : $signed(wire7));
      reg76 <= (~&$signed(wire10[(5'h10):(4'h8)]));
      reg77 <= $unsigned(wire70[(4'hb):(4'h8)]);
      if (wire10)
        begin
          reg78 <= reg75[(4'hd):(1'h0)];
        end
      else
        begin
          reg78 <= wire27[(3'h5):(2'h2)];
          reg79 <= (^~(wire71[(2'h2):(1'h0)] ?
              wire6[(4'hf):(2'h3)] : $unsigned((((8'ha0) ?
                  reg77 : wire72) < wire70))));
          if ($signed((wire6 >> {($signed(wire73) ?
                  (8'hbc) : $unsigned(wire8))})))
            begin
              reg80 <= (+reg77);
              reg81 <= (($signed((((8'hab) || (8'hb3)) ~^ $unsigned(wire74))) ?
                  $signed({(wire73 ? wire9 : (8'haf))}) : reg75) << wire10);
              reg82 <= wire67;
              reg83 <= ($unsigned(reg76) ?
                  reg81 : $unsigned(({(^wire25),
                      ((8'ha1) * wire23)} == reg78[(2'h2):(1'h0)])));
            end
          else
            begin
              reg80 <= reg79;
              reg81 <= $unsigned(wire72);
              reg82 <= {(~|{(-{wire10}), $signed((wire74 <<< reg76))}),
                  {wire25[(3'h6):(3'h6)], (-wire8)}};
              reg83 <= reg81;
            end
        end
      reg84 <= (8'hbf);
    end
  assign wire85 = (|(8'hb5));
  assign wire86 = {$unsigned($signed({$unsigned(reg81)})),
                      ((+{wire73[(3'h4):(1'h0)]}) ?
                          wire6 : (^~{(~&(8'hb0)), $unsigned(wire26)}))};
  assign wire87 = $unsigned($unsigned(wire85[(4'hd):(4'h9)]));
  always
    @(posedge clk) begin
      reg88 <= $signed($unsigned((((+reg80) >> {wire70}) ?
          {wire8, (~&wire27)} : $signed($signed((8'h9c))))));
      reg89 <= (~(~$unsigned(($unsigned(wire73) ?
          (reg88 || wire67) : (reg76 ? (8'hb9) : wire87)))));
      reg90 <= $signed($unsigned((8'ha1)));
      reg91 <= reg82[(1'h0):(1'h0)];
      reg92 <= ((($signed((wire10 ? wire72 : wire27)) ?
          $signed((wire70 <= wire23)) : $signed($unsigned(wire71))) << (wire6 ?
          (|(wire8 >> (8'h9f))) : ($signed(reg81) <= reg79))) & wire67);
    end
  assign wire93 = (7'h44);
  assign wire94 = {(~|$unsigned((~^(&wire86))))};
endmodule

module module28
#(parameter param65 = (((7'h43) <<< ((~|(8'hba)) ? (^(^~(8'ha0))) : {(8'ha4)})) >= (~(~^(&((8'hb3) < (8'hbb)))))), 
parameter param66 = (8'ha9))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h17b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire32;
  input wire signed [(4'hf):(1'h0)] wire31;
  input wire [(4'hd):(1'h0)] wire30;
  input wire signed [(4'h8):(1'h0)] wire29;
  wire signed [(5'h14):(1'h0)] wire64;
  wire signed [(5'h14):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(5'h11):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire33;
  reg signed [(4'h9):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(2'h2):(1'h0)] reg58 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h12):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(2'h2):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg49 = (1'h0);
  reg [(4'hf):(1'h0)] reg48 = (1'h0);
  reg [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(5'h11):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'he):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire33,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
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
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire33 = {wire32[(3'h6):(3'h5)], {wire32}};
  always
    @(posedge clk) begin
      if ($unsigned(wire29[(3'h4):(3'h4)]))
        begin
          if (wire31)
            begin
              reg34 <= (((-$signed(wire33)) ?
                      (8'ha5) : (wire32[(4'h9):(4'h9)] + ($unsigned(wire32) <<< $unsigned(wire31)))) ?
                  ($unsigned((^~(wire29 ? wire33 : wire31))) ?
                      ((^~(~|wire33)) ^~ ($unsigned(wire33) ?
                          $unsigned(wire33) : (wire32 | wire29))) : wire31[(3'h5):(2'h2)]) : wire33[(3'h4):(1'h0)]);
            end
          else
            begin
              reg34 <= (&{$unsigned($signed((^wire30))),
                  wire33[(4'hd):(3'h7)]});
              reg35 <= wire32[(4'hb):(4'h9)];
            end
          if (($signed((-wire30[(1'h1):(1'h0)])) ?
              (((&{reg35}) ?
                  ((wire30 <= wire29) != $unsigned(reg34)) : $signed(((8'hb3) < wire30))) <= {(&wire33[(2'h2):(1'h0)])}) : reg35))
            begin
              reg36 <= ($signed(wire32) != $signed((&reg35)));
              reg37 <= (-(wire31[(4'hf):(4'hc)] ?
                  ($unsigned($signed(wire32)) ?
                      {(wire31 <= reg36),
                          (wire29 ?
                              wire29 : reg35)} : (!(wire33 != reg35))) : (~^wire31)));
              reg38 <= $unsigned(wire29);
            end
          else
            begin
              reg36 <= wire32;
            end
          if ($unsigned((wire32 ?
              ($signed((reg37 & (8'ha3))) == $unsigned($unsigned(reg34))) : (reg37 ?
                  wire29[(3'h5):(2'h3)] : wire30))))
            begin
              reg39 <= (~^wire31);
              reg40 <= $signed(wire33);
              reg41 <= (7'h41);
            end
          else
            begin
              reg39 <= wire33[(1'h0):(1'h0)];
              reg40 <= (^~(({reg37[(4'h9):(3'h7)],
                      wire31[(4'ha):(4'h9)]} >= $unsigned($signed(reg40))) ?
                  ({reg41[(3'h4):(1'h1)]} * (wire30[(2'h3):(1'h0)] ?
                      $signed(wire30) : (^~(8'hb7)))) : wire31));
              reg41 <= ({(reg41 && $signed((+wire32))),
                  (+$unsigned(wire30))} << (!(~wire33[(4'h8):(3'h5)])));
              reg42 <= (wire31 ?
                  $unsigned(((&$unsigned((8'h9f))) ?
                      (^~reg34[(4'h8):(1'h1)]) : $signed((wire30 > (7'h44))))) : reg35[(4'hc):(4'h9)]);
              reg43 <= (-((8'hab) != (reg38[(1'h0):(1'h0)] ?
                  {wire29,
                      wire33[(3'h5):(1'h1)]} : $unsigned($unsigned(reg39)))));
            end
          reg44 <= ($signed((^~(^(!reg40)))) ^ reg36[(1'h1):(1'h1)]);
        end
      else
        begin
          reg34 <= $signed(((($unsigned(wire31) ?
              reg44[(1'h1):(1'h0)] : (^~reg37)) == (~&(8'ha4))) >= reg36[(4'h9):(2'h2)]));
          if ((!($unsigned({$signed(reg34)}) ?
              $unsigned(({wire33, reg34} * (^~reg35))) : reg39)))
            begin
              reg35 <= reg36[(4'hc):(3'h7)];
              reg36 <= ({(^~((~^reg41) || $unsigned(wire29))), reg44} ?
                  $unsigned(reg35[(1'h1):(1'h1)]) : reg44[(1'h0):(1'h0)]);
              reg37 <= ($unsigned((&$unsigned(reg38))) ?
                  (!$unsigned(reg38)) : {{$signed((reg35 & (8'hbe))),
                          reg41[(1'h0):(1'h0)]}});
            end
          else
            begin
              reg35 <= {({$unsigned(reg34)} == $unsigned((-{reg36}))),
                  (reg43 ?
                      (reg34 ?
                          $signed(wire30) : (^~(!(7'h42)))) : ($signed((~reg40)) | reg35))};
              reg36 <= reg35[(3'h4):(1'h1)];
              reg37 <= ($signed(($signed(reg40[(3'h4):(2'h2)]) < $signed(((8'hb2) >= wire32)))) << $unsigned(wire29[(2'h3):(1'h0)]));
              reg38 <= (&(^~$signed(($signed(reg39) >> wire29))));
              reg39 <= reg35;
            end
        end
      reg45 <= (reg40 ?
          wire33[(4'ha):(1'h0)] : (wire29[(2'h2):(1'h0)] ?
              reg34 : {reg41[(1'h1):(1'h0)]}));
      reg46 <= $signed((reg38 - ((-(reg45 ? reg34 : (8'ha9))) ?
          ((~^reg44) ?
              $signed((8'hb3)) : reg35[(3'h5):(1'h1)]) : $signed($unsigned(wire30)))));
      if ($unsigned($signed($signed((reg39 ~^ ((8'hbf) ? wire32 : (8'hb7)))))))
        begin
          if ($unsigned(reg42[(1'h0):(1'h0)]))
            begin
              reg47 <= ({(~|(8'hbe))} ? reg44 : reg46[(3'h6):(1'h0)]);
              reg48 <= $unsigned((&reg35));
              reg49 <= wire32;
              reg50 <= $unsigned({$signed($unsigned(reg34))});
              reg51 <= $signed((~^$signed((~^reg35))));
            end
          else
            begin
              reg47 <= reg43;
              reg48 <= $signed(({reg37[(3'h5):(1'h1)]} ^ $signed(($signed((8'h9d)) > reg40))));
            end
          reg52 <= $signed($signed(reg37[(1'h1):(1'h0)]));
          reg53 <= (reg46 ^~ $unsigned($unsigned((^~(reg44 ?
              (8'hae) : reg47)))));
          if (($unsigned(reg42) ^ (~|((^wire30[(3'h6):(1'h1)]) < reg36[(4'hc):(4'h8)]))))
            begin
              reg54 <= $unsigned((8'h9e));
              reg55 <= {reg36};
              reg56 <= (~reg36[(3'h6):(2'h3)]);
              reg57 <= $unsigned($unsigned(reg34));
              reg58 <= $signed(($unsigned({reg55}) ?
                  (^((+reg52) ?
                      wire29[(3'h6):(2'h2)] : $unsigned((8'hb7)))) : ($signed($signed(reg57)) >= $signed($unsigned((8'hbd))))));
            end
          else
            begin
              reg54 <= $unsigned($signed((8'hb4)));
              reg55 <= $unsigned(reg39[(3'h4):(1'h0)]);
            end
          reg59 <= reg38[(2'h2):(2'h2)];
        end
      else
        begin
          reg47 <= $unsigned((&$signed($unsigned(reg43))));
          if ((|{$signed(((wire31 ? reg38 : wire30) && (~|wire32)))}))
            begin
              reg48 <= (reg52[(1'h1):(1'h0)] ?
                  $signed((((reg55 * reg48) ?
                          reg47[(3'h5):(1'h0)] : reg58[(2'h2):(1'h0)]) ?
                      ($unsigned(reg37) ?
                          $unsigned(wire33) : $signed(reg56)) : $signed((reg35 ~^ reg51)))) : reg44);
              reg49 <= (&$signed(wire31[(4'hc):(2'h3)]));
              reg50 <= $unsigned({reg39[(1'h1):(1'h1)]});
              reg51 <= ((+reg46) ?
                  ($signed($unsigned($unsigned((8'hae)))) ?
                      reg42[(3'h4):(2'h3)] : ($unsigned((&reg57)) ~^ (|$signed(reg49)))) : {reg36,
                      $unsigned(wire30)});
            end
          else
            begin
              reg48 <= $unsigned($unsigned({$signed({reg38, reg56})}));
              reg49 <= $signed((8'h9c));
              reg50 <= (+$unsigned(reg55[(3'h5):(2'h3)]));
            end
          if (reg35[(2'h2):(1'h0)])
            begin
              reg52 <= {reg55};
              reg53 <= wire31[(2'h3):(2'h3)];
              reg54 <= reg49;
            end
          else
            begin
              reg52 <= $unsigned(reg40);
              reg53 <= reg39[(1'h1):(1'h1)];
              reg54 <= $signed($unsigned(reg53));
              reg55 <= $unsigned((reg34 > ((~&reg44) + (~|(reg42 ?
                  reg56 : wire32)))));
              reg56 <= (~^reg55[(4'hb):(2'h2)]);
            end
          reg57 <= $signed(((~&$signed({reg49})) ?
              (~^wire32) : $unsigned(((8'hae) ?
                  $signed(reg46) : reg42[(1'h0):(1'h0)]))));
          reg58 <= $signed((8'hb1));
        end
      reg60 <= (~reg51[(4'hb):(4'hb)]);
    end
  assign wire61 = ({((|(reg57 ? wire32 : reg36)) ?
                              (8'ha0) : (wire29 || (reg47 ? reg50 : wire30)))} ?
                      reg37 : $unsigned({($signed(reg46) ?
                              (~&reg36) : wire30[(3'h6):(2'h3)])}));
  assign wire62 = reg55[(5'h14):(4'ha)];
  assign wire63 = wire32[(4'he):(4'ha)];
  assign wire64 = $unsigned(reg44);
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire15;
  input wire signed [(5'h14):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire13;
  input wire [(5'h12):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire22;
  wire signed [(2'h2):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(3'h7):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire signed [(2'h2):(1'h0)] wire16;
  assign y = {wire22, wire21, wire20, wire19, wire18, wire17, wire16, (1'h0)};
  assign wire16 = $signed($unsigned((~&wire12)));
  assign wire17 = $unsigned(wire16[(1'h1):(1'h1)]);
  assign wire18 = wire15[(2'h3):(1'h0)];
  assign wire19 = $signed(($unsigned((~^$signed(wire12))) ^~ wire15));
  assign wire20 = ($signed(wire12) ?
                      ((-$unsigned(wire18[(3'h4):(2'h3)])) ?
                          ($unsigned({wire18}) != wire14[(5'h10):(4'he)]) : $unsigned((wire19 ~^ {wire13,
                              wire16}))) : wire17[(4'h8):(3'h5)]);
  assign wire21 = (^((~^(~|wire12[(1'h0):(1'h0)])) ?
                      ((~&(wire12 >= (8'hab))) * $signed(wire17[(3'h4):(1'h1)])) : (-wire14)));
  assign wire22 = $unsigned(($unsigned({wire19[(1'h1):(1'h1)]}) | $signed((wire15 == (wire16 <<< wire19)))));
endmodule
