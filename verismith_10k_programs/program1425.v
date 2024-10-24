module top
#(parameter param92 = {({(|{(8'hbc), (7'h42)}), (|(8'hb3))} ? (^~(^~((8'hb3) << (8'ha4)))) : (&(!((8'ha8) ? (8'ha9) : (8'ha4)))))})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h23a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire89;
  wire [(3'h7):(1'h0)] wire88;
  wire [(4'hf):(1'h0)] wire87;
  wire [(2'h2):(1'h0)] wire86;
  wire signed [(4'he):(1'h0)] wire85;
  wire [(2'h3):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire [(4'hd):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire [(4'hc):(1'h0)] wire53;
  wire [(5'h10):(1'h0)] wire14;
  wire signed [(4'h9):(1'h0)] wire10;
  wire signed [(5'h12):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  reg signed [(3'h4):(1'h0)] reg91 = (1'h0);
  reg [(5'h13):(1'h0)] reg90 = (1'h0);
  reg [(4'h9):(1'h0)] reg82 = (1'h0);
  reg [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(4'he):(1'h0)] reg80 = (1'h0);
  reg [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(3'h4):(1'h0)] reg77 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg [(4'he):(1'h0)] reg75 = (1'h0);
  reg [(5'h14):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(3'h7):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'h9):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg13 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire70,
                 wire69,
                 wire68,
                 wire53,
                 wire14,
                 wire10,
                 wire9,
                 wire8,
                 reg91,
                 reg90,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg5,
                 reg6,
                 reg7,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (((&$unsigned(wire0)) >> wire2) ?
          $unsigned((~^(wire1 <<< wire0[(4'h8):(3'h6)]))) : wire3);
    end
  always
    @(posedge clk) begin
      reg6 <= wire1;
      reg7 <= (reg6[(5'h11):(4'he)] ?
          wire1[(2'h3):(1'h0)] : ((($signed((8'hab)) ?
                      wire3[(2'h3):(1'h0)] : $signed(wire2)) ?
                  wire4[(2'h3):(2'h3)] : $signed(wire2[(2'h2):(1'h1)])) ?
              wire4[(2'h3):(2'h2)] : $signed((wire2[(4'h8):(3'h6)] ^~ wire2[(1'h0):(1'h0)]))));
    end
  assign wire8 = $unsigned((~|(8'hb0)));
  assign wire9 = $unsigned($unsigned(reg6[(4'hf):(4'ha)]));
  assign wire10 = wire4;
  always
    @(posedge clk) begin
      reg11 <= $signed(({$signed(reg7[(1'h0):(1'h0)])} & ($signed((^wire3)) ?
          reg5 : wire0)));
      reg12 <= (((wire9[(4'h8):(3'h6)] && {{(8'hb8), wire9}, (wire3 > wire3)}) ?
              ((wire3 <<< $unsigned(wire4)) ?
                  wire2 : (wire0 >>> wire9)) : reg7[(1'h0):(1'h0)]) ?
          reg7 : {((reg6 & ((7'h44) || wire4)) ?
                  (wire4 ? {reg6, reg11} : (&wire4)) : ((wire9 ?
                      wire10 : reg5) <<< (~&reg7)))});
      reg13 <= (({reg12[(1'h1):(1'h0)]} ?
          $unsigned(wire8) : wire3[(3'h4):(1'h1)]) >>> (reg12 >> $unsigned(reg6)));
    end
  assign wire14 = (^$signed(($unsigned({reg7}) >> wire2[(2'h2):(1'h1)])));
  module15 #() modinst54 (.wire19(wire3), .wire20(wire4), .wire16(reg12), .wire18(reg7), .y(wire53), .wire17(reg11), .clk(clk));
  always
    @(posedge clk) begin
      if (reg7)
        begin
          reg55 <= (((({reg12, reg6} || $signed(reg13)) << (((8'hb4) ?
              wire3 : wire2) || reg6[(3'h4):(2'h2)])) >>> reg5[(1'h0):(1'h0)]) ^~ (8'hb6));
        end
      else
        begin
          if ($unsigned(wire9[(3'h7):(1'h0)]))
            begin
              reg55 <= $signed((({(wire14 ? reg7 : wire10),
                  wire0} ^~ (reg13[(3'h6):(1'h1)] ?
                  (wire14 <<< wire4) : (reg6 >>> reg5))) >> wire4[(2'h2):(2'h2)]));
              reg56 <= wire8[(3'h7):(3'h7)];
              reg57 <= $signed(wire3);
              reg58 <= reg11[(1'h1):(1'h1)];
              reg59 <= reg11;
            end
          else
            begin
              reg55 <= (($signed(wire0[(3'h6):(2'h2)]) ?
                      $unsigned(wire8) : {$unsigned($unsigned(wire1))}) ?
                  ($unsigned($unsigned({reg59,
                      reg11})) * (|(!{reg56}))) : (wire10 ?
                      $signed(wire8[(3'h6):(1'h0)]) : $signed($unsigned($signed(reg57)))));
              reg56 <= ((^{(wire0 ? reg7 : reg58)}) && (wire8 ^~ wire1));
            end
          reg60 <= reg12;
          reg61 <= {$unsigned($unsigned(wire14[(3'h6):(3'h4)])),
              ({$signed((8'hbe))} ?
                  {reg60,
                      ((wire2 ? reg7 : wire3) ?
                          (wire4 - wire0) : $signed((8'hb0)))} : $unsigned($signed(((8'h9c) ?
                      reg5 : reg12))))};
          reg62 <= {((8'h9f) ?
                  $unsigned(reg56) : (reg5[(3'h4):(1'h0)] <= (reg59 ~^ (wire9 ?
                      (8'hb6) : wire4)))),
              ($unsigned((+$unsigned(reg7))) <= wire4[(1'h1):(1'h1)])};
          reg63 <= (($unsigned($signed($unsigned(reg61))) ?
              ({(^reg57), $signed(reg7)} ?
                  wire1[(3'h5):(1'h0)] : (~$unsigned(reg58))) : {wire9}) << $signed(reg62));
        end
      reg64 <= wire53;
      reg65 <= reg5;
      reg66 <= $signed($unsigned($signed(($signed(reg61) ?
          (reg60 ~^ reg61) : wire4[(1'h1):(1'h0)]))));
      reg67 <= reg58[(4'ha):(3'h5)];
    end
  assign wire68 = (wire14 << {((~(wire9 & reg61)) ?
                          (&(reg13 ? wire10 : wire4)) : {reg56}),
                      (^~$signed($signed(reg62)))});
  assign wire69 = (~&(reg13 ?
                      $unsigned($signed(reg64)) : (&$unsigned($signed(wire10)))));
  assign wire70 = reg57[(4'h9):(3'h4)];
  always
    @(posedge clk) begin
      reg71 <= ($signed(reg60) ~^ wire70[(4'hc):(3'h5)]);
    end
  always
    @(posedge clk) begin
      reg72 <= (^$signed(wire3[(5'h10):(4'ha)]));
      reg73 <= ((reg66 ?
              (~&wire70) : ({wire68, (-reg65)} ?
                  $unsigned((reg72 || (7'h42))) : $unsigned((8'hb6)))) ?
          (~&$unsigned($signed($unsigned(reg60)))) : $unsigned(((~|$signed(reg65)) - $unsigned((-wire10)))));
      if (reg7)
        begin
          reg74 <= {$signed((($unsigned(wire0) & {reg13,
                  reg55}) < wire4[(1'h0):(1'h0)])),
              reg7[(1'h1):(1'h0)]};
        end
      else
        begin
          reg74 <= ((($unsigned($unsigned(reg12)) ?
                  ({wire14, wire70} ^ reg13) : (reg57[(3'h6):(2'h2)] ?
                      $signed((8'hba)) : $unsigned(wire1))) <= ((reg5[(2'h3):(1'h1)] >> wire3[(5'h14):(1'h1)]) & $unsigned({reg73,
                  wire10}))) ?
              {reg11} : (reg72[(3'h7):(1'h0)] & $signed($signed(reg71))));
          reg75 <= {(&reg74), $signed($signed((7'h41)))};
          reg76 <= $signed($unsigned(($signed(wire8[(2'h2):(1'h1)]) ?
              reg75 : ((|wire70) <<< wire14[(3'h5):(1'h1)]))));
          reg77 <= (-((reg67 & reg6[(4'hb):(3'h6)]) + ($unsigned($unsigned(reg61)) && (-$signed(reg13)))));
          reg78 <= (wire68[(4'h9):(3'h5)] ?
              (^((^(8'hb4)) ?
                  (!(^~reg12)) : $unsigned((reg63 <<< reg65)))) : (({(+reg64),
                          (wire10 || (8'ha4))} ?
                      {(~|reg71)} : ((+wire1) <= {wire53, wire9})) ?
                  (&(^~reg74[(1'h0):(1'h0)])) : {reg76}));
        end
      reg79 <= (wire70 ?
          (reg59[(4'ha):(1'h0)] ?
              $signed($signed(reg59)) : $signed(wire2[(3'h6):(1'h1)])) : $unsigned(reg60));
      if ((&wire3))
        begin
          reg80 <= (~$signed((((^~wire53) ? $unsigned(reg7) : $unsigned(reg7)) ?
              reg79 : reg63)));
        end
      else
        begin
          if ((-(&wire9)))
            begin
              reg80 <= $unsigned(reg57);
            end
          else
            begin
              reg80 <= reg62[(1'h1):(1'h0)];
              reg81 <= ($signed(reg78) & ($signed($unsigned($unsigned(wire4))) ?
                  ((reg13[(4'hb):(4'ha)] ?
                      {wire9} : $signed((8'h9f))) ^~ $unsigned((^wire70))) : (!reg7[(3'h5):(2'h3)])));
            end
          reg82 <= {$unsigned(wire2),
              (($unsigned(((8'ha3) ? reg62 : reg59)) ?
                      $signed({(8'hb6)}) : $unsigned($signed(reg65))) ?
                  ($unsigned($signed(wire14)) ^ $unsigned($unsigned((7'h43)))) : wire0)};
        end
    end
  assign wire83 = (reg63 ? $unsigned(reg72[(4'h8):(1'h0)]) : reg73);
  assign wire84 = reg80;
  assign wire85 = {reg61[(3'h4):(1'h1)]};
  assign wire86 = {$unsigned((reg65 <= ((wire4 ? wire14 : reg67) ?
                          reg56[(4'hb):(3'h7)] : (wire85 >= reg71))))};
  assign wire87 = $signed($unsigned($unsigned((|((8'hb0) ~^ (8'haf))))));
  assign wire88 = {$signed({($unsigned((8'hb1)) || $signed(reg59))}),
                      $unsigned((7'h43))};
  assign wire89 = ($unsigned((&(~^(wire88 ?
                      (8'hb1) : (8'haa))))) ^~ wire8[(4'h9):(3'h4)]);
  always
    @(posedge clk) begin
      reg90 <= ((-(|$signed($unsigned((8'h9c))))) ^~ {reg11,
          reg76[(3'h4):(1'h0)]});
      if ((((~&(~|{reg75, reg13})) | reg58) ?
          $signed($signed((&$unsigned(reg60)))) : (~^$signed((reg62[(2'h3):(1'h0)] ?
              (reg12 ? reg13 : reg55) : $signed(reg82))))))
        begin
          reg91 <= reg60;
        end
      else
        begin
          reg91 <= $signed(($unsigned($unsigned({reg13, reg58})) ?
              {$unsigned($unsigned(reg65))} : wire14));
        end
    end
endmodule

module module15
#(parameter param52 = ({(({(8'hbd)} << ((8'hbc) << (8'ha4))) * (~((8'hab) ? (7'h42) : (8'hba)))), {(((8'ha2) != (8'ha1)) ? (~^(8'hbc)) : ((8'hb2) ? (8'hb7) : (8'ha1))), ({(8'hac)} ? ((8'hae) <= (8'ha4)) : {(8'hb6), (8'ha5)})}} != ({((~&(8'hb0)) == {(8'hac), (8'h9f)}), (~|(~^(8'ha3)))} ? ({((8'hae) ? (8'hbc) : (8'h9f))} ~^ {((8'hb2) ? (8'h9f) : (8'ha9)), ((8'hb9) ? (8'ha0) : (8'hb4))}) : (((8'hae) ? (8'hbe) : {(8'ha7), (8'hb5)}) ^~ (7'h41)))))
(y, clk, wire20, wire19, wire18, wire17, wire16);
  output wire [(32'h157):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(5'h15):(1'h0)] wire19;
  input wire [(4'ha):(1'h0)] wire18;
  input wire [(5'h10):(1'h0)] wire17;
  input wire signed [(3'h7):(1'h0)] wire16;
  wire [(4'ha):(1'h0)] wire49;
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(2'h3):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(3'h5):(1'h0)] reg21 = (1'h0);
  assign y = {wire49,
                 reg51,
                 reg50,
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
  always
    @(posedge clk) begin
      reg21 <= (^wire18);
      if ($signed($signed(($unsigned(wire17) <= (~((8'hbf) ?
          wire18 : (8'hbc)))))))
        begin
          if ($signed((reg21 <<< $signed({$signed((8'hbb)), wire17}))))
            begin
              reg22 <= $signed((|wire17));
              reg23 <= (reg22 ?
                  (wire20[(1'h0):(1'h0)] ?
                      {$unsigned({wire18}),
                          (~^$signed((7'h41)))} : $unsigned(reg21)) : ($unsigned((~wire18)) ?
                      wire16 : (+$unsigned((~&wire20)))));
            end
          else
            begin
              reg22 <= $unsigned($unsigned(wire19));
            end
          reg24 <= reg22[(2'h3):(1'h1)];
          if ({(wire20[(2'h2):(1'h0)] * (|((wire18 >= reg21) || $signed(wire18))))})
            begin
              reg25 <= ({(!(~|reg24)), $signed($unsigned(wire18))} ?
                  wire19 : reg22[(5'h11):(4'hd)]);
              reg26 <= reg23[(3'h6):(3'h5)];
              reg27 <= (wire20 ?
                  (^~((&$signed(wire19)) ?
                      $unsigned($signed(reg24)) : reg23)) : reg21);
            end
          else
            begin
              reg25 <= ($signed({($signed(reg27) | reg22)}) >>> (~^$signed($unsigned(reg24[(1'h1):(1'h1)]))));
              reg26 <= {$unsigned($unsigned((!(reg27 | wire18))))};
              reg27 <= reg27;
              reg28 <= (+((^$unsigned({reg25})) ~^ (~|$unsigned($signed(wire17)))));
              reg29 <= reg25[(3'h6):(2'h3)];
            end
          reg30 <= $unsigned((($signed($signed((8'hb6))) ?
              ($signed(wire20) * (reg28 != reg22)) : ($unsigned(reg24) <= {(8'ha1),
                  wire19})) <= reg25));
          reg31 <= wire19[(3'h4):(1'h1)];
        end
      else
        begin
          reg22 <= (reg24 ^ reg23);
        end
    end
  always
    @(posedge clk) begin
      if (reg27[(1'h0):(1'h0)])
        begin
          reg32 <= (8'ha5);
          if ($unsigned($unsigned({(-(wire16 >>> reg31))})))
            begin
              reg33 <= $signed(((~^(reg22 ^~ (reg28 ? reg27 : reg21))) ?
                  $signed(reg29) : $signed(reg21[(2'h2):(2'h2)])));
            end
          else
            begin
              reg33 <= (wire18[(3'h7):(3'h5)] <= (reg29 ?
                  reg28 : (((reg29 || reg30) < (~reg24)) != ({reg25} ?
                      reg22[(4'hf):(4'hf)] : reg27[(3'h7):(3'h7)]))));
              reg34 <= (($unsigned($signed((|reg21))) ?
                  $unsigned(wire16[(2'h2):(2'h2)]) : {reg21[(2'h2):(1'h1)],
                      (((8'hb9) ?
                          wire17 : (7'h43)) <<< reg25[(4'ha):(1'h1)])}) != ($unsigned($signed((&(8'hb1)))) ?
                  ($unsigned((reg29 ? reg28 : reg33)) ?
                      $signed((wire18 | reg24)) : ($signed(reg30) ?
                          $signed(reg28) : (reg29 <<< reg28))) : ($signed(wire20) ?
                      ((reg29 >> reg28) ?
                          $signed(reg33) : wire19[(4'hd):(2'h2)]) : wire19)));
              reg35 <= $signed($unsigned(($signed(wire16[(3'h6):(2'h3)]) <= $signed($signed(reg21)))));
              reg36 <= (reg35[(3'h4):(1'h0)] ?
                  wire19[(4'hc):(4'h9)] : (&$unsigned($unsigned((reg26 ?
                      reg21 : reg30)))));
            end
          if ((reg23[(2'h2):(1'h1)] ?
              reg35[(2'h2):(1'h1)] : (~wire17[(4'h8):(2'h3)])))
            begin
              reg37 <= wire19;
              reg38 <= {($signed((8'hae)) - $signed(reg23[(3'h5):(2'h2)])),
                  (&reg27[(1'h0):(1'h0)])};
            end
          else
            begin
              reg37 <= $unsigned((~&$signed(wire16[(3'h7):(1'h0)])));
              reg38 <= reg31[(4'ha):(4'h9)];
              reg39 <= ((!(((reg30 ? (8'hb2) : reg21) >>> (wire20 <= reg29)) ?
                      (|$signed(reg35)) : ({reg25, reg24} < {(8'h9f)}))) ?
                  $unsigned(reg38) : wire19);
            end
          if (($unsigned($signed($unsigned($unsigned(reg34)))) >= $signed((8'hb9))))
            begin
              reg40 <= $unsigned($unsigned(wire16[(2'h2):(2'h2)]));
            end
          else
            begin
              reg40 <= ((~&wire17) ? reg34[(1'h0):(1'h0)] : (7'h41));
              reg41 <= $unsigned(reg29);
              reg42 <= reg31[(3'h7):(3'h4)];
              reg43 <= $unsigned((reg42 && $signed($signed($signed(reg30)))));
              reg44 <= $unsigned(reg23);
            end
          reg45 <= (!reg22);
        end
      else
        begin
          if ($signed(wire18[(4'h9):(2'h3)]))
            begin
              reg32 <= ($unsigned((!$unsigned((wire19 | (7'h44))))) == {reg44[(2'h3):(1'h0)],
                  (&$unsigned(reg40))});
              reg33 <= $unsigned($unsigned($unsigned($unsigned((!reg23)))));
              reg34 <= reg35;
              reg35 <= (&(!$unsigned(((wire18 ? reg32 : wire18) ?
                  reg25 : (~reg44)))));
              reg36 <= reg39[(2'h2):(1'h1)];
            end
          else
            begin
              reg32 <= $signed((~&reg38));
              reg33 <= $unsigned($unsigned(wire19[(3'h4):(2'h3)]));
              reg34 <= reg23;
            end
          if ((reg36 ?
              ({reg29,
                  $unsigned((reg34 ? (8'hab) : wire18))} - ({(reg36 << (8'ha5)),
                      wire18[(1'h1):(1'h0)]} ?
                  reg25[(2'h2):(1'h0)] : reg30[(3'h6):(3'h6)])) : $signed(((^~(reg30 ?
                  reg39 : reg35)) && ({(7'h43), reg40} ?
                  (reg24 ? (8'ha0) : reg33) : wire20[(2'h3):(2'h2)])))))
            begin
              reg37 <= $signed($unsigned({$unsigned((8'hb4))}));
            end
          else
            begin
              reg37 <= reg28[(4'hb):(4'h8)];
              reg38 <= {(~&$unsigned((~&(reg23 ? reg39 : reg45))))};
              reg39 <= (8'ha8);
              reg40 <= reg27;
            end
          if (reg26)
            begin
              reg41 <= (7'h41);
              reg42 <= reg35;
              reg43 <= (&{reg23[(5'h15):(4'he)]});
              reg44 <= (reg36 ?
                  (((reg32[(1'h0):(1'h0)] ?
                      wire19 : (reg25 ?
                          reg42 : reg39)) | ((8'ha9) ^~ reg38[(1'h0):(1'h0)])) ~^ wire16) : $signed(($signed($signed(reg42)) - ((reg29 * reg39) * reg30))));
            end
          else
            begin
              reg41 <= reg40;
              reg42 <= reg35[(1'h1):(1'h1)];
              reg43 <= reg27[(3'h7):(3'h6)];
              reg44 <= reg25;
            end
        end
      reg46 <= ((~^reg32) << reg35);
      reg47 <= $signed(reg24);
      reg48 <= reg27;
    end
  assign wire49 = $unsigned((!(~|$unsigned($unsigned(reg25)))));
  always
    @(posedge clk) begin
      reg50 <= wire19;
      reg51 <= ($unsigned((($signed(reg21) ?
          wire17 : {reg45,
              reg22}) == ((^~reg27) && $signed(reg50)))) ^ (&$unsigned($signed((8'hb2)))));
    end
endmodule
