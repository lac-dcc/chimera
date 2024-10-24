module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hc1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(5'h15):(1'h0)] wire58;
  wire signed [(5'h14):(1'h0)] wire57;
  wire [(4'ha):(1'h0)] wire56;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(5'h14):(1'h0)] wire54;
  wire signed [(3'h6):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire signed [(3'h6):(1'h0)] wire50;
  reg signed [(4'hc):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg67 = (1'h0);
  reg [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(4'he):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg [(4'h9):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(3'h4):(1'h0)] reg61 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire50,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 (1'h0)};
  module5 #() modinst51 (wire50, clk, wire0, wire4, wire1, wire3);
  assign wire52 = $signed($signed(wire3));
  assign wire53 = {(($signed($unsigned(wire52)) > $unsigned((wire50 & wire52))) ?
                          ((wire1 ? (wire2 >> wire1) : (wire1 ~^ (8'hbf))) ?
                              wire50 : (+$unsigned(wire4))) : $signed((^(wire2 ?
                              wire2 : wire2)))),
                      (8'hb2)};
  assign wire54 = (^$unsigned($signed((8'hbb))));
  assign wire55 = ((($signed((wire1 ? wire50 : wire1)) ? (~^wire3) : wire3) ?
                          (^(!{wire4})) : wire0[(3'h4):(2'h3)]) ?
                      wire1[(1'h1):(1'h0)] : (~wire52[(3'h6):(1'h0)]));
  assign wire56 = ({{wire3}, (8'hb4)} ~^ (~&(8'ha7)));
  assign wire57 = ({$signed({wire1}),
                          $signed($signed((wire56 ? (8'hae) : wire0)))} ?
                      (^~wire52) : ($unsigned(wire53[(1'h1):(1'h0)]) * wire52[(2'h2):(1'h0)]));
  assign wire58 = wire50[(2'h2):(1'h1)];
  assign wire59 = $signed($signed($signed(wire58)));
  assign wire60 = ((~&wire53[(1'h1):(1'h0)]) <= ((8'hb5) + ($signed((!wire1)) > wire58)));
  always
    @(posedge clk) begin
      if (wire50[(2'h3):(1'h0)])
        begin
          reg61 <= (wire3[(1'h1):(1'h0)] ? wire2 : (~wire58[(3'h7):(3'h7)]));
          reg62 <= (wire52 >> wire4[(1'h0):(1'h0)]);
          reg63 <= $unsigned((($signed(wire50) ?
                  $unsigned(wire58[(5'h10):(1'h0)]) : wire1[(4'hc):(4'h9)]) ?
              (((wire60 ? reg62 : reg62) ?
                  wire1[(2'h3):(1'h1)] : {wire55,
                      (8'hbf)}) ^ {(wire53 || wire56),
                  (wire58 ? wire1 : wire3)}) : (((^wire56) ?
                  reg62 : $signed(wire4)) || reg61[(2'h2):(1'h1)])));
          reg64 <= (+$signed($signed($signed($signed((8'hb0))))));
        end
      else
        begin
          reg61 <= wire1[(4'ha):(4'h8)];
          reg62 <= (~$unsigned($signed(reg62)));
        end
      reg65 <= (wire57 || (wire56 > reg64[(3'h4):(2'h3)]));
      reg66 <= (wire0 ? {wire52[(3'h6):(3'h4)]} : wire60);
      reg67 <= wire0;
      reg68 <= (($signed($unsigned(reg65)) ?
              (((-wire59) ? (wire55 ? reg64 : wire2) : $signed((8'hb3))) ?
                  (~(wire59 ?
                      (8'hba) : (8'had))) : reg61) : wire59[(4'ha):(4'ha)]) ?
          (wire60[(1'h1):(1'h1)] == wire60[(2'h2):(2'h2)]) : {(^wire58),
              (|($signed(wire1) ? {wire2} : reg65))});
    end
endmodule

module module5
#(parameter param49 = (+((^{((8'ha1) || (7'h44)), (~&(7'h41))}) >= ((((8'hb9) ? (8'hb9) : (8'hab)) ? ((8'hbc) * (8'ha8)) : (7'h40)) ^ (^((8'hb8) <= (8'h9c)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire signed [(4'he):(1'h0)] wire7;
  input wire [(5'h15):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire48;
  wire [(4'hf):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire38;
  reg [(5'h15):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h11):(1'h0)] reg41 = (1'h0);
  reg signed [(4'he):(1'h0)] reg40 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire46,
                 wire38,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  module10 #() modinst39 (wire38, clk, wire8, wire9, wire7, wire6);
  always
    @(posedge clk) begin
      reg40 <= $signed(wire7[(3'h6):(3'h4)]);
      reg41 <= reg40[(3'h6):(2'h3)];
    end
  always
    @(posedge clk) begin
      reg42 <= {(&{$signed(((8'hb8) & wire7))})};
      if ((8'ha8))
        begin
          reg43 <= (&$signed(((&$unsigned(reg42)) & $signed(((7'h43) ?
              (8'hab) : wire9)))));
        end
      else
        begin
          reg43 <= (wire8[(4'hd):(4'h9)] == wire6);
          reg44 <= {reg41[(3'h5):(1'h1)], wire6[(5'h12):(3'h5)]};
        end
      reg45 <= $signed(wire7);
    end
  assign wire46 = (wire8 - {(~&{reg44}), wire9});
  assign wire47 = $signed($signed($unsigned((!reg40))));
  assign wire48 = wire46[(2'h3):(2'h2)];
endmodule

module module10  (y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire37;
  wire signed [(5'h10):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire15;
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(5'h14):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h11):(1'h0)] reg16 = (1'h0);
  assign y = {wire37,
                 wire29,
                 wire15,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
  assign wire15 = wire12[(3'h5):(2'h2)];
  always
    @(posedge clk) begin
      reg16 <= (~$unsigned((($signed((8'hb2)) >>> (wire11 ? wire11 : wire13)) ?
          wire13[(3'h4):(1'h0)] : wire15)));
      reg17 <= $unsigned($signed(({$signed((8'hb8))} <<< $unsigned($unsigned(wire15)))));
      reg18 <= ((~^{$signed(reg16[(3'h6):(1'h1)]), {$unsigned(wire14)}}) ?
          $unsigned(($signed(reg16[(4'h9):(3'h7)]) ^~ wire14[(5'h10):(5'h10)])) : (|$unsigned(reg17[(4'hc):(2'h2)])));
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire15))
        begin
          reg19 <= reg18[(1'h0):(1'h0)];
          if (wire11)
            begin
              reg20 <= $signed(reg16);
              reg21 <= reg18;
            end
          else
            begin
              reg20 <= wire14;
              reg21 <= (reg19 > (({$signed(wire13), reg18[(1'h1):(1'h0)]} ?
                      reg19[(4'ha):(3'h6)] : {(!(8'ha3))}) ?
                  (reg18 ?
                      ($unsigned((7'h40)) == $signed(wire11)) : (reg21[(4'hc):(4'hb)] >= (reg21 ?
                          (8'hbf) : wire14))) : $signed($unsigned({wire13,
                      reg20}))));
              reg22 <= ((!$signed($unsigned(wire12[(4'he):(1'h1)]))) ?
                  $unsigned((((~^wire14) + wire14) ?
                      ($unsigned(reg21) ?
                          $signed((8'hb6)) : $signed(reg21)) : $signed((wire13 ?
                          reg17 : (8'ha6))))) : ($unsigned($signed($unsigned((7'h43)))) ?
                      {$unsigned((^~reg20))} : wire11[(4'hb):(3'h5)]));
            end
          reg23 <= (($signed((8'hb7)) || (8'hb7)) ?
              wire15 : ($unsigned(reg20) ?
                  {wire12} : ((((8'haa) ? (7'h44) : reg22) == $signed(wire12)) ?
                      ((8'ha2) >= (reg21 & reg20)) : (wire11 ?
                          wire14 : wire12))));
          reg24 <= $unsigned((($signed((wire12 ? reg23 : wire11)) ?
              $signed((reg22 ?
                  wire12 : (8'hbd))) : reg23) ^~ ({((8'hb9) >>> reg23)} || reg16[(4'h9):(3'h5)])));
          reg25 <= ((reg16[(4'ha):(3'h6)] ^~ wire13[(2'h3):(1'h0)]) < $signed(($unsigned(((8'hab) ?
              reg24 : reg16)) <<< ({wire11} ?
              {reg16} : (reg22 ? reg19 : (8'ha8))))));
        end
      else
        begin
          reg19 <= (^$unsigned(wire13));
          if (({(wire14[(2'h3):(2'h3)] ~^ ((-wire14) ?
                  (wire11 > reg19) : (+reg21))),
              $unsigned($unsigned((reg22 >>> reg16)))} || reg18[(3'h6):(3'h5)]))
            begin
              reg20 <= $unsigned($signed(reg16[(3'h5):(2'h3)]));
              reg21 <= ($unsigned((~^(reg24 | (wire13 ? reg24 : reg19)))) ?
                  reg16[(5'h11):(3'h7)] : (-$signed(reg17[(4'h8):(2'h3)])));
              reg22 <= (~&{$unsigned((-reg22)), wire13[(2'h3):(2'h2)]});
              reg23 <= (reg22[(1'h1):(1'h0)] ? reg25 : wire12[(3'h6):(2'h3)]);
            end
          else
            begin
              reg20 <= ($unsigned((({reg24} ^~ (8'hb0)) > (wire14 ?
                  reg21 : reg18[(2'h2):(1'h0)]))) != ($unsigned((-{reg24})) | reg25));
              reg21 <= ((8'hb2) - reg19[(4'ha):(2'h3)]);
            end
          reg24 <= reg22;
        end
      reg26 <= $signed(($signed(reg16[(4'hf):(3'h4)]) ?
          ((((8'hbc) && reg17) & (&wire15)) ?
              ({wire11} ? $signed(reg16) : $signed(wire14)) : ((wire15 ?
                      wire15 : reg19) ?
                  {wire14} : ((8'h9d) ? reg19 : wire14))) : (|reg25)));
      reg27 <= reg25;
      reg28 <= reg19[(3'h5):(1'h0)];
    end
  assign wire29 = (((~^reg17[(5'h11):(1'h1)]) << (^wire14)) & (~|(($signed(reg28) - (reg21 != reg18)) == {(reg18 ~^ reg23),
                      $signed(reg16)})));
  always
    @(posedge clk) begin
      if ($unsigned(((&$signed(wire15)) ?
          {{$unsigned(wire13), (^~wire29)}} : wire15[(3'h7):(3'h6)])))
        begin
          if (wire15[(2'h3):(2'h2)])
            begin
              reg30 <= ((({(8'hbe), $signed(reg17)} && (~|wire14)) ?
                  (reg28 ^~ wire15) : $unsigned((wire11 ?
                      (!reg26) : {reg17}))) == {(~&reg23)});
            end
          else
            begin
              reg30 <= reg17;
              reg31 <= $signed(reg23[(4'h8):(1'h0)]);
              reg32 <= reg28;
              reg33 <= reg26;
            end
        end
      else
        begin
          if ((8'hb2))
            begin
              reg30 <= (($unsigned(wire11[(4'he):(1'h1)]) ?
                      {$signed($signed((8'hb1)))} : (reg16[(1'h0):(1'h0)] || (~^{wire29,
                          wire13}))) ?
                  (&((8'hae) ? (~reg32) : $signed(reg19))) : (8'ha2));
              reg31 <= (reg30[(2'h3):(2'h2)] ?
                  $unsigned(((8'hbc) ?
                      $unsigned(reg26) : $signed((~|wire14)))) : reg27[(4'hf):(4'ha)]);
              reg32 <= (^($unsigned(reg22) ?
                  $signed({(8'hbe)}) : (($signed(reg30) - ((8'haf) ?
                      reg23 : (8'hbd))) - $signed($unsigned((8'hb2))))));
              reg33 <= $unsigned(((reg20 ?
                  $signed($signed(reg23)) : reg32[(1'h1):(1'h1)]) | wire15));
            end
          else
            begin
              reg30 <= $unsigned($signed(reg33));
              reg31 <= reg30[(4'h9):(3'h5)];
              reg32 <= $signed((8'hbf));
              reg33 <= (($signed($signed({(8'hba),
                  (8'hb5)})) >= $signed(reg28)) * $signed(reg24));
              reg34 <= reg28;
            end
        end
      reg35 <= $signed(wire15[(3'h4):(1'h0)]);
      reg36 <= reg19[(4'h8):(1'h0)];
    end
  assign wire37 = reg24;
endmodule
