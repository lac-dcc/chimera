module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h153):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire42;
  wire signed [(5'h10):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire34;
  wire signed [(3'h5):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'ha):(1'h0)] wire31;
  wire signed [(5'h14):(1'h0)] wire30;
  wire signed [(5'h11):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'hf):(1'h0)] wire20;
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg29 = (1'h0);
  reg [(3'h4):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(5'h11):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg24 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg [(5'h10):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg9 = (1'h0);
  assign y = {wire46,
                 wire42,
                 wire41,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire5,
                 wire6,
                 wire7,
                 wire20,
                 reg45,
                 reg44,
                 reg43,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = (wire0 & $unsigned((!($signed(wire1) <= (wire0 ?
                     wire4 : wire1)))));
  assign wire6 = (^wire2[(3'h5):(2'h3)]);
  assign wire7 = {($signed({$signed((8'ha5))}) <= wire2[(1'h0):(1'h0)]),
                     wire1[(5'h10):(3'h4)]};
  always
    @(posedge clk) begin
      reg8 <= {wire2[(2'h3):(2'h2)]};
      reg9 <= $signed(((wire5 ?
              $unsigned({wire1, wire5}) : ($unsigned(wire7) ? wire2 : {reg8})) ?
          wire5[(4'h9):(1'h0)] : ($unsigned(wire4[(3'h7):(1'h0)]) < (wire1 ?
              $unsigned(wire0) : wire3))));
    end
  module10 #() modinst21 (wire20, clk, wire1, reg8, wire2, wire0);
  always
    @(posedge clk) begin
      if ($unsigned({(($signed(wire5) ? (|wire5) : ((8'hae) ~^ wire4)) ?
              $unsigned((!wire3)) : $signed($unsigned(wire6))),
          $unsigned($unsigned($unsigned(wire3)))}))
        begin
          reg22 <= (+wire6[(2'h3):(2'h2)]);
          reg23 <= $signed(((~&$signed((|(8'hb3)))) ?
              wire3 : ({wire2, ((8'hbf) + (8'hb6))} & (^~(reg8 >> wire2)))));
          reg24 <= $signed(($unsigned((wire5[(3'h7):(1'h1)] ?
              (wire4 ? reg23 : reg23) : (wire7 ?
                  wire4 : (8'ha5)))) || (8'hbc)));
          reg25 <= (reg24[(3'h6):(2'h2)] ?
              (wire3 ~^ ((~|$signed(reg9)) ?
                  $unsigned((wire6 <= reg24)) : ((~&wire4) + $unsigned(wire6)))) : $signed((~&(wire20[(2'h2):(2'h2)] ?
                  (7'h41) : (|reg24)))));
        end
      else
        begin
          reg22 <= reg24[(3'h7):(3'h6)];
          reg23 <= (!{reg22[(2'h2):(1'h0)],
              (reg8 ?
                  (!(wire4 ? wire4 : wire0)) : (reg23[(4'h9):(3'h7)] ?
                      (wire4 ^ wire1) : $signed(reg25)))});
          if ($unsigned($unsigned((^{{wire6}}))))
            begin
              reg24 <= wire4;
            end
          else
            begin
              reg24 <= $unsigned($unsigned($unsigned($unsigned($unsigned(reg24)))));
              reg25 <= reg8;
              reg26 <= reg22[(1'h0):(1'h0)];
            end
          reg27 <= ((8'ha8) ?
              $unsigned({($unsigned(wire3) >>> reg22[(1'h0):(1'h0)]),
                  (^~wire6[(2'h2):(1'h1)])}) : $signed(reg26[(4'h9):(3'h4)]));
        end
      reg28 <= reg9[(1'h1):(1'h0)];
      reg29 <= (reg28[(2'h2):(1'h1)] ?
          $unsigned(($signed((|reg27)) ?
              $unsigned((~&reg24)) : (reg24[(3'h5):(3'h4)] >> $signed(wire6)))) : (^~($unsigned((wire7 ?
                  wire4 : wire1)) ?
              wire20[(4'ha):(1'h0)] : ($signed(reg24) & ((8'ha6) * reg25)))));
    end
  assign wire30 = ($signed($signed((-$unsigned(reg24)))) ?
                      reg8 : wire20[(4'he):(3'h6)]);
  assign wire31 = reg29[(3'h5):(1'h1)];
  assign wire32 = $signed((~|reg28));
  assign wire33 = reg22;
  assign wire34 = reg24;
  assign wire35 = (reg28 != (wire32[(4'hc):(4'h9)] <<< (((^~wire33) ?
                          $signed(wire1) : (~|wire1)) ?
                      (&((8'hb6) ? reg25 : (7'h42))) : ($signed(wire2) ?
                          wire4[(4'ha):(2'h2)] : wire7[(1'h1):(1'h1)]))));
  assign wire36 = reg29[(2'h3):(2'h3)];
  always
    @(posedge clk) begin
      reg37 <= $signed(reg27);
      reg38 <= wire20;
      reg39 <= wire30;
      reg40 <= $signed((8'hac));
    end
  assign wire41 = (wire7 ~^ (^reg8[(4'hf):(4'hd)]));
  assign wire42 = ({reg27} ?
                      $signed($unsigned((|((8'ha1) ? wire36 : reg8)))) : reg38);
  always
    @(posedge clk) begin
      if (($unsigned(wire2[(1'h1):(1'h1)]) < (($signed({(8'ha6),
              reg37}) - (~(reg26 || reg28))) ?
          wire30 : wire3[(2'h2):(1'h1)])))
        begin
          reg43 <= $signed($signed(($unsigned((!wire6)) ?
              $unsigned(reg24) : (-reg29[(2'h2):(1'h1)]))));
        end
      else
        begin
          reg43 <= ((7'h44) ? reg28[(1'h0):(1'h0)] : {$unsigned(wire41)});
          reg44 <= {wire42[(4'hb):(4'hb)]};
        end
      reg45 <= reg39;
    end
  assign wire46 = ((~wire33[(1'h0):(1'h0)]) ? (&wire30) : {wire20});
endmodule

module module10
#(parameter param19 = (((8'hae) ? (((~&(8'hbc)) ? ((8'hab) != (8'ha7)) : (^(8'hbf))) ? (((8'ha6) ? (8'ha9) : (8'hb7)) ? ((8'haa) ? (7'h43) : (7'h44)) : (~&(8'ha7))) : (-((8'hb3) + (8'hb4)))) : ({(~|(8'hb7))} ? (8'ha2) : ((8'hb9) | {(8'ha7), (8'hb0)}))) * (({((8'ha1) || (8'hae)), ((8'hbf) ? (8'h9c) : (8'hbe))} ? ({(8'hbc)} >>> (-(8'hac))) : ((~(8'hbc)) ? ((8'haa) ? (8'hb0) : (8'hbe)) : (!(7'h42)))) ? {(((8'haa) <= (8'hbb)) ? ((8'hb2) ? (8'hb7) : (8'haf)) : ((8'hb3) ? (8'hbe) : (8'ha0)))} : (~&(((8'h9e) ? (7'h41) : (8'hbc)) + (^~(7'h43)))))))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h29):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  input wire signed [(2'h3):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(4'hd):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire15;
  assign y = {wire18, wire17, wire16, wire15, (1'h0)};
  assign wire15 = ($unsigned(($unsigned((~wire11)) ?
                          {wire11[(3'h5):(3'h5)],
                              $signed(wire12)} : (~|$signed(wire13)))) ?
                      (~&((!(!wire12)) ?
                          (~&(wire14 ?
                              wire14 : wire14)) : $unsigned((!wire14)))) : (wire14 ^~ (^wire12[(2'h3):(2'h3)])));
  assign wire16 = wire14[(4'h8):(3'h7)];
  assign wire17 = wire16[(3'h4):(3'h4)];
  assign wire18 = $signed(wire13);
endmodule
