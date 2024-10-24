module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(4'h9):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(4'hb):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  reg signed [(4'hd):(1'h0)] reg4 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg6 = (1'h0);
  reg [(5'h11):(1'h0)] reg7 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg9 = (1'h0);
  reg [(5'h11):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire65,
                 wire13,
                 wire12,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ({(+(~|$unsigned((8'hac))))} <= (wire2[(1'h0):(1'h0)] ?
          wire0 : wire3[(4'he):(4'hd)]));
      reg5 <= $unsigned(reg4[(2'h3):(2'h3)]);
      reg6 <= $unsigned($unsigned((8'hba)));
      if ({$signed(reg5[(3'h6):(3'h6)])})
        begin
          if (((8'haf) ?
              $unsigned(((-(reg5 ?
                  wire2 : (8'hb0))) + $unsigned((wire0 & (8'ha3))))) : ((({(8'ha0)} ?
                      (!reg5) : (wire3 ?
                          reg6 : wire2)) ^~ $signed(((8'hbf) <<< (8'hab)))) ?
                  $signed((~&wire3)) : $signed(wire2))))
            begin
              reg7 <= $unsigned($unsigned(((wire0[(1'h0):(1'h0)] ^ (+wire3)) ?
                  $signed((^~reg4)) : (^~$unsigned(wire0)))));
              reg8 <= $signed((wire2 | ($unsigned($signed(wire3)) ?
                  {reg5, (wire0 < reg5)} : $unsigned({wire1, wire2}))));
              reg9 <= ((reg7[(4'hb):(4'ha)] ?
                      reg4[(2'h2):(1'h0)] : $unsigned(wire3)) ?
                  $signed((((+reg6) ? wire0 : (-(8'hb0))) ?
                      (^wire2) : $unsigned((wire2 ?
                          (8'ha0) : wire0)))) : ((!((reg4 <= (8'haa)) ?
                      wire2[(3'h5):(1'h0)] : (-wire3))) - reg7));
            end
          else
            begin
              reg7 <= wire0[(2'h2):(1'h0)];
            end
        end
      else
        begin
          reg7 <= reg6;
          reg8 <= (-((-($unsigned(wire0) == {reg7})) ?
              $unsigned(wire3) : (($unsigned(wire1) ?
                      (~&wire3) : $signed(reg8)) ?
                  reg7[(4'hd):(3'h5)] : (~^$unsigned(reg6)))));
          reg9 <= (reg5[(4'h9):(3'h7)] & $signed(wire1));
          reg10 <= $unsigned({($signed((~&reg8)) ?
                  (^(wire1 ? wire0 : (8'had))) : $signed($signed(wire1)))});
        end
      reg11 <= ((wire2 ?
              ({$signed(wire1),
                  $unsigned((8'hab))} | wire3[(4'hb):(1'h1)]) : reg9) ?
          (8'haf) : reg10[(4'h8):(2'h2)]);
    end
  assign wire12 = wire0;
  assign wire13 = (wire1[(4'hf):(2'h3)] == (-$signed((((7'h42) != (8'hb7)) ?
                      $unsigned((8'ha4)) : ((8'ha1) ? reg5 : (8'ha6))))));
  module14 #() modinst66 (wire65, clk, wire12, reg11, reg7, wire3, reg5);
  assign wire67 = ((wire0 - $signed($signed(((8'ha2) | wire65)))) ^~ (+(&{$signed(reg8)})));
  assign wire68 = ((wire12[(4'hc):(3'h4)] && wire1) | (((|reg11[(3'h5):(3'h4)]) ?
                          wire3 : ((~|reg10) ?
                              $signed(reg5) : (wire67 - wire12))) ?
                      reg8[(2'h3):(2'h3)] : $signed($unsigned($signed(wire65)))));
  assign wire69 = ({$unsigned($signed((wire3 << wire1)))} - $signed(wire2));
endmodule

module module14  (y, clk, wire15, wire16, wire17, wire18, wire19);
  output wire [(32'haa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire16;
  input wire [(4'he):(1'h0)] wire17;
  input wire signed [(5'h14):(1'h0)] wire18;
  input wire signed [(4'h8):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire [(5'h11):(1'h0)] wire62;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(4'hf):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire21;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(3'h5):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire27;
  wire [(3'h4):(1'h0)] wire59;
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire20,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire59,
                 (1'h0)};
  assign wire20 = wire18[(4'hd):(1'h1)];
  assign wire21 = (~^$unsigned((~((~&wire15) || $signed((8'ha0))))));
  assign wire22 = wire20[(4'hf):(1'h0)];
  assign wire23 = wire21[(2'h3):(2'h3)];
  assign wire24 = wire19[(1'h0):(1'h0)];
  assign wire25 = {$signed({(wire18[(4'hb):(3'h6)] | $unsigned((8'ha9))),
                          wire24[(3'h6):(1'h1)]})};
  assign wire26 = ($signed($unsigned(wire23)) < (8'hbf));
  assign wire27 = $signed($unsigned($unsigned((+(+wire23)))));
  module28 #() modinst60 (.wire33(wire17), .wire32(wire22), .wire31(wire18), .clk(clk), .wire29(wire20), .wire30(wire24), .y(wire59));
  assign wire61 = (($unsigned($signed((-wire24))) ?
                      $unsigned((wire23[(4'hc):(4'hb)] + (wire25 ^~ wire59))) : ((^~{wire18,
                              wire25}) ?
                          $unsigned($unsigned(wire15)) : $unsigned((~^wire24)))) >= (wire19 ^ (!wire26[(3'h6):(1'h1)])));
  assign wire62 = ((wire25 ?
                          $unsigned(((wire59 ?
                              wire25 : wire24) >= $signed(wire19))) : $signed((8'hbf))) ?
                      $signed(wire26) : ((^wire59[(2'h3):(2'h3)]) == (($unsigned((8'hb6)) << {wire17}) ?
                          wire24 : (-$signed(wire27)))));
  assign wire63 = wire25;
  assign wire64 = $signed($unsigned($signed(wire59[(3'h4):(2'h3)])));
endmodule

module module28
#(parameter param57 = (((+(~&((8'hae) ? (8'h9e) : (8'hae)))) ? ((8'hbd) >>> ((+(8'ha6)) - (~&(8'haf)))) : ((((8'ha3) ? (8'hb2) : (8'hae)) ^~ (~|(8'h9e))) ? (((8'h9f) ? (8'hb6) : (8'ha0)) >> ((8'ha8) ? (7'h43) : (8'ha8))) : ((-(7'h43)) ? ((8'h9f) ? (8'ha1) : (8'hb4)) : (&(8'hab))))) == {((+((7'h41) ? (8'haf) : (8'h9e))) ? (((8'hb2) ? (7'h42) : (8'ha1)) >= (|(8'hb0))) : (((8'had) ? (8'hab) : (8'haa)) == (^~(8'ha3))))}), 
parameter param58 = ({({param57} ? (param57 - (~param57)) : (|(!param57)))} + param57))
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h116):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire33;
  input wire [(4'ha):(1'h0)] wire32;
  input wire [(5'h14):(1'h0)] wire31;
  input wire signed [(4'h8):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  wire signed [(5'h11):(1'h0)] wire56;
  wire [(4'he):(1'h0)] wire50;
  wire signed [(5'h13):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(5'h12):(1'h0)] wire47;
  wire [(5'h14):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(5'h11):(1'h0)] wire34;
  reg signed [(2'h2):(1'h0)] reg55 = (1'h0);
  reg [(4'hb):(1'h0)] reg54 = (1'h0);
  reg [(5'h13):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg [(4'h9):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h15):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg38 = (1'h0);
  reg [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg36 = (1'h0);
  assign y = {wire56,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire35,
                 wire34,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
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
                 (1'h0)};
  assign wire34 = wire33[(2'h3):(1'h1)];
  assign wire35 = (wire32 ? wire31[(4'hc):(4'h8)] : $unsigned(wire33));
  always
    @(posedge clk) begin
      if (((8'hb0) >= (~^(+$signed((wire34 || wire29))))))
        begin
          reg36 <= $signed($signed((^~wire31)));
          if (((($signed($unsigned(wire31)) < $unsigned($unsigned(wire32))) ?
              $signed($unsigned((8'hac))) : wire33) << wire32))
            begin
              reg37 <= ((8'hbe) ^~ {$unsigned(((wire32 != wire33) ^~ (wire29 ?
                      wire35 : wire29)))});
              reg38 <= (+$signed(((wire31 ?
                      $signed(wire31) : (wire35 ? wire32 : wire33)) ?
                  ($signed(wire32) ?
                      (~wire30) : {wire32}) : (wire35[(1'h0):(1'h0)] ^~ reg37))));
              reg39 <= ($unsigned($unsigned((~|wire31[(4'h9):(4'h8)]))) - (($unsigned((|wire33)) | ($unsigned((8'ha6)) || (wire34 ?
                  wire29 : wire34))) || wire35));
            end
          else
            begin
              reg37 <= {{(($unsigned((8'ha2)) ?
                              (reg39 ? wire35 : (8'ha9)) : ((8'ha2) & wire33)) ?
                          $signed(wire35[(3'h4):(2'h3)]) : wire33),
                      wire32[(4'ha):(1'h0)]}};
              reg38 <= (wire30 ?
                  (8'hab) : (reg38 || (($signed(reg37) ?
                      wire33[(2'h3):(2'h3)] : $unsigned(reg38)) <= ($unsigned(wire34) ?
                      ((8'ha4) < wire32) : (8'hae)))));
              reg39 <= (reg37 ? wire32[(4'ha):(4'ha)] : reg39);
              reg40 <= reg37[(4'hf):(4'hd)];
            end
        end
      else
        begin
          if (($unsigned((~reg39[(2'h3):(2'h2)])) ?
              ($unsigned((wire29 ? reg38 : (wire32 ? reg36 : (8'hbb)))) ?
                  $unsigned(wire29) : $signed($signed((reg40 ?
                      wire30 : wire34)))) : reg39[(4'hc):(1'h1)]))
            begin
              reg36 <= (~(wire29 ? (8'hae) : (~|(&((8'ha7) == wire35)))));
              reg37 <= $signed($unsigned(reg38));
              reg38 <= $unsigned(reg40[(1'h1):(1'h0)]);
              reg39 <= wire33[(2'h2):(1'h0)];
            end
          else
            begin
              reg36 <= (($signed((wire30[(4'h8):(3'h7)] <<< $signed(wire34))) <<< wire32) ?
                  (reg36[(3'h6):(3'h5)] ?
                      $unsigned({$signed(reg38), {wire31}}) : {((wire31 ?
                                  (8'hbd) : (8'hb0)) ?
                              (wire29 + reg37) : {wire35}),
                          ({(8'had)} | {wire34})}) : (wire35 ?
                      $signed(((reg36 ? reg39 : reg39) ?
                          (wire30 || reg40) : (wire35 ?
                              wire34 : reg37))) : {reg40[(1'h0):(1'h0)]}));
              reg37 <= (~&wire35);
              reg38 <= reg38;
              reg39 <= $signed($unsigned($unsigned(((wire32 ? wire35 : wire29) ?
                  $unsigned((8'hb4)) : (+(7'h41))))));
            end
          reg40 <= {$signed((((wire34 ?
                  wire32 : wire29) >>> (!reg38)) + $signed($unsigned(reg38)))),
              ((($signed(wire33) < (reg40 ?
                      reg38 : wire35)) * wire30[(3'h7):(3'h5)]) ?
                  {{$unsigned(wire30)}} : (~&((wire31 ?
                      wire32 : (8'hbc)) << (!wire32))))};
          reg41 <= {$signed((&$signed((-reg39))))};
        end
      reg42 <= reg38;
      reg43 <= $unsigned((((!$signed(wire29)) ? (~reg41) : reg39) ?
          (^$unsigned((~&reg36))) : {reg39[(4'hc):(4'h8)],
              reg42[(4'h9):(3'h4)]}));
      reg44 <= wire32;
      reg45 <= (8'haa);
    end
  assign wire46 = wire31[(5'h14):(3'h5)];
  assign wire47 = reg39[(3'h5):(3'h5)];
  assign wire48 = $signed(($unsigned($unsigned($unsigned(wire47))) ?
                      (reg37 ?
                          {$signed(reg42)} : {(reg44 ? reg39 : reg44),
                              reg43[(2'h2):(2'h2)]}) : wire47[(3'h6):(3'h5)]));
  assign wire49 = {$signed(wire34[(4'hc):(4'h9)]),
                      ({$signed(reg39), $unsigned($unsigned(reg41))} ?
                          wire33 : (!(wire32 ? reg42 : $signed(wire47))))};
  assign wire50 = reg45;
  always
    @(posedge clk) begin
      reg51 <= $unsigned(wire29);
      reg52 <= (-reg41);
      reg53 <= $unsigned({($signed((^~reg42)) >>> ($signed(wire31) ?
              (reg52 ? (8'h9e) : reg43) : (8'ha9)))});
    end
  always
    @(posedge clk) begin
      reg54 <= {reg37[(2'h2):(1'h1)]};
      reg55 <= (wire48 ^~ (($signed(wire33[(1'h0):(1'h0)]) ?
              ($signed(reg39) ?
                  reg51 : (reg45 & reg39)) : $signed($signed(wire33))) ?
          (reg39[(2'h2):(2'h2)] ?
              wire30[(3'h5):(2'h2)] : $unsigned((wire31 ^ reg44))) : wire47[(4'he):(3'h7)]));
    end
  assign wire56 = $unsigned((reg42 ?
                      (reg42[(3'h6):(3'h4)] ?
                          (reg36[(3'h7):(3'h5)] ?
                              $unsigned(reg51) : (reg38 != wire30)) : (~^$unsigned(reg36))) : reg36[(3'h6):(1'h0)]));
endmodule
