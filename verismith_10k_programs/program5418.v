module top
#(parameter param90 = (|((^(((8'hbc) ? (8'hba) : (8'hbb)) ? {(8'hb6)} : ((8'hb5) ? (8'hb8) : (7'h43)))) - (+((+(8'hb6)) | ((8'hb2) >= (8'hb6)))))), 
parameter param91 = (param90 * ((({(8'ha4)} ? (param90 > param90) : ((8'hbe) ? param90 : param90)) >>> ((param90 != param90) != {(8'ha8), param90})) ? (~|(!(param90 >= param90))) : (8'h9e))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h18f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire [(4'h9):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire61;
  wire [(5'h10):(1'h0)] wire60;
  wire [(3'h7):(1'h0)] wire59;
  wire [(4'hf):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire56;
  reg signed [(5'h12):(1'h0)] reg87 = (1'h0);
  reg [(5'h14):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg85 = (1'h0);
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg [(4'ha):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg76 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg75 = (1'h0);
  reg [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(3'h5):(1'h0)] reg72 = (1'h0);
  reg [(3'h4):(1'h0)] reg71 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg70 = (1'h0);
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg [(3'h6):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg63 = (1'h0);
  reg [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire56,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= $unsigned({$unsigned((^(wire3 ? wire0 : (8'hb2))))});
      reg6 <= {($signed($signed(wire3)) ?
              ($unsigned({wire3, wire2}) ?
                  wire3[(3'h5):(1'h1)] : (reg5 >>> (8'ha3))) : wire2[(4'ha):(3'h6)]),
          {(wire1[(3'h4):(3'h4)] * ($unsigned(wire2) ?
                  (reg5 << (8'hb1)) : $signed(wire2)))}};
      reg7 <= (7'h43);
      reg8 <= wire1[(3'h4):(2'h3)];
    end
  module9 #() modinst57 (wire56, clk, reg8, reg5, wire0, reg6);
  assign wire58 = {wire0[(4'h9):(3'h6)]};
  assign wire59 = $unsigned(((~^reg6[(3'h5):(2'h2)]) + ((~&{reg6}) ?
                      $signed((~|wire58)) : $signed({wire3, reg5}))));
  assign wire60 = $signed(((^~(wire0 > (|(8'had)))) ?
                      (wire1 ?
                          $signed({wire4}) : wire2) : $unsigned((reg6 + wire4))));
  assign wire61 = wire59;
  always
    @(posedge clk) begin
      reg62 <= (reg7 ~^ reg5[(3'h6):(3'h6)]);
      if ($unsigned(wire58))
        begin
          reg63 <= {(!(reg8[(4'hc):(1'h1)] ?
                  wire60 : $unsigned((wire0 ? wire61 : wire58))))};
          reg64 <= ((~|(&$unsigned($signed(wire60)))) - $unsigned(((!reg63) ?
              (8'hab) : reg62[(1'h0):(1'h0)])));
        end
      else
        begin
          reg63 <= reg5;
          reg64 <= (^~(($unsigned($unsigned(reg63)) < $unsigned((wire3 ^ wire4))) ?
              $signed(reg5[(4'he):(4'he)]) : (wire4[(1'h0):(1'h0)] >> wire3[(2'h2):(1'h0)])));
          reg65 <= {($unsigned($unsigned($signed(reg62))) ?
                  reg5[(4'h8):(2'h3)] : {(!(reg6 - wire60)),
                      $signed($unsigned(wire3))})};
          if ((~($unsigned(($unsigned(wire58) ?
                  wire0[(1'h1):(1'h1)] : {(8'ha5), wire4})) ?
              (wire3[(1'h0):(1'h0)] > wire59[(1'h0):(1'h0)]) : (((~wire0) | $signed(wire59)) ?
                  ({reg6} ?
                      (wire4 - (8'ha6)) : $unsigned(wire1)) : wire2[(3'h6):(3'h5)]))))
            begin
              reg66 <= wire58;
              reg67 <= (-reg8);
              reg68 <= (({$unsigned({wire56})} ?
                      reg62[(2'h2):(1'h1)] : (~|$signed($signed(reg65)))) ?
                  wire0[(3'h4):(1'h1)] : $signed((reg67[(2'h3):(1'h0)] != (~^wire59))));
            end
          else
            begin
              reg66 <= {wire4[(3'h4):(2'h3)],
                  {{($unsigned((8'had)) == reg7)}, (+wire0[(1'h0):(1'h0)])}};
              reg67 <= $signed($signed($unsigned($signed(wire56[(4'h9):(3'h5)]))));
              reg68 <= ($unsigned(((reg68 ^ (reg5 ? (7'h41) : wire4)) ?
                  reg6 : (8'h9e))) >> $signed(wire3));
              reg69 <= reg62;
            end
        end
      if ((~wire3[(1'h1):(1'h0)]))
        begin
          reg70 <= {wire60[(4'hd):(3'h4)]};
          reg71 <= $signed(reg65[(3'h4):(2'h3)]);
          reg72 <= ((+reg67) < $unsigned($unsigned({reg5[(4'hf):(4'hc)],
              (~reg63)})));
        end
      else
        begin
          reg70 <= ($signed({wire56[(3'h6):(2'h3)]}) & ((&(+$signed(wire2))) ?
              $signed(wire61[(2'h3):(2'h2)]) : reg66));
          reg71 <= (~&$signed(wire56));
          reg72 <= $unsigned($unsigned(((8'hb6) + ($unsigned(reg7) < wire56))));
          reg73 <= (~$unsigned($signed((reg65[(1'h1):(1'h1)] != {reg67}))));
        end
    end
  always
    @(posedge clk) begin
      if ({reg64})
        begin
          reg74 <= $signed(reg67);
          reg75 <= (~(~|$signed((wire58[(2'h2):(1'h1)] ?
              (reg5 && reg66) : wire4[(3'h7):(3'h7)]))));
          reg76 <= ({(((^reg6) != (reg6 >> wire61)) && reg62),
              (~|$signed({reg8}))} >= reg68);
          reg77 <= wire61[(2'h2):(2'h2)];
        end
      else
        begin
          if ($signed($signed($signed($unsigned(wire3[(1'h0):(1'h0)])))))
            begin
              reg74 <= reg64;
              reg75 <= ((reg6[(1'h0):(1'h0)] ?
                      ($unsigned((wire4 > wire3)) * ((~&wire60) ?
                          (~&reg74) : (^wire0))) : $signed(wire58[(2'h2):(1'h1)])) ?
                  (-($unsigned($unsigned(reg68)) * $unsigned($signed(reg69)))) : wire58);
            end
          else
            begin
              reg74 <= wire59[(2'h2):(2'h2)];
              reg75 <= wire3[(1'h1):(1'h1)];
              reg76 <= reg68;
            end
          reg77 <= ($unsigned(reg70[(3'h5):(1'h1)]) ?
              (wire59[(3'h7):(1'h0)] ?
                  {((reg64 ? wire2 : reg73) ?
                          reg75 : (~^reg76))} : {$unsigned($signed(wire4))}) : ((+(~|$unsigned((8'ha2)))) && (reg5[(4'hc):(4'h8)] ?
                  ($unsigned(reg62) * ((8'hbb) * wire58)) : $unsigned((8'hb2)))));
          reg78 <= (~^reg71[(2'h2):(1'h1)]);
          if ($signed(reg69))
            begin
              reg79 <= {(-(^(8'hb4)))};
              reg80 <= {wire2, reg62[(2'h2):(1'h0)]};
              reg81 <= reg70[(2'h2):(2'h2)];
              reg82 <= $signed($unsigned(reg7));
            end
          else
            begin
              reg79 <= ({{wire1[(2'h2):(1'h1)]}} <<< $signed($unsigned(reg82)));
              reg80 <= (-{reg71, wire60});
              reg81 <= reg80[(4'ha):(2'h3)];
              reg82 <= (~^$signed($signed(reg64[(1'h0):(1'h0)])));
              reg83 <= ($unsigned(reg72[(1'h0):(1'h0)]) ?
                  reg65[(2'h2):(1'h1)] : reg66[(1'h0):(1'h0)]);
            end
          reg84 <= (~|$unsigned((reg76 << reg70[(1'h0):(1'h0)])));
        end
      reg85 <= reg65;
      reg86 <= (((($unsigned(reg64) ? (~wire4) : $signed(reg62)) ?
                  {reg79} : (|{(8'ha3)})) ?
              (&$signed((-wire59))) : reg75) ?
          $signed(wire2[(4'hf):(3'h4)]) : ($signed($signed((reg7 * wire61))) ?
              $signed($signed(reg68[(3'h4):(2'h2)])) : reg73[(4'ha):(1'h0)]));
      reg87 <= $signed($unsigned((({reg84} ? $unsigned(wire3) : (^reg82)) ?
          (^~$signed((8'hb9))) : reg7)));
    end
  assign wire88 = ({$signed(reg77),
                      (reg87[(3'h4):(2'h2)] | reg83[(2'h2):(1'h1)])} | (reg83 ~^ reg62));
  assign wire89 = {(wire1[(3'h6):(2'h2)] - {$unsigned((-reg73))})};
endmodule

module module9  (y, clk, wire10, wire11, wire12, wire13);
  output wire [(32'he0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire11;
  input wire [(4'hf):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire50;
  wire signed [(4'hd):(1'h0)] wire49;
  wire signed [(5'h10):(1'h0)] wire48;
  wire signed [(5'h13):(1'h0)] wire47;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire45;
  wire signed [(5'h13):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire42;
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg52 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg44 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire14,
                 wire15,
                 wire16,
                 wire17,
                 wire42,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg44,
                 (1'h0)};
  assign wire14 = (wire12 ?
                      {{wire11},
                          (((wire13 ? wire11 : wire13) << {wire13,
                              wire13}) <<< wire11)} : wire10[(2'h2):(1'h0)]);
  assign wire15 = $signed(wire10[(1'h1):(1'h1)]);
  assign wire16 = $signed({(($unsigned(wire10) ?
                          $signed(wire15) : {wire13,
                              wire10}) >= ($unsigned(wire11) ?
                          (wire15 | wire15) : (~wire12))),
                      ($unsigned((8'hb8)) == wire15[(2'h2):(1'h1)])});
  assign wire17 = wire10[(1'h1):(1'h1)];
  module18 #() modinst43 (.wire20(wire14), .wire22(wire15), .wire21(wire16), .wire19(wire12), .clk(clk), .y(wire42), .wire23(wire11));
  always
    @(posedge clk) begin
      reg44 <= wire16[(1'h1):(1'h1)];
    end
  assign wire45 = $signed(($unsigned((8'hbc)) || ($signed(wire11) | ((wire16 <= wire42) ^ ((8'hbc) ^ wire14)))));
  assign wire46 = ($unsigned($unsigned(wire12[(2'h3):(2'h3)])) ?
                      $signed(($signed(wire11) ?
                          $unsigned(wire15[(4'ha):(3'h5)]) : (8'ha6))) : (^~$unsigned((wire45[(3'h5):(1'h1)] ?
                          $signed(wire42) : (&wire42)))));
  assign wire47 = wire16[(4'h8):(1'h1)];
  assign wire48 = $unsigned(wire17[(3'h5):(3'h5)]);
  assign wire49 = $signed(($signed((~(&wire12))) || ($unsigned((wire10 ^~ wire45)) ?
                      wire14[(3'h4):(3'h4)] : wire12)));
  assign wire50 = ($signed(wire49[(4'h8):(3'h6)]) < ($unsigned((wire10 > wire46)) ?
                      (&{wire15[(5'h14):(5'h13)]}) : (({wire48} <= wire46) <<< $signed(((8'hbf) ?
                          (8'h9e) : wire48)))));
  always
    @(posedge clk) begin
      reg51 <= ((($unsigned($signed(reg44)) ?
              $unsigned($signed(wire50)) : $signed($unsigned(wire10))) >>> wire50) ?
          reg44[(3'h4):(2'h2)] : ($unsigned(wire11) ?
              wire13[(1'h1):(1'h1)] : $unsigned({(wire17 ?
                      wire15 : (8'hb7))})));
    end
  always
    @(posedge clk) begin
      reg52 <= (8'hbb);
      reg53 <= $signed(wire16);
      reg54 <= {(reg53[(4'hc):(1'h1)] ~^ wire10[(2'h2):(1'h0)])};
      reg55 <= (+wire10[(1'h0):(1'h0)]);
    end
endmodule

module module18  (y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hc2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire23;
  input wire [(5'h15):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  input wire signed [(5'h13):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire19;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire signed [(3'h4):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(5'h13):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire30;
  wire signed [(2'h2):(1'h0)] wire29;
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg24 <= wire23;
      reg25 <= {{{$signed((&wire19))}, wire22},
          (&$signed(($signed(wire23) == (-wire19))))};
      reg26 <= (reg25[(2'h3):(1'h1)] ? wire20 : (!$signed((8'ha3))));
      reg27 <= ((wire23[(3'h5):(3'h4)] | (!($signed((8'haf)) >>> $unsigned((8'hbc))))) ~^ (reg26[(3'h4):(1'h0)] ?
          (^(~^(wire23 ?
              wire23 : reg26))) : $signed($unsigned($signed(reg26)))));
      reg28 <= wire23;
    end
  assign wire29 = wire20[(5'h11):(2'h2)];
  assign wire30 = $unsigned((reg25 ? (7'h43) : $unsigned($unsigned(wire29))));
  assign wire31 = ({{(^~((8'ha5) ? wire19 : wire30)), reg27},
                      wire19[(4'h8):(3'h7)]} < wire21[(4'he):(2'h3)]);
  assign wire32 = $unsigned((+$unsigned(wire20[(4'ha):(3'h7)])));
  assign wire33 = wire19;
  assign wire34 = wire23;
  assign wire35 = wire19[(3'h5):(2'h2)];
  assign wire36 = (^$unsigned(wire30[(3'h4):(2'h2)]));
  assign wire37 = ($signed(reg25) >> ((($signed((8'ha0)) & (reg24 ?
                      wire32 : wire36)) && ((wire22 == wire29) ?
                      (~&wire22) : (wire19 ?
                          wire30 : wire30))) == $unsigned(wire33[(2'h3):(2'h3)])));
  assign wire38 = wire33;
  assign wire39 = wire34;
  assign wire40 = $unsigned(($signed((|wire35[(4'ha):(4'h9)])) << $signed(($unsigned((8'hbf)) ?
                      (^~(8'hb1)) : $signed(wire33)))));
  assign wire41 = wire40;
endmodule
