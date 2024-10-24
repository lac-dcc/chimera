module top
#(parameter param61 = (({(((8'hae) - (8'ha8)) ? {(8'hab)} : {(8'hb1)})} ? (((-(7'h44)) ? ((8'ha2) ? (8'h9e) : (8'ha8)) : (~(8'h9c))) ^ {((7'h41) >= (8'haf)), ((7'h43) >>> (8'hbf))}) : (({(8'ha5), (7'h41)} ? ((8'hbc) ^ (8'h9f)) : {(8'had)}) != (((8'ha7) << (8'ha7)) | ((8'hbc) >> (7'h41))))) ? ((((8'ha0) ? ((8'ha7) ? (8'h9e) : (8'had)) : ((8'hb6) ? (8'hbc) : (7'h42))) <= {((8'hb6) ? (8'hb1) : (7'h42))}) ? ((((8'hbe) ? (8'hb0) : (8'ha6)) ^~ (~^(8'h9d))) ? (-((8'h9d) - (8'haf))) : (7'h40)) : ((~^{(8'h9f)}) <<< ((|(8'hb4)) ? (|(8'haa)) : ((8'hb4) | (8'ha4))))) : {((((8'h9d) ? (8'ha7) : (8'ha1)) ? ((8'hbc) ? (8'hb3) : (8'haa)) : ((8'ha9) ? (8'hbe) : (8'ha5))) ^~ (((8'had) << (8'h9f)) ? {(8'ha0)} : {(8'hbc), (8'hab)}))}))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h16f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'h8):(1'h0)] wire0;
  wire [(4'h9):(1'h0)] wire59;
  wire [(4'hb):(1'h0)] wire36;
  wire [(4'h8):(1'h0)] wire35;
  wire signed [(5'h14):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire [(2'h3):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire26;
  wire signed [(5'h11):(1'h0)] wire25;
  wire signed [(3'h4):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire23;
  wire [(5'h11):(1'h0)] wire22;
  wire signed [(4'h9):(1'h0)] wire21;
  wire signed [(3'h5):(1'h0)] wire11;
  wire [(2'h2):(1'h0)] wire10;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire5;
  reg signed [(5'h12):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg14 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg16 = (1'h0);
  reg [(4'hb):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire59,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire5,
                 reg6,
                 reg7,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 (1'h0)};
  assign wire5 = wire0[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      reg6 <= (wire1 < ((&(|$unsigned(wire4))) ?
          wire5[(2'h2):(1'h0)] : (|((wire4 * wire1) <= (+wire1)))));
      reg7 <= ({{wire3},
              $unsigned(((wire1 ? wire3 : wire3) < $signed(wire2)))} ?
          (|reg6) : $unsigned({($unsigned((8'hb9)) ? (-wire2) : (-wire0))}));
    end
  assign wire8 = wire4[(2'h2):(2'h2)];
  assign wire9 = ((($signed({wire2}) != wire1) && ($signed({wire0}) >= {(wire0 ?
                         wire0 : wire8)})) - (reg7 ?
                     (&{$unsigned(reg6)}) : wire8));
  assign wire10 = wire3[(4'hc):(4'hc)];
  assign wire11 = wire10;
  always
    @(posedge clk) begin
      reg12 <= (reg6 ?
          (($signed(wire9[(4'hc):(3'h4)]) ?
              wire4[(2'h2):(1'h0)] : (wire0 ?
                  {reg7} : $signed((8'haf)))) > $unsigned(((reg6 ?
              reg7 : reg7) && ((8'hac) ?
              wire3 : (8'ha9))))) : (^~$unsigned(wire1[(4'ha):(4'h9)])));
      if (wire11)
        begin
          reg13 <= wire4[(2'h2):(1'h0)];
          reg14 <= (reg13 ?
              ((|(wire11[(2'h3):(1'h0)] == (^(8'ha1)))) ?
                  reg13[(3'h6):(3'h4)] : wire9) : wire5);
          reg15 <= (~&wire11);
          reg16 <= reg12;
        end
      else
        begin
          reg13 <= $unsigned($signed($unsigned($signed({wire5, (8'hbb)}))));
        end
      reg17 <= ((($signed($signed(wire3)) >> (reg14[(2'h2):(1'h1)] ?
              wire4[(2'h2):(1'h0)] : (reg7 ? reg15 : wire5))) ?
          (wire0 <= (^(wire2 ? wire3 : reg6))) : (~&((8'hb1) ?
              reg15 : {wire1, wire3}))) * ($unsigned(reg7[(1'h0):(1'h0)]) ?
          reg13 : $unsigned(($unsigned(reg6) ~^ {reg14, wire0}))));
      reg18 <= wire1[(3'h4):(3'h4)];
    end
  always
    @(posedge clk) begin
      reg19 <= (|(wire5 ? wire10[(1'h1):(1'h0)] : reg16));
      reg20 <= wire8;
    end
  assign wire21 = ((8'hbd) <= ($signed(((~reg6) ~^ reg17[(3'h4):(2'h3)])) && $unsigned(reg15)));
  assign wire22 = ({(~|(&(wire8 * (8'ha4))))} ?
                      ((reg20[(4'hd):(3'h5)] <<< $unsigned((wire21 ?
                              reg17 : wire11))) ?
                          (~^reg13) : (($unsigned(reg17) >>> wire11[(2'h2):(2'h2)]) ~^ $unsigned(wire9[(5'h11):(4'hb)]))) : $signed($unsigned($signed((wire4 ?
                          reg16 : wire5)))));
  assign wire23 = reg6[(4'hc):(3'h7)];
  assign wire24 = $unsigned({(+(~wire9)),
                      (-((wire1 ? reg14 : wire23) && $unsigned((8'ha2))))});
  assign wire25 = reg12;
  assign wire26 = reg12[(2'h3):(1'h0)];
  assign wire27 = (wire22 ?
                      wire5 : (reg15[(2'h2):(1'h1)] < ($signed(wire4) ^~ $signed($signed(reg20)))));
  assign wire28 = ((wire0 ?
                      $signed(wire25[(4'hc):(4'ha)]) : ({reg17,
                          wire21[(3'h4):(3'h4)]} - (reg15 ?
                          (8'ha1) : wire23))) & ((|((wire3 & (8'hae)) ?
                      wire3[(2'h3):(1'h1)] : reg20[(2'h3):(2'h3)])) || ((~&(reg19 != reg19)) <= (~|(8'ha7)))));
  always
    @(posedge clk) begin
      reg29 <= ((8'ha4) ~^ ((wire28 ?
          ((wire24 ?
              wire10 : wire8) <= (wire22 || reg18)) : $unsigned(wire2[(1'h0):(1'h0)])) && ($unsigned($signed(wire27)) | wire21)));
      reg30 <= (~(^(reg20 ? reg20 : reg14[(2'h3):(2'h3)])));
      reg31 <= reg20;
      reg32 <= (((((reg15 ? (8'h9c) : wire28) ?
              $signed(reg20) : $unsigned(wire27)) ?
          (((7'h41) >= wire0) >> (reg19 ?
              wire11 : reg20)) : wire11[(1'h1):(1'h0)]) - {((reg16 ?
              reg17 : reg12) >= $signed(wire22)),
          $signed($unsigned((8'h9c)))}) | reg19);
    end
  assign wire33 = wire11[(2'h3):(2'h3)];
  assign wire34 = (^~$unsigned(((^reg32[(2'h3):(1'h0)]) - reg7[(4'h8):(1'h0)])));
  assign wire35 = $signed($signed(((&(wire23 - reg15)) & $signed((wire34 ?
                      wire1 : wire26)))));
  assign wire36 = {((^~(!(wire35 ? wire1 : reg7))) ?
                          $signed((!reg32[(1'h1):(1'h1)])) : {$signed({wire11,
                                  reg18}),
                              wire28[(2'h2):(1'h1)]}),
                      wire23[(4'hb):(4'h9)]};
  module37 #() modinst60 (wire59, clk, wire4, reg31, reg12, reg29, wire2);
endmodule

module module37  (y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'hc0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire42;
  input wire signed [(4'hd):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire40;
  input wire signed [(5'h13):(1'h0)] wire39;
  input wire [(4'hf):(1'h0)] wire38;
  wire [(4'hc):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire signed [(4'hb):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(5'h12):(1'h0)] wire53;
  wire [(4'h8):(1'h0)] wire52;
  wire [(4'hf):(1'h0)] wire51;
  wire [(5'h11):(1'h0)] wire50;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire43;
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 reg49,
                 reg48,
                 (1'h0)};
  assign wire43 = wire40;
  assign wire44 = wire39[(3'h4):(1'h1)];
  assign wire45 = $unsigned((^($signed($unsigned(wire38)) ^~ (wire41[(2'h2):(2'h2)] && $signed((8'h9d))))));
  assign wire46 = ((~|wire42) ?
                      $signed(((8'ha0) >>> (wire41[(1'h0):(1'h0)] ?
                          $unsigned(wire38) : (wire44 ?
                              wire38 : wire38)))) : wire45[(4'he):(1'h1)]);
  assign wire47 = $signed(($signed(wire43[(4'he):(1'h0)]) ?
                      (+($unsigned(wire38) ?
                          wire44 : (wire38 ?
                              wire45 : wire41))) : ($signed($signed(wire44)) ?
                          (|(wire40 ?
                              wire41 : wire43)) : wire44[(1'h0):(1'h0)])));
  always
    @(posedge clk) begin
      reg48 <= wire41;
      reg49 <= wire47[(1'h0):(1'h0)];
    end
  assign wire50 = ((|(wire38[(3'h5):(2'h3)] >>> ($unsigned(wire38) ?
                      $signed(wire38) : wire47[(3'h4):(2'h2)]))) && {(+(&(reg49 >= (8'hba))))});
  assign wire51 = wire41;
  assign wire52 = wire47[(3'h6):(1'h1)];
  assign wire53 = (^(~&$unsigned(((wire41 ? reg48 : wire45) ?
                      wire41[(3'h5):(2'h3)] : $signed(wire38)))));
  assign wire54 = ({$signed($unsigned({wire42, wire45}))} ?
                      (wire39[(4'h9):(1'h0)] >= ($signed({wire50}) ?
                          (((8'hb6) ?
                              (8'had) : (8'h9c)) | $unsigned(reg48)) : ($signed((8'hb9)) ?
                              wire51 : $signed(wire43)))) : wire43);
  assign wire55 = $signed(wire54);
  assign wire56 = ((~^$signed(wire51)) > $unsigned(wire43[(3'h5):(3'h4)]));
  assign wire57 = (~&reg49[(2'h2):(1'h1)]);
  assign wire58 = (((!(~&((7'h43) ?
                      wire56 : reg49))) <<< ($signed($signed((8'hbd))) ?
                      {(reg49 >>> wire43)} : (^$signed(wire39)))) > (-(~^(8'h9d))));
endmodule
