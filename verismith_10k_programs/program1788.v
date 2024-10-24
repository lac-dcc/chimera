module top
#(parameter param75 = (({(((8'ha9) ? (8'hb0) : (8'h9d)) ? (&(8'hbd)) : ((8'hb8) ? (8'hb4) : (8'hbf)))} ? (((~(8'ha0)) >>> ((8'ha0) ? (8'hbf) : (8'hb3))) >> (&(8'haf))) : ((^~(~(8'h9d))) ? (~&((7'h43) | (7'h41))) : (8'hb2))) ? ((+(~^((8'hac) ^~ (7'h41)))) ? (^~((-(8'ha9)) & ((8'h9e) ^ (8'hb7)))) : {((~(8'ha3)) ? ((8'hbf) ? (8'hba) : (8'hbb)) : {(8'ha5)}), (|((8'ha9) ? (8'hb7) : (8'hac)))}) : ((((-(7'h44)) ? ((8'hb7) ? (8'h9d) : (8'hbf)) : (^~(8'hb8))) >>> {((8'h9d) ? (7'h41) : (8'h9e))}) ? {(~{(8'hb7), (8'hb6)})} : (8'ha9))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h159):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire72;
  wire [(4'hc):(1'h0)] wire29;
  wire [(4'hb):(1'h0)] wire28;
  wire [(5'h10):(1'h0)] wire13;
  wire [(4'h8):(1'h0)] wire12;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire4;
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg [(3'h6):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg24 = (1'h0);
  reg [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(5'h13):(1'h0)] reg22 = (1'h0);
  reg [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(4'hb):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg10 = (1'h0);
  reg signed [(4'he):(1'h0)] reg9 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire74,
                 wire72,
                 wire29,
                 wire28,
                 wire13,
                 wire12,
                 wire6,
                 wire5,
                 wire4,
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
                 reg15,
                 reg14,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 (1'h0)};
  assign wire4 = ($signed(wire3) < ($unsigned(wire0[(4'hb):(1'h0)]) ?
                     {$unsigned((+wire3))} : {wire1}));
  assign wire5 = {(^~wire4[(1'h1):(1'h0)]),
                     ($signed($unsigned((&wire3))) ?
                         ({(8'ha6),
                             ((7'h41) ?
                                 wire2 : wire1)} < (wire1[(4'hc):(4'h8)] ?
                             (~|wire0) : wire2)) : (+wire2[(3'h5):(2'h2)]))};
  assign wire6 = {(-$signed(wire0))};
  always
    @(posedge clk) begin
      reg7 <= wire4;
      reg8 <= wire1;
      reg9 <= (~|($signed({$unsigned(wire0),
          $unsigned(wire5)}) || (~|($signed(wire4) >= wire0[(1'h0):(1'h0)]))));
      reg10 <= (8'hbe);
      reg11 <= (reg10[(1'h0):(1'h0)] ?
          $signed(wire0) : $signed($signed(((wire3 ? wire5 : reg10) ?
              (8'ha7) : ((8'hb1) > wire1)))));
    end
  assign wire12 = ($unsigned($unsigned(reg11)) & wire2[(3'h5):(1'h0)]);
  assign wire13 = ((((+(|wire4)) ?
                              ({wire4} <= ((8'ha3) ?
                                  wire5 : (8'ha2))) : wire3[(2'h2):(2'h2)]) ?
                          ((reg8[(1'h0):(1'h0)] ?
                                  (reg8 ? wire1 : reg11) : (+wire12)) ?
                              (wire6[(3'h4):(1'h1)] >= (|reg11)) : (wire12[(1'h1):(1'h1)] ?
                                  wire5 : ((8'ha2) ?
                                      reg10 : wire4))) : $signed({(wire3 ?
                                  wire5 : wire1),
                              wire5})) ?
                      reg8 : $unsigned(($unsigned($signed(wire5)) ?
                          $unsigned((^(8'ha6))) : $signed(wire12))));
  always
    @(posedge clk) begin
      reg14 <= $unsigned(($unsigned(((wire0 >>> (8'ha4)) ?
              $signed((8'ha5)) : (^~(8'ha6)))) ?
          wire5 : {$signed((~|wire2))}));
      reg15 <= wire12[(3'h4):(2'h2)];
      if (wire6[(2'h3):(1'h0)])
        begin
          reg16 <= (reg10 ?
              (($signed($signed((8'hbf))) && (reg15 ^~ wire13)) - reg14[(3'h6):(1'h1)]) : {wire1});
          reg17 <= $unsigned((^~wire2[(1'h1):(1'h0)]));
        end
      else
        begin
          reg16 <= ($unsigned(((|$unsigned(wire3)) ?
              (reg9[(4'hd):(4'h9)] ?
                  (reg11 <<< wire5) : $unsigned(wire4)) : $unsigned({(8'hac),
                  wire2}))) < reg8);
        end
      if ($signed((~|($signed((reg17 ?
          reg7 : (8'ha0))) >> $unsigned(wire0[(4'h9):(3'h5)])))))
        begin
          reg18 <= {($signed((wire6 ? (^~reg14) : (8'hb7))) << reg8)};
          if ((+((^((reg7 ? reg14 : reg14) - (8'hb1))) || {reg16})))
            begin
              reg19 <= reg10[(2'h2):(2'h2)];
            end
          else
            begin
              reg19 <= (-$signed(wire12));
              reg20 <= (^~{($signed((&reg7)) << (reg11 == wire5[(1'h0):(1'h0)])),
                  reg15[(2'h2):(1'h1)]});
              reg21 <= wire13[(4'h9):(1'h0)];
              reg22 <= reg16;
              reg23 <= $signed((wire0 >> {$signed((-reg11)),
                  ((wire4 ? reg7 : (8'hb0)) <= (reg15 << reg9))}));
            end
        end
      else
        begin
          if ($signed($unsigned(wire1[(1'h1):(1'h1)])))
            begin
              reg18 <= {$signed((~|(-wire5)))};
              reg19 <= (reg16[(4'hb):(3'h7)] ?
                  $signed({reg15[(1'h0):(1'h0)],
                      (!$signed(reg7))}) : {$signed(((+reg22) << (wire0 ?
                          wire2 : reg18)))});
              reg20 <= (($signed($unsigned($unsigned(reg19))) ?
                      (($unsigned(reg21) != reg14) ?
                          reg8[(1'h1):(1'h0)] : $signed((~|wire0))) : (~^(|reg8[(2'h2):(2'h2)]))) ?
                  wire3 : (($unsigned((reg14 ? reg19 : (8'h9e))) ?
                          reg16[(2'h3):(1'h0)] : ((&reg8) ?
                              $signed((8'hb3)) : wire3[(2'h3):(2'h2)])) ?
                      reg23[(2'h2):(1'h1)] : (&$unsigned($signed(reg15)))));
              reg21 <= $signed(wire13);
              reg22 <= ({reg23} >= wire5);
            end
          else
            begin
              reg18 <= (($unsigned($signed(reg19[(5'h10):(5'h10)])) * ($signed($signed(wire4)) << (~&(~^(8'ha2))))) ?
                  (reg17 ?
                      (wire3[(2'h2):(1'h1)] >> (reg7 ^~ reg20[(3'h5):(1'h1)])) : wire6) : reg16);
              reg19 <= (|(reg22 ^~ (|(&(wire3 ? wire5 : reg17)))));
              reg20 <= $signed($unsigned(($unsigned((reg8 ~^ reg7)) <= reg21[(4'hc):(3'h7)])));
              reg21 <= wire3[(2'h3):(2'h2)];
            end
          reg23 <= (&(~^$unsigned(((reg14 ? (8'hb6) : reg18) & (wire6 ?
              reg21 : reg23)))));
          reg24 <= (~&wire13);
          reg25 <= $unsigned(((wire2[(1'h0):(1'h0)] || $signed(reg18[(4'hc):(1'h0)])) ^~ ((|(reg16 * reg9)) == $unsigned($signed((8'h9f))))));
          reg26 <= (8'h9c);
        end
      reg27 <= reg8;
    end
  assign wire28 = {(-(wire13 + wire12))};
  assign wire29 = reg17[(3'h4):(2'h3)];
  module30 #() modinst73 (wire72, clk, wire3, reg10, wire5, reg27);
  assign wire74 = (~&((((reg18 * reg27) >> (wire72 ?
                          reg20 : reg8)) >= {$signed(wire29)}) ?
                      reg7[(2'h2):(1'h1)] : reg27));
endmodule

module module30  (y, clk, wire34, wire33, wire32, wire31);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire34;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire [(4'hd):(1'h0)] wire32;
  input wire [(4'ha):(1'h0)] wire31;
  wire [(4'hc):(1'h0)] wire71;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(5'h12):(1'h0)] wire40;
  wire [(4'h8):(1'h0)] wire39;
  wire signed [(5'h13):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(5'h12):(1'h0)] wire35;
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  assign y = {wire71,
                 wire69,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 wire35,
                 reg38,
                 (1'h0)};
  assign wire35 = (~$unsigned(($signed((^~wire33)) * $unsigned(wire31))));
  assign wire36 = (((($signed(wire32) >= $unsigned(wire34)) ?
                          $signed($signed(wire32)) : ((-wire33) >>> (wire32 > wire35))) >= (((!wire32) == $signed(wire33)) ^~ wire31[(4'ha):(3'h6)])) ?
                      $unsigned(((wire35 >>> wire32) && wire31[(3'h4):(1'h0)])) : {$signed(({(8'haa)} ~^ $signed(wire35))),
                          (wire32 ?
                              $signed(wire35) : ((wire31 >>> wire35) ?
                                  $signed(wire33) : wire33[(5'h15):(4'h8)]))});
  assign wire37 = ((wire36[(1'h1):(1'h1)] ?
                      wire32[(3'h4):(1'h0)] : $unsigned(((&wire33) ?
                          wire36[(1'h1):(1'h0)] : {wire35,
                              wire34}))) && wire33);
  always
    @(posedge clk) begin
      if ($unsigned(wire31[(4'h9):(1'h0)]))
        begin
          reg38 <= (|(~&$signed(wire35[(4'he):(1'h1)])));
        end
      else
        begin
          reg38 <= (8'hb1);
        end
    end
  assign wire39 = $unsigned((^~(~$unsigned($unsigned(wire33)))));
  assign wire40 = (reg38[(1'h0):(1'h0)] + wire35[(5'h12):(4'hf)]);
  module41 #() modinst70 (wire69, clk, wire37, wire33, wire32, wire39);
  assign wire71 = (|$unsigned($unsigned({wire34, $signed(wire37)})));
endmodule

module module41
#(parameter param67 = {((~({(8'ha4), (8'hb3)} ? (^(8'hb7)) : (&(8'ha2)))) ? (~^(((7'h42) <<< (8'ha4)) ? (&(8'hba)) : (-(8'hac)))) : ((!((8'ha3) & (8'ha6))) ? {{(8'hbe), (8'hb8)}, {(8'h9d), (8'hb8)}} : (((8'hb7) ? (7'h40) : (8'haf)) ? (~(7'h42)) : ((8'ha9) ? (8'ha0) : (8'h9f)))))}, 
parameter param68 = (param67 < param67))
(y, clk, wire45, wire44, wire43, wire42);
  output wire [(32'hfc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire45;
  input wire signed [(4'hb):(1'h0)] wire44;
  input wire [(4'hd):(1'h0)] wire43;
  input wire [(3'h6):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire66;
  wire signed [(5'h11):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(4'he):(1'h0)] wire63;
  wire signed [(5'h11):(1'h0)] wire62;
  wire [(5'h14):(1'h0)] wire61;
  wire [(4'hb):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(3'h4):(1'h0)] wire56;
  wire [(4'hd):(1'h0)] wire55;
  wire signed [(5'h12):(1'h0)] wire54;
  wire [(2'h2):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(4'hb):(1'h0)] wire51;
  wire [(2'h2):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  wire [(4'hb):(1'h0)] wire48;
  wire [(3'h6):(1'h0)] wire47;
  wire [(4'h8):(1'h0)] wire46;
  assign y = {wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 (1'h0)};
  assign wire46 = wire44;
  assign wire47 = $unsigned(wire42[(3'h6):(1'h0)]);
  assign wire48 = $signed($unsigned(((~wire47) ?
                      (|(~|wire46)) : (wire47 ?
                          (wire43 ?
                              wire47 : wire44) : wire44[(2'h2):(1'h0)]))));
  assign wire49 = (wire42[(3'h6):(1'h1)] << $unsigned(wire44[(1'h1):(1'h1)]));
  assign wire50 = $signed($unsigned(wire48));
  assign wire51 = (&wire46[(1'h1):(1'h1)]);
  assign wire52 = (^$signed($signed(((~(8'hab)) ?
                      wire44[(4'h8):(3'h5)] : $signed(wire47)))));
  assign wire53 = wire42[(2'h3):(1'h0)];
  assign wire54 = $signed($unsigned(wire47[(3'h5):(3'h4)]));
  assign wire55 = $signed($signed((^~(~&(wire43 ? wire45 : wire51)))));
  assign wire56 = (wire48[(3'h6):(2'h3)] ?
                      wire44 : (~|$unsigned($unsigned($signed(wire54)))));
  assign wire57 = (~wire46);
  assign wire58 = (~$signed(($unsigned($signed(wire48)) ?
                      {(wire55 ? wire52 : wire56),
                          wire53[(1'h0):(1'h0)]} : (|(wire56 < wire48)))));
  assign wire59 = $unsigned($signed(((wire58[(4'hb):(2'h3)] != (wire54 ?
                          wire56 : wire51)) ?
                      $unsigned((-wire50)) : (^(!wire57)))));
  assign wire60 = wire45;
  assign wire61 = (($unsigned((|(!wire48))) == {{{wire44}, $signed(wire54)}}) ?
                      $unsigned($unsigned($signed(wire51))) : $unsigned($unsigned($signed(wire59))));
  assign wire62 = (wire61 >= ((8'hae) ?
                      {(8'hb9),
                          (wire45 ?
                              wire59 : (|(8'hbc)))} : (-$unsigned($signed((8'hbb))))));
  assign wire63 = $unsigned($signed($unsigned(($signed(wire48) ?
                      wire54 : wire47[(3'h6):(1'h1)]))));
  assign wire64 = (-$signed(wire55));
  assign wire65 = wire46[(3'h7):(1'h0)];
  assign wire66 = wire57;
endmodule
