module top
#(parameter param83 = ((((((7'h43) ? (8'ha2) : (7'h43)) ? (&(8'hb4)) : {(8'ha4), (8'ha4)}) || ((-(8'ha3)) != {(7'h43), (8'hbe)})) ? ((((8'ha2) ? (8'ha6) : (8'ha4)) >> (~|(8'hb7))) ? ((^~(8'hb0)) ? (-(8'hb5)) : (^(8'hb4))) : (8'hab)) : (^(~&((8'ha0) ? (8'haa) : (8'hbd))))) > (^{(8'hae), (((8'ha6) ? (8'hb7) : (8'ha1)) ? ((8'hab) ? (8'h9c) : (8'hb3)) : ((8'ha3) ? (8'hb3) : (8'ha8)))})), 
parameter param84 = (!{((~(8'hb7)) >> (param83 ? {(8'hb6)} : (~^(8'hb4))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h88):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire81;
  wire signed [(5'h14):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'hb):(1'h0)] wire9;
  wire signed [(4'hd):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire7;
  wire signed [(4'hb):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire [(5'h10):(1'h0)] wire4;
  assign y = {wire82,
                 wire81,
                 wire79,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = $unsigned(wire0);
  assign wire5 = ($signed(wire0[(1'h1):(1'h1)]) >= ((~^{wire3[(4'he):(4'ha)]}) ?
                     wire4[(3'h4):(3'h4)] : $unsigned((8'hbc))));
  assign wire6 = wire3;
  assign wire7 = $signed(($unsigned(((wire1 ? wire3 : wire5) != (~wire0))) ?
                     wire0[(1'h0):(1'h0)] : $unsigned((~&(wire1 ?
                         (8'hbb) : wire2)))));
  assign wire8 = (-wire0);
  assign wire9 = $unsigned(($signed({wire2[(1'h0):(1'h0)],
                     wire7[(1'h1):(1'h1)]}) >> $unsigned({wire2})));
  assign wire10 = $unsigned(wire7);
  assign wire11 = (&(^wire0));
  assign wire12 = (wire6 ? (~&wire5) : wire0);
  module13 #() modinst80 (.y(wire79), .wire17(wire3), .wire16(wire0), .clk(clk), .wire15(wire2), .wire14(wire10));
  assign wire81 = $signed(wire9[(2'h3):(1'h1)]);
  assign wire82 = wire6[(4'hb):(2'h3)];
endmodule

module module13
#(parameter param78 = (|(((-((8'hb6) ? (8'haa) : (8'ha3))) ? (8'h9d) : (((8'hac) ? (8'ha9) : (8'ha0)) ? (+(8'hb9)) : ((8'hb8) ? (8'hb5) : (8'had)))) ? ((~&(-(7'h41))) ? (((7'h42) | (8'hb1)) ? (^~(7'h43)) : ((7'h40) ^~ (7'h40))) : (((8'ha5) ^ (8'hb6)) | (~|(8'haa)))) : {({(8'hb8), (8'hb2)} > ((8'ha5) ? (8'hb7) : (8'ha0))), (((8'ha7) << (8'h9c)) ? ((8'hab) ? (8'had) : (7'h43)) : (~(7'h44)))})))
(y, clk, wire14, wire15, wire16, wire17);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire14;
  input wire [(5'h12):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(5'h15):(1'h0)] wire17;
  wire signed [(5'h15):(1'h0)] wire39;
  wire signed [(2'h2):(1'h0)] wire41;
  wire signed [(5'h11):(1'h0)] wire42;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire46;
  wire [(5'h14):(1'h0)] wire47;
  wire [(5'h13):(1'h0)] wire48;
  wire [(2'h2):(1'h0)] wire49;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(5'h12):(1'h0)] wire76;
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg60 = (1'h0);
  reg [(4'ha):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  assign y = {wire39,
                 wire41,
                 wire42,
                 wire43,
                 wire46,
                 wire47,
                 wire48,
                 wire49,
                 wire50,
                 wire63,
                 wire76,
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
                 reg45,
                 reg44,
                 (1'h0)};
  module18 #() modinst40 (.wire22(wire17), .wire21(wire16), .wire23(wire15), .wire19((8'hb2)), .y(wire39), .clk(clk), .wire20(wire14));
  assign wire41 = {(((8'ha7) && wire17[(4'h8):(1'h0)]) ?
                          $signed(wire15) : ((wire17[(4'h8):(3'h5)] ?
                              {wire17, wire17} : (wire39 ?
                                  (8'ha1) : wire17)) ~^ wire15))};
  assign wire42 = wire16;
  assign wire43 = wire39;
  always
    @(posedge clk) begin
      reg44 <= wire17[(5'h13):(4'h8)];
      reg45 <= wire43[(4'hb):(3'h5)];
    end
  assign wire46 = $signed({$signed(((wire42 ?
                          wire17 : wire42) - wire14[(2'h3):(1'h0)]))});
  assign wire47 = $signed((reg44 ?
                      ($unsigned($unsigned(wire17)) << (~^$signed(wire43))) : wire14));
  assign wire48 = $signed(({{$signed(wire17), reg44[(4'hb):(3'h6)]}} ?
                      (wire41 ?
                          $unsigned(wire15[(4'hb):(2'h3)]) : $signed((wire15 ?
                              wire14 : wire43))) : $unsigned(reg45)));
  assign wire49 = $unsigned(wire48);
  assign wire50 = ($signed((~^$unsigned(wire43))) ?
                      (^~(~(8'ha2))) : wire39[(5'h12):(4'hc)]);
  always
    @(posedge clk) begin
      if ($signed(((8'ha3) ?
          (+$signed(wire49)) : {$unsigned(reg45[(3'h5):(1'h0)]),
              wire17[(4'ha):(1'h1)]})))
        begin
          reg51 <= (($signed(wire43[(2'h2):(2'h2)]) ?
                  reg45[(4'h8):(4'h8)] : ({wire16,
                      $unsigned(wire48)} + wire17)) ?
              (^~wire48[(2'h2):(2'h2)]) : {((|wire41) ?
                      wire16[(1'h1):(1'h1)] : wire39),
                  $signed($signed(((8'ha7) ? wire42 : (7'h44))))});
        end
      else
        begin
          reg51 <= wire39[(4'hc):(4'ha)];
        end
      reg52 <= wire46;
      if ($signed((wire43 ? ($signed((~&wire15)) < wire43) : wire16)))
        begin
          reg53 <= wire39[(4'ha):(3'h5)];
          reg54 <= wire46;
          if ($signed($signed(reg53)))
            begin
              reg55 <= $signed((wire47 != (($signed(reg53) ?
                      $signed(wire50) : $signed(reg54)) ?
                  ({wire15} | (8'h9e)) : reg52[(2'h3):(2'h3)])));
            end
          else
            begin
              reg55 <= (+wire46[(2'h3):(2'h2)]);
            end
          reg56 <= $signed((!($unsigned(wire41) >>> reg54)));
          reg57 <= $unsigned(((((|reg45) ? (wire15 >>> (8'h9c)) : wire14) ?
              $unsigned({reg52, reg53}) : reg56) || wire41[(2'h2):(1'h1)]));
        end
      else
        begin
          reg53 <= $unsigned({reg57[(2'h2):(1'h0)], {wire48[(2'h3):(2'h2)]}});
          if ($signed((8'hb4)))
            begin
              reg54 <= ({(({reg56, reg56} + $signed(wire49)) ?
                          wire50 : ($unsigned((8'hac)) * ((8'hb4) * reg53))),
                      ($signed({wire48, reg52}) ?
                          $signed((&(8'h9c))) : {$unsigned(reg55)})} ?
                  (^~(wire39 ?
                      (!wire43[(4'h8):(3'h4)]) : $unsigned($unsigned(reg57)))) : (((~|wire50[(4'h9):(2'h3)]) || reg52) < (^~wire50[(3'h5):(3'h4)])));
            end
          else
            begin
              reg54 <= ({wire46} ?
                  $signed($signed((!reg51))) : (^((reg56[(5'h12):(4'he)] ?
                          $unsigned(wire49) : $signed(reg45)) ?
                      (wire47 ?
                          (~&wire49) : (wire47 ?
                              wire41 : reg52)) : $signed((wire39 ?
                          (8'hbf) : reg45)))));
              reg55 <= $signed(wire14);
              reg56 <= wire41[(1'h1):(1'h0)];
              reg57 <= $signed((reg53[(1'h0):(1'h0)] | wire48[(2'h3):(2'h3)]));
            end
          reg58 <= $signed($signed($unsigned($signed($signed(wire42)))));
          if ((wire50 ^ $signed($signed($unsigned((reg53 * wire50))))))
            begin
              reg59 <= (wire49[(1'h1):(1'h1)] + $unsigned((reg58 ?
                  wire49 : wire15)));
              reg60 <= reg52;
            end
          else
            begin
              reg59 <= (^~((~&({reg58, reg56} ?
                      (reg51 ? reg60 : reg51) : reg44)) ?
                  $unsigned((reg59 ? $signed(reg45) : wire46)) : wire42));
            end
          reg61 <= wire17;
        end
      reg62 <= (8'ha3);
    end
  assign wire63 = ((8'hb2) < reg44);
  module64 #() modinst77 (.clk(clk), .y(wire76), .wire66(wire46), .wire68(reg55), .wire69(wire48), .wire65(wire39), .wire67(reg56));
endmodule

module module64
#(parameter param75 = (~^((+((~^(8'hba)) >= ((8'h9c) ? (8'ha4) : (8'h9d)))) <<< ((~&(!(7'h40))) ? (!{(8'hbe)}) : ((~|(8'haa)) && (|(8'hba)))))))
(y, clk, wire69, wire68, wire67, wire66, wire65);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire69;
  input wire signed [(5'h15):(1'h0)] wire68;
  input wire [(5'h14):(1'h0)] wire67;
  input wire signed [(4'hb):(1'h0)] wire66;
  input wire [(5'h15):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire74;
  wire [(4'he):(1'h0)] wire73;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(4'ha):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  assign y = {wire74, wire73, wire72, wire71, wire70, (1'h0)};
  assign wire70 = wire66[(3'h4):(2'h2)];
  assign wire71 = ({(-(|(!wire69))), wire68} ?
                      wire67[(4'h8):(2'h2)] : wire66[(3'h4):(3'h4)]);
  assign wire72 = (~&wire66);
  assign wire73 = wire69[(2'h3):(1'h1)];
  assign wire74 = wire73[(3'h6):(3'h4)];
endmodule

module module18
#(parameter param38 = {(((~|((8'h9e) - (7'h43))) ? (-{(8'hb0), (8'ha4)}) : (8'ha6)) <= ((&{(8'hbd)}) ? {((7'h43) ^ (8'hb4))} : {(8'hb5), (~&(7'h41))}))})
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hcc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire [(4'ha):(1'h0)] wire21;
  input wire [(4'ha):(1'h0)] wire20;
  input wire [(3'h4):(1'h0)] wire19;
  wire [(4'h9):(1'h0)] wire37;
  wire signed [(5'h13):(1'h0)] wire36;
  wire [(5'h15):(1'h0)] wire35;
  wire signed [(5'h11):(1'h0)] wire34;
  wire [(3'h4):(1'h0)] wire33;
  wire [(4'hd):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire [(4'hd):(1'h0)] wire29;
  wire [(4'ha):(1'h0)] wire28;
  wire [(5'h14):(1'h0)] wire27;
  wire signed [(4'hb):(1'h0)] wire26;
  wire [(5'h15):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire24;
  assign y = {wire37,
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
                 (1'h0)};
  assign wire24 = {((|{$signed(wire22), $signed(wire20)}) ?
                          {{wire23[(3'h5):(1'h0)],
                                  (wire21 ?
                                      wire22 : (8'hbb))}} : $signed(wire23[(5'h11):(1'h1)])),
                      wire21};
  assign wire25 = {$signed(wire19[(3'h4):(3'h4)]),
                      $unsigned(wire23[(1'h0):(1'h0)])};
  assign wire26 = (8'hbe);
  assign wire27 = ($unsigned(((!wire21[(4'h8):(3'h5)]) ?
                      (^{wire26, wire20}) : ({(8'ha4),
                          wire24} & (8'hb3)))) + ($unsigned($unsigned((!(8'hb5)))) << $unsigned({(|wire26)})));
  assign wire28 = ($unsigned((wire21 ?
                      wire21[(3'h4):(1'h1)] : (wire22[(5'h10):(2'h3)] ?
                          (8'haf) : (wire24 ?
                              (8'ha6) : wire25)))) < wire22[(5'h13):(1'h1)]);
  assign wire29 = $signed(wire24);
  assign wire30 = wire28;
  assign wire31 = $signed($unsigned((wire19 <= {(&wire27),
                      $unsigned(wire22)})));
  assign wire32 = $unsigned(wire23);
  assign wire33 = {(~wire26[(4'hb):(3'h5)])};
  assign wire34 = $signed($signed({$unsigned((|wire19)),
                      $unsigned((wire28 || wire31))}));
  assign wire35 = wire22[(4'he):(1'h1)];
  assign wire36 = wire30;
  assign wire37 = wire19[(1'h1):(1'h1)];
endmodule
