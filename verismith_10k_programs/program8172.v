module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire0;
  input wire signed [(4'h9):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'he):(1'h0)] wire3;
  wire [(3'h4):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(4'hb):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire42;
  wire signed [(3'h4):(1'h0)] wire76;
  assign y = {wire80, wire79, wire78, wire39, wire41, wire42, wire76, (1'h0)};
  module4 #() modinst40 (wire39, clk, wire2, wire1, wire3, wire0);
  assign wire41 = {(wire2 ?
                          (^~$signed((wire3 ?
                              wire2 : (8'h9d)))) : $unsigned(({wire0} ?
                              (wire2 | wire39) : (wire2 ? wire2 : wire39))))};
  assign wire42 = wire0;
  module43 #() modinst77 (.clk(clk), .wire44(wire42), .y(wire76), .wire46(wire1), .wire48(wire2), .wire45(wire39), .wire47(wire3));
  assign wire78 = {((($signed(wire39) != $unsigned(wire39)) ?
                          (wire76[(2'h2):(2'h2)] - (wire3 ?
                              wire2 : (8'hba))) : wire41) & (|$signed({wire1})))};
  assign wire79 = $unsigned($unsigned($signed((~^(wire78 ? wire3 : wire76)))));
  assign wire80 = wire3[(3'h5):(3'h5)];
endmodule

module module43
#(parameter param74 = (({(&((8'ha1) ? (8'hb8) : (8'hb7))), ({(8'ha3)} ? ((8'hb9) | (8'hbc)) : ((8'ha2) || (7'h40)))} > (~&(~((8'h9d) & (8'hb1))))) >= (8'hb3)), 
parameter param75 = (~param74))
(y, clk, wire48, wire47, wire46, wire45, wire44);
  output wire [(32'h12b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire48;
  input wire [(2'h3):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  input wire [(3'h5):(1'h0)] wire45;
  input wire [(4'hf):(1'h0)] wire44;
  wire signed [(4'hf):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire68;
  wire signed [(5'h13):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire [(5'h13):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire signed [(2'h2):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(5'h11):(1'h0)] wire50;
  wire [(2'h3):(1'h0)] wire49;
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(5'h13):(1'h0)] reg59 = (1'h0);
  reg [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg [(3'h4):(1'h0)] reg55 = (1'h0);
  reg [(3'h5):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire61,
                 wire60,
                 wire50,
                 wire49,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg62,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire49 = $unsigned($signed((^~$unsigned(wire44))));
  assign wire50 = wire48[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if ($unsigned(wire50[(4'h9):(1'h1)]))
        begin
          reg51 <= $unsigned({wire47[(2'h2):(1'h0)]});
          reg52 <= $unsigned($signed($unsigned($signed((+wire50)))));
          reg53 <= reg52[(2'h2):(1'h1)];
          reg54 <= ($signed(($signed(((8'hb2) == wire48)) ^~ {$unsigned(wire49)})) ?
              reg53 : reg53[(4'hb):(4'hb)]);
          if ((~$signed($signed($unsigned({wire49})))))
            begin
              reg55 <= $unsigned((~^wire48));
              reg56 <= (^(!$unsigned((^~$signed(wire46)))));
              reg57 <= (wire49 ?
                  (8'ha5) : ({(+(^(8'ha0)))} - $unsigned((wire45[(3'h5):(1'h0)] == ((8'hb9) ?
                      wire45 : wire47)))));
              reg58 <= (((|{$unsigned(wire50)}) | $unsigned(((-reg52) * wire48))) ?
                  reg56[(1'h1):(1'h0)] : $unsigned($unsigned($signed((reg57 << reg57)))));
              reg59 <= $unsigned(wire47[(1'h0):(1'h0)]);
            end
          else
            begin
              reg55 <= (&((reg53 >>> reg51[(5'h13):(3'h6)]) ?
                  (({wire45} ?
                      (wire49 ?
                          reg56 : reg57) : $unsigned(reg53)) <<< (wire44[(3'h7):(3'h5)] ?
                      reg54 : wire50[(4'ha):(2'h2)])) : {reg53,
                      $unsigned($signed((8'hba)))}));
            end
        end
      else
        begin
          if ((($signed({(reg54 <<< reg52), $unsigned(wire46)}) ?
              (!$unsigned(reg55[(1'h1):(1'h0)])) : wire45) >>> $unsigned((((~^reg58) ?
              (8'hbc) : (reg52 ? reg51 : reg53)) ^~ wire48[(4'hf):(3'h6)]))))
            begin
              reg51 <= reg58[(1'h1):(1'h0)];
              reg52 <= $unsigned(reg56[(4'hd):(3'h6)]);
            end
          else
            begin
              reg51 <= $signed((+reg59[(3'h6):(2'h3)]));
              reg52 <= $signed(reg56[(5'h10):(4'h8)]);
              reg53 <= ((($signed({(7'h43), reg51}) <= wire46) >> reg54) ?
                  $signed($unsigned(wire44)) : reg59);
              reg54 <= ($signed(reg59) > $unsigned($signed(reg55[(2'h3):(2'h2)])));
            end
          reg55 <= $signed((wire50 ? reg54 : reg52));
          reg56 <= reg57;
          reg57 <= ((reg52[(3'h6):(3'h4)] + (|($signed(wire46) ?
              (wire47 ? (8'hba) : wire48) : (reg58 ?
                  (8'hbd) : reg58)))) << ($unsigned((&{wire49, wire50})) ?
              $unsigned((wire50 ?
                  $unsigned(reg57) : $signed(reg51))) : (~(wire50[(5'h10):(3'h4)] ?
                  wire44 : (wire48 || reg56)))));
          reg58 <= ((+(($unsigned(reg55) ? $signed(wire44) : (reg57 == reg54)) ?
                  wire50 : $signed($signed(reg56)))) ?
              ((($signed(reg53) >> $signed(wire49)) ?
                  ((+reg52) ?
                      (reg52 != wire45) : (~&(8'ha5))) : $unsigned($signed((8'ha0)))) ^~ $unsigned($signed((wire44 ?
                  wire48 : wire45)))) : $unsigned(wire46[(2'h3):(1'h0)]));
        end
    end
  assign wire60 = {$unsigned($signed(({reg58, (8'hb5)} < (|reg53))))};
  assign wire61 = (|reg53);
  always
    @(posedge clk) begin
      reg62 <= reg59[(4'h8):(3'h5)];
    end
  assign wire63 = reg62[(1'h0):(1'h0)];
  assign wire64 = wire46[(3'h5):(2'h3)];
  assign wire65 = wire49;
  assign wire66 = $signed((({(wire63 + (8'haf)), (reg53 ? reg62 : (8'ha0))} ?
                      (((7'h43) ~^ (8'h9f)) ?
                          wire48[(1'h0):(1'h0)] : reg56) : $unsigned(((8'hb9) ?
                          reg51 : wire48))) < (&reg56)));
  assign wire67 = $unsigned((^~(reg52[(1'h1):(1'h1)] >> ({reg59} ^~ {(8'hac)}))));
  assign wire68 = ($unsigned(reg59[(4'hf):(3'h7)]) <<< (+wire49[(2'h2):(1'h1)]));
  assign wire69 = ($unsigned($signed($signed({wire44}))) ^~ wire63[(5'h12):(4'hd)]);
  always
    @(posedge clk) begin
      if (wire47)
        begin
          reg70 <= ((wire66[(3'h6):(1'h1)] ?
              (($unsigned(wire66) ?
                  (wire50 != reg55) : reg54) == {(reg62 >= reg51)}) : wire65[(2'h3):(2'h3)]) <<< $unsigned($unsigned({wire46[(3'h6):(3'h4)],
              (^~wire68)})));
          reg71 <= (reg57 - {wire67[(4'h9):(4'h8)], wire64});
          reg72 <= reg53[(4'hb):(2'h3)];
        end
      else
        begin
          reg70 <= wire65;
          reg71 <= reg62[(1'h1):(1'h1)];
          if ($signed((~^(wire63[(4'ha):(3'h7)] != {wire46[(1'h1):(1'h0)]}))))
            begin
              reg72 <= (wire61 != wire65[(2'h3):(2'h2)]);
              reg73 <= (^~((reg54[(1'h0):(1'h0)] ?
                      ((wire67 >>> reg70) ?
                          reg52 : $unsigned(reg71)) : wire69) ?
                  wire68[(4'h8):(2'h3)] : ((wire45[(2'h3):(1'h0)] - $unsigned((8'hab))) | $unsigned((&(8'hbf))))));
            end
          else
            begin
              reg72 <= {$unsigned($unsigned((reg54 ?
                      {wire69, reg73} : reg71)))};
              reg73 <= (~{(reg51 != $unsigned((-wire69)))});
            end
        end
    end
endmodule

module module4
#(parameter param37 = (^((({(8'ha7)} ? {(7'h40)} : ((8'ha0) >>> (8'hb4))) ? ((+(8'ha3)) || ((7'h42) | (8'hbb))) : (~&((8'h9d) - (7'h43)))) >>> (^~(~|((7'h41) || (8'hb7)))))), 
parameter param38 = ({param37, param37} ? param37 : ((((+param37) ? (param37 ? param37 : param37) : (param37 ^ (8'hbc))) ? (param37 ? (+param37) : {param37, param37}) : (~&(param37 ? param37 : param37))) ? (^param37) : param37)))
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h113):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire8;
  input wire signed [(4'h9):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire signed [(3'h6):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire12;
  wire [(4'h9):(1'h0)] wire11;
  wire signed [(2'h3):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  reg signed [(4'he):(1'h0)] reg36 = (1'h0);
  reg [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg14 = (1'h0);
  assign y = {wire31,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 reg30,
                 reg29,
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
                 reg15,
                 reg14,
                 (1'h0)};
  assign wire9 = $unsigned(wire5[(1'h1):(1'h0)]);
  assign wire10 = {wire7[(4'h8):(3'h5)], $unsigned(wire9)};
  assign wire11 = $unsigned((8'haa));
  assign wire12 = {(|wire11), $signed(wire7)};
  assign wire13 = $unsigned($unsigned(((wire5 ?
                      $unsigned(wire12) : wire7) < wire6)));
  always
    @(posedge clk) begin
      if ($unsigned(wire6[(4'h8):(3'h5)]))
        begin
          reg14 <= (wire12 ?
              ($signed(wire6) ?
                  wire9[(1'h1):(1'h0)] : (+$signed({wire12}))) : (+wire9));
          if (wire5)
            begin
              reg15 <= ($unsigned(($signed(((8'h9f) && wire13)) ?
                  {(wire9 ? wire10 : wire10),
                      {wire6, wire5}} : (^~$unsigned(wire12)))) << {wire6});
              reg16 <= reg14;
              reg17 <= $unsigned((reg16[(5'h12):(1'h1)] ?
                  (((-wire12) ?
                      {(8'ha1), wire10} : {wire13,
                          (8'h9e)}) ^~ ((&(8'hb1)) == (~wire13))) : {$signed(wire10),
                      $signed((~|reg14))}));
            end
          else
            begin
              reg15 <= $signed((wire12[(4'hc):(4'ha)] ?
                  wire13[(3'h5):(1'h0)] : wire8));
              reg16 <= wire8;
              reg17 <= reg16[(4'h8):(2'h2)];
              reg18 <= (^(8'ha2));
            end
          reg19 <= $unsigned((|$unsigned($unsigned((reg15 ? reg18 : wire8)))));
          reg20 <= ($signed((reg18[(1'h0):(1'h0)] - (~$signed(wire5)))) ?
              ((&($signed(reg17) ?
                      (wire11 ? wire9 : reg15) : $unsigned(wire10))) ?
                  (8'ha2) : ((&$signed(reg15)) != {reg14,
                      (+reg14)})) : (wire11 ?
                  (wire8 ?
                      (~^$unsigned(reg18)) : (^wire11)) : (($unsigned(reg19) ?
                      $signed(reg19) : ((8'ha4) ?
                          (8'hae) : (8'hbf))) ^ ((8'hbc) >= $unsigned(wire6)))));
        end
      else
        begin
          reg14 <= (^~reg15[(3'h6):(3'h5)]);
          reg15 <= $unsigned({(((reg19 ? reg19 : (7'h40)) ? (7'h44) : {wire8}) ?
                  reg19[(2'h2):(2'h2)] : reg16),
              ($unsigned((wire11 ? reg16 : wire7)) ?
                  $signed((reg19 ? wire5 : wire5)) : (-$signed(reg20)))});
          if ((+$unsigned(wire6)))
            begin
              reg16 <= $unsigned((~^wire5));
            end
          else
            begin
              reg16 <= $signed(wire10);
              reg17 <= (|wire10);
            end
        end
      reg21 <= ((wire11 || $signed($signed((reg14 ?
          reg16 : reg18)))) == (+(reg19[(3'h4):(1'h1)] ?
          ((reg20 * wire12) ?
              (wire10 ? reg15 : (8'h9c)) : wire12) : $signed({wire5}))));
      if (($unsigned(wire9) & reg15[(4'h8):(4'h8)]))
        begin
          if ($unsigned($unsigned(reg18)))
            begin
              reg22 <= $signed(wire10);
              reg23 <= ({{$signed((wire7 >>> (7'h42)))}} ?
                  ($unsigned({(wire12 * (8'hbc))}) ?
                      (&wire12) : {reg20}) : ({($signed((8'hab)) ?
                          $signed(reg19) : $signed(reg18)),
                      ($signed(reg21) >>> (reg15 ?
                          reg15 : (8'hb1)))} ~^ $signed(reg16)));
            end
          else
            begin
              reg22 <= {$signed($unsigned($unsigned(reg21)))};
              reg23 <= (((&(~^reg21)) ?
                  $unsigned(({(8'ha6)} == (!wire12))) : reg18) > wire13[(4'h9):(4'h9)]);
              reg24 <= reg16[(3'h5):(2'h3)];
              reg25 <= $unsigned(reg23[(4'hc):(3'h7)]);
              reg26 <= $signed(((8'hab) ?
                  $signed(({wire7} && $signed(wire7))) : $unsigned(((!reg24) ?
                      wire6[(2'h3):(2'h3)] : {wire6}))));
            end
        end
      else
        begin
          reg22 <= (&($unsigned(wire6[(4'h8):(1'h1)]) || reg21));
          if ($signed(reg17[(3'h6):(2'h2)]))
            begin
              reg23 <= (8'hb9);
              reg24 <= (~reg25[(4'hd):(4'hd)]);
              reg25 <= (reg21 + (-(reg22 & wire6[(2'h3):(1'h1)])));
              reg26 <= $signed(((((^reg24) << $signed(wire13)) ?
                      (~(^~reg26)) : reg20) ?
                  $signed($unsigned((reg25 ?
                      reg22 : (8'h9c)))) : reg14[(2'h3):(2'h2)]));
              reg27 <= wire12[(3'h5):(3'h4)];
            end
          else
            begin
              reg23 <= $signed(wire7[(1'h0):(1'h0)]);
            end
          reg28 <= $signed(reg24[(2'h3):(2'h3)]);
          if ({($signed(((reg16 ^~ reg24) >> (^~wire13))) ?
                  $signed($signed((wire11 <= reg20))) : (~&(|$unsigned(wire11))))})
            begin
              reg29 <= ({wire12[(4'h8):(2'h3)], $signed((8'ha0))} ?
                  ($signed(((reg22 ? wire11 : wire11) ?
                          (&wire6) : reg23[(4'h8):(1'h0)])) ?
                      ($signed((^~reg16)) >>> (^$unsigned((8'ha9)))) : wire12[(3'h7):(2'h3)]) : ($signed(($signed(wire6) ^ reg14[(3'h6):(3'h6)])) < (wire10[(1'h0):(1'h0)] > $signed(reg17))));
            end
          else
            begin
              reg29 <= $signed(reg16);
            end
          reg30 <= $unsigned($signed((reg18[(2'h3):(2'h2)] ?
              (|((8'hb0) ? reg18 : reg21)) : reg26)));
        end
    end
  assign wire31 = (8'haf);
  always
    @(posedge clk) begin
      reg32 <= (reg27 * (~&($unsigned($signed(reg27)) ? wire7 : wire5)));
      reg33 <= (^~($unsigned(($unsigned(reg18) >= (wire5 >>> wire5))) ?
          (($unsigned(reg27) & (|reg20)) ?
              $signed((8'ha0)) : $signed(reg26[(3'h4):(3'h4)])) : (~&{reg20,
              $signed((8'ha5))})));
      reg34 <= (reg16 == reg14[(3'h6):(2'h2)]);
      reg35 <= wire5[(1'h1):(1'h0)];
      reg36 <= wire7[(1'h1):(1'h1)];
    end
endmodule
