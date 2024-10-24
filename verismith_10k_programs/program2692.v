module top
#(parameter param80 = (~{((8'hb4) << {(8'hb6), {(8'hb2)}}), ((((8'hbb) == (7'h43)) ? (~|(8'hbe)) : (&(8'h9d))) ? ((~|(8'hb4)) & ((8'h9d) <<< (8'ha8))) : (-((8'ha2) ? (8'hac) : (7'h43))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire79;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(2'h2):(1'h0)] wire77;
  wire [(4'h8):(1'h0)] wire76;
  wire [(3'h6):(1'h0)] wire71;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(5'h15):(1'h0)] wire4;
  wire signed [(4'h9):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire48;
  wire signed [(3'h5):(1'h0)] wire49;
  wire [(4'h8):(1'h0)] wire69;
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(4'he):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire71,
                 wire45,
                 wire4,
                 wire47,
                 wire48,
                 wire49,
                 wire69,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 (1'h0)};
  assign wire4 = $signed((-$signed($unsigned(wire0))));
  module5 #() modinst46 (wire45, clk, wire3, wire1, wire0, wire2, wire4);
  assign wire47 = wire45[(4'he):(4'ha)];
  assign wire48 = (~^$signed((({wire47} ?
                          wire47[(2'h3):(2'h3)] : $signed(wire4)) ?
                      $signed((wire3 ? wire2 : wire2)) : $unsigned(wire0))));
  assign wire49 = wire0;
  module50 #() modinst70 (wire69, clk, wire49, wire4, wire1, wire48, wire47);
  assign wire71 = wire45;
  always
    @(posedge clk) begin
      reg72 <= wire48;
      reg73 <= wire4[(3'h6):(2'h2)];
      reg74 <= wire4;
      reg75 <= (!{((~wire3[(4'h8):(4'h8)]) - (wire2[(2'h2):(2'h2)] ?
              (wire49 < (7'h43)) : reg74))});
    end
  assign wire76 = ({(reg73[(1'h0):(1'h0)] << ((+wire3) ?
                              (wire71 >= wire3) : (wire49 ? reg74 : wire4))),
                          ($unsigned((wire49 ?
                              wire0 : wire69)) ~^ (&wire69[(2'h2):(1'h1)]))} ?
                      {(reg75[(4'h8):(2'h2)] << {$unsigned(wire4),
                              $unsigned((8'ha9))})} : wire2);
  assign wire77 = ((wire71[(1'h1):(1'h0)] < (7'h41)) ?
                      (8'hbf) : ($signed(reg73) ?
                          $unsigned($unsigned($signed(wire49))) : {({(8'hb2),
                                      reg74} ?
                                  wire49[(1'h0):(1'h0)] : wire69[(4'h8):(1'h1)])}));
  assign wire78 = (((&reg75) ^ ((&(7'h44)) ?
                      {(wire4 ?
                              wire4 : reg74)} : (wire2[(2'h2):(1'h0)] >= (wire3 << wire4)))) <<< (+wire48[(1'h1):(1'h0)]));
  assign wire79 = wire69[(3'h7):(3'h7)];
endmodule

module module50
#(parameter param67 = ((((8'hb4) ? (((8'ha0) >> (7'h43)) ^~ ((8'hbb) - (8'ha1))) : ({(8'ha1), (8'ha8)} ? {(8'hb5), (8'ha8)} : ((8'ha0) ^ (8'ha8)))) ? ({(&(8'h9f)), ((8'haf) ? (8'ha0) : (8'ha0))} ? {{(8'hb7)}, ((8'hb5) - (8'hb3))} : ((~(8'ha4)) == ((8'hba) ? (8'ha8) : (8'haf)))) : {(^~{(8'hbb)}), {(8'hb1), ((8'hba) <<< (8'hae))}}) >>> (^~(((8'ha3) ? ((8'hb5) >= (8'haa)) : (8'hb1)) ? (|((8'hb2) && (8'hbd))) : {((8'ha9) ? (8'hab) : (7'h43)), {(8'hb6), (8'haf)}}))), 
parameter param68 = ({(((~param67) >= (param67 ? param67 : param67)) == (param67 ? param67 : (param67 != (8'ha2))))} >= param67))
(y, clk, wire55, wire54, wire53, wire52, wire51);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire55;
  input wire [(4'hc):(1'h0)] wire54;
  input wire signed [(5'h11):(1'h0)] wire53;
  input wire signed [(3'h5):(1'h0)] wire52;
  input wire [(4'h9):(1'h0)] wire51;
  wire signed [(4'hd):(1'h0)] wire65;
  wire [(3'h5):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(2'h3):(1'h0)] wire56;
  reg signed [(4'h8):(1'h0)] reg66 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg [(4'h8):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg [(5'h15):(1'h0)] reg57 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire56,
                 reg66,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 (1'h0)};
  assign wire56 = (~wire55[(2'h3):(2'h3)]);
  always
    @(posedge clk) begin
      reg57 <= ((8'ha0) ? wire55 : (~&wire55[(1'h0):(1'h0)]));
      reg58 <= wire51;
      if ((&(reg57 >= wire52)))
        begin
          if ((wire51 ? wire55[(1'h1):(1'h1)] : reg58[(1'h0):(1'h0)]))
            begin
              reg59 <= (8'ha5);
            end
          else
            begin
              reg59 <= $signed($signed(wire53));
              reg60 <= ($unsigned((wire54[(2'h2):(1'h1)] ^~ reg59)) ^~ ($signed(wire55[(2'h3):(2'h3)]) ?
                  wire56 : $signed({(wire55 ? wire55 : wire52)})));
              reg61 <= $unsigned((wire53 ? reg59[(3'h5):(3'h4)] : reg58));
            end
        end
      else
        begin
          reg59 <= (wire54 ^ wire56);
          reg60 <= $unsigned(reg58);
          reg61 <= (~&({$unsigned((8'hbf))} || $unsigned(reg60)));
        end
      reg62 <= (($signed(reg57) ?
          wire54[(2'h3):(1'h1)] : $unsigned(wire56)) ^ $signed($signed(((reg57 ?
              wire56 : (8'hb3)) ?
          (|reg58) : (reg57 && wire55)))));
    end
  assign wire63 = wire53[(5'h11):(3'h6)];
  assign wire64 = ((~{((~|reg57) ? (reg61 + wire56) : (!wire52)),
                          wire51[(3'h5):(1'h1)]}) ?
                      $signed($unsigned(wire63)) : reg62[(2'h3):(2'h2)]);
  assign wire65 = $unsigned((reg60 <<< (reg62 + ((wire51 << reg62) ?
                      $signed(wire54) : (wire51 ^ reg62)))));
  always
    @(posedge clk) begin
      reg66 <= wire63;
    end
endmodule

module module5  (y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  input wire signed [(3'h4):(1'h0)] wire8;
  input wire [(3'h4):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire44;
  wire signed [(5'h15):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire42;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'ha):(1'h0)] wire40;
  wire [(4'hd):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(3'h4):(1'h0)] wire37;
  wire [(4'hb):(1'h0)] wire35;
  wire [(2'h3):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire11;
  reg signed [(3'h5):(1'h0)] reg15 = (1'h0);
  reg [(5'h14):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg12 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire35,
                 wire16,
                 wire11,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 (1'h0)};
  assign wire11 = $signed(wire10[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg12 <= $unsigned(wire9[(3'h7):(3'h6)]);
      reg13 <= wire9;
      reg14 <= reg12[(2'h3):(2'h2)];
      reg15 <= (~|($unsigned((~(wire9 - reg12))) == $signed($unsigned(wire8))));
    end
  assign wire16 = {$unsigned((|$unsigned($signed(reg12))))};
  module17 #() modinst36 (wire35, clk, wire8, reg12, wire9, reg14);
  assign wire37 = {(+(|$signed((reg15 && reg13)))),
                      (reg13[(1'h0):(1'h0)] ?
                          {({reg12, (8'h9d)} != wire16[(1'h0):(1'h0)]),
                              wire16} : reg12[(1'h1):(1'h1)])};
  assign wire38 = (((reg12[(1'h0):(1'h0)] ^ (wire16 << (wire11 ^~ wire10))) != (~&reg15[(1'h0):(1'h0)])) ?
                      (-$signed($signed($unsigned(reg12)))) : (({wire37,
                              $signed(wire9)} ^~ reg14[(4'he):(4'hb)]) ?
                          $signed($signed((~^(8'hb3)))) : $signed((~&{wire16,
                              wire35}))));
  assign wire39 = wire11[(3'h6):(2'h3)];
  assign wire40 = $signed($signed(wire37));
  assign wire41 = (+(&($unsigned(wire39[(4'h9):(3'h4)]) ?
                      wire38[(4'hc):(3'h6)] : wire8)));
  assign wire42 = $signed(wire38);
  assign wire43 = (!$unsigned($signed((~wire11))));
  assign wire44 = wire16[(2'h2):(2'h2)];
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'ha0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire [(2'h2):(1'h0)] wire19;
  input wire signed [(5'h14):(1'h0)] wire18;
  wire signed [(4'hd):(1'h0)] wire34;
  wire signed [(5'h14):(1'h0)] wire33;
  wire signed [(2'h2):(1'h0)] wire32;
  wire signed [(3'h5):(1'h0)] wire31;
  wire signed [(5'h12):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire28;
  wire signed [(4'h9):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'ha):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  assign y = {wire34,
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
                 wire23,
                 wire22,
                 (1'h0)};
  assign wire22 = ({wire20[(3'h4):(1'h0)],
                      $signed($signed({wire21}))} ^ ((((wire20 ?
                          wire18 : (7'h41)) || {wire18, wire21}) ?
                      (wire21[(3'h4):(2'h2)] ?
                          ((7'h44) ?
                              wire19 : wire18) : $unsigned(wire18)) : $unsigned((wire21 != wire20))) << wire20[(1'h0):(1'h0)]));
  assign wire23 = ($signed(wire22[(1'h0):(1'h0)]) ?
                      {(~^wire20[(1'h0):(1'h0)]),
                          $unsigned(((wire22 ? wire20 : wire18) ?
                              $unsigned((7'h40)) : {wire19,
                                  wire22}))} : wire21[(1'h1):(1'h1)]);
  assign wire24 = ((^~{$unsigned(wire22),
                      ($signed(wire23) != wire21[(1'h0):(1'h0)])}) + $unsigned(wire23[(2'h2):(2'h2)]));
  assign wire25 = {wire18[(5'h14):(3'h5)],
                      ({$signed($signed(wire22))} * $signed(wire22[(1'h0):(1'h0)]))};
  assign wire26 = $unsigned($unsigned(wire21));
  assign wire27 = wire23[(2'h3):(2'h3)];
  assign wire28 = {(wire18[(2'h3):(1'h1)] == {({wire20} == wire18[(4'he):(3'h4)]),
                          (wire25 ?
                              wire26[(2'h2):(2'h2)] : $unsigned(wire22))}),
                      ((-($unsigned(wire25) ?
                          (~|(8'hbb)) : (wire26 << wire18))) <<< wire20)};
  assign wire29 = $unsigned((&{$signed(wire24)}));
  assign wire30 = (8'ha1);
  assign wire31 = ($signed(($signed($unsigned(wire22)) ?
                          wire21 : $signed(wire21))) ?
                      wire28 : (|(~&$unsigned($unsigned(wire22)))));
  assign wire32 = $signed(wire19[(1'h1):(1'h0)]);
  assign wire33 = ((wire26 >>> wire32) <<< (!wire25[(3'h5):(2'h3)]));
  assign wire34 = (wire33[(4'hd):(2'h2)] <<< (-$unsigned(wire27[(4'h9):(3'h7)])));
endmodule
