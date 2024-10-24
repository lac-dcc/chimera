module top
#(parameter param97 = ((8'ha6) * (((8'h9c) || ((+(8'ha1)) || ((8'ha4) - (7'h42)))) ? (({(8'hbe)} >= ((8'hbb) ? (8'hbb) : (8'h9e))) && (+((8'ha4) && (8'hba)))) : {((!(8'hb4)) ? {(8'h9f), (8'hb7)} : ((8'ha4) << (8'hb6)))})))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h2d7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire4;
  wire signed [(4'he):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire6;
  wire [(4'h8):(1'h0)] wire7;
  wire signed [(5'h12):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire13;
  wire signed [(5'h13):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire55;
  wire [(4'h9):(1'h0)] wire56;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire58;
  wire [(5'h10):(1'h0)] wire95;
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(5'h14):(1'h0)] reg59 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg41 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(4'ha):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(3'h5):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(2'h3):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg29 = (1'h0);
  reg [(5'h12):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(4'ha):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg17 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg14 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire24,
                 wire55,
                 wire56,
                 wire57,
                 wire58,
                 wire95,
                 reg60,
                 reg59,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
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
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
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
                 (1'h0)};
  assign wire4 = (~|(wire2 ?
                     $unsigned((wire2[(5'h10):(1'h0)] == ((8'hb0) >> wire0))) : wire0[(2'h2):(1'h0)]));
  assign wire5 = wire3[(2'h2):(2'h2)];
  assign wire6 = {wire1, {(({wire4, wire5} << (wire4 ^~ wire5)) != wire5)}};
  assign wire7 = $unsigned($signed($unsigned(wire3[(3'h4):(1'h0)])));
  assign wire8 = ((wire1 <<< (($unsigned(wire3) ?
                     wire4[(4'h8):(4'h8)] : wire7[(3'h7):(3'h4)]) ^ $unsigned($signed(wire1)))) & $unsigned($unsigned({wire1,
                     (wire6 & wire5)})));
  assign wire9 = (($unsigned(((wire0 ? wire2 : wire5) ?
                     (wire0 <<< wire1) : (wire7 ?
                         (8'ha6) : wire3))) != $unsigned((wire2 ?
                     (wire1 ? (8'ha4) : wire5) : {wire8,
                         wire6}))) + $signed({($signed(wire0) ?
                         $unsigned(wire8) : (~&wire1)),
                     (^(wire1 > wire4))}));
  assign wire10 = wire7;
  assign wire11 = wire7[(4'h8):(1'h1)];
  assign wire12 = (8'h9e);
  assign wire13 = (((8'hba) <= (8'hab)) && (&wire10[(3'h7):(1'h1)]));
  always
    @(posedge clk) begin
      reg14 <= ((~&(wire10[(1'h1):(1'h0)] ?
          {(wire9 ? wire7 : wire12)} : $unsigned({(8'h9c),
              (8'ha6)}))) >>> ((wire7[(1'h0):(1'h0)] && wire11) ?
          {(wire6 ? $signed(wire9) : (wire11 ? wire12 : wire2)),
              (((8'ha7) & wire1) ?
                  wire12[(1'h0):(1'h0)] : $unsigned(wire11))} : wire0));
      reg15 <= ($unsigned((&$unsigned((8'had)))) | ({wire10} | (~|$signed((wire7 >> reg14)))));
      if ($signed((^~(wire13 && {$unsigned(wire7)}))))
        begin
          if ((wire11[(3'h5):(2'h2)] ?
              wire2[(1'h0):(1'h0)] : ((!((wire2 ?
                      reg15 : wire6) < (wire10 > wire9))) ?
                  $unsigned(wire8) : $signed(({reg15} <<< wire12)))))
            begin
              reg16 <= (wire0[(1'h1):(1'h0)] ?
                  (wire1[(1'h0):(1'h0)] ?
                      {$unsigned(wire2[(4'hb):(4'hb)])} : $unsigned(((wire0 ?
                          wire9 : (8'hb2)) || (wire6 & wire7)))) : {$signed({(~|wire7)}),
                      wire8});
              reg17 <= wire3[(1'h1):(1'h0)];
              reg18 <= $signed(reg17);
              reg19 <= $unsigned($unsigned(({(wire3 > reg16), (~&wire3)} ?
                  $signed(reg17) : wire2)));
            end
          else
            begin
              reg16 <= ($signed((8'hbd)) ? reg18 : (&wire11));
              reg17 <= {$unsigned(($unsigned(reg18[(3'h4):(3'h4)]) ?
                      ((wire8 <<< (7'h42)) ^~ (wire0 ?
                          wire1 : reg19)) : $unsigned($signed((8'h9f)))))};
            end
        end
      else
        begin
          reg16 <= $signed(((~$signed({reg16, wire11})) ?
              (|(!(wire11 >>> wire3))) : $signed({reg15})));
          reg17 <= $signed(wire8[(4'h8):(3'h5)]);
          reg18 <= wire2;
          if ($signed(wire13[(2'h2):(2'h2)]))
            begin
              reg19 <= reg18[(2'h2):(1'h1)];
              reg20 <= {{(8'hb6),
                      ($unsigned((8'hb3)) + ($unsigned(reg19) ~^ $signed(wire13)))},
                  wire9[(3'h5):(3'h4)]};
            end
          else
            begin
              reg19 <= {(~&$signed($unsigned($unsigned(wire0)))),
                  ($unsigned(wire8[(4'hb):(3'h4)]) ?
                      (+{(^~wire0)}) : $unsigned((~&wire2)))};
              reg20 <= ($signed(wire10[(3'h4):(3'h4)]) ?
                  wire9[(3'h4):(2'h3)] : wire9[(4'hb):(4'h8)]);
            end
          reg21 <= (wire0 ?
              {$signed(wire2[(4'ha):(4'h8)])} : ((($unsigned(reg15) ?
                          (wire2 ? (8'hbd) : wire6) : (wire6 >= reg16)) ?
                      ($unsigned(wire0) ?
                          $unsigned(wire8) : reg18[(3'h6):(2'h3)]) : $unsigned($unsigned(reg14))) ?
                  (-$signed((wire9 <= reg20))) : $signed((-(^wire3)))));
        end
      reg22 <= $unsigned((-(((reg19 >= wire13) ?
              {reg18, (8'haa)} : $unsigned(wire12)) ?
          reg16 : reg17)));
      reg23 <= ((8'hb6) < (|wire7[(1'h1):(1'h1)]));
    end
  assign wire24 = {$unsigned($unsigned($signed((wire12 ? reg19 : wire0)))),
                      (|wire12[(3'h4):(1'h1)])};
  always
    @(posedge clk) begin
      if (($unsigned((~(8'ha7))) ?
          (wire11[(1'h1):(1'h0)] ? wire3 : wire10[(3'h6):(3'h5)]) : wire24))
        begin
          reg25 <= (&$signed($unsigned(($signed(reg21) != (8'hb6)))));
          reg26 <= wire7;
        end
      else
        begin
          reg25 <= $unsigned((-reg22[(1'h1):(1'h1)]));
          if ((($unsigned((reg23 ? wire13 : (~^wire8))) ?
                  {$unsigned($unsigned(reg25)), $signed((~^reg18))} : reg22) ?
              {(wire9[(3'h4):(1'h0)] <<< $signed($signed(reg23))),
                  $unsigned(((+reg18) ?
                      (reg20 <= reg15) : (~wire10)))} : {reg15[(4'h8):(4'h8)],
                  $signed(reg25[(3'h6):(1'h0)])}))
            begin
              reg26 <= reg18;
              reg27 <= {((wire0 <<< wire9) ?
                      (($signed(wire11) ?
                          $signed(wire4) : $signed(wire5)) >= (8'h9d)) : wire13[(2'h2):(1'h0)])};
              reg28 <= $unsigned(reg26[(3'h7):(3'h6)]);
              reg29 <= $unsigned(wire2[(3'h6):(1'h0)]);
            end
          else
            begin
              reg26 <= (((~^$signed((&reg16))) >>> $unsigned(wire7)) ?
                  $unsigned({reg21[(2'h2):(1'h1)]}) : ({$signed(reg28[(4'ha):(1'h0)]),
                      reg17[(2'h3):(2'h3)]} <= wire12));
              reg27 <= $unsigned(((~$unsigned((reg21 >> wire3))) ^~ reg25));
            end
        end
    end
  always
    @(posedge clk) begin
      reg30 <= $signed((!(reg22[(2'h2):(1'h0)] ?
          (((8'hb4) && wire6) ? (~|wire12) : $unsigned(reg22)) : ({reg29,
                  wire3} ?
              {wire8, wire9} : $signed(wire1)))));
      reg31 <= $signed(($unsigned(reg20[(2'h2):(1'h0)]) ?
          (wire9[(4'hb):(4'hb)] ?
              (!$unsigned(reg20)) : $signed((^~wire9))) : (wire0 < $signed((reg16 ?
              (8'hbd) : (8'hbe))))));
      if (wire3)
        begin
          reg32 <= wire2;
          reg33 <= $unsigned((wire12[(2'h3):(2'h2)] >= {$unsigned(reg23[(2'h2):(1'h1)])}));
          reg34 <= reg18[(1'h1):(1'h0)];
        end
      else
        begin
          reg32 <= reg20;
        end
      reg35 <= $signed((^{reg28}));
      reg36 <= (8'ha9);
    end
  always
    @(posedge clk) begin
      if ($signed(($signed($unsigned((wire13 || (8'haf)))) ^ ((8'ha2) ~^ reg28))))
        begin
          reg37 <= ((!$signed(({reg16} ?
                  (reg28 < (8'had)) : reg23[(1'h0):(1'h0)]))) ?
              ($unsigned((reg21 < (wire3 ?
                  reg22 : reg20))) - reg29) : (reg27[(1'h0):(1'h0)] ?
                  $signed($unsigned({wire2, reg20})) : ((&(reg26 ?
                          reg36 : reg29)) ?
                      {reg22[(1'h0):(1'h0)], ((8'hb9) * reg23)} : (8'haa))));
          reg38 <= $signed(reg22[(3'h6):(3'h6)]);
          if (((reg22 ?
              (reg23 != $unsigned((!reg19))) : reg16) | $unsigned(wire13[(2'h2):(1'h0)])))
            begin
              reg39 <= (wire3 == wire7);
              reg40 <= reg36;
              reg41 <= reg34;
              reg42 <= {$signed($signed((&(8'hb4)))),
                  (($unsigned($signed(reg17)) - {$signed(wire4)}) ?
                      {$signed(reg21[(1'h0):(1'h0)]),
                          wire8} : (reg40 - (wire13 + reg27)))};
            end
          else
            begin
              reg39 <= ((wire3 & (~^$unsigned($signed(wire24)))) ?
                  (reg17 ?
                      (-$signed($signed((8'hbb)))) : ($unsigned($signed(reg17)) ?
                          {reg17[(3'h5):(1'h0)],
                              (reg27 && (8'hb5))} : (^~(|(8'hab))))) : ($unsigned((wire12[(2'h3):(2'h2)] | $signed((8'hbe)))) <= reg36[(4'hb):(2'h3)]));
              reg40 <= (reg32[(2'h2):(1'h0)] ?
                  ($signed(($signed(wire24) | (wire12 ?
                      reg30 : reg20))) ^ $signed((~|$signed(reg37)))) : (~$unsigned(reg36)));
              reg41 <= $unsigned((wire7 < ((~&reg17) & $unsigned($unsigned(reg22)))));
              reg42 <= reg23[(1'h1):(1'h0)];
            end
          reg43 <= reg38;
        end
      else
        begin
          reg37 <= ($signed(((8'ha0) <<< ({reg15} ~^ (wire11 ?
              reg28 : reg37)))) * $signed($unsigned($unsigned((-reg39)))));
          if ({(({$unsigned(reg28)} <<< ((reg26 ^~ reg27) * reg20[(1'h0):(1'h0)])) ^ {wire9[(2'h2):(2'h2)]})})
            begin
              reg38 <= ($signed(reg27[(4'h8):(1'h0)]) ?
                  $signed(wire11[(1'h0):(1'h0)]) : (-reg39[(3'h6):(3'h4)]));
              reg39 <= $unsigned(reg30);
              reg40 <= reg16[(2'h2):(2'h2)];
              reg41 <= wire9;
            end
          else
            begin
              reg38 <= $unsigned((!$signed(reg33)));
              reg39 <= (-wire2);
              reg40 <= $unsigned((reg40[(2'h3):(1'h0)] - {$unsigned($unsigned(reg33)),
                  (~&wire5[(3'h5):(3'h5)])}));
              reg41 <= ((-(wire0 ? wire2 : $unsigned($unsigned(wire4)))) ?
                  wire11[(1'h1):(1'h1)] : (~^((wire5 ^ (!reg26)) ?
                      $unsigned(wire11) : $signed($unsigned(reg26)))));
            end
          reg42 <= $signed((~^(+reg31)));
          if ((+{wire13[(3'h4):(1'h1)]}))
            begin
              reg43 <= $signed($signed($unsigned($signed(wire6[(2'h3):(2'h2)]))));
              reg44 <= {reg26, reg32};
            end
          else
            begin
              reg43 <= ((~|reg15) ~^ {wire6});
              reg44 <= {$signed($signed(reg40)),
                  ((reg41[(1'h1):(1'h0)] ?
                      $signed({reg23}) : $signed(((8'ha6) ?
                          (8'hbd) : (8'haf)))) && wire11[(2'h3):(1'h0)])};
              reg45 <= (($signed(wire9) || reg26) ?
                  (wire5 < ((-$signed((8'hb7))) ?
                      (&wire8) : ((wire0 < wire7) ?
                          $signed(wire1) : (~&(8'ha4))))) : (wire7 ?
                      wire8 : (((wire0 & reg18) != (reg27 ? reg20 : reg29)) ?
                          wire2 : $unsigned({reg38}))));
              reg46 <= wire12[(2'h3):(2'h2)];
              reg47 <= $signed((-$unsigned(wire5[(4'hd):(3'h7)])));
            end
          if (((reg45[(3'h4):(3'h4)] ?
              wire9 : (reg31 << $unsigned((wire24 ?
                  wire3 : wire1)))) & {$unsigned(reg18[(1'h1):(1'h1)]),
              {wire0}}))
            begin
              reg48 <= (({{$signed(wire24)}} ?
                      reg22 : $signed($signed($unsigned(wire7)))) ?
                  $signed((~^$signed((reg25 + reg47)))) : (-({(reg39 ?
                          (8'hb7) : reg27)} != (reg44[(1'h1):(1'h0)] * (reg22 ?
                      wire1 : reg19)))));
              reg49 <= (~wire2);
              reg50 <= reg44[(1'h1):(1'h0)];
              reg51 <= (8'hb0);
            end
          else
            begin
              reg48 <= $unsigned((&{(((8'ha4) ^ reg49) ^ $signed(reg17)),
                  $signed(reg36)}));
              reg49 <= reg20;
              reg50 <= $unsigned(($signed({(reg25 ? reg51 : wire7),
                  (~|wire4)}) * reg26[(3'h5):(1'h1)]));
            end
        end
      reg52 <= reg49[(4'hd):(4'hd)];
      reg53 <= $unsigned(wire11[(3'h4):(3'h4)]);
      reg54 <= $signed((((reg39 + {reg33}) ?
              {{(7'h43)}} : $signed((reg23 >> reg26))) ?
          $unsigned((^(^~reg33))) : reg32));
    end
  assign wire55 = reg30;
  assign wire56 = $unsigned(reg39[(4'ha):(3'h5)]);
  assign wire57 = {reg38, (8'ha5)};
  assign wire58 = reg49;
  always
    @(posedge clk) begin
      reg59 <= $signed(wire8);
      reg60 <= (($unsigned(($signed(wire13) ?
              $signed(reg33) : $unsigned(reg33))) ^~ $unsigned($signed($unsigned(reg53)))) ?
          (-(reg48 ? wire12 : $unsigned((reg36 ? wire5 : reg28)))) : (!{reg23,
              ($unsigned(reg17) ?
                  $unsigned((8'h9e)) : (reg14 ? reg51 : reg19))}));
    end
  module61 #() modinst96 (wire95, clk, reg38, wire4, reg29, wire3, wire55);
endmodule

module module61  (y, clk, wire62, wire63, wire64, wire65, wire66);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire62;
  input wire signed [(2'h3):(1'h0)] wire63;
  input wire [(5'h14):(1'h0)] wire64;
  input wire [(5'h13):(1'h0)] wire65;
  input wire signed [(4'h9):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire93;
  reg [(5'h11):(1'h0)] reg69 = (1'h0);
  reg [(3'h5):(1'h0)] reg70 = (1'h0);
  assign y = {wire67, wire68, wire93, reg69, reg70, (1'h0)};
  assign wire67 = wire64[(2'h2):(2'h2)];
  assign wire68 = wire64;
  always
    @(posedge clk) begin
      reg69 <= ($unsigned(((~wire62[(2'h2):(1'h1)]) <= ((wire66 && wire67) ~^ (^~(8'ha7))))) < wire63[(2'h2):(1'h0)]);
      reg70 <= $signed(($signed(({wire66} > $signed(wire62))) ?
          wire67 : wire63[(2'h2):(1'h0)]));
    end
  module71 #() modinst94 (wire93, clk, wire64, wire68, wire67, reg69);
endmodule

module module71
#(parameter param92 = (8'hba))
(y, clk, wire75, wire74, wire73, wire72);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire75;
  input wire [(4'h9):(1'h0)] wire74;
  input wire signed [(4'h8):(1'h0)] wire73;
  input wire signed [(5'h11):(1'h0)] wire72;
  wire signed [(3'h5):(1'h0)] wire91;
  wire [(5'h10):(1'h0)] wire90;
  wire signed [(5'h15):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(4'hc):(1'h0)] wire87;
  reg signed [(5'h13):(1'h0)] reg86 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg84 = (1'h0);
  reg [(2'h3):(1'h0)] reg83 = (1'h0);
  reg [(3'h7):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg80 = (1'h0);
  reg [(3'h6):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  assign y = {wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if ((-$signed({(~((7'h42) ? wire72 : wire74)), $unsigned(wire74)})))
        begin
          reg76 <= wire72[(4'h8):(3'h6)];
          if (wire75)
            begin
              reg77 <= wire73;
              reg78 <= {reg76[(2'h2):(1'h1)]};
              reg79 <= $unsigned(({{wire74, wire72},
                      ((8'hb0) ? (8'hb3) : wire73)} ?
                  wire72 : {($signed(reg78) == (!reg77))}));
              reg80 <= reg78;
              reg81 <= $signed({reg78});
            end
          else
            begin
              reg77 <= (($signed((&reg76)) ?
                      (({wire74, reg76} ? (reg78 ? (8'hb4) : (8'ha5)) : reg81) ?
                          (&reg80) : $signed(wire74[(2'h3):(1'h1)])) : ((reg76[(1'h0):(1'h0)] ?
                              wire73[(1'h1):(1'h1)] : (&reg80)) ?
                          ((reg79 ?
                              reg80 : reg81) | (!reg76)) : $unsigned((reg81 ?
                              (8'hb2) : reg78)))) ?
                  $unsigned((~^reg79)) : $unsigned(wire72[(5'h10):(4'hf)]));
              reg78 <= $signed((wire73[(1'h0):(1'h0)] ?
                  $signed(($unsigned(wire73) * reg77[(3'h6):(3'h5)])) : $signed({(reg81 >= (8'ha2))})));
              reg79 <= ({{reg79, $unsigned((reg77 & reg78))}} ^~ (8'hb8));
              reg80 <= reg80[(2'h3):(2'h2)];
              reg81 <= wire72;
            end
        end
      else
        begin
          if (reg81[(5'h10):(3'h6)])
            begin
              reg76 <= {$signed(({(reg78 && reg80)} ?
                      reg79[(3'h6):(2'h2)] : ($unsigned(reg78) | (reg80 ?
                          reg76 : wire74))))};
              reg77 <= reg80[(2'h3):(1'h0)];
              reg78 <= ((~({{reg78}, (~|wire72)} >= reg79)) ?
                  $signed(((wire75[(3'h6):(2'h2)] ?
                      {reg81,
                          reg79} : $unsigned(reg77)) + $unsigned((reg81 << reg79)))) : reg77);
              reg79 <= $unsigned($unsigned(($signed({(8'hb4)}) ?
                  ($unsigned(reg76) << wire74[(3'h6):(1'h1)]) : $unsigned(reg81[(4'h9):(2'h2)]))));
              reg80 <= {(^~reg77[(4'hf):(3'h5)]), (~wire72)};
            end
          else
            begin
              reg76 <= (8'hbd);
            end
          reg81 <= ($unsigned((wire75[(2'h2):(1'h0)] ?
                  reg78 : $unsigned(reg78[(4'hc):(3'h6)]))) ?
              reg77 : $signed(wire75[(4'ha):(2'h3)]));
          if ((wire75[(4'he):(4'hb)] ?
              wire75[(3'h4):(3'h4)] : (wire72 << $signed((^reg78)))))
            begin
              reg82 <= (reg78[(3'h7):(2'h3)] ^~ (-(((~^reg79) <= ((8'hb8) || reg77)) || wire72[(4'h8):(3'h5)])));
              reg83 <= (&$signed((^reg78[(1'h0):(1'h0)])));
            end
          else
            begin
              reg82 <= $unsigned((reg82[(3'h7):(3'h5)] ?
                  $unsigned((^wire72[(4'h8):(3'h4)])) : (~|(wire73 * $unsigned((8'hbe))))));
              reg83 <= (8'hbb);
              reg84 <= {reg80};
              reg85 <= (reg81 ?
                  $unsigned(reg80) : ($unsigned(reg78) ^~ ($signed($signed(reg78)) & (|wire72))));
            end
        end
      reg86 <= {{reg76},
          {({(|(8'hb1)), (reg79 ? reg84 : (8'hae))} == $unsigned(((8'hbb) ?
                  reg82 : reg83))),
              $unsigned((-(|(8'h9e))))}};
    end
  assign wire87 = $unsigned(reg81);
  assign wire88 = ($unsigned($signed((~{reg84, wire75}))) ?
                      (-reg80[(5'h14):(4'hc)]) : $unsigned((({wire87, (8'ha5)} ?
                              $signed(reg86) : reg76) ?
                          (|$signed(reg76)) : $signed((7'h41)))));
  assign wire89 = wire75;
  assign wire90 = wire89;
  assign wire91 = $unsigned($unsigned($unsigned(wire89)));
endmodule
