module top
#(parameter param65 = ((!(((-(8'hac)) | ((8'hb3) >= (8'hba))) ? ((^(8'had)) ? (&(8'ha0)) : ((8'hbb) ? (8'haf) : (8'hb5))) : (8'haa))) >> (((~^((8'hbe) < (8'h9e))) << (!(+(8'hbf)))) & ((+((8'hb2) ? (8'hb0) : (7'h42))) ? ((^(8'hb2)) ? ((8'hb0) < (7'h44)) : {(8'hab), (8'hba)}) : (((8'ha7) ? (8'ha2) : (7'h44)) ? ((8'hab) ? (8'haa) : (8'hae)) : {(8'hbd)})))), 
parameter param66 = ((({param65, (param65 < param65)} ? param65 : ((8'had) ? {param65, param65} : (param65 || (8'hb1)))) ? param65 : ({(8'hbe)} ? param65 : param65)) ? (^(~^((param65 ? param65 : param65) ? (|param65) : (param65 ? param65 : param65)))) : (param65 >> ((8'hb0) ? {(~param65)} : ((param65 ? param65 : (8'hab)) != (param65 ? param65 : param65))))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire4;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire signed [(4'hf):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire signed [(4'he):(1'h0)] wire28;
  wire signed [(5'h10):(1'h0)] wire7;
  wire signed [(2'h3):(1'h0)] wire6;
  wire [(5'h13):(1'h0)] wire5;
  wire [(4'hd):(1'h0)] wire30;
  wire [(3'h5):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire32;
  wire signed [(4'he):(1'h0)] wire35;
  wire signed [(2'h2):(1'h0)] wire36;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire38;
  wire [(5'h10):(1'h0)] wire39;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(5'h11):(1'h0)] wire41;
  wire signed [(4'he):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire61;
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg33 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire28,
                 wire7,
                 wire6,
                 wire5,
                 wire30,
                 wire31,
                 wire32,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire39,
                 wire40,
                 wire41,
                 wire43,
                 wire61,
                 reg42,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire5 = $unsigned(($unsigned($unsigned((!wire0))) ?
                     $signed(wire1) : $signed(((8'hac) ?
                         ((8'hbe) ? wire0 : wire3) : (wire0 & (8'haf))))));
  assign wire6 = $signed($signed(wire5[(1'h0):(1'h0)]));
  assign wire7 = $unsigned({$unsigned({wire0[(3'h4):(1'h1)]}), wire6});
  module8 #() modinst29 (wire28, clk, wire3, wire7, wire0, wire2, wire1);
  assign wire30 = {(wire3[(3'h7):(3'h7)] ?
                          {wire4} : $signed($signed((!wire0))))};
  assign wire31 = ((!$signed($unsigned($unsigned((8'ha5))))) ?
                      $unsigned(($signed((&wire2)) ?
                          wire3[(5'h10):(4'hd)] : (-(wire28 * wire7)))) : wire30[(3'h5):(2'h2)]);
  assign wire32 = wire28;
  always
    @(posedge clk) begin
      reg33 <= {(wire6[(2'h3):(2'h2)] ? $signed(wire0) : wire4[(4'h8):(3'h4)]),
          wire1[(1'h1):(1'h0)]};
      reg34 <= wire1[(2'h2):(2'h2)];
    end
  assign wire35 = $unsigned(({wire31[(3'h5):(3'h4)],
                      (wire5 ?
                          (wire6 && wire1) : wire2[(3'h5):(3'h5)])} + $unsigned((wire0[(4'h9):(3'h4)] != wire4[(3'h7):(2'h3)]))));
  assign wire36 = (8'h9f);
  assign wire37 = ($unsigned($unsigned((~&(|(8'hae))))) ^~ ((!$unsigned(wire2)) ?
                      $unsigned(wire1[(3'h5):(1'h1)]) : {$signed(reg34[(2'h2):(1'h1)])}));
  assign wire38 = $unsigned($signed($unsigned({(8'hb8), {wire31}})));
  assign wire39 = (wire37[(2'h2):(1'h0)] ?
                      $signed((~^{$unsigned(wire3)})) : (wire6[(2'h2):(1'h1)] ?
                          wire7 : wire1));
  assign wire40 = $unsigned((&wire39[(4'hc):(1'h1)]));
  assign wire41 = {{wire0}};
  always
    @(posedge clk) begin
      reg42 <= $unsigned(wire41);
    end
  assign wire43 = (($signed(((^~wire5) ?
                          (wire37 + reg33) : ((8'hba) ? wire35 : wire1))) ?
                      $unsigned(wire40) : ({wire2[(3'h4):(3'h4)],
                          (8'ha9)} ^~ ((wire4 - (8'hac)) ^~ wire38[(1'h1):(1'h0)]))) >>> (($signed((8'hb0)) - $signed($signed(wire39))) ?
                      $unsigned($unsigned(reg42[(3'h5):(2'h2)])) : ($unsigned((wire31 ?
                              reg34 : wire32)) ?
                          $signed($unsigned(wire28)) : ($signed(wire5) ?
                              wire4[(3'h7):(2'h3)] : wire32[(2'h3):(1'h1)]))));
  module44 #() modinst62 (wire61, clk, wire39, wire28, wire32, wire38, wire2);
  assign wire63 = $signed($signed(((wire32[(4'he):(3'h5)] >>> (~wire39)) ?
                      wire36 : (-{wire61, wire2}))));
  assign wire64 = ({((wire38[(3'h5):(1'h1)] >> $signed(wire63)) ?
                          wire32[(4'h9):(3'h7)] : $unsigned($unsigned(wire6)))} ^ wire28[(4'hc):(3'h6)]);
endmodule

module module44
#(parameter param60 = {(({(|(7'h41)), {(8'h9e)}} < {((8'ha8) + (8'hb7)), (&(8'h9d))}) ? (8'ha5) : ({(+(8'ha5))} + (8'hb8)))})
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h6e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire49;
  input wire signed [(4'h8):(1'h0)] wire48;
  input wire [(4'hd):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  input wire signed [(5'h10):(1'h0)] wire45;
  wire [(4'he):(1'h0)] wire59;
  wire [(4'hc):(1'h0)] wire58;
  wire [(4'hb):(1'h0)] wire57;
  wire [(5'h12):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire55;
  wire [(2'h2):(1'h0)] wire54;
  wire [(4'hd):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  assign y = {wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 reg51,
                 reg50,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg50 <= (&wire47[(4'hc):(1'h0)]);
      reg51 <= wire45;
    end
  assign wire52 = (^$unsigned((!wire46[(1'h0):(1'h0)])));
  assign wire53 = {($signed(($unsigned(wire46) ? $signed(wire46) : wire49)) ?
                          ({(8'ha8), $signed((8'hac))} && ($signed(reg50) ?
                              $unsigned(wire47) : ((8'ha2) ?
                                  wire52 : wire47))) : $signed((~&(~^reg50)))),
                      wire48};
  assign wire54 = $unsigned($unsigned((((wire52 ? reg50 : wire45) ~^ (8'ha3)) ?
                      {(wire45 >>> wire52)} : (+(wire47 ? (8'ha9) : wire52)))));
  assign wire55 = ($unsigned(wire48[(2'h3):(2'h2)]) ?
                      (~wire45[(4'hc):(4'ha)]) : (wire47[(4'ha):(3'h5)] >> ($unsigned(reg50) == wire46)));
  assign wire56 = {wire55, $signed((^$unsigned($unsigned(wire48))))};
  assign wire57 = (~(~&(($unsigned(wire45) ^ (wire56 ^~ wire56)) ?
                      reg51[(4'he):(3'h4)] : reg51[(1'h1):(1'h1)])));
  assign wire58 = reg50;
  assign wire59 = {wire57, (8'hb3)};
endmodule

module module8
#(parameter param27 = ((+(^~{(~|(7'h41)), {(8'hbd), (8'hbc)}})) << (!({(-(8'ha5))} ~^ (((8'haa) > (8'hba)) <<< {(8'hb6)})))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'ha5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(5'h10):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(3'h5):(1'h0)] wire10;
  input wire signed [(2'h3):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(5'h12):(1'h0)] wire15;
  wire [(5'h10):(1'h0)] wire14;
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg20 = (1'h0);
  reg [(4'hb):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg18 = (1'h0);
  reg [(5'h11):(1'h0)] reg17 = (1'h0);
  reg [(4'ha):(1'h0)] reg16 = (1'h0);
  assign y = {wire26,
                 wire15,
                 wire14,
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
  assign wire14 = ($signed((~^(&$unsigned(wire9)))) < (-(wire10 ^ $signed(wire11[(3'h7):(3'h4)]))));
  assign wire15 = $signed({(wire9 ? wire14[(4'hb):(4'h8)] : wire9)});
  always
    @(posedge clk) begin
      reg16 <= $unsigned(wire14[(4'hc):(1'h1)]);
      if ($signed((({(+wire13), (+(8'hbf))} << {{wire9}}) ?
          (((wire9 ? reg16 : wire10) ?
              (wire10 + wire10) : $unsigned(wire15)) << ($signed(wire14) ^ $unsigned(wire11))) : $signed(($signed((8'h9f)) ?
              wire9 : wire12[(4'hf):(1'h0)])))))
        begin
          reg17 <= $signed({(wire15 ? (8'ha7) : wire10),
              {((wire13 <<< (8'hb7)) ?
                      $unsigned(wire14) : (wire13 ? (7'h42) : wire11)),
                  reg16}});
          reg18 <= $unsigned($signed(wire10[(1'h1):(1'h1)]));
          if ((~&(!$unsigned({wire15, {wire12, wire12}}))))
            begin
              reg19 <= $signed((wire11[(3'h6):(2'h3)] ?
                  ({{wire13}} && (^~{(8'h9e)})) : $unsigned((reg17 || $signed(reg16)))));
              reg20 <= wire12[(1'h1):(1'h1)];
              reg21 <= ((^($unsigned({reg19, wire14}) ?
                      $signed((~wire12)) : wire12)) ?
                  wire9[(1'h0):(1'h0)] : (((wire14[(4'ha):(2'h3)] > (7'h40)) ?
                          ((wire9 ?
                              wire15 : (8'hb6)) - (reg17 >= wire10)) : (wire9[(1'h0):(1'h0)] << reg17[(5'h11):(5'h10)])) ?
                      $unsigned(wire13[(3'h4):(2'h3)]) : (&((reg19 ^~ wire9) > (reg17 - reg19)))));
              reg22 <= (~&wire11[(2'h2):(1'h1)]);
              reg23 <= ($unsigned({(8'haf)}) ?
                  ($unsigned($unsigned(wire12[(4'hd):(3'h4)])) ?
                      $unsigned($unsigned((reg19 ?
                          reg21 : wire14))) : wire12[(3'h6):(2'h2)]) : $signed((^{wire10[(2'h2):(1'h1)],
                      reg18[(3'h6):(3'h6)]})));
            end
          else
            begin
              reg19 <= (($unsigned(((wire9 ?
                          (7'h44) : reg21) <= (wire11 & (8'hb6)))) ?
                      (($unsigned(wire15) < (wire13 <= reg17)) - ({reg20} | reg20)) : wire9) ?
                  reg21 : ((wire10[(1'h0):(1'h0)] ?
                          ((8'hb8) || ((8'hba) || reg18)) : (+$unsigned(reg21))) ?
                      $unsigned((^~$unsigned(wire12))) : $signed((^(reg17 & reg21)))));
              reg20 <= (($unsigned(($unsigned(wire12) ?
                      (reg21 ? wire9 : reg17) : {wire9})) < ((-reg16) ?
                      ($signed((8'hbf)) ?
                          {reg20} : (reg18 != (8'haa))) : ($unsigned(reg22) ?
                          (wire11 ? (8'ha4) : (8'hae)) : {reg22, wire12}))) ?
                  ($signed(reg16[(2'h3):(1'h1)]) >= reg19[(2'h3):(1'h0)]) : reg21);
              reg21 <= (((reg18 >>> {reg18[(4'hc):(3'h4)]}) ?
                      (|((wire12 ? wire14 : wire15) ?
                          (reg23 ^~ wire9) : wire13[(5'h10):(4'h9)])) : (^~wire9[(1'h1):(1'h1)])) ?
                  reg18 : (8'hac));
              reg22 <= wire9;
            end
        end
      else
        begin
          reg17 <= {wire9[(1'h0):(1'h0)]};
        end
      reg24 <= (&$unsigned((($signed(wire15) + wire10) ?
          (~$signed(reg19)) : reg19[(4'h8):(1'h1)])));
      reg25 <= reg19;
    end
  assign wire26 = ($unsigned((reg24[(3'h6):(2'h2)] ?
                      ((wire12 ?
                          reg16 : (8'hae)) && $signed(wire9)) : $signed(reg19))) || (!$unsigned((+$unsigned((8'had))))));
endmodule
