module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire85;
  wire signed [(3'h5):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire signed [(4'hf):(1'h0)] wire82;
  wire signed [(3'h5):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(4'hc):(1'h0)] wire75;
  wire signed [(4'h8):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(2'h3):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire21;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(5'h15):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire4;
  wire [(3'h6):(1'h0)] wire23;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'hc):(1'h0)] wire25;
  wire signed [(4'he):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire70;
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(4'h8):(1'h0)] reg76 = (1'h0);
  assign y = {wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire21,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire70,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 (1'h0)};
  assign wire4 = (8'hac);
  assign wire5 = $unsigned(({$signed((wire0 != wire0)),
                     wire2[(1'h0):(1'h0)]} > wire1));
  assign wire6 = $unsigned((($unsigned(wire4) != $signed({wire3, wire1})) ?
                     $signed({(-(8'hbf))}) : wire4[(4'h9):(2'h3)]));
  assign wire7 = ($unsigned(($unsigned((wire3 ?
                         wire4 : (7'h44))) <<< ($signed(wire3) && wire0))) ?
                     $signed($signed($unsigned($signed(wire4)))) : ((((~^wire0) && (wire6 ?
                             wire1 : wire6)) ?
                         ((wire4 | (8'hac)) ?
                             wire1 : $unsigned(wire0)) : wire3) ~^ {wire4}));
  assign wire8 = $unsigned(wire7);
  assign wire9 = wire3;
  module10 #() modinst22 (.wire12(wire2), .y(wire21), .clk(clk), .wire13(wire9), .wire14(wire6), .wire11(wire7), .wire15(wire1));
  assign wire23 = ((~|(&(wire9[(2'h3):(2'h3)] ? (8'hbd) : (wire1 > (8'ha4))))) ?
                      ($signed(($unsigned(wire2) ?
                          $unsigned(wire1) : $unsigned(wire4))) && (wire8[(3'h7):(1'h0)] || $signed($signed(wire4)))) : ((8'ha5) >>> ($unsigned($signed(wire1)) ?
                          wire6[(1'h0):(1'h0)] : wire6)));
  assign wire24 = (wire21 ?
                      $unsigned((wire9[(3'h5):(3'h4)] <= (wire23 + wire7))) : {(8'hb5),
                          $signed(wire21)});
  assign wire25 = (|(wire2 & wire5[(2'h2):(2'h2)]));
  assign wire26 = (8'ha4);
  module27 #() modinst71 (.wire28(wire8), .wire30(wire0), .clk(clk), .wire32(wire9), .wire31(wire25), .wire29(wire5), .y(wire70));
  assign wire72 = (&$unsigned($unsigned(wire1[(2'h2):(1'h1)])));
  assign wire73 = wire24[(4'hc):(4'h8)];
  assign wire74 = $unsigned(((-(8'ha5)) ?
                      wire4 : {$signed($unsigned(wire2)),
                          wire7[(2'h3):(1'h1)]}));
  assign wire75 = ($signed((wire5[(4'ha):(2'h3)] ?
                      wire72 : (wire73[(1'h1):(1'h1)] << {wire74,
                          wire0}))) - (({$signed((8'hb7))} + wire9) ?
                      ({(8'h9d)} ?
                          (~(&(8'haf))) : $unsigned((^~wire8))) : (~^$unsigned(((8'ha9) ?
                          wire0 : wire74)))));
  always
    @(posedge clk) begin
      reg76 <= wire25;
      reg77 <= ($unsigned(wire70[(3'h7):(3'h7)]) >= $unsigned($unsigned(wire1[(4'hc):(4'hc)])));
      reg78 <= (8'ha2);
      reg79 <= (wire73[(1'h1):(1'h0)] ?
          {(wire7 ~^ {(&wire1), $signed(wire75)})} : {(!($signed(wire6) ?
                  wire72[(2'h2):(1'h0)] : $signed((8'hb5))))});
    end
  assign wire80 = wire8;
  assign wire81 = $signed((~&$unsigned((&$unsigned(wire80)))));
  assign wire82 = $unsigned($unsigned($unsigned(({wire26} < wire24))));
  assign wire83 = {(8'haf),
                      (-($signed((wire21 == wire0)) ?
                          {(~&(8'haf))} : (~&(reg77 ? wire5 : (8'ha5)))))};
  assign wire84 = wire83;
  assign wire85 = ({wire9} - {$unsigned((wire72[(2'h3):(2'h2)] ?
                          {wire74, wire9} : (wire26 ? wire82 : reg79)))});
endmodule

module module27  (y, clk, wire32, wire31, wire30, wire29, wire28);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire32;
  input wire signed [(4'ha):(1'h0)] wire31;
  input wire signed [(5'h13):(1'h0)] wire30;
  input wire signed [(4'hd):(1'h0)] wire29;
  input wire signed [(4'hd):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire39;
  wire [(4'ha):(1'h0)] wire38;
  wire signed [(4'hb):(1'h0)] wire37;
  wire signed [(2'h2):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire35;
  wire [(3'h5):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  reg [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg47 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'hb):(1'h0)] reg40 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
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
                 (1'h0)};
  assign wire33 = {((~|wire29) ?
                          $signed(($unsigned(wire30) ?
                              {(7'h43)} : (^~(8'h9c)))) : $unsigned(wire32[(2'h3):(2'h2)]))};
  assign wire34 = (!$unsigned((^wire31)));
  assign wire35 = $unsigned(wire30[(4'hc):(3'h7)]);
  assign wire36 = (8'haa);
  assign wire37 = wire29[(4'ha):(3'h4)];
  assign wire38 = (^~wire37[(4'ha):(3'h5)]);
  assign wire39 = {$unsigned({$signed(((8'ha8) ? wire30 : wire28))})};
  always
    @(posedge clk) begin
      if ($unsigned((8'haf)))
        begin
          if ($unsigned(({(wire39 ?
                  (~|(8'hb6)) : (&wire34))} < (($unsigned(wire34) - wire31) ?
              {(wire28 << wire28), (wire37 ? wire36 : (8'haf))} : wire29))))
            begin
              reg40 <= wire37;
            end
          else
            begin
              reg40 <= wire29;
              reg41 <= (^~(($signed(((8'ha7) <<< wire37)) ?
                  $unsigned(((8'h9d) > (8'ha8))) : $signed((&(8'hbd)))) >> $signed(($signed(wire30) >> $unsigned(wire29)))));
              reg42 <= (wire39[(4'h8):(1'h1)] >= wire39[(5'h10):(3'h4)]);
              reg43 <= ((({wire38, $signed(wire36)} ?
                      (~$signed(wire37)) : ({wire37,
                          reg40} != (wire29 >> wire28))) < {$signed((+reg40)),
                      ((~(7'h44)) || (reg41 ? reg40 : wire37))}) ?
                  (-$signed(((8'hbe) == $unsigned(wire35)))) : $signed($signed(((wire37 ?
                      reg41 : wire33) & $unsigned(wire36)))));
              reg44 <= reg41;
            end
          if ($signed(((((reg43 ? wire36 : reg41) ? reg43 : $unsigned(wire31)) ?
              $unsigned((wire32 > wire31)) : (wire39 ^ $signed((8'hac)))) << $signed($signed($signed(reg40))))))
            begin
              reg45 <= (wire30 ^~ wire33[(2'h2):(1'h1)]);
            end
          else
            begin
              reg45 <= wire39[(5'h15):(1'h1)];
              reg46 <= wire33;
              reg47 <= (^$signed((^($signed(reg46) ?
                  $unsigned(wire33) : wire28[(3'h6):(3'h4)]))));
            end
          reg48 <= (wire28 ?
              reg47[(2'h3):(1'h1)] : $unsigned({reg47[(2'h2):(1'h0)]}));
          if ($unsigned((~^$unsigned(wire29))))
            begin
              reg49 <= {$signed({$unsigned((!reg46))}),
                  $signed((~|(&(wire36 | reg41))))};
              reg50 <= (wire37[(4'hb):(2'h2)] > ($signed($unsigned((wire30 ^ reg42))) ?
                  $signed(((reg40 >>> reg41) ?
                      wire33[(1'h0):(1'h0)] : (^~wire32))) : wire34));
              reg51 <= reg49[(4'hd):(1'h1)];
              reg52 <= reg46[(4'hc):(3'h7)];
              reg53 <= wire34[(3'h5):(2'h2)];
            end
          else
            begin
              reg49 <= $signed($unsigned($unsigned($unsigned($unsigned(reg46)))));
              reg50 <= $unsigned((($unsigned($signed(reg47)) ?
                      reg41 : (&$signed(reg40))) ?
                  wire32 : $signed(($unsigned(reg51) | ((8'hac) ?
                      reg46 : reg44)))));
              reg51 <= (^(~&{((wire35 ? reg42 : wire28) & (reg40 ?
                      wire38 : (8'ha0))),
                  ((wire36 ? wire37 : reg46) || (|wire34))}));
              reg52 <= {wire34[(2'h2):(1'h1)]};
            end
        end
      else
        begin
          reg40 <= reg40;
          reg41 <= (reg48 ?
              $signed($signed(reg50[(1'h1):(1'h0)])) : (+$unsigned($unsigned($unsigned(wire28)))));
          reg42 <= reg43;
        end
      if (reg45[(1'h1):(1'h0)])
        begin
          reg54 <= $unsigned(reg45[(1'h0):(1'h0)]);
          reg55 <= ($unsigned({$signed((reg49 ? wire33 : wire28)),
                  reg54[(4'hb):(3'h4)]}) ?
              {wire34[(3'h5):(1'h1)], wire28} : reg50);
          reg56 <= ({$signed(reg52[(2'h2):(1'h0)])} ^~ (wire39 ?
              reg52 : wire36[(2'h2):(1'h0)]));
          reg57 <= ((!wire29) ?
              (!(wire38 ?
                  ((reg48 + (8'hb4)) ?
                      (8'ha3) : $unsigned(wire31)) : $signed(wire39[(4'h9):(1'h0)]))) : ((($unsigned(wire39) == reg55) ?
                  (&(~^reg40)) : ((wire36 == reg55) ?
                      $signed(reg44) : wire39)) | wire29[(4'h9):(2'h2)]));
        end
      else
        begin
          reg54 <= {$signed({$signed((reg57 + wire37))}),
              {$signed(((wire33 && wire37) ^ (wire36 ? reg54 : reg45))),
                  wire30[(4'h8):(4'h8)]}};
          if (wire32[(2'h3):(2'h2)])
            begin
              reg55 <= $unsigned((reg57 ?
                  $unsigned({$unsigned(wire39)}) : (wire37[(4'h9):(3'h7)] ?
                      $unsigned(reg49) : $unsigned(reg49))));
              reg56 <= (-($unsigned((reg53 ^ (-wire33))) ~^ $unsigned({$unsigned(reg47)})));
              reg57 <= reg45;
              reg58 <= {((^($signed((8'ha1)) * wire34[(3'h5):(1'h1)])) <<< reg51),
                  (-(+reg41[(3'h5):(1'h1)]))};
              reg59 <= (+(reg48[(5'h10):(2'h3)] && (^{$unsigned(reg50)})));
            end
          else
            begin
              reg55 <= (&($signed(reg52[(1'h0):(1'h0)]) ?
                  (~&((^(7'h43)) ?
                      (wire30 | wire28) : $unsigned((8'hac)))) : (+(wire36 ^~ $unsigned(reg44)))));
              reg56 <= wire33;
              reg57 <= ($signed((((reg56 || reg49) ?
                      (!reg48) : $signed(reg54)) >>> wire38)) ?
                  ((^~{reg50[(1'h1):(1'h0)],
                      $signed((8'hb5))}) ^~ ($signed($signed((8'hbb))) ?
                      $unsigned((wire36 < reg45)) : (^$signed(wire39)))) : $signed(wire28[(1'h0):(1'h0)]));
              reg58 <= wire37[(4'ha):(2'h3)];
            end
          if ((~&$signed(wire36[(2'h2):(1'h0)])))
            begin
              reg60 <= (($signed($signed(((8'ha4) != wire34))) ?
                  wire32 : (reg57 ?
                      $unsigned($signed(reg54)) : ((reg41 + wire28) - (-wire36)))) && (~&reg42[(1'h1):(1'h1)]));
              reg61 <= ((($signed(reg47[(2'h3):(2'h2)]) ?
                      {{(8'hb7)}, reg47} : (wire39[(5'h14):(2'h3)] ?
                          reg60 : (wire29 ? reg44 : wire36))) ?
                  ($unsigned(wire33[(1'h0):(1'h0)]) && (&{reg55})) : (reg55 * $signed($signed(wire38)))) & $signed((~^(|((8'ha3) ?
                  wire38 : reg45)))));
              reg62 <= $signed((^$unsigned(reg47[(3'h5):(3'h4)])));
              reg63 <= reg51[(1'h0):(1'h0)];
            end
          else
            begin
              reg60 <= $signed(($signed(((wire35 ? reg48 : wire36) ?
                      wire36[(1'h0):(1'h0)] : $unsigned((8'hb4)))) ?
                  reg60[(3'h7):(1'h1)] : $unsigned((|$unsigned(reg63)))));
              reg61 <= ({reg59[(1'h0):(1'h0)]} <<< {(~|$unsigned(reg47))});
            end
          if (($signed($unsigned($signed({wire32, (8'ha7)}))) ?
              $signed({($unsigned(wire30) ?
                      $signed(reg55) : reg50)}) : $signed((reg41 <= wire30))))
            begin
              reg64 <= $unsigned(reg48[(5'h11):(3'h5)]);
              reg65 <= (((({reg42, reg48} ?
                  reg45 : $signed(reg44)) <<< ((wire35 || reg56) ^ (reg41 != reg43))) | wire38[(1'h0):(1'h0)]) <<< (((wire38[(3'h7):(3'h5)] ?
                          $unsigned(reg54) : (~reg43)) ?
                      $signed((reg45 << wire29)) : $unsigned((wire29 ?
                          reg48 : reg57))) ?
                  reg50 : ({wire35, reg49[(5'h12):(5'h11)]} >>> reg62)));
              reg66 <= reg49;
              reg67 <= ((~&((wire36[(1'h0):(1'h0)] >>> (reg66 + wire39)) ?
                  $unsigned($signed(reg56)) : ($unsigned(wire34) ?
                      (reg43 ?
                          wire29 : wire32) : {wire35}))) < {($signed((~^(8'hb6))) ?
                      $signed((&reg64)) : reg54[(2'h2):(1'h0)])});
            end
          else
            begin
              reg64 <= $signed(($signed($signed((^reg65))) != reg63));
              reg65 <= reg50[(1'h1):(1'h0)];
              reg66 <= {$signed($unsigned({reg45})),
                  $signed($unsigned((((8'hb5) & wire30) <<< (8'hba))))};
            end
          reg68 <= {reg41[(1'h0):(1'h0)]};
        end
      reg69 <= (wire34[(2'h2):(2'h2)] > (^$signed((wire28 ^ (wire32 != wire32)))));
    end
endmodule

module module10  (y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h2f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire14;
  input wire signed [(2'h3):(1'h0)] wire13;
  input wire [(5'h15):(1'h0)] wire12;
  input wire [(3'h6):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire20;
  wire signed [(5'h15):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  reg [(3'h5):(1'h0)] reg16 = (1'h0);
  assign y = {wire20, wire19, wire18, wire17, reg16, (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= wire14;
    end
  assign wire17 = $signed($signed($unsigned((~&(~|reg16)))));
  assign wire18 = wire17;
  assign wire19 = $unsigned(((wire18[(2'h2):(1'h0)] >>> $unsigned(wire13)) ?
                      (wire14[(2'h3):(1'h0)] > (wire18 >= (wire17 ^ wire12))) : ($signed(wire12) ?
                          $signed(wire17[(1'h0):(1'h0)]) : ($unsigned(wire12) ~^ (reg16 ?
                              reg16 : reg16)))));
  assign wire20 = $signed(((~&($unsigned(wire17) ?
                      $signed(wire13) : $unsigned(wire18))) >>> reg16));
endmodule
