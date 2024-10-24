module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h75):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire4;
  input wire signed [(4'ha):(1'h0)] wire3;
  input wire [(4'he):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire92;
  wire [(2'h2):(1'h0)] wire91;
  wire signed [(5'h11):(1'h0)] wire90;
  wire [(4'h8):(1'h0)] wire89;
  wire [(4'hb):(1'h0)] wire88;
  wire [(5'h13):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(4'hb):(1'h0)] wire84;
  wire signed [(5'h12):(1'h0)] wire83;
  wire [(5'h13):(1'h0)] wire81;
  assign y = {wire92,
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
                 (1'h0)};
  module5 #() modinst82 (.y(wire81), .wire6(wire4), .wire8(wire0), .clk(clk), .wire7(wire3), .wire9(wire1));
  assign wire83 = wire4[(4'ha):(4'h9)];
  assign wire84 = wire0[(1'h1):(1'h1)];
  assign wire85 = (($unsigned($signed($signed(wire0))) ?
                          ($unsigned(wire81) >> {$signed(wire1),
                              (wire83 ?
                                  wire1 : wire0)}) : ({wire84[(4'hb):(3'h6)]} ?
                              $unsigned((wire4 ?
                                  wire0 : wire1)) : $unsigned(wire3[(1'h1):(1'h1)]))) ?
                      $signed(($signed({wire4,
                          wire0}) <= wire84)) : $unsigned((~((wire84 ?
                              wire2 : (7'h40)) ?
                          (~|wire84) : (~^wire4)))));
  assign wire86 = {(^~$unsigned(wire83[(3'h6):(2'h2)])), wire83[(4'hb):(4'hb)]};
  assign wire87 = (~&wire0);
  assign wire88 = (wire2 ?
                      ((~^(~&wire1)) & ((7'h40) != wire84[(4'h9):(2'h3)])) : $unsigned((-(wire4 << {(8'hbc),
                          wire3}))));
  assign wire89 = wire86;
  assign wire90 = $signed(($unsigned(wire1) ?
                      ({wire2[(3'h6):(1'h0)]} & ($unsigned(wire0) ?
                          $unsigned(wire4) : wire4)) : (!wire1[(3'h4):(1'h1)])));
  assign wire91 = wire2;
  assign wire92 = wire86;
endmodule

module module5
#(parameter param79 = (&(~&((((8'hab) < (8'hb9)) >>> (~^(8'hb5))) ? ({(8'hb6), (8'ha1)} ? {(8'h9c)} : (+(7'h41))) : {((8'hb8) <<< (8'hb0)), (-(8'haf))}))), 
parameter param80 = ({((~{param79}) || ((|param79) <<< {param79, param79}))} ? param79 : {{(param79 < (^param79))}, (((param79 || param79) > {param79, param79}) ? (+(+(8'h9d))) : (8'hb5))}))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire signed [(3'h5):(1'h0)] wire76;
  wire signed [(2'h3):(1'h0)] wire75;
  wire signed [(4'hb):(1'h0)] wire73;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(5'h11):(1'h0)] wire14;
  wire [(5'h14):(1'h0)] wire13;
  wire signed [(2'h3):(1'h0)] wire12;
  wire [(4'he):(1'h0)] wire11;
  wire signed [(4'hb):(1'h0)] wire10;
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h13):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'h8):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg16 = (1'h0);
  assign y = {wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire73,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire10 = wire9[(5'h10):(2'h3)];
  assign wire11 = {(~|({wire6} >> (~&$signed(wire7))))};
  assign wire12 = wire8[(2'h3):(2'h3)];
  assign wire13 = $unsigned((~^$unsigned(wire7)));
  assign wire14 = wire13[(2'h2):(1'h1)];
  assign wire15 = (wire10 ? wire12[(1'h0):(1'h0)] : wire6[(3'h7):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire14)
        begin
          reg16 <= ((8'ha2) ? wire11[(3'h5):(2'h3)] : wire15[(1'h1):(1'h0)]);
          if (wire12[(2'h2):(1'h0)])
            begin
              reg17 <= $unsigned(($signed(wire10[(4'ha):(2'h3)]) == (+reg16)));
            end
          else
            begin
              reg17 <= $unsigned((+$unsigned($unsigned((wire8 * wire11)))));
              reg18 <= (8'ha9);
              reg19 <= {{{((reg18 ? wire12 : reg16) <<< (wire8 < wire13)),
                          (~(wire12 ? (8'h9c) : reg16))}}};
              reg20 <= $unsigned($unsigned($signed(($unsigned(wire7) ?
                  $signed(wire15) : wire11[(1'h0):(1'h0)]))));
            end
          reg21 <= (~|((8'hb0) ?
              wire11[(4'hd):(4'h8)] : {({reg18, reg19} ? (-wire15) : reg18),
                  wire10}));
          reg22 <= wire7[(1'h0):(1'h0)];
        end
      else
        begin
          reg16 <= ((|$signed(reg16[(1'h1):(1'h0)])) ?
              reg20[(3'h6):(3'h5)] : wire7);
          reg17 <= (~^reg21);
        end
      reg23 <= {(($unsigned({reg21, wire8}) ?
              {(reg17 | reg18)} : (+(wire8 && reg17))) > (-((~(8'hb2)) ?
              $signed(reg20) : $signed(wire14)))),
          wire11};
      reg24 <= wire6;
      reg25 <= (((~(^~$unsigned(wire15))) ?
              reg18[(3'h5):(3'h5)] : $signed($signed((~|wire14)))) ?
          (~&reg20[(2'h3):(2'h2)]) : $signed((^~((wire12 == reg19) ~^ (reg23 ?
              reg23 : wire14)))));
      if (((reg21 < (wire8 ? wire7[(1'h1):(1'h1)] : wire10)) ?
          ((^(~&wire8)) >> reg19[(1'h0):(1'h0)]) : (reg21 ?
              ((~&(reg17 ? wire9 : wire14)) ?
                  wire13[(2'h3):(1'h1)] : $unsigned(wire12)) : ($unsigned((+wire14)) ?
                  (wire15 << (^~reg23)) : ({reg20, wire13} ?
                      (reg20 ? (7'h44) : wire12) : (wire15 < reg24))))))
        begin
          reg26 <= wire7;
          reg27 <= $unsigned({{($unsigned(wire11) ? $signed(reg25) : (-reg22)),
                  {(wire8 ? wire10 : wire11)}}});
        end
      else
        begin
          reg26 <= $signed({reg21, reg21[(3'h6):(2'h2)]});
          reg27 <= reg19;
          if ((wire7[(2'h2):(1'h0)] ?
              $unsigned(wire8[(3'h7):(1'h1)]) : ((~^reg25[(4'hb):(3'h4)]) >>> ((!(reg24 ?
                  reg22 : reg20)) ^~ $signed($signed(wire7))))))
            begin
              reg28 <= (+reg16);
              reg29 <= (($signed(wire12) ?
                  $signed(($unsigned(reg20) ?
                      reg25 : (reg18 & reg25))) : (~&(^~reg24))) ^~ $signed((+$unsigned({wire7,
                  reg26}))));
            end
          else
            begin
              reg28 <= $signed(((wire13 - (((7'h42) ?
                      wire14 : reg24) >> (8'h9c))) ?
                  ($unsigned({wire6}) <<< (~^$unsigned(reg19))) : (!reg24[(1'h0):(1'h0)])));
              reg29 <= ((8'h9e) != $unsigned((~|$signed((^~wire10)))));
              reg30 <= (|$signed($unsigned((^~(reg19 ? reg16 : wire12)))));
              reg31 <= (8'ha2);
            end
          reg32 <= $unsigned($signed((-$unsigned(reg19[(2'h2):(2'h2)]))));
        end
    end
  module33 #() modinst74 (wire73, clk, reg21, reg31, wire9, wire7);
  assign wire75 = wire10;
  assign wire76 = reg29[(4'h8):(2'h3)];
  assign wire77 = (wire73 ?
                      reg27[(2'h2):(1'h1)] : ((((reg27 == reg23) ?
                              (^wire8) : reg25[(2'h3):(2'h2)]) >> $unsigned((reg25 ?
                              wire75 : wire11))) ?
                          ($signed((|reg17)) ^ $signed($unsigned(wire73))) : wire13[(5'h14):(5'h10)]));
  assign wire78 = wire12;
endmodule

module module33  (y, clk, wire37, wire36, wire35, wire34);
  output wire [(32'h1c3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire37;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire signed [(4'h9):(1'h0)] wire35;
  input wire signed [(4'h9):(1'h0)] wire34;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire65;
  wire signed [(2'h2):(1'h0)] wire49;
  wire signed [(5'h11):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(4'h9):(1'h0)] wire38;
  reg signed [(4'hc):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(4'hc):(1'h0)] reg51 = (1'h0);
  reg [(4'he):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h5):(1'h0)] reg41 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire70,
                 wire65,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire40,
                 wire39,
                 wire38,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire38 = wire36[(4'he):(4'hb)];
  assign wire39 = (wire36[(4'h8):(1'h1)] < ($signed(wire38[(3'h5):(3'h4)]) ?
                      ($unsigned(wire36) & $signed($unsigned(wire36))) : (-wire36[(4'h8):(3'h5)])));
  assign wire40 = $signed(wire36[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg41 <= $unsigned((+($unsigned($unsigned(wire39)) >> wire36)));
      reg42 <= $signed((~$signed(wire40)));
      reg43 <= ((~&reg42[(3'h7):(3'h6)]) ?
          (^{$unsigned(((8'hab) ? wire37 : reg41))}) : (~|wire35));
      reg44 <= $signed($unsigned((({wire38} ?
          reg42 : (reg41 < wire39)) >= reg43)));
    end
  assign wire45 = (wire39[(4'hd):(4'hc)] - reg43[(3'h6):(3'h6)]);
  assign wire46 = ({wire35[(2'h3):(2'h3)]} - (wire34[(4'h9):(3'h7)] ?
                      ({$unsigned(wire37)} == ($signed((8'haa)) << (wire37 + (8'h9c)))) : $signed(($signed(reg44) ?
                          reg42 : (reg44 ? reg44 : wire40)))));
  assign wire47 = ($unsigned($unsigned((~^$unsigned(wire34)))) >>> wire46[(4'hd):(3'h4)]);
  assign wire48 = wire36[(4'hc):(3'h7)];
  assign wire49 = reg41;
  always
    @(posedge clk) begin
      if (wire38)
        begin
          reg50 <= $unsigned($signed(wire49));
          reg51 <= {{({wire48, $signed(wire37)} >= ($unsigned(wire48) ?
                      (8'h9c) : (wire34 <<< (8'hb7))))}};
          if ((wire39[(4'hf):(4'hd)] - (^$signed($unsigned(wire35)))))
            begin
              reg52 <= $signed(wire45[(3'h7):(1'h0)]);
              reg53 <= $signed($signed(wire45[(1'h1):(1'h0)]));
              reg54 <= (~|($signed($unsigned(((8'hb6) ?
                  reg53 : wire45))) | {$signed(((8'hb1) ? wire38 : reg52)),
                  ($signed((8'ha8)) <= (~wire35))}));
            end
          else
            begin
              reg52 <= $signed($signed((+$unsigned($signed(reg44)))));
              reg53 <= {$signed((wire34 ? {reg42} : wire38))};
              reg54 <= $unsigned(wire37);
            end
          reg55 <= (+reg51);
        end
      else
        begin
          if (wire48[(3'h6):(2'h2)])
            begin
              reg50 <= reg44;
              reg51 <= wire35[(3'h6):(1'h0)];
            end
          else
            begin
              reg50 <= ($unsigned($signed((!reg43))) ^ wire35[(1'h0):(1'h0)]);
              reg51 <= $unsigned($signed(wire39[(2'h2):(2'h2)]));
              reg52 <= (&wire38[(2'h2):(1'h1)]);
              reg53 <= $unsigned($signed($signed((reg51 ?
                  {reg52} : (!wire34)))));
            end
        end
      if ($signed($unsigned({wire39[(3'h4):(1'h1)], reg54[(4'hf):(4'hd)]})))
        begin
          reg56 <= $unsigned(wire47);
          reg57 <= $signed(reg54[(3'h5):(1'h0)]);
          reg58 <= (reg56 ? wire40 : {reg54[(4'h9):(1'h1)]});
          reg59 <= $unsigned((+reg53));
          if (reg51)
            begin
              reg60 <= wire47[(2'h3):(1'h1)];
              reg61 <= reg60;
              reg62 <= (^(wire46[(1'h0):(1'h0)] || reg51[(3'h5):(2'h2)]));
              reg63 <= (wire40 & ((~|{(~&wire49)}) ?
                  $signed((^~wire49[(2'h2):(1'h1)])) : {$unsigned($signed(reg55))}));
            end
          else
            begin
              reg60 <= reg44[(3'h4):(1'h1)];
              reg61 <= $unsigned(reg43[(3'h6):(1'h0)]);
              reg62 <= (((8'hb4) ^~ reg41) | (reg55 ?
                  (~(wire48[(5'h11):(4'ha)] ?
                      (8'h9e) : wire48[(2'h3):(2'h2)])) : $signed($signed($unsigned(wire34)))));
              reg63 <= $unsigned((&wire38));
            end
        end
      else
        begin
          if ($unsigned(reg63))
            begin
              reg56 <= {reg60[(2'h3):(1'h0)], $unsigned((^~(&(-reg58))))};
              reg57 <= ({(^$signed((reg59 ? reg42 : (8'hbc))))} ?
                  ({($signed(reg41) && reg58[(4'h8):(1'h1)])} > $unsigned({wire46[(5'h13):(4'ha)],
                      {(8'hbd), wire39}})) : $unsigned($unsigned((~|reg63))));
              reg58 <= ((&(((^reg59) | ((8'hba) ?
                      wire37 : wire46)) + {$unsigned(wire37)})) ?
                  $signed((wire34 ^~ (|wire39))) : ((((wire38 ?
                              (8'hb2) : reg53) ?
                          (wire36 ? reg56 : wire34) : reg53) ?
                      (~|(|reg61)) : reg44[(1'h0):(1'h0)]) && $unsigned({(reg63 << wire39),
                      (wire47 != reg43)})));
            end
          else
            begin
              reg56 <= wire35;
              reg57 <= $signed($unsigned(wire38[(2'h3):(2'h3)]));
              reg58 <= reg41;
            end
          reg59 <= {((((7'h42) ~^ {wire47}) >>> $signed((reg58 >= (8'ha5)))) <= reg60),
              $signed(reg58)};
          reg60 <= $unsigned($signed((^~(~(~^wire34)))));
          if ((reg53[(2'h3):(1'h1)] ?
              (($unsigned(wire47) >= $signed($signed(wire35))) < wire45[(4'ha):(3'h7)]) : wire48))
            begin
              reg61 <= $unsigned($unsigned($unsigned(reg54)));
              reg62 <= (~&wire46);
              reg63 <= {$unsigned(reg59)};
              reg64 <= wire38[(2'h3):(1'h0)];
            end
          else
            begin
              reg61 <= reg60;
              reg62 <= ((reg58[(4'h8):(1'h1)] ^ wire38) ?
                  $unsigned((+((reg44 - wire40) ?
                      wire36[(4'hc):(3'h4)] : (~reg43)))) : (reg50 & ($unsigned(reg41[(2'h2):(1'h1)]) ?
                      (wire49[(1'h1):(1'h1)] << reg42[(3'h6):(3'h4)]) : (&reg64))));
              reg63 <= ((({{wire48}} != (reg55 ?
                          $unsigned((8'hb2)) : $signed(reg41))) ?
                      wire48[(4'hb):(4'hb)] : $unsigned(((|(8'ha2)) ~^ wire35))) ?
                  $signed($unsigned(($unsigned((8'hb5)) ?
                      wire49[(1'h0):(1'h0)] : $unsigned(reg55)))) : $signed((((wire45 ?
                          wire47 : (8'hbf)) ?
                      wire37[(5'h12):(3'h6)] : (reg54 ?
                          (8'ha9) : reg63)) ^~ reg59[(2'h3):(1'h0)])));
            end
        end
    end
  assign wire65 = (~^$signed($unsigned($unsigned({(8'hb2), reg61}))));
  always
    @(posedge clk) begin
      reg66 <= (8'ha2);
      reg67 <= $unsigned(((!(~&{reg55, reg58})) ?
          ((~^(-wire36)) | wire38) : reg42[(2'h3):(2'h3)]));
      reg68 <= (~({((8'ha1) ^ (~|reg41))} ? reg51 : $signed((^(|wire49)))));
      reg69 <= ((reg42 < (reg67[(1'h0):(1'h0)] ?
          wire36[(1'h0):(1'h0)] : reg55)) < $unsigned(wire65));
    end
  assign wire70 = (-(!(($unsigned(reg58) ?
                      (wire36 ? wire48 : wire37) : $signed(wire39)) < reg63)));
  assign wire71 = $unsigned((8'hbc));
  assign wire72 = wire37[(4'ha):(3'h4)];
endmodule
