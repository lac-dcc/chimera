module top
#(parameter param88 = ((^~{((!(8'haf)) ? (^(8'h9e)) : ((8'hbf) <<< (8'ha2)))}) || ({(((8'haa) ? (8'haf) : (8'ha8)) != {(8'hac)}), {((8'hbd) ? (8'hb3) : (7'h42))}} < ((((8'ha2) | (8'ha8)) + (-(8'hbc))) < ((!(7'h40)) || (~&(8'hab)))))), 
parameter param89 = param88)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h16d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire87;
  wire [(3'h7):(1'h0)] wire86;
  wire signed [(5'h12):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire68;
  wire [(5'h13):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire66;
  wire signed [(4'hc):(1'h0)] wire56;
  reg signed [(4'he):(1'h0)] reg84 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(5'h10):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg80 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(5'h11):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(3'h4):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg69 = (1'h0);
  reg [(5'h15):(1'h0)] reg65 = (1'h0);
  reg [(3'h4):(1'h0)] reg64 = (1'h0);
  reg [(3'h6):(1'h0)] reg63 = (1'h0);
  reg [(3'h4):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg59 = (1'h0);
  reg [(5'h12):(1'h0)] reg58 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire68,
                 wire67,
                 wire66,
                 wire56,
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
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 (1'h0)};
  module5 #() modinst57 (wire56, clk, wire1, wire0, wire2, wire3, wire4);
  always
    @(posedge clk) begin
      reg58 <= wire0[(1'h1):(1'h1)];
      reg59 <= wire56[(3'h6):(2'h3)];
      reg60 <= wire3;
      reg61 <= ($unsigned({wire0[(4'ha):(4'ha)],
          $signed((wire56 ?
              wire4 : wire1))}) < (^(-$unsigned($signed(reg60)))));
      if ($signed(wire3))
        begin
          reg62 <= reg60[(2'h3):(2'h2)];
          reg63 <= $signed($unsigned(((~^wire2[(1'h0):(1'h0)]) & (~((8'ha4) ?
              wire1 : wire3)))));
          reg64 <= ((~|$signed((~|$unsigned(reg61)))) ?
              {(wire1[(5'h14):(4'he)] - $signed((reg62 ? wire4 : wire56))),
                  ($unsigned($signed(reg60)) ^~ (reg59[(2'h2):(1'h1)] << (wire0 * reg60)))} : ((((~|wire2) ?
                          wire0[(1'h0):(1'h0)] : $unsigned(wire3)) ?
                      ({reg61} ? (^reg59) : (wire0 >> reg63)) : reg59) ?
                  wire56 : (reg62 ?
                      (~&wire1[(4'he):(4'hd)]) : $signed({reg58}))));
          reg65 <= ({$signed($signed((~reg63))),
              ({(wire56 != wire4), $signed(wire4)} ?
                  (reg64[(2'h3):(2'h3)] ^~ reg59) : wire1[(5'h13):(4'hc)])} ^ ($signed(wire3) ?
              (8'hb5) : ($unsigned(wire2[(4'h8):(4'h8)]) ?
                  wire2[(5'h12):(2'h2)] : $signed(wire0))));
        end
      else
        begin
          reg62 <= $signed((^(((8'hb1) ?
                  reg58[(5'h12):(4'hf)] : (reg65 ? (8'ha3) : reg61)) ?
              reg61[(4'hf):(3'h4)] : (~|$signed(reg60)))));
          reg63 <= $unsigned($signed($signed({$signed(reg65),
              (reg60 & (8'ha6))})));
          reg64 <= (reg60 ?
              {({$unsigned((8'hab))} < reg60[(2'h2):(1'h0)])} : $unsigned({(reg65 << wire1),
                  $unsigned((wire4 ? (8'haf) : wire56))}));
          reg65 <= wire4;
        end
    end
  assign wire66 = reg59[(4'he):(4'hb)];
  assign wire67 = reg58[(4'ha):(2'h2)];
  assign wire68 = $signed((wire66[(4'hc):(1'h0)] ?
                      ((~^$unsigned(reg64)) ?
                          $signed({wire2}) : {(wire1 ?
                                  wire67 : (8'ha6))}) : (wire4[(4'hc):(3'h6)] ?
                          $signed(wire2[(5'h12):(3'h7)]) : reg60[(4'h8):(3'h7)])));
  always
    @(posedge clk) begin
      reg69 <= ($signed(wire1[(5'h10):(3'h7)]) ?
          (reg58 ^ ((~(reg63 * reg62)) > (&wire1))) : wire1);
      if ((^~(+($signed((reg64 << reg60)) ? reg60 : reg63[(3'h5):(3'h4)]))))
        begin
          reg70 <= (&reg59[(4'ha):(2'h2)]);
          reg71 <= (+(wire0[(1'h1):(1'h1)] ?
              {(|(-reg69)),
                  ((wire66 >= wire2) && $signed((8'hab)))} : $signed($signed(((8'hb6) ?
                  wire1 : wire3)))));
          reg72 <= {wire1[(4'hd):(4'hd)], $unsigned(reg69[(2'h2):(1'h0)])};
        end
      else
        begin
          if (((wire4[(3'h5):(2'h2)] && {(((7'h44) ^~ reg65) + $unsigned(reg62))}) == (!((~$unsigned(wire66)) ?
              reg60 : $signed((~&(8'h9c)))))))
            begin
              reg70 <= (reg70 ? reg63[(2'h3):(1'h1)] : (8'hbb));
              reg71 <= wire66[(5'h14):(1'h0)];
              reg72 <= (8'hb1);
              reg73 <= reg63[(3'h4):(2'h2)];
            end
          else
            begin
              reg70 <= ((reg69 ?
                  reg58 : $signed($signed(reg69[(1'h1):(1'h0)]))) + wire68);
              reg71 <= (reg69[(2'h2):(1'h1)] >>> $unsigned(wire66));
            end
        end
      if ((^reg65[(3'h5):(2'h3)]))
        begin
          reg74 <= ($unsigned((~$signed((wire2 & reg65)))) ^~ ($unsigned($signed($signed(reg60))) ?
              {$unsigned((wire4 ? (8'ha1) : reg65)),
                  $unsigned((reg69 || reg73))} : (~(7'h42))));
          if (((~$signed(((reg73 << wire68) >>> wire67[(3'h7):(1'h0)]))) != $unsigned({{(~^wire0),
                  $signed(reg71)},
              $unsigned({wire1, reg58})})))
            begin
              reg75 <= (~$unsigned(wire1[(5'h12):(3'h5)]));
              reg76 <= (reg61[(1'h1):(1'h0)] != $unsigned(reg62[(1'h0):(1'h0)]));
            end
          else
            begin
              reg75 <= (&(8'ha9));
              reg76 <= wire3;
              reg77 <= $signed(((((wire67 ? wire66 : reg65) > $signed(reg61)) ?
                  $unsigned(reg59) : wire56[(4'hc):(4'hb)]) != (((reg64 ?
                          (7'h41) : reg58) ?
                      $signed(wire1) : (wire56 ? reg72 : reg69)) ?
                  $signed((|reg70)) : (^~$signed(reg63)))));
              reg78 <= ($unsigned((reg77 | {$signed(wire2),
                      $unsigned(reg71)})) ?
                  wire1 : (reg64[(1'h1):(1'h0)] ?
                      $unsigned($signed((-reg65))) : (({reg77} || (!reg58)) ?
                          {$signed(reg59), (8'h9e)} : {$unsigned(reg58),
                              $unsigned(reg69)})));
              reg79 <= (reg61[(4'hc):(1'h0)] ^~ $signed((+((reg63 ?
                  wire1 : (8'hb0)) ^ reg71[(1'h1):(1'h1)]))));
            end
          reg80 <= ((^{reg61,
              (wire4 ? reg72[(1'h1):(1'h1)] : (+reg77))}) < (8'haa));
          if (reg76[(4'hc):(4'hc)])
            begin
              reg81 <= (reg75[(3'h6):(2'h2)] ?
                  (~^$unsigned(($unsigned(reg73) ?
                      (reg60 == (8'hb4)) : $unsigned(wire67)))) : (wire68 ?
                      $unsigned($signed(reg77[(2'h3):(1'h0)])) : wire3[(3'h5):(3'h4)]));
            end
          else
            begin
              reg81 <= (&($unsigned($signed($unsigned(reg61))) ?
                  wire67 : $unsigned(reg73[(1'h0):(1'h0)])));
              reg82 <= {(!((reg77 ? reg79[(4'h8):(2'h3)] : (wire4 != wire0)) ?
                      reg60[(1'h0):(1'h0)] : wire67)),
                  $unsigned($unsigned(({wire4} * (|reg78))))};
              reg83 <= (~^$unsigned($unsigned($unsigned($signed(reg70)))));
            end
          if (reg61)
            begin
              reg84 <= (reg81 ?
                  wire3[(4'h9):(3'h6)] : {wire67[(3'h5):(3'h5)],
                      $unsigned((reg71[(3'h6):(2'h3)] ? wire68 : (&wire0)))});
            end
          else
            begin
              reg84 <= reg58[(3'h5):(3'h5)];
            end
        end
      else
        begin
          if (wire3)
            begin
              reg74 <= ((wire2[(3'h7):(3'h6)] || (($signed(wire2) & $signed((8'hb6))) * {wire4})) ?
                  ((8'hbb) ?
                      (^~wire3) : (($unsigned(reg59) >= {reg76}) ?
                          $signed((reg80 > (8'hbf))) : reg71)) : ((reg72 >> reg63[(3'h6):(3'h5)]) > $signed(wire56[(2'h2):(1'h0)])));
              reg75 <= (wire3[(4'hb):(4'ha)] ^ $unsigned($unsigned(reg59[(1'h0):(1'h0)])));
            end
          else
            begin
              reg74 <= $unsigned($signed(((^(reg84 ?
                  (8'ha7) : reg71)) >> (|reg59[(4'h8):(1'h1)]))));
              reg75 <= $unsigned($unsigned((^~wire4[(2'h3):(2'h2)])));
              reg76 <= {wire67};
              reg77 <= $signed(reg61);
              reg78 <= (~$unsigned(reg64));
            end
          reg79 <= reg81;
          reg80 <= ((~&reg78[(4'hb):(4'ha)]) * $unsigned(((reg74[(1'h0):(1'h0)] ?
              $unsigned(reg60) : reg82[(1'h1):(1'h1)]) != reg80[(4'h9):(1'h0)])));
          reg81 <= (^$unsigned((-$signed({reg74, reg60}))));
          reg82 <= $unsigned(((!(~(^~wire3))) || wire68));
        end
    end
  assign wire85 = ((~|reg69) ?
                      ((reg75 ? reg72 : (8'hac)) ?
                          reg78[(4'hb):(4'h9)] : (reg60[(4'hd):(3'h4)] + {$unsigned(reg65)})) : (~|$signed(reg82)));
  assign wire86 = reg83[(1'h1):(1'h1)];
  assign wire87 = (reg61 | reg76[(1'h1):(1'h0)]);
endmodule

module module5
#(parameter param54 = (((7'h41) ? (({(8'hbc)} <= ((7'h43) ? (8'haf) : (7'h40))) <<< (|((8'hb5) << (8'hb8)))) : ((~((8'ha8) | (8'haa))) < {(~^(8'ha8)), ((8'hb6) ? (8'hb3) : (8'h9d))})) ? {(|(((8'ha7) ? (8'ha5) : (8'h9e)) || {(8'hba), (8'hb4)}))} : ((~&{((8'h9c) ? (8'h9c) : (8'hb5)), (~^(8'hbc))}) ? ((((8'hba) || (8'hbe)) != ((7'h42) ? (7'h41) : (8'hbe))) < {((8'ha6) ? (7'h43) : (8'ha2)), ((8'hb0) ? (8'hb6) : (8'haf))}) : {(((8'ha3) ? (8'had) : (8'ha1)) ? ((8'hba) >= (8'ha9)) : (8'hbe)), {{(8'hb1)}, ((8'ha8) * (8'hbc))}})), 
parameter param55 = (^param54))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'h7b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire10;
  input wire [(5'h12):(1'h0)] wire9;
  input wire signed [(5'h12):(1'h0)] wire8;
  input wire [(4'h8):(1'h0)] wire7;
  input wire [(3'h4):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire [(5'h14):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire46;
  wire signed [(3'h5):(1'h0)] wire15;
  wire signed [(5'h10):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire13;
  wire [(2'h2):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire11;
  reg signed [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire11 = (wire8 == (~$signed(($unsigned(wire6) <<< (-wire8)))));
  assign wire12 = (8'hac);
  assign wire13 = $unsigned($unsigned($signed((wire6[(2'h2):(1'h0)] && ((8'h9d) ?
                      wire6 : wire10)))));
  assign wire14 = $signed((-$unsigned((wire9 << (~wire13)))));
  assign wire15 = wire13[(1'h0):(1'h0)];
  module16 #() modinst47 (wire46, clk, wire6, wire8, wire10, wire11);
  assign wire48 = (!wire9[(1'h1):(1'h0)]);
  assign wire49 = ((|$signed(($unsigned(wire6) ? wire7 : (^wire15)))) ?
                      wire13 : wire11[(1'h0):(1'h0)]);
  assign wire50 = ((~|((wire48 ? $signed(wire10) : {wire15}) ?
                          (wire13[(2'h2):(2'h2)] >= (wire48 && wire12)) : wire49[(3'h4):(2'h3)])) ?
                      ($unsigned(($unsigned(wire10) ?
                          (^~wire7) : $unsigned((8'haa)))) - {(~|(~|(8'hbe)))}) : wire9);
  always
    @(posedge clk) begin
      reg51 <= $unsigned((8'h9d));
      reg52 <= wire50;
      reg53 <= $unsigned(reg51);
    end
endmodule

module module16
#(parameter param45 = {(~&((-(8'hbb)) ? (((8'hb3) ? (8'hb3) : (7'h43)) ? ((8'ha9) ^ (8'hbe)) : (~^(7'h42))) : (((8'hbe) < (8'hb4)) ? {(7'h43)} : ((8'ha0) ^~ (8'hb4)))))})
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'h111):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  input wire [(4'h8):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(4'hd):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(4'hf):(1'h0)] wire40;
  wire [(4'he):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire38;
  wire signed [(5'h15):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire [(5'h14):(1'h0)] wire35;
  wire [(4'h8):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire22;
  wire [(4'h9):(1'h0)] wire21;
  reg [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg30 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg [(4'he):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire22,
                 wire21,
                 reg42,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire21 = (((^wire20) ? wire17[(3'h4):(2'h3)] : (-$signed((|wire19)))) ?
                      (~^$unsigned($unsigned((wire20 || (8'hb6))))) : ({($unsigned(wire18) >> (wire19 ?
                              wire20 : (8'hbf)))} <<< wire19[(4'hc):(3'h4)]));
  assign wire22 = ((~&wire18[(2'h2):(2'h2)]) ^ $signed(wire19[(4'ha):(4'h9)]));
  always
    @(posedge clk) begin
      reg23 <= ((+wire22[(1'h0):(1'h0)]) ? wire21[(3'h4):(1'h0)] : wire21);
    end
  always
    @(posedge clk) begin
      if (((~(!$unsigned({wire22}))) <= (wire21 ?
          wire18[(1'h1):(1'h0)] : (wire18[(4'h8):(1'h1)] ?
              $signed($signed(reg23)) : {$signed(wire20)}))))
        begin
          reg24 <= wire18[(1'h1):(1'h1)];
          reg25 <= {$unsigned(reg23[(4'he):(3'h5)])};
          if ($signed(((reg25[(4'hb):(3'h4)] | $unsigned($signed(wire20))) ?
              $unsigned($unsigned({wire17})) : $unsigned(wire19))))
            begin
              reg26 <= {(^(wire22[(3'h4):(2'h3)] ?
                      $signed((wire21 ? reg24 : reg25)) : $unsigned({(8'hb2),
                          reg23})))};
              reg27 <= ($signed($unsigned(wire19)) << wire18);
              reg28 <= (^{$signed(($signed(wire19) == (8'hbd)))});
              reg29 <= (7'h42);
            end
          else
            begin
              reg26 <= $signed($unsigned($unsigned({$signed(wire18), reg24})));
              reg27 <= ((wire20[(1'h0):(1'h0)] ?
                  ($signed((reg27 | reg27)) ?
                      $signed((wire17 ?
                          reg28 : wire20)) : (^reg28)) : ($signed({(8'hb0),
                          (8'hb6)}) ?
                      (^~$signed(reg23)) : (+(+reg25)))) >>> (7'h44));
            end
          reg30 <= ({reg29[(3'h7):(3'h5)]} == $unsigned(reg24));
        end
      else
        begin
          reg24 <= (reg28 ?
              $signed(($unsigned(((8'hb0) ? (8'hb3) : reg30)) ?
                  reg30[(4'hb):(3'h7)] : ({wire22,
                      wire19} & {wire21}))) : $signed($unsigned(($signed(reg27) << $signed(reg27)))));
          reg25 <= $signed(reg26[(3'h5):(2'h2)]);
          reg26 <= wire20;
          reg27 <= reg23;
        end
      reg31 <= reg25;
    end
  assign wire32 = $signed(reg27);
  assign wire33 = {reg27};
  assign wire34 = (reg30[(4'hc):(3'h7)] >= $signed($signed(wire18)));
  assign wire35 = (~{{$unsigned((reg30 || reg24)), wire19},
                      $signed($unsigned(((7'h43) >>> wire20)))});
  assign wire36 = reg31[(3'h6):(1'h0)];
  assign wire37 = ($unsigned(({(reg29 ? wire19 : wire35)} ^ reg30)) | {(wire32 ?
                          $unsigned((reg24 ? wire19 : (8'hbd))) : (^~wire20))});
  assign wire38 = $unsigned(wire37);
  assign wire39 = (!$unsigned(wire33[(4'ha):(3'h6)]));
  assign wire40 = (~(({wire35} >> {(wire35 ? reg29 : wire21)}) + reg23));
  assign wire41 = wire19[(4'h8):(3'h7)];
  always
    @(posedge clk) begin
      reg42 <= wire36;
    end
  assign wire43 = (~|(wire20 ?
                      (({reg27, reg26} && (wire40 >= reg28)) >> ((reg28 ?
                          (8'ha4) : (7'h43)) <<< ((8'hb4) ?
                          reg27 : wire35))) : ($signed((wire37 + wire17)) ?
                          $unsigned(reg28[(1'h1):(1'h1)]) : $unsigned($signed(wire39)))));
  assign wire44 = ($signed($unsigned(reg42[(1'h0):(1'h0)])) ?
                      (wire35 + $unsigned(wire19)) : (+(($unsigned(wire38) ?
                              wire34[(4'h8):(2'h2)] : (+reg31)) ?
                          $signed((8'ha7)) : (+$signed(wire33)))));
endmodule
