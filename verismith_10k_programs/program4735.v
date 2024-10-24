module top
#(parameter param82 = (((~|({(8'hb7), (8'hb5)} && {(8'hae)})) == (8'hbb)) ? ((((+(8'hbf)) ^ ((8'ha9) ~^ (8'ha3))) ? {((8'haf) ? (8'hac) : (8'ha8)), ((8'ha9) && (8'h9e))} : (8'hbf)) ? ((((8'hab) == (8'hbe)) || (~|(7'h43))) >> (8'hba)) : ({((8'h9f) - (8'hb5))} << (-((8'ha6) || (8'ha2))))) : (+((&((8'hb4) ^~ (7'h41))) ? (((8'haa) < (8'hb9)) - ((8'h9e) ? (8'hb8) : (8'hbd))) : (-((8'ha0) ? (8'hbe) : (8'hb8)))))), 
parameter param83 = ((~((param82 ? (~&param82) : (param82 >> (8'hbc))) ? {param82} : ((~param82) | (param82 ^ param82)))) && ((((param82 ~^ param82) ? {(8'hb7), param82} : param82) ? (8'had) : (~|param82)) >= (~param82))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire4;
  wire [(5'h14):(1'h0)] wire81;
  wire signed [(5'h12):(1'h0)] wire80;
  wire [(4'hd):(1'h0)] wire79;
  wire signed [(3'h4):(1'h0)] wire78;
  wire signed [(4'he):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire10;
  wire [(3'h6):(1'h0)] wire75;
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg [(4'h9):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg9 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire5,
                 wire6,
                 wire10,
                 wire75,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = ($signed($unsigned((^~(~^wire0)))) ?
                     {(&$unsigned(wire3))} : (wire2 ?
                         (((wire1 ?
                             (8'hac) : wire4) | $signed(wire2)) << ($signed(wire4) & wire0)) : wire3));
  assign wire6 = $signed((~wire0[(5'h10):(3'h7)]));
  always
    @(posedge clk) begin
      if ({$unsigned(((((8'haf) != wire3) != (wire5 << wire3)) & $unsigned($signed((7'h44))))),
          (wire6 - (((^~wire0) ? wire2[(3'h4):(2'h3)] : $unsigned(wire1)) ?
              $unsigned((wire3 ?
                  (7'h42) : (8'hb3))) : $signed(wire3[(4'h8):(4'h8)])))})
        begin
          reg7 <= wire1;
          reg8 <= $signed(wire3);
        end
      else
        begin
          reg7 <= $unsigned({{$unsigned((wire0 ? wire4 : reg8))},
              (~^(wire2 + (wire3 ? (8'hbe) : wire2)))});
        end
      reg9 <= (8'hb0);
    end
  assign wire10 = wire4[(3'h5):(2'h3)];
  module11 #() modinst76 (wire75, clk, reg7, wire6, wire4, wire3);
  assign wire77 = (wire5[(1'h0):(1'h0)] ?
                      (|{((wire10 && (8'hb5)) <<< $unsigned(wire1))}) : wire2[(2'h2):(1'h0)]);
  assign wire78 = $signed($signed((&((wire77 << wire3) ?
                      $signed((8'ha3)) : $signed(wire75)))));
  assign wire79 = ($unsigned((&$unsigned(wire1[(2'h2):(1'h1)]))) <= $signed($unsigned($unsigned((reg8 ?
                      wire10 : wire1)))));
  assign wire80 = wire6;
  assign wire81 = (~$unsigned($unsigned(wire75[(2'h2):(1'h0)])));
endmodule

module module11
#(parameter param73 = (~&({(((8'hb0) ? (8'hb6) : (8'hbb)) ? ((8'ha2) && (8'hbd)) : ((7'h41) ? (8'hb9) : (7'h40)))} != ((~(~^(8'ha9))) ? (-(+(8'ha8))) : (!(8'hae))))), 
parameter param74 = param73)
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(4'ha):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(4'h8):(1'h0)] wire70;
  wire signed [(4'he):(1'h0)] wire55;
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg [(4'hc):(1'h0)] reg17 = (1'h0);
  reg [(4'h8):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg21 = (1'h0);
  reg signed [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg27 = (1'h0);
  assign y = {wire72,
                 wire70,
                 wire55,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      reg16 <= wire14;
      reg17 <= wire12;
      reg18 <= (!(~$signed((((7'h42) ? wire13 : wire14) * $signed(wire13)))));
      if ($signed(($unsigned({(wire15 < reg16), {wire13, (8'hbd)}}) ?
          (((7'h40) >= {wire13, wire12}) ?
              $unsigned((wire12 ?
                  wire13 : (8'hb1))) : reg16[(1'h0):(1'h0)]) : wire15)))
        begin
          if ({($unsigned(reg18) > (^($signed(wire15) ?
                  wire14[(2'h2):(2'h2)] : reg16)))})
            begin
              reg19 <= (^~(^~wire13));
            end
          else
            begin
              reg19 <= (+(8'h9e));
              reg20 <= ((8'hb8) ?
                  $signed({((wire15 - reg18) >= $unsigned((8'hb1)))}) : $unsigned({wire12}));
              reg21 <= (^{wire15[(3'h6):(1'h0)]});
              reg22 <= reg17;
            end
        end
      else
        begin
          if (((8'h9f) ?
              $signed((((~|reg19) ? wire13 : reg21) ?
                  ((~(8'hb4)) ? ((8'h9d) << reg21) : $signed(reg21)) : ((reg16 ?
                          (8'ha5) : (8'hbb)) ?
                      (reg17 ?
                          reg18 : reg18) : (wire15 > wire12)))) : $signed($unsigned((reg20 ^ $signed(reg19))))))
            begin
              reg19 <= wire14[(3'h6):(1'h1)];
            end
          else
            begin
              reg19 <= (!(^~$signed((~^(reg18 ? (7'h43) : reg21)))));
              reg20 <= (reg19 ?
                  $unsigned(((&(reg17 | wire14)) ?
                      ($unsigned(reg20) ?
                          $unsigned(reg21) : ((8'ha8) <<< wire15)) : (reg20[(3'h5):(3'h4)] ?
                          (reg18 << reg19) : $signed(wire14)))) : $unsigned($signed($signed(reg18[(4'h8):(3'h5)]))));
              reg21 <= $signed(wire12[(1'h0):(1'h0)]);
            end
          reg22 <= (~$signed(wire15[(1'h1):(1'h0)]));
          if ($signed($signed((~^$signed(((8'hb2) >> wire12))))))
            begin
              reg23 <= wire12;
              reg24 <= (~reg18[(3'h5):(1'h0)]);
              reg25 <= ($signed(((!wire14) * (^~(reg16 ~^ reg18)))) >> wire14[(3'h5):(2'h3)]);
            end
          else
            begin
              reg23 <= ({$signed(wire12[(1'h0):(1'h0)]), reg22[(4'hc):(4'ha)]} ?
                  (+$unsigned(((~^wire13) ?
                      $signed(wire12) : $unsigned(reg22)))) : $signed($unsigned($unsigned($unsigned((8'ha3))))));
              reg24 <= ((!({wire12[(3'h7):(3'h4)]} ?
                      ($signed(wire13) ?
                          $unsigned(reg18) : wire12) : wire15[(2'h3):(1'h1)])) ?
                  ($signed({reg24,
                      $unsigned(wire13)}) || $unsigned($signed((wire12 ?
                      wire12 : reg24)))) : (^~(-($signed(reg18) ^ $signed(wire12)))));
              reg25 <= $signed(({(!(~reg25)),
                  ((wire12 * (8'hb2)) ?
                      $signed(reg17) : $unsigned(wire14))} ^~ reg23[(4'ha):(3'h7)]));
              reg26 <= {{reg16, reg17[(4'h9):(2'h3)]}, $signed(reg22)};
            end
        end
      reg27 <= wire12[(4'ha):(2'h2)];
    end
  module28 #() modinst56 (.wire31(reg21), .wire30(wire12), .y(wire55), .clk(clk), .wire29(reg20), .wire32(wire15));
  module57 #() modinst71 (.wire60(reg25), .y(wire70), .wire58(wire12), .clk(clk), .wire61(reg21), .wire59(wire55), .wire62(reg19));
  assign wire72 = $signed($unsigned(wire12));
endmodule

module module57
#(parameter param68 = (((({(7'h42)} ? ((8'hba) ? (8'ha8) : (8'ha5)) : ((7'h43) >>> (8'hbf))) * ({(8'hbb), (8'hbf)} != ((8'haf) ^~ (8'h9e)))) <= (~^(~((7'h40) || (8'hb2))))) >> ((~|(^((8'hbf) >>> (8'ha5)))) * ((|((7'h43) && (8'hb9))) ? (((8'h9c) + (8'ha9)) ? (~|(8'h9d)) : ((8'ha7) ? (8'ha7) : (8'hb4))) : (((8'ha7) || (8'hb7)) ^~ ((8'ha8) ? (8'hbc) : (8'hb9)))))), 
parameter param69 = (~|(8'hbb)))
(y, clk, wire62, wire61, wire60, wire59, wire58);
  output wire [(32'h28):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire62;
  input wire signed [(4'ha):(1'h0)] wire61;
  input wire [(4'ha):(1'h0)] wire60;
  input wire signed [(4'he):(1'h0)] wire59;
  input wire [(4'hc):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire67;
  wire [(4'hb):(1'h0)] wire66;
  wire signed [(3'h4):(1'h0)] wire65;
  wire [(4'hb):(1'h0)] wire64;
  wire [(3'h6):(1'h0)] wire63;
  assign y = {wire67, wire66, wire65, wire64, wire63, (1'h0)};
  assign wire63 = $signed($unsigned($unsigned(wire62)));
  assign wire64 = wire58[(3'h7):(3'h5)];
  assign wire65 = (wire58 * $unsigned(wire59[(1'h1):(1'h1)]));
  assign wire66 = (^($signed((~^(^wire58))) ?
                      $signed($unsigned($signed(wire65))) : ({(wire60 ?
                                  wire60 : wire60),
                              wire60} ?
                          wire61[(4'h9):(3'h6)] : $signed(wire59))));
  assign wire67 = $unsigned((^$signed($signed(wire64))));
endmodule

module module28
#(parameter param53 = (((8'h9f) ? ((((8'h9e) ? (8'hbe) : (8'ha5)) <= ((8'hbd) + (7'h42))) ? (((8'hb6) ? (8'hb6) : (8'hbf)) ? (~&(8'ha3)) : ((7'h41) >>> (8'hbe))) : (((8'hbf) ^ (8'hbf)) ^~ {(8'ha5), (8'hb6)})) : ({(~(8'ha6))} <<< (8'hbc))) ? ({(~((8'hb6) == (8'h9f))), (~|((8'haf) + (8'ha2)))} >>> (8'hb8)) : {(!(~&((8'h9c) ? (8'hac) : (8'hb2))))}), 
parameter param54 = ({(({(8'h9c), param53} ? (param53 < param53) : {param53}) ? ((param53 ? param53 : param53) + param53) : (!(~&param53)))} ? (^param53) : ((param53 ? ((8'hbf) <<< (|param53)) : param53) != ((((8'hae) ? param53 : param53) ? (param53 ? param53 : param53) : (|param53)) ? {param53, (param53 || param53)} : ((8'hba) ^ (param53 ? param53 : param53))))))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h10a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire32;
  input wire signed [(4'hb):(1'h0)] wire31;
  input wire [(4'ha):(1'h0)] wire30;
  input wire [(5'h11):(1'h0)] wire29;
  wire signed [(3'h5):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire51;
  wire signed [(4'hc):(1'h0)] wire50;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(4'hc):(1'h0)] wire46;
  wire signed [(5'h10):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire [(5'h14):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire37;
  wire [(5'h13):(1'h0)] wire36;
  wire signed [(5'h11):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(5'h13):(1'h0)] wire33;
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire46,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 reg48,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 (1'h0)};
  assign wire33 = (!$unsigned($unsigned(($signed(wire31) <= $unsigned(wire30)))));
  assign wire34 = $unsigned(($unsigned((wire31 ?
                      wire33[(5'h10):(4'h8)] : (wire31 ?
                          wire29 : wire31))) >> $unsigned(wire33[(1'h0):(1'h0)])));
  assign wire35 = $unsigned(wire32[(2'h3):(2'h2)]);
  assign wire36 = {wire32};
  assign wire37 = (|(8'haf));
  assign wire38 = (8'hbd);
  assign wire39 = {({$signed(wire34), (wire31 & (wire31 ^ wire36))} ?
                          wire38 : wire37),
                      wire35[(4'ha):(4'h9)]};
  assign wire40 = wire32[(4'hb):(3'h4)];
  assign wire41 = $unsigned($signed($unsigned($signed({(8'haa)}))));
  always
    @(posedge clk) begin
      reg42 <= (wire31 ?
          ($unsigned($unsigned(((8'ha8) ?
              wire37 : wire34))) * (8'ha7)) : {$signed($signed($unsigned(wire40)))});
      if ((~^wire37))
        begin
          reg43 <= wire38;
          reg44 <= (8'hb7);
        end
      else
        begin
          reg43 <= {{$unsigned(wire34[(3'h7):(2'h2)]),
                  $signed(reg43[(4'ha):(3'h4)])},
              (8'hb2)};
        end
      reg45 <= $unsigned((wire33 ? wire39 : wire32));
    end
  assign wire46 = wire32;
  always
    @(posedge clk) begin
      reg47 <= wire40;
    end
  always
    @(posedge clk) begin
      reg48 <= $signed((8'h9f));
    end
  assign wire49 = $unsigned(((^reg48[(4'hb):(4'h9)]) ?
                      (&$signed($signed((8'hba)))) : wire34));
  assign wire50 = (|wire46);
  assign wire51 = (reg48 <= (8'ha7));
  assign wire52 = $signed((&((~(reg45 >>> reg42)) ? wire31 : wire36)));
endmodule
