module top
#(parameter param110 = (({(((8'ha4) ? (8'ha8) : (8'h9e)) ? ((8'hb7) ? (8'haf) : (8'haf)) : ((8'ha0) ? (8'hbb) : (8'hbf)))} ? (-((+(8'hbf)) ? {(8'ha8)} : ((8'hba) == (8'ha0)))) : {(^~(+(8'h9d))), ((|(7'h41)) ^~ (~&(8'ha2)))}) ? {(({(7'h43), (8'haf)} ? ((8'had) | (8'had)) : (^~(8'ha8))) - {{(8'had), (8'ha9)}}), (((-(8'ha1)) ? {(8'hb5), (8'ha6)} : (+(8'hae))) <<< ((|(8'haa)) ? ((8'h9f) ? (8'h9c) : (8'ha8)) : ((8'ha9) >> (8'hbb))))} : (&((8'ha3) > (((8'ha1) ? (8'ha3) : (8'hb1)) + ((8'ha4) || (8'hb4)))))), 
parameter param111 = {(&param110), ((param110 ? ((param110 & param110) ? (param110 ? param110 : param110) : (param110 ? param110 : param110)) : ((-param110) ? param110 : (&param110))) < ({{param110, param110}} ? ((8'ha5) ? (param110 | (8'hbd)) : param110) : param110))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1c7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire109;
  wire [(4'he):(1'h0)] wire108;
  wire [(2'h2):(1'h0)] wire96;
  wire [(4'h9):(1'h0)] wire95;
  wire [(5'h10):(1'h0)] wire94;
  wire [(3'h5):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire77;
  wire [(5'h10):(1'h0)] wire76;
  wire [(3'h4):(1'h0)] wire75;
  wire signed [(3'h5):(1'h0)] wire74;
  wire signed [(4'ha):(1'h0)] wire73;
  wire signed [(3'h7):(1'h0)] wire72;
  wire [(4'h8):(1'h0)] wire69;
  reg [(4'he):(1'h0)] reg107 = (1'h0);
  reg [(4'hb):(1'h0)] reg106 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg105 = (1'h0);
  reg [(5'h15):(1'h0)] reg104 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(3'h7):(1'h0)] reg100 = (1'h0);
  reg [(5'h15):(1'h0)] reg99 = (1'h0);
  reg [(5'h15):(1'h0)] reg98 = (1'h0);
  reg [(4'hc):(1'h0)] reg97 = (1'h0);
  reg [(3'h5):(1'h0)] reg92 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg90 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg89 = (1'h0);
  reg [(4'ha):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg [(4'hc):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg80 = (1'h0);
  reg [(4'h9):(1'h0)] reg79 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg signed [(4'he):(1'h0)] reg71 = (1'h0);
  assign y = {wire109,
                 wire108,
                 wire96,
                 wire95,
                 wire94,
                 wire93,
                 wire85,
                 wire84,
                 wire83,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire69,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg71,
                 (1'h0)};
  module5 #() modinst70 (.clk(clk), .wire10(wire0), .wire7(wire1), .wire6(wire2), .wire8(wire3), .y(wire69), .wire9(wire4));
  always
    @(posedge clk) begin
      reg71 <= $unsigned($signed(($unsigned((wire3 - (8'ha9))) == (wire69 ?
          wire4 : (wire2 + (8'hab))))));
    end
  assign wire72 = wire0[(4'hb):(3'h4)];
  assign wire73 = (wire3[(4'hd):(4'ha)] ?
                      wire69[(4'h8):(3'h4)] : wire69[(3'h5):(1'h1)]);
  assign wire74 = (reg71[(4'hc):(4'hc)] ?
                      (((!$unsigned(wire0)) ^ (wire73[(3'h7):(1'h0)] == $signed(wire4))) ?
                          wire69 : $signed((~$signed((7'h42))))) : $unsigned(wire0));
  assign wire75 = $unsigned(wire72[(2'h2):(1'h1)]);
  assign wire76 = $unsigned(wire75);
  assign wire77 = wire72[(3'h5):(3'h4)];
  always
    @(posedge clk) begin
      reg78 <= $unsigned($unsigned({$signed(((8'hb2) <= reg71)),
          $signed($unsigned(wire75))}));
      if (wire0)
        begin
          if ((~((((+wire4) ?
              $unsigned(wire77) : (~wire73)) + (8'hac)) ~^ ($unsigned(wire2[(4'h8):(3'h6)]) + wire1[(2'h3):(2'h2)]))))
            begin
              reg79 <= wire1;
            end
          else
            begin
              reg79 <= ($signed((reg79 || (wire77 ?
                      wire2[(1'h1):(1'h1)] : wire2))) ?
                  wire74[(1'h0):(1'h0)] : (^~$signed((^$unsigned(wire74)))));
              reg80 <= (({(|wire72[(3'h4):(1'h0)])} ?
                  wire0 : (+$signed((wire72 || wire72)))) == $signed((~|$unsigned((reg78 <= wire74)))));
              reg81 <= $signed($unsigned(((wire1 ?
                  (!wire72) : (reg79 ? reg80 : reg80)) == wire76)));
            end
        end
      else
        begin
          reg79 <= $unsigned(($signed({wire4,
              wire3}) && ($unsigned((reg71 >>> wire75)) ?
              (wire3[(5'h11):(3'h5)] << (+reg71)) : reg80)));
        end
      reg82 <= (~^$unsigned($signed(wire74[(2'h2):(1'h0)])));
    end
  assign wire83 = $signed($unsigned((({wire69} ?
                      reg78[(1'h1):(1'h0)] : wire3[(4'h8):(3'h5)]) <= $signed((|(8'hb2))))));
  assign wire84 = reg79;
  assign wire85 = $unsigned($unsigned($signed(($unsigned(reg71) ~^ $unsigned(wire83)))));
  always
    @(posedge clk) begin
      if ($unsigned((($unsigned($unsigned(wire1)) ^ ($signed(reg79) ?
              (wire85 ? wire4 : (8'h9d)) : reg79[(1'h1):(1'h1)])) ?
          wire1 : wire76)))
        begin
          if (reg71)
            begin
              reg86 <= reg81;
              reg87 <= (^($unsigned(((wire0 ? wire75 : wire2) ?
                  $unsigned(reg80) : wire73)) - wire77[(1'h1):(1'h0)]));
              reg88 <= ($unsigned(($unsigned(reg86[(4'h8):(1'h1)]) << ((reg87 && wire76) ?
                  (&wire4) : reg71))) ^~ $unsigned(($unsigned($unsigned(reg82)) ?
                  reg78 : (~^(~&reg71)))));
              reg89 <= wire85[(1'h1):(1'h0)];
            end
          else
            begin
              reg86 <= (^({($signed(wire84) ~^ $unsigned(wire3)),
                  wire4} ^~ (reg81[(4'h8):(3'h4)] > $unsigned(wire83[(1'h1):(1'h0)]))));
              reg87 <= (reg89[(3'h4):(1'h0)] ^~ $unsigned((((wire0 >>> reg71) <<< ((8'ha9) >> reg79)) * (8'hbc))));
              reg88 <= ((~({$signed(reg88), ((8'hbf) ? wire0 : reg87)} ?
                  $unsigned((wire4 ?
                      reg81 : wire3)) : wire76[(4'hd):(3'h6)])) >= ({wire83,
                  (reg89[(1'h1):(1'h0)] >>> ((8'hbd) ?
                      reg71 : (8'h9d)))} * {(8'haa)}));
              reg89 <= wire0[(1'h0):(1'h0)];
            end
          reg90 <= ($unsigned({$unsigned($signed((8'hae)))}) << wire75[(3'h4):(2'h3)]);
          reg91 <= (({$signed($signed(reg71)),
                  $signed((reg90 < reg89))} || reg88) ?
              {(($signed(reg89) | {reg80}) - {(wire76 ? wire73 : reg81),
                      {reg89, reg78}})} : (wire3 ?
                  ($signed(reg86[(3'h5):(2'h2)]) <<< ((wire72 || wire1) ?
                      (wire84 < wire74) : $signed(reg89))) : reg79[(3'h7):(1'h1)]));
          reg92 <= ({(((reg90 ? reg78 : reg86) >>> reg90) ?
                      reg88[(3'h6):(3'h6)] : $signed({reg87, wire75})),
                  wire2[(4'hb):(3'h6)]} ?
              {wire85[(4'he):(4'he)]} : wire0);
        end
      else
        begin
          reg86 <= (-(!((reg92 <<< $signed(wire76)) ^~ $signed((8'haf)))));
          reg87 <= ($signed((^reg78[(4'hd):(3'h5)])) ?
              (($signed($signed(reg78)) ?
                      (8'hab) : ($unsigned(wire83) <<< $signed(reg88))) ?
                  wire73[(2'h2):(1'h1)] : $unsigned(($unsigned(wire2) ?
                      $signed(wire4) : reg81[(3'h5):(2'h2)]))) : $unsigned({($unsigned(wire84) || (7'h43))}));
          reg88 <= wire72[(1'h0):(1'h0)];
          reg89 <= {(|reg91[(4'h9):(4'h8)])};
        end
    end
  assign wire93 = $signed((reg91[(2'h2):(1'h1)] <<< (|wire1)));
  assign wire94 = $signed({$signed(({reg90} ?
                          (8'hbe) : wire77[(1'h1):(1'h0)]))});
  assign wire95 = $unsigned($signed($unsigned($unsigned((wire69 << wire76)))));
  assign wire96 = (($signed({$signed(reg79)}) << ($signed((~|(8'hb7))) == $signed($signed(wire0)))) ?
                      (((!wire69[(1'h1):(1'h1)]) ?
                          wire4 : (reg80[(5'h11):(3'h7)] || (wire76 < (8'ha4)))) >= $unsigned(wire69[(2'h3):(2'h2)])) : $unsigned(($signed((wire94 ?
                              wire85 : wire4)) ?
                          $signed(reg82[(2'h2):(1'h1)]) : (((7'h41) ~^ reg91) ?
                              $unsigned(reg86) : (wire94 ? wire74 : wire75)))));
  always
    @(posedge clk) begin
      reg97 <= ($signed($unsigned($signed((!reg89)))) || wire69[(1'h0):(1'h0)]);
      if ((^$unsigned($signed(reg82[(1'h0):(1'h0)]))))
        begin
          reg98 <= (8'ha0);
        end
      else
        begin
          if (wire76[(2'h3):(1'h1)])
            begin
              reg98 <= (((wire95 ?
                  wire95 : $signed((^~(8'haf)))) && ({$signed(reg79)} ?
                  reg88 : (|$signed(wire95)))) != (~|reg91[(4'h8):(3'h7)]));
              reg99 <= (-{$signed((-reg92[(1'h1):(1'h1)])),
                  ((|(~|reg82)) | $signed((reg86 >> wire74)))});
            end
          else
            begin
              reg98 <= (8'ha8);
              reg99 <= wire0;
              reg100 <= (+(|(&(8'haf))));
              reg101 <= (($unsigned(wire94) - reg81[(4'h9):(1'h0)]) ^ $signed($signed(wire4)));
            end
          reg102 <= $signed((reg82[(1'h0):(1'h0)] ?
              reg100 : wire96[(1'h0):(1'h0)]));
          reg103 <= reg101;
          reg104 <= (~^(((&reg90[(3'h5):(2'h2)]) > ((wire3 >>> wire72) ?
                  {wire1} : (wire96 ? reg91 : (8'hb2)))) ?
              (reg78[(2'h3):(2'h2)] ^ (^$signed(wire76))) : reg86));
          reg105 <= (7'h40);
        end
      reg106 <= wire76[(2'h3):(2'h3)];
      reg107 <= $unsigned($unsigned((reg89[(1'h0):(1'h0)] << (8'hbd))));
    end
  assign wire108 = (~&{reg82[(2'h2):(1'h0)], wire0[(1'h0):(1'h0)]});
  assign wire109 = reg71[(4'hc):(4'hb)];
endmodule

module module5
#(parameter param68 = (8'hae))
(y, clk, wire6, wire7, wire8, wire9, wire10);
  output wire [(32'h65):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire6;
  input wire signed [(4'ha):(1'h0)] wire7;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(5'h14):(1'h0)] wire9;
  input wire signed [(3'h7):(1'h0)] wire10;
  wire [(4'hf):(1'h0)] wire11;
  wire signed [(4'h8):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire13;
  wire [(4'he):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire66;
  reg signed [(5'h12):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  assign y = {wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire17,
                 wire66,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire11 = {($signed(wire7) << $unsigned(wire9[(2'h2):(1'h1)]))};
  assign wire12 = $signed($unsigned(((^~{wire11}) ?
                      wire9[(5'h12):(4'he)] : (((8'hb9) ?
                          wire6 : wire9) + (wire8 ? (8'hbf) : wire11)))));
  assign wire13 = (wire6[(4'h8):(3'h6)] ?
                      (8'hab) : (+(~$unsigned(((8'h9c) > wire7)))));
  assign wire14 = $signed((^~$unsigned($signed(wire12[(3'h4):(2'h2)]))));
  always
    @(posedge clk) begin
      reg15 <= {($signed($signed($signed(wire10))) ?
              ($signed((wire9 ? wire10 : wire13)) ?
                  {(wire10 ?
                          wire11 : wire12)} : {(+(8'hae))}) : $signed((wire8[(1'h1):(1'h1)] ?
                  (~^wire9) : $unsigned(wire13)))),
          {$unsigned(wire11)}};
      reg16 <= (&{(&{(wire7 ? wire9 : wire6)})});
    end
  assign wire17 = (wire9 ?
                      (reg16 ?
                          wire6[(1'h1):(1'h0)] : (wire6 ?
                              reg16 : (~|$signed(wire9)))) : ((+reg15[(5'h14):(1'h0)]) ?
                          wire13 : wire13));
  module18 #() modinst67 (wire66, clk, reg16, wire14, reg15, wire7, wire12);
endmodule

module module18
#(parameter param64 = (^(~|((~|{(8'ha4), (8'hae)}) * (!(~^(8'hb1)))))), 
parameter param65 = param64)
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h1cb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire23;
  input wire signed [(4'he):(1'h0)] wire22;
  input wire signed [(4'h8):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(4'h8):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire34;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire32;
  wire [(3'h4):(1'h0)] wire31;
  wire signed [(4'he):(1'h0)] wire30;
  wire signed [(4'hc):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(4'ha):(1'h0)] wire27;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'ha):(1'h0)] wire24;
  reg [(4'hd):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg57 = (1'h0);
  reg [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg [(2'h3):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg40 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg37 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire36,
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
                 reg63,
                 reg62,
                 reg61,
                 reg60,
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
                 (1'h0)};
  assign wire24 = ($unsigned($signed(wire21)) ? $signed(wire22) : wire20);
  assign wire25 = (~&$signed(wire20));
  assign wire26 = ((($unsigned({wire20}) <= $unsigned((wire23 ?
                          wire24 : wire19))) << $signed($signed((~(8'hbb))))) ?
                      $unsigned((+wire22)) : ($signed(((^~wire22) >= wire21)) ?
                          wire22 : (~^((wire19 <<< wire24) >>> $unsigned(wire21)))));
  assign wire27 = $signed($unsigned(wire22[(4'h8):(1'h1)]));
  assign wire28 = $signed($signed((|$unsigned($signed(wire25)))));
  assign wire29 = wire21[(3'h5):(3'h5)];
  assign wire30 = $signed({(~((wire20 ?
                          wire19 : wire27) > wire21[(4'h8):(3'h6)])),
                      wire23});
  assign wire31 = wire29[(3'h7):(1'h0)];
  assign wire32 = wire21;
  assign wire33 = (~&((-(~&$unsigned(wire21))) ?
                      ($signed((wire28 == wire25)) ?
                          (wire31 <= (wire32 ?
                              wire32 : wire23)) : $signed((+wire29))) : wire20));
  assign wire34 = ($unsigned((wire28 ?
                      ((|wire27) >>> $signed(wire30)) : wire20)) <<< wire31[(1'h0):(1'h0)]);
  assign wire35 = wire30[(4'h9):(2'h2)];
  assign wire36 = $unsigned($signed(wire34[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      if ($unsigned($signed($signed((-wire31)))))
        begin
          if (wire30)
            begin
              reg37 <= (!(^~((~^(^wire24)) >= $unsigned(wire24))));
              reg38 <= wire20;
              reg39 <= $unsigned(($signed($unsigned($signed(wire28))) & (wire34 ?
                  {$signed(wire35)} : (wire33 ? wire36 : $signed(wire30)))));
            end
          else
            begin
              reg37 <= (|$signed($signed((wire33 ?
                  wire23 : {wire26, wire34}))));
              reg38 <= (($signed($signed($signed((8'had)))) - (~|(8'ha4))) > (8'hb2));
              reg39 <= ((wire35[(3'h6):(3'h5)] ?
                      $unsigned(((reg39 ? wire25 : wire28) ?
                          ((8'h9c) >>> (8'ha1)) : wire24)) : (wire31[(1'h0):(1'h0)] ?
                          (wire36 << reg37) : wire29[(2'h3):(2'h2)])) ?
                  $unsigned((wire27 ?
                      $unsigned((^(8'haf))) : reg39)) : (8'hb3));
            end
          if ({$unsigned((|(|$unsigned(wire29))))})
            begin
              reg40 <= {((wire22 <<< wire19) || {($unsigned(wire20) ?
                          (^reg39) : ((8'hb3) | wire20))})};
              reg41 <= $unsigned(wire21);
              reg42 <= (wire31[(2'h2):(1'h1)] >>> $unsigned($signed($signed($signed(reg41)))));
              reg43 <= wire26[(5'h10):(3'h5)];
            end
          else
            begin
              reg40 <= (((($signed(wire20) ?
                      $unsigned((7'h40)) : $unsigned(wire24)) ^ ($unsigned(wire23) + (^wire30))) >> (wire22[(4'ha):(3'h7)] ?
                      wire33 : ((reg38 ? (8'hb9) : wire28) ?
                          (wire29 ? wire32 : wire24) : (wire34 ?
                              wire27 : wire20)))) ?
                  ($signed((8'hb2)) ?
                      $signed({(~wire34)}) : {{$signed(wire20), wire25},
                          reg42}) : $unsigned($signed({((8'ha7) ?
                          wire36 : wire20),
                      wire29[(3'h4):(3'h4)]})));
              reg41 <= $signed($signed($signed(wire21[(2'h3):(2'h2)])));
              reg42 <= $unsigned((((+(reg43 > wire28)) * $unsigned(((8'ha8) ^~ wire22))) ?
                  $unsigned($signed($signed(wire31))) : $unsigned(((wire23 & wire24) ?
                      wire31[(3'h4):(2'h3)] : wire25[(2'h3):(2'h2)]))));
              reg43 <= ((&{reg39[(3'h4):(2'h2)]}) <<< reg40[(3'h5):(1'h0)]);
            end
          if ($unsigned(wire31[(2'h2):(1'h1)]))
            begin
              reg44 <= (8'hb6);
              reg45 <= $unsigned(reg43[(1'h0):(1'h0)]);
              reg46 <= $signed({reg38[(2'h3):(1'h0)]});
            end
          else
            begin
              reg44 <= (((-$signed((wire25 ? wire35 : wire35))) ?
                  wire32[(4'ha):(2'h3)] : (wire28[(3'h5):(2'h3)] ?
                      $signed(((8'hb6) ?
                          wire21 : wire30)) : wire33)) ^ wire35[(1'h1):(1'h1)]);
              reg45 <= ((reg40 == (((-(8'hba)) << wire33) ?
                  ((|wire21) + (reg44 ^ (8'had))) : $unsigned({wire21,
                      wire25}))) > $signed(wire22[(3'h5):(3'h5)]));
            end
        end
      else
        begin
          if ((^~reg45))
            begin
              reg37 <= ((^~$unsigned($signed($signed(reg43)))) && (reg42[(4'he):(1'h0)] ?
                  wire35[(1'h0):(1'h0)] : (((8'ha3) << reg45[(1'h1):(1'h0)]) ?
                      $signed((reg39 ~^ wire22)) : reg43[(4'h8):(1'h0)])));
              reg38 <= ((wire21[(3'h4):(2'h3)] ?
                      (8'hb6) : ($unsigned({wire36,
                          (8'ha8)}) << ($signed(reg43) ?
                          $unsigned(wire25) : (reg40 == wire33)))) ?
                  $unsigned(wire31) : (wire32 ?
                      (-reg43[(4'he):(4'hc)]) : (^~$unsigned({wire20,
                          wire23}))));
              reg39 <= (~&$signed(reg40));
              reg40 <= (7'h41);
              reg41 <= wire25[(4'h8):(2'h3)];
            end
          else
            begin
              reg37 <= reg37[(3'h5):(2'h2)];
              reg38 <= ({wire32} ?
                  wire31[(2'h2):(1'h1)] : (wire30[(4'he):(3'h5)] ?
                      wire20[(2'h2):(2'h2)] : {wire35[(2'h3):(2'h3)],
                          ({wire28} ? (~&wire36) : wire31)}));
              reg39 <= $signed(wire28[(1'h1):(1'h0)]);
              reg40 <= {{$signed($unsigned({wire20})),
                      ((~(|reg43)) >> (^~$signed(wire24)))}};
            end
          reg42 <= (wire20 >>> $unsigned(reg45[(1'h0):(1'h0)]));
          reg43 <= {($unsigned((-wire30[(4'hd):(4'h8)])) ?
                  wire33 : (((reg45 == reg38) ~^ (reg42 ?
                      wire23 : wire20)) > wire25[(2'h3):(2'h2)]))};
          reg44 <= {$signed($signed($signed({reg39, reg40}))),
              ((~reg44) ? wire21[(1'h0):(1'h0)] : $signed(reg39))};
          reg45 <= $signed(wire30[(4'hd):(1'h1)]);
        end
      reg47 <= (8'ha3);
      if (reg44)
        begin
          reg48 <= (^reg40[(3'h6):(1'h0)]);
          reg49 <= {wire23};
          reg50 <= ($unsigned($unsigned($unsigned(wire19[(2'h2):(1'h0)]))) ?
              $signed($signed(reg43)) : ($unsigned((&(+wire22))) ?
                  reg40[(2'h2):(2'h2)] : $signed(($unsigned(wire26) == $signed(reg45)))));
          if (reg42)
            begin
              reg51 <= ((~((&$signed(reg40)) ~^ reg39[(1'h1):(1'h0)])) ~^ (^(reg42[(4'hd):(3'h6)] ?
                  ($unsigned(wire24) ?
                      (~^wire22) : wire33) : $unsigned(wire19))));
              reg52 <= ((reg40 <= $signed($signed((!wire21)))) ?
                  ($unsigned({(~^wire36), wire22[(3'h6):(1'h0)]}) ?
                      $unsigned(wire19) : wire20) : ({{(8'hb8)}} ?
                      $unsigned((reg49 ?
                          (^~wire21) : $unsigned(reg49))) : wire19[(3'h4):(1'h0)]));
            end
          else
            begin
              reg51 <= (7'h44);
            end
          reg53 <= reg43;
        end
      else
        begin
          if ($unsigned(((({wire27, reg42} ?
                  (wire24 ? wire22 : reg49) : (~wire33)) ?
              $unsigned((!wire36)) : (wire36[(2'h2):(2'h2)] >>> (reg39 + reg41))) - (-($signed((8'hb7)) ?
              wire25 : (reg40 ? wire36 : (7'h40)))))))
            begin
              reg48 <= wire36[(3'h4):(2'h3)];
              reg49 <= ({$signed((~$unsigned(reg38)))} ~^ $signed(($unsigned(reg41[(3'h4):(1'h0)]) ~^ (~|(reg46 ?
                  reg38 : reg38)))));
              reg50 <= wire19[(1'h1):(1'h1)];
              reg51 <= wire28;
            end
          else
            begin
              reg48 <= wire21;
              reg49 <= (8'hb3);
              reg50 <= wire35[(1'h0):(1'h0)];
              reg51 <= (~|$signed($unsigned(reg44[(5'h10):(3'h4)])));
              reg52 <= (wire19[(4'h8):(3'h5)] + $unsigned(((reg45 ?
                      {reg39, reg52} : (&wire19)) ?
                  reg41 : $signed((~|wire22)))));
            end
          reg53 <= ($unsigned(reg48) ^~ (reg42[(4'h8):(1'h1)] ~^ (~&{(reg41 ?
                  wire29 : wire25),
              ((8'hab) <= wire20)})));
          if (wire25)
            begin
              reg54 <= reg52[(3'h6):(1'h1)];
              reg55 <= $signed((wire23 * reg51));
              reg56 <= reg39;
            end
          else
            begin
              reg54 <= $signed((~|$signed($signed(reg45[(1'h1):(1'h1)]))));
              reg55 <= (wire30 & (!$unsigned(wire29)));
            end
        end
      reg57 <= wire22[(3'h5):(2'h3)];
    end
  assign wire58 = {wire35[(3'h4):(3'h4)], $unsigned(wire29)};
  assign wire59 = {{((wire21[(3'h4):(1'h1)] ?
                                  (reg56 && wire20) : $signed(wire34)) ?
                              (8'ha1) : {reg57[(4'h8):(4'h8)]}),
                          $signed(wire35[(2'h3):(1'h1)])},
                      $unsigned((^~(~^wire33[(4'h9):(3'h7)])))};
  always
    @(posedge clk) begin
      reg60 <= ($signed((((wire30 + reg57) ?
              reg51 : (reg41 ? wire36 : (7'h42))) <<< wire30[(3'h7):(3'h7)])) ?
          wire34[(3'h7):(2'h3)] : (({reg40[(2'h3):(1'h0)],
              $unsigned(wire25)} && (wire25 ?
              (reg40 ?
                  (7'h41) : wire20) : wire58[(3'h7):(3'h7)])) ^~ $signed(wire35)));
      reg61 <= (8'hb0);
      reg62 <= (reg40[(4'h9):(3'h7)] ?
          $signed((reg44 ^ reg47[(1'h1):(1'h1)])) : (wire23 ?
              reg45 : (wire28 == wire26)));
      reg63 <= wire32;
    end
endmodule
