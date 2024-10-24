module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h1e8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire4;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(3'h4):(1'h0)] wire0;
  wire signed [(3'h5):(1'h0)] wire86;
  wire [(4'ha):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire84;
  wire signed [(2'h2):(1'h0)] wire83;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(5'h13):(1'h0)] wire81;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(5'h12):(1'h0)] wire79;
  wire signed [(4'ha):(1'h0)] wire78;
  wire [(4'h9):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(4'hd):(1'h0)] wire34;
  reg [(3'h6):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg8 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg10 = (1'h0);
  reg [(4'hf):(1'h0)] reg11 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg12 = (1'h0);
  reg [(4'hd):(1'h0)] reg13 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg23 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg32 = (1'h0);
  reg [(4'he):(1'h0)] reg33 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire75,
                 wire34,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (({((wire0 && (8'ha8)) ?
                  (~^(wire2 ? wire0 : wire0)) : $signed(wire1[(1'h1):(1'h0)])),
              wire4} ?
          {({((8'hbe) ? wire0 : wire1), (wire4 ? wire0 : wire3)} ?
                  wire1[(4'h8):(3'h4)] : (^~(wire1 ?
                      wire1 : wire1)))} : wire2[(3'h4):(2'h3)]))
        begin
          reg5 <= {(({{(8'ha6), wire1}} || wire1[(4'ha):(4'ha)]) ?
                  wire1 : ($unsigned(wire3[(3'h5):(2'h3)]) && (8'ha4))),
              $unsigned(wire0[(1'h0):(1'h0)])};
          reg6 <= $unsigned(wire4[(4'h9):(1'h0)]);
          reg7 <= {{(($signed(wire1) ? $unsigned(reg5) : reg5) ?
                      ($signed(wire4) != (wire4 > (8'ha6))) : $unsigned($signed(reg5)))}};
        end
      else
        begin
          if ($signed((((wire1 ?
              reg6[(4'ha):(4'ha)] : (wire3 <<< wire3)) - (|$signed(wire2))) && reg7)))
            begin
              reg5 <= (({({wire0} ? (wire2 ? wire1 : reg5) : (|(8'hac)))} ?
                      $unsigned((+wire2[(1'h0):(1'h0)])) : reg6[(3'h7):(3'h7)]) ?
                  reg7[(2'h2):(1'h0)] : (7'h43));
              reg6 <= wire0[(1'h0):(1'h0)];
            end
          else
            begin
              reg5 <= $signed(((&((reg5 ? wire2 : wire3) ?
                  (^~reg7) : (wire4 ^~ wire3))) >= (!wire2[(2'h2):(1'h0)])));
              reg6 <= wire1;
              reg7 <= ($unsigned($signed((~wire1[(2'h2):(2'h2)]))) ^ wire1[(3'h7):(1'h0)]);
              reg8 <= wire0;
            end
          if ($unsigned({{(^$signed(wire4)),
                  {wire2[(1'h0):(1'h0)], reg8[(4'hc):(4'h8)]}},
              wire1}))
            begin
              reg9 <= reg6[(3'h5):(3'h5)];
              reg10 <= ($signed(wire3) * reg5[(1'h1):(1'h1)]);
            end
          else
            begin
              reg9 <= $signed($unsigned((-$unsigned(wire4))));
              reg10 <= ((^~((&(reg8 ^ wire0)) << {(~^wire4), reg6})) ?
                  $signed(wire4[(3'h5):(2'h3)]) : (^~($signed((wire2 ^~ reg8)) ~^ $unsigned((~reg6)))));
              reg11 <= ($unsigned($signed($unsigned((|reg6)))) << ((!((wire2 ^~ wire2) ?
                  (-wire2) : $unsigned(reg7))) >= ($signed($unsigned(wire1)) >>> ((reg5 && reg9) ?
                  (reg10 == wire3) : (8'h9e)))));
            end
          reg12 <= (+$signed($unsigned(($unsigned(reg10) - (8'ha0)))));
          reg13 <= $signed(wire0);
          reg14 <= (+$unsigned(((reg8 ^ $unsigned(reg8)) ? reg5 : wire1)));
        end
      reg15 <= wire0[(3'h4):(1'h0)];
      if (reg12)
        begin
          if (($signed(reg14) << (reg13[(3'h4):(1'h0)] * wire3)))
            begin
              reg16 <= $signed(wire0[(3'h4):(1'h1)]);
              reg17 <= $unsigned(reg12[(2'h2):(1'h1)]);
              reg18 <= (wire0[(2'h2):(2'h2)] ^ (^~reg10[(5'h12):(5'h12)]));
            end
          else
            begin
              reg16 <= $signed(reg16);
              reg17 <= $unsigned((^reg14[(4'hc):(2'h2)]));
              reg18 <= $unsigned({$unsigned($unsigned((^~reg14)))});
              reg19 <= (((~|reg17) ?
                      ((8'ha7) ^ ((reg18 ^~ reg5) ?
                          ((8'hb1) > reg16) : reg9[(4'h8):(1'h0)])) : $signed((^~(reg5 + wire4)))) ?
                  reg14[(3'h7):(3'h4)] : {(($signed(reg14) ?
                              (reg13 ? wire1 : reg8) : $unsigned(wire1)) ?
                          $signed(reg12[(2'h2):(1'h1)]) : $unsigned((~reg6))),
                      {reg11}});
              reg20 <= reg8;
            end
          if ((+reg7[(1'h0):(1'h0)]))
            begin
              reg21 <= (((~|reg19[(1'h0):(1'h0)]) ?
                      $unsigned(reg13) : reg17[(1'h1):(1'h1)]) ?
                  reg20 : reg19[(2'h2):(2'h2)]);
              reg22 <= $unsigned(reg6[(4'h9):(1'h0)]);
              reg23 <= (($unsigned((!$signed((7'h44)))) && {reg11,
                  ($signed(wire1) ^~ (~|(8'h9e)))}) - {$signed(({reg5} && reg12[(1'h0):(1'h0)]))});
              reg24 <= {reg9};
            end
          else
            begin
              reg21 <= reg15[(3'h5):(2'h2)];
              reg22 <= (|$unsigned(((reg23[(1'h0):(1'h0)] ?
                      $unsigned(reg23) : reg8) ?
                  reg7[(2'h2):(1'h0)] : reg14[(4'h9):(2'h2)])));
              reg23 <= (+reg7);
            end
          if ((~&$signed((~|$signed($unsigned(reg24))))))
            begin
              reg25 <= ((-(reg9[(4'hd):(1'h0)] ^~ (|reg20))) ?
                  ({reg11, (~&$unsigned(reg24))} ?
                      (($unsigned(reg23) + {reg15, reg19}) ?
                          $signed($unsigned(reg12)) : reg20[(4'h9):(3'h7)]) : $signed($unsigned(reg15[(4'h8):(3'h6)]))) : (!reg16));
              reg26 <= {$unsigned(reg10[(1'h1):(1'h0)]),
                  (~&reg18[(2'h3):(1'h1)])};
              reg27 <= (|reg18[(1'h1):(1'h0)]);
              reg28 <= reg27;
              reg29 <= (-$unsigned({reg6}));
            end
          else
            begin
              reg25 <= $signed((reg5 >= reg29[(3'h4):(2'h3)]));
              reg26 <= wire3[(3'h5):(1'h0)];
            end
          reg30 <= reg22;
          reg31 <= (^~(reg10 & reg9));
        end
      else
        begin
          if ($signed((^~$signed($unsigned((^~reg10))))))
            begin
              reg16 <= (~reg9);
              reg17 <= wire1;
            end
          else
            begin
              reg16 <= $unsigned(($signed($signed((reg21 > reg27))) * (8'hba)));
            end
          reg18 <= {reg23};
          reg19 <= reg6;
          reg20 <= {reg11,
              ((~^(~|(!(8'h9e)))) >>> $unsigned(((reg14 ~^ reg5) + reg23[(2'h2):(1'h0)])))};
        end
      reg32 <= {reg10, reg28};
    end
  always
    @(posedge clk) begin
      reg33 <= reg25[(3'h7):(1'h0)];
    end
  assign wire34 = (-(8'h9c));
  module35 #() modinst76 (.wire39(reg22), .wire36(reg9), .wire40(reg8), .wire37(reg18), .y(wire75), .wire38(reg7), .clk(clk));
  assign wire77 = $signed(((reg28[(4'hb):(3'h7)] ?
                      $unsigned((wire0 >>> reg5)) : (((8'h9c) ^ (8'ha7)) ?
                          (reg22 ?
                              reg17 : (8'ha6)) : $unsigned(reg11))) > (($unsigned(reg23) <<< ((8'hbf) || (8'ha3))) ~^ $signed($unsigned(reg30)))));
  assign wire78 = (reg18 <= (-(|reg19)));
  assign wire79 = {{reg17[(1'h0):(1'h0)]},
                      ($unsigned($unsigned($unsigned(wire75))) ?
                          wire4[(4'h9):(3'h6)] : $signed(reg26[(1'h1):(1'h0)]))};
  assign wire80 = $signed((reg23 >= $unsigned(reg16)));
  assign wire81 = (reg23[(2'h3):(2'h2)] ?
                      $signed(reg33) : ($signed(reg22) < reg32));
  assign wire82 = $unsigned(((reg26[(5'h11):(4'he)] + $unsigned($signed(reg23))) ?
                      (((8'ha6) ? $signed(reg6) : (reg13 < reg23)) * (~(reg31 ?
                          reg16 : wire4))) : $signed((reg24 && (^(8'hb8))))));
  assign wire83 = reg10;
  assign wire84 = (!wire3);
  assign wire85 = $signed(reg16[(4'hf):(4'ha)]);
  assign wire86 = ($unsigned({($unsigned(wire78) ?
                              (reg11 ?
                                  wire81 : (8'ha3)) : (wire83 + (8'hb5)))}) ?
                      (!$signed($unsigned((!reg17)))) : ($signed(($unsigned(reg22) ?
                          reg11[(2'h2):(1'h1)] : (&reg30))) >>> $unsigned(reg27)));
endmodule

module module35
#(parameter param73 = ((|(!(((8'had) < (8'hb9)) ? {(8'hb1)} : ((8'h9c) * (8'ha8))))) >>> (!((~((8'ha4) ~^ (7'h40))) & (^((8'ha5) ? (8'hb1) : (8'hb4)))))), 
parameter param74 = (8'ha7))
(y, clk, wire36, wire37, wire38, wire39, wire40);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire [(5'h15):(1'h0)] wire37;
  input wire signed [(4'h9):(1'h0)] wire38;
  input wire signed [(2'h2):(1'h0)] wire39;
  input wire [(5'h12):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(4'h8):(1'h0)] wire64;
  wire signed [(4'hd):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(4'he):(1'h0)] wire61;
  wire [(4'h9):(1'h0)] wire60;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire58;
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg66 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire41,
                 wire58,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 (1'h0)};
  assign wire41 = $unsigned(($signed(wire39[(1'h1):(1'h1)]) <= ($signed(wire39) >> ($unsigned(wire38) ?
                      $unsigned(wire39) : $signed(wire36)))));
  module42 #() modinst59 (.y(wire58), .wire46(wire37), .wire47(wire36), .wire45(wire38), .wire44(wire40), .wire43(wire41), .clk(clk));
  assign wire60 = $unsigned(wire41[(4'h9):(1'h1)]);
  assign wire61 = $signed((($unsigned(wire38) ?
                      ((~|(8'hb1)) ?
                          (wire41 ?
                              wire37 : (8'hbc)) : wire39) : $signed((wire38 ?
                          wire60 : wire37))) ^~ wire58[(1'h1):(1'h1)]));
  assign wire62 = $unsigned((8'hb8));
  assign wire63 = $unsigned($unsigned({$unsigned((wire60 ? (8'ha1) : wire41)),
                      $unsigned($unsigned(wire41))}));
  assign wire64 = $unsigned($signed(wire58));
  assign wire65 = wire62[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      if (((8'hb9) * wire64))
        begin
          reg66 <= wire40;
          reg67 <= $signed($signed((-(wire65[(1'h1):(1'h1)] ^ ((8'ha2) * wire37)))));
          reg68 <= reg67[(2'h2):(1'h1)];
          reg69 <= wire36;
        end
      else
        begin
          reg66 <= ((^~((wire58[(2'h3):(1'h1)] ?
                  {reg69} : (wire41 << reg68)) || ($unsigned(wire63) <= (reg69 ?
                  wire40 : (8'hb7))))) ?
              wire61[(4'he):(4'he)] : $signed((~{reg66[(1'h0):(1'h0)]})));
          reg67 <= ((~|($signed((&wire63)) ?
              $signed(wire64) : $signed((+wire39)))) ^ wire64[(2'h2):(1'h0)]);
        end
      reg70 <= ($unsigned(wire38) <= $unsigned(wire58));
    end
  assign wire71 = (wire65 ?
                      (wire37[(4'ha):(4'h8)] ?
                          $unsigned($signed($signed(wire62))) : ((wire60[(4'h9):(2'h2)] >>> $unsigned(wire36)) ?
                              reg66 : $signed((+reg70)))) : wire62);
  assign wire72 = (&$unsigned(($signed((+wire63)) ?
                      {{reg67, (8'hb5)}} : reg69)));
endmodule

module module42
#(parameter param57 = (((((~^(7'h41)) ^~ (~(8'ha8))) ? (((8'hac) ^ (8'haf)) ? ((8'hae) ? (8'haf) : (8'hab)) : (^~(8'ha9))) : {((8'ha4) ~^ (8'hb5))}) && (({(8'ha1)} ? {(8'ha3)} : (&(7'h42))) ? (((8'hbe) << (8'hb5)) == (&(8'ha4))) : {(7'h42), (~|(7'h43))})) ? (((((8'hbd) && (7'h41)) << {(8'had), (8'hae)}) || (!{(8'ha3)})) || (8'hab)) : {((^~((8'h9c) >>> (8'hb8))) ? (+((8'hb4) == (8'hb1))) : ((-(8'ha3)) ? ((7'h41) ? (8'ha1) : (8'hae)) : ((8'had) || (8'hb9))))}))
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire47;
  input wire [(5'h15):(1'h0)] wire46;
  input wire [(3'h4):(1'h0)] wire45;
  input wire [(5'h10):(1'h0)] wire44;
  input wire signed [(5'h10):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire55;
  wire signed [(4'hc):(1'h0)] wire54;
  wire signed [(5'h11):(1'h0)] wire53;
  wire [(2'h3):(1'h0)] wire51;
  wire [(5'h12):(1'h0)] wire50;
  wire signed [(3'h4):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire48;
  reg [(4'h8):(1'h0)] reg52 = (1'h0);
  assign y = {wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 reg52,
                 (1'h0)};
  assign wire48 = wire47;
  assign wire49 = {wire44, $signed(wire46)};
  assign wire50 = ((wire44 ?
                          $unsigned(($signed(wire48) ^~ (|wire43))) : $signed(wire43)) ?
                      ($signed($signed((wire45 >= wire45))) ?
                          (~&$unsigned(wire49)) : (|wire46[(4'hc):(4'h9)])) : {$unsigned(({wire46,
                              wire44} || (8'h9c))),
                          (8'ha5)});
  assign wire51 = wire45[(2'h2):(2'h2)];
  always
    @(posedge clk) begin
      reg52 <= (($unsigned(wire46) << (~(wire43 ?
              $signed(wire51) : (wire50 ? wire45 : (8'hab))))) ?
          wire47 : (+(($unsigned(wire48) || (wire50 + wire47)) ~^ wire50)));
    end
  assign wire53 = wire43;
  assign wire54 = ((7'h40) > (7'h42));
  assign wire55 = wire47[(4'ha):(3'h5)];
  assign wire56 = $unsigned((7'h43));
endmodule
