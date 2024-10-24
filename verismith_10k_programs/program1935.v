module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h120):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(4'hf):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire48;
  reg [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg65 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg62 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg56 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg55 = (1'h0);
  reg [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg [(5'h12):(1'h0)] reg50 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire48,
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
                 reg50,
                 (1'h0)};
  assign wire4 = (($signed(wire3) && (wire0[(3'h5):(2'h2)] << wire1[(1'h0):(1'h0)])) >> $unsigned(wire1[(2'h2):(1'h1)]));
  assign wire5 = (((((wire3 ^ wire0) >> wire4[(1'h0):(1'h0)]) ?
                     wire3 : $unsigned((wire1 ?
                         wire1 : wire2))) ^~ $unsigned((+{wire1}))) != (wire0 ?
                     $unsigned($unsigned((wire3 ? wire4 : wire3))) : wire2));
  assign wire6 = {{$signed(wire0[(3'h4):(1'h0)]), (&$signed((8'ha2)))},
                     ($signed(((wire0 <= (8'hb8)) <= wire1)) ?
                         (($signed(wire5) ?
                             (|wire5) : (~&(8'hb3))) <<< wire4[(1'h0):(1'h0)]) : wire1[(1'h1):(1'h1)])};
  module7 #() modinst49 (.wire11(wire1), .clk(clk), .y(wire48), .wire10(wire4), .wire9(wire3), .wire12(wire5), .wire8(wire6));
  always
    @(posedge clk) begin
      if (wire1[(4'he):(1'h1)])
        begin
          reg50 <= (wire0 - wire3[(4'ha):(2'h3)]);
          reg51 <= {(wire1 ?
                  (wire2 ?
                      $unsigned(((8'ha1) - (8'ha3))) : (((7'h40) + wire2) * $unsigned(wire48))) : ($unsigned(wire6[(4'ha):(1'h1)]) ?
                      ({wire3, (7'h41)} ?
                          wire3 : (wire6 ?
                              wire2 : wire6)) : wire4[(5'h11):(4'hd)])),
              wire48};
          if ($signed(reg50[(1'h0):(1'h0)]))
            begin
              reg52 <= {$signed(wire1),
                  (({wire3[(1'h0):(1'h0)], ((8'ha3) ? wire48 : reg51)} ?
                          (~&wire2[(1'h1):(1'h0)]) : $unsigned((wire6 ?
                              wire6 : reg51))) ?
                      ((|{reg50, reg50}) ?
                          (~|(8'ha3)) : ($signed(reg50) ?
                              (|wire48) : (reg50 << wire6))) : $unsigned($signed({(8'h9e),
                          wire0})))};
              reg53 <= $unsigned({({$unsigned(wire1),
                      reg50[(4'hb):(4'h8)]} <<< $signed($signed(wire1)))});
              reg54 <= (-$unsigned(wire48));
              reg55 <= reg50;
              reg56 <= (wire1[(5'h10):(3'h6)] ?
                  reg53[(2'h3):(1'h1)] : ((($signed(wire4) ?
                          (reg54 || reg54) : wire1[(4'hf):(4'ha)]) || ((8'ha9) ?
                          $unsigned(reg50) : $signed(reg52))) ?
                      (reg53[(1'h1):(1'h0)] ?
                          ((~(8'hbe)) ?
                              wire48[(1'h1):(1'h0)] : $unsigned(wire4)) : reg50[(2'h3):(2'h2)]) : ((wire6 == (wire0 ?
                              wire0 : reg53)) ?
                          ((~|(8'hab)) ?
                              reg51[(3'h4):(2'h3)] : (reg53 ?
                                  wire5 : wire3)) : wire5)));
            end
          else
            begin
              reg52 <= ($unsigned((&$unsigned(wire1))) < $unsigned($signed($signed(reg52))));
            end
          reg57 <= {(-wire48[(2'h2):(1'h1)])};
        end
      else
        begin
          reg50 <= (~^(~&((-$unsigned(wire0)) && $unsigned($signed(reg55)))));
          if ({$unsigned($unsigned(((wire3 == reg52) * wire3)))})
            begin
              reg51 <= reg52;
            end
          else
            begin
              reg51 <= ((wire48[(1'h0):(1'h0)] && reg51[(2'h2):(1'h1)]) & $signed(wire5[(4'he):(1'h0)]));
              reg52 <= ((reg51 ?
                  $signed((|wire5)) : reg53) >= $unsigned(({(reg55 ?
                      reg53 : (8'ha5)),
                  {reg51}} && ({(8'had), wire6} * {reg50}))));
              reg53 <= (reg55[(1'h0):(1'h0)] ?
                  (~^{(reg51 ? $unsigned(wire5) : (8'ha5)),
                      $unsigned((-reg57))}) : ($unsigned($signed(((8'ha2) ?
                      (7'h41) : (8'hb7)))) >> (reg50 ?
                      (reg53[(2'h2):(1'h0)] ?
                          wire5[(1'h0):(1'h0)] : reg53[(3'h4):(3'h4)]) : $unsigned(reg52))));
            end
        end
      if ($signed(($unsigned(((wire5 ?
          (8'ha4) : wire3) ~^ (~&wire2))) - (reg56[(1'h0):(1'h0)] ?
          {(^~wire0)} : (reg54 >>> {(8'hb9), reg56})))))
        begin
          reg58 <= reg55[(1'h1):(1'h0)];
          if ({wire2,
              $signed(({reg55} ?
                  (reg58 ? reg52 : reg58[(4'h8):(1'h0)]) : $signed({reg52,
                      wire2})))})
            begin
              reg59 <= reg52;
              reg60 <= (+reg53);
            end
          else
            begin
              reg59 <= $unsigned((^wire5));
              reg60 <= $signed($unsigned(wire0));
              reg61 <= $signed(wire2);
              reg62 <= $signed($signed(reg54));
              reg63 <= (~^($signed(((wire1 ? wire6 : reg59) ?
                      wire2[(1'h0):(1'h0)] : (wire5 + wire0))) ?
                  ((-$signed(wire5)) ?
                      wire48 : reg57[(4'ha):(3'h6)]) : ($signed(wire6[(3'h7):(3'h7)]) * reg56)));
            end
          if (wire3)
            begin
              reg64 <= $unsigned((reg60[(1'h1):(1'h0)] ?
                  reg62 : (((+(8'hba)) ? $unsigned(wire6) : $unsigned(reg57)) ?
                      $signed((7'h41)) : reg59)));
              reg65 <= reg57[(4'hc):(1'h0)];
              reg66 <= ($unsigned(reg59[(1'h1):(1'h0)]) ?
                  ($unsigned(reg65) | (8'hbc)) : reg62);
              reg67 <= reg64;
            end
          else
            begin
              reg64 <= wire4[(4'hc):(3'h5)];
              reg65 <= $unsigned($unsigned((wire3[(4'h9):(3'h4)] || reg63)));
              reg66 <= $unsigned({reg57,
                  ($signed((~wire0)) ?
                      (|$unsigned(reg66)) : reg65[(4'he):(4'ha)])});
              reg67 <= ($unsigned(($unsigned($signed(wire1)) & (reg50[(4'hb):(1'h1)] ?
                  {wire2,
                      reg54} : $signed(wire0)))) ^ $signed($signed($signed((reg60 + wire48)))));
            end
          reg68 <= (^((~^$signed(reg51[(1'h1):(1'h0)])) ?
              (reg52 >= reg56[(2'h3):(2'h2)]) : {(((8'haf) ?
                      wire0 : wire6) <= $signed(wire6)),
                  ((reg56 ? (8'ha5) : wire1) >>> (reg58 ? reg54 : reg56))}));
          if ($signed((reg53 ? wire0 : (~wire1))))
            begin
              reg69 <= $signed((wire0[(3'h5):(2'h3)] ?
                  reg59[(3'h4):(3'h4)] : reg64));
              reg70 <= ($unsigned($unsigned(((reg54 <= wire1) <<< (+reg54)))) > {(8'hb1)});
              reg71 <= ({($signed($unsigned((8'ha6))) ?
                          {((8'hb3) ? reg70 : reg56),
                              reg65[(3'h5):(2'h3)]} : reg59[(2'h3):(2'h3)])} ?
                  reg53 : (~|$unsigned((reg66 ^~ ((8'hb2) & reg55)))));
              reg72 <= ($unsigned(wire6) ?
                  ((-(reg62[(5'h10):(2'h2)] << $signed(reg51))) * $signed($unsigned($signed(reg50)))) : reg65);
            end
          else
            begin
              reg69 <= (reg67[(2'h3):(2'h2)] ?
                  (reg66 & (^~{$unsigned(reg60)})) : (($unsigned((|reg65)) ?
                      $signed($unsigned(reg50)) : $signed((reg52 || wire0))) >>> reg61[(3'h7):(1'h1)]));
              reg70 <= $unsigned((reg66[(2'h2):(1'h0)] - {(~$signed(wire0))}));
            end
        end
      else
        begin
          if ((reg50 ?
              $signed(((~&reg57) + wire6[(4'hb):(3'h4)])) : reg55[(3'h5):(2'h3)]))
            begin
              reg58 <= $unsigned({{$signed((reg50 ^ reg68)),
                      {reg67, $unsigned(reg71)}}});
              reg59 <= ($signed(reg65[(5'h13):(4'hc)]) >> reg53);
            end
          else
            begin
              reg58 <= reg57[(4'hc):(3'h5)];
              reg59 <= reg55;
            end
          reg60 <= $unsigned(reg61);
          reg61 <= $unsigned((&$unsigned((^~(~wire48)))));
          reg62 <= $unsigned(((((!(8'hb1)) ?
                      $signed(reg65) : reg61[(1'h1):(1'h1)]) ?
                  $signed((reg65 <= reg50)) : wire48[(1'h0):(1'h0)]) ?
              (~|wire5) : $signed(wire6)));
          reg63 <= (reg59 >> $unsigned((~reg65[(4'hc):(3'h7)])));
        end
    end
endmodule

module module7
#(parameter param46 = (!((((&(8'hbc)) ? (|(8'hb9)) : ((8'hae) ? (8'hb1) : (8'had))) ? ((^(8'hab)) ? ((8'hb7) ^~ (8'hab)) : {(8'hbd), (8'ha2)}) : (+((8'h9f) ? (8'h9c) : (8'haf)))) ? (8'hac) : ((^((8'ha9) ? (8'hbb) : (8'hbc))) | (^((8'hbb) & (8'h9f)))))), 
parameter param47 = {((+(7'h41)) <<< param46)})
(y, clk, wire8, wire9, wire10, wire11, wire12);
  output wire [(32'hb8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire9;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(2'h3):(1'h0)] wire45;
  wire signed [(3'h6):(1'h0)] wire44;
  wire [(4'hb):(1'h0)] wire35;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire14;
  wire signed [(5'h15):(1'h0)] wire15;
  wire signed [(4'he):(1'h0)] wire33;
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h4):(1'h0)] reg39 = (1'h0);
  reg [(4'h8):(1'h0)] reg38 = (1'h0);
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  assign y = {wire45,
                 wire44,
                 wire35,
                 wire13,
                 wire14,
                 wire15,
                 wire33,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire13 = ($unsigned((7'h43)) ?
                      $signed((wire11[(1'h0):(1'h0)] ?
                          (|(8'hab)) : (~&$signed(wire12)))) : (((wire8 && {wire12,
                          wire8}) != $unsigned($unsigned(wire10))) << wire9[(3'h5):(1'h1)]));
  assign wire14 = (&wire8);
  assign wire15 = ($unsigned($signed((~|$unsigned(wire13)))) ^ (((wire12 ?
                          wire8[(1'h0):(1'h0)] : wire14) <= wire13) ?
                      $unsigned(wire8[(3'h4):(2'h3)]) : wire13));
  module16 #() modinst34 (wire33, clk, wire10, wire15, wire11, wire8, wire9);
  assign wire35 = (($unsigned((8'haa)) ? wire12 : wire9) ?
                      wire33 : (~|$signed(((+wire14) ?
                          (8'hac) : $unsigned((8'ha9))))));
  always
    @(posedge clk) begin
      reg36 <= (^~(wire35[(4'ha):(1'h1)] >> {(^wire13[(3'h7):(1'h1)]),
          ($unsigned(wire15) >> $signed((8'ha2)))}));
      reg37 <= ($signed(wire15) ?
          wire13 : (~|($unsigned({wire15}) ?
              (+{wire10}) : ((reg36 & wire11) || {wire12, wire35}))));
      if (wire9[(1'h0):(1'h0)])
        begin
          reg38 <= wire15[(2'h2):(2'h2)];
          reg39 <= reg36[(2'h2):(1'h1)];
          if (reg39)
            begin
              reg40 <= $signed(reg38);
              reg41 <= $signed((~^(+(wire15[(4'h8):(2'h2)] ?
                  $unsigned((8'hac)) : ((8'hb1) ? (8'hb7) : wire13)))));
              reg42 <= $unsigned({$unsigned($signed((|wire15))),
                  reg39[(2'h2):(1'h0)]});
            end
          else
            begin
              reg40 <= reg42[(4'hb):(3'h4)];
              reg41 <= {((~(~|$signed(reg36))) && (((reg39 << wire33) ?
                      wire35 : (reg36 ?
                          wire33 : wire10)) + (((8'hbe) < wire35) ?
                      reg37 : (wire12 == wire11)))),
                  $unsigned(wire15[(4'h8):(3'h7)])};
            end
        end
      else
        begin
          reg38 <= ($signed($unsigned(($unsigned(reg40) ?
                  (~|wire11) : $signed(wire11)))) ?
              ((^$signed(wire11[(4'hc):(4'h9)])) ?
                  ((^~(wire11 ?
                      reg41 : wire35)) >> wire14[(5'h11):(3'h5)]) : (^~reg36[(3'h5):(2'h2)])) : (wire11[(5'h10):(4'he)] ?
                  $unsigned($signed((-reg40))) : $signed($unsigned($signed(reg36)))));
          reg39 <= reg38;
          reg40 <= ((~$signed(reg37[(4'hc):(3'h7)])) ?
              (wire33[(4'h9):(1'h1)] ?
                  $signed((~&wire9[(3'h5):(3'h5)])) : $signed(($unsigned(wire15) & (wire11 ?
                      reg40 : wire9)))) : $unsigned(reg42[(3'h7):(3'h4)]));
          reg41 <= reg42;
        end
      reg43 <= reg40[(1'h1):(1'h1)];
    end
  assign wire44 = (reg41 * (~^(&$unsigned($unsigned(reg36)))));
  assign wire45 = $unsigned($signed($signed($signed(((8'hbe) ?
                      wire35 : wire8)))));
endmodule

module module16
#(parameter param32 = {(((((8'hac) >>> (8'hbd)) ? ((8'hba) ? (7'h43) : (8'haf)) : ((8'hab) ~^ (7'h41))) >> (^~((8'hbe) ? (8'hb0) : (8'h9f)))) > ((((8'hb0) ? (8'hb5) : (8'hb2)) ? ((8'hbd) ? (8'haf) : (8'hac)) : {(8'hb5), (8'haa)}) ~^ (8'hb2)))})
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h7f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire signed [(4'hc):(1'h0)] wire20;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire signed [(4'hc):(1'h0)] wire18;
  input wire [(3'h4):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(5'h15):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire26;
  wire [(2'h2):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  reg signed [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h11):(1'h0)] reg24 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire23,
                 wire22,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire22 = (&$signed($signed(wire21)));
  assign wire23 = ($unsigned(((!{wire19}) - (8'hbd))) < $unsigned(wire20[(4'h8):(3'h7)]));
  always
    @(posedge clk) begin
      reg24 <= $signed(((~(^~wire20[(2'h3):(1'h0)])) ?
          (8'ha8) : {((!(8'hac)) ? $unsigned(wire23) : wire17[(1'h1):(1'h1)]),
              (+$unsigned(wire19))}));
      reg25 <= wire17;
    end
  assign wire26 = reg25;
  assign wire27 = reg24;
  assign wire28 = wire17;
  assign wire29 = ($signed((((7'h42) ?
                      {wire27,
                          wire23} : {wire23}) - wire23)) ^~ (wire17 || $signed(((wire17 - wire26) >= wire21[(3'h7):(3'h5)]))));
  assign wire30 = (8'ha6);
  assign wire31 = $signed((-wire22[(1'h1):(1'h1)]));
endmodule
