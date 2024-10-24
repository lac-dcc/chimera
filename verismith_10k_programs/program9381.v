module top
#(parameter param88 = (((~^(((8'hab) ? (7'h41) : (8'ha6)) ? (8'haa) : ((8'ha7) != (8'ha9)))) & (((^~(8'ha4)) ? ((8'hb1) ? (8'had) : (8'hbb)) : {(8'hbd), (8'hab)}) & (((8'h9e) ? (8'ha9) : (8'ha1)) == ((8'had) && (8'h9e))))) ? (((((8'ha9) ? (8'hbf) : (8'hbd)) <<< {(7'h41), (8'h9f)}) ? (((8'hbf) * (8'hb6)) ? {(8'ha6)} : (|(7'h41))) : {((7'h44) + (8'ha0))}) ? ((|{(8'hb7)}) <= (^~((8'hb1) >> (8'hae)))) : (8'hb2)) : (({((8'hb8) ^ (8'hb0))} ? (~|((8'ha8) ~^ (8'hb4))) : (7'h41)) != ((&(|(8'hba))) ? ({(8'had)} == (-(8'hb0))) : (+(&(8'hb0)))))), 
parameter param89 = param88)
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire4;
  wire [(4'hd):(1'h0)] wire87;
  wire [(3'h4):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire76;
  wire signed [(3'h5):(1'h0)] wire75;
  wire signed [(4'h9):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire60;
  wire [(4'h8):(1'h0)] wire59;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire6;
  wire signed [(4'hc):(1'h0)] wire40;
  wire [(5'h13):(1'h0)] wire42;
  wire [(4'hc):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire57;
  reg [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(4'hc):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'hd):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg [(4'hc):(1'h0)] reg78 = (1'h0);
  reg [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg7 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire76,
                 wire75,
                 wire73,
                 wire60,
                 wire59,
                 wire5,
                 wire6,
                 wire40,
                 wire42,
                 wire43,
                 wire44,
                 wire45,
                 wire57,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg7,
                 (1'h0)};
  assign wire5 = (wire0[(2'h3):(1'h0)] | $signed(($signed({wire0}) ?
                     (&(!(7'h42))) : (-wire4))));
  assign wire6 = wire3;
  always
    @(posedge clk) begin
      reg7 <= wire2[(1'h1):(1'h0)];
    end
  module8 #() modinst41 (wire40, clk, wire2, wire1, wire4, wire0, reg7);
  assign wire42 = $unsigned((~(|{wire40})));
  assign wire43 = $unsigned(wire5);
  assign wire44 = {({$unsigned((+wire6)), $unsigned($unsigned(wire6))} ?
                          {(((7'h43) ? wire5 : wire42) > (wire40 | (8'hab))),
                              ($signed(wire43) ?
                                  wire40[(4'hb):(4'ha)] : $signed(wire1))} : $signed((8'ha5))),
                      (-(8'h9c))};
  assign wire45 = $unsigned($signed(wire2));
  module46 #() modinst58 (.clk(clk), .wire47(wire4), .wire51(wire3), .wire48(wire43), .y(wire57), .wire50(wire0), .wire49(wire5));
  assign wire59 = {(wire4 ?
                          $unsigned($signed({wire45})) : (^{$signed(wire44),
                              {wire44, wire42}}))};
  assign wire60 = {$unsigned($signed((&$unsigned(wire44)))), (!wire44)};
  module61 #() modinst74 (wire73, clk, wire42, wire60, wire3, wire1);
  assign wire75 = $signed($signed((wire40[(4'hc):(1'h1)] | (wire57 ?
                      (8'hac) : (&wire57)))));
  assign wire76 = (8'h9d);
  always
    @(posedge clk) begin
      reg77 <= (8'hb7);
      reg78 <= $signed(({(~^((8'ha8) * reg77))} ?
          wire75[(1'h1):(1'h1)] : wire3));
      reg79 <= (wire73[(4'h9):(4'h9)] ?
          wire60[(1'h1):(1'h1)] : reg7[(4'ha):(3'h7)]);
      reg80 <= ((reg78[(4'h8):(2'h3)] ?
              ((&wire5) ?
                  (~&{reg78}) : ($signed(reg79) << (wire75 ?
                      reg7 : reg78))) : {(&{wire5})}) ?
          {$signed(({(8'ha7)} ? wire1[(3'h7):(3'h4)] : ((8'hae) >= wire0))),
              $signed((~^(wire43 << reg79)))} : wire60);
    end
  always
    @(posedge clk) begin
      if (((~&$unsigned((reg78[(3'h5):(3'h5)] - (wire1 ? (8'ha1) : wire45)))) ?
          (&(-(~^{(8'hbd)}))) : ((~($unsigned(wire42) * {wire40,
              (8'h9e)})) && (~wire5[(4'hc):(4'ha)]))))
        begin
          reg81 <= {(!reg7[(3'h4):(1'h1)])};
          reg82 <= $unsigned(wire4[(4'hf):(4'hd)]);
        end
      else
        begin
          reg81 <= (+((~^{(reg7 != wire0), (8'hb5)}) * wire3));
          reg82 <= wire57[(3'h7):(2'h3)];
        end
      reg83 <= wire1;
      reg84 <= (|wire57);
    end
  assign wire85 = $unsigned((!((^~$unsigned(wire5)) ?
                      ({wire3} ? (!reg77) : (~^(8'ha4))) : ($signed(wire45) ?
                          wire60 : $signed(wire0)))));
  assign wire86 = (~((~|$signed({(8'ha2)})) ?
                      {$signed(wire60[(4'ha):(4'h9)])} : {reg7}));
  assign wire87 = reg84;
endmodule

module module61  (y, clk, wire65, wire64, wire63, wire62);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire65;
  input wire [(4'h8):(1'h0)] wire64;
  input wire [(5'h10):(1'h0)] wire63;
  input wire [(5'h12):(1'h0)] wire62;
  wire [(5'h10):(1'h0)] wire72;
  wire [(3'h6):(1'h0)] wire71;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(3'h5):(1'h0)] wire69;
  wire [(4'he):(1'h0)] wire68;
  wire signed [(4'hf):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  assign y = {wire72, wire71, wire70, wire69, wire68, wire67, wire66, (1'h0)};
  assign wire66 = $unsigned((~^{$unsigned((8'hb6))}));
  assign wire67 = (|$unsigned($unsigned((wire65 ~^ wire65[(3'h5):(2'h2)]))));
  assign wire68 = (wire62[(4'hd):(3'h5)] ?
                      (($signed((-wire67)) ?
                              $unsigned((wire63 ?
                                  wire65 : wire66)) : ({wire66} && {wire64,
                                  (7'h42)})) ?
                          wire64[(1'h0):(1'h0)] : (wire63[(1'h0):(1'h0)] ?
                              {(wire62 ? wire67 : wire65),
                                  $unsigned((8'hb7))} : ($signed(wire64) ~^ wire66))) : wire65[(2'h3):(1'h0)]);
  assign wire69 = (^~wire67);
  assign wire70 = $unsigned(wire64[(2'h2):(2'h2)]);
  assign wire71 = (7'h42);
  assign wire72 = (8'hab);
endmodule

module module46
#(parameter param56 = {{(((!(8'hb0)) ? ((8'hba) ? (8'hb9) : (8'ha9)) : ((8'hae) ? (7'h43) : (7'h41))) & {(8'ha9)}), (-(((8'hbd) + (8'ha8)) ? ((8'hbb) + (8'ha3)) : (8'hb4)))}})
(y, clk, wire51, wire50, wire49, wire48, wire47);
  output wire [(32'h2b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire51;
  input wire signed [(3'h5):(1'h0)] wire50;
  input wire signed [(4'hf):(1'h0)] wire49;
  input wire signed [(4'hc):(1'h0)] wire48;
  input wire signed [(5'h14):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire55;
  wire signed [(5'h15):(1'h0)] wire54;
  wire signed [(3'h5):(1'h0)] wire53;
  wire signed [(4'hb):(1'h0)] wire52;
  assign y = {wire55, wire54, wire53, wire52, (1'h0)};
  assign wire52 = $signed(wire49);
  assign wire53 = wire52[(4'hb):(1'h0)];
  assign wire54 = (+(|(-(7'h41))));
  assign wire55 = $signed(($unsigned(wire54) ?
                      $unsigned(({(8'h9c)} && (!wire48))) : $unsigned((^wire51[(4'h9):(3'h4)]))));
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h12d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire13;
  input wire signed [(4'ha):(1'h0)] wire12;
  input wire [(3'h5):(1'h0)] wire11;
  input wire signed [(4'he):(1'h0)] wire10;
  input wire signed [(4'h9):(1'h0)] wire9;
  wire signed [(4'hc):(1'h0)] wire39;
  wire [(3'h7):(1'h0)] wire38;
  wire [(4'h8):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire16;
  wire [(2'h3):(1'h0)] wire15;
  wire [(4'ha):(1'h0)] wire14;
  reg [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg31 = (1'h0);
  reg [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(4'he):(1'h0)] reg28 = (1'h0);
  reg [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg24 = (1'h0);
  reg signed [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg22 = (1'h0);
  reg [(4'hc):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg18 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg17 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire20,
                 wire16,
                 wire15,
                 wire14,
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
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire14 = ((8'hba) ?
                      (wire10[(4'h8):(2'h2)] ?
                          wire13 : (|$signed((wire11 ?
                              wire10 : wire9)))) : wire11[(2'h2):(1'h0)]);
  assign wire15 = ($signed(wire9) > wire13);
  assign wire16 = wire12[(3'h4):(1'h1)];
  always
    @(posedge clk) begin
      reg17 <= wire13;
      reg18 <= (7'h42);
      reg19 <= wire15[(1'h0):(1'h0)];
    end
  assign wire20 = $unsigned(({$unsigned((wire16 < wire16)),
                      ($signed((7'h43)) ?
                          (wire10 ?
                              wire12 : wire10) : (8'hb0))} | ((&(~|wire14)) ?
                      ({wire15,
                          reg19} != $signed((8'ha3))) : $unsigned($unsigned(wire13)))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(($unsigned(reg18[(5'h10):(4'hc)]) ?
          wire12 : (|$unsigned(wire14))))))
        begin
          reg21 <= wire15[(2'h3):(1'h1)];
        end
      else
        begin
          if ($unsigned(wire10[(3'h5):(2'h3)]))
            begin
              reg21 <= (|$signed((wire20 || $signed({reg21, wire13}))));
              reg22 <= (-((&wire9[(3'h6):(3'h5)]) > reg17));
              reg23 <= ((reg19 > $unsigned((~^{(8'ha8), (8'ha1)}))) - (&(reg21 ?
                  ((+wire16) ? reg17 : {wire12}) : ((8'hb7) || {wire13}))));
              reg24 <= (reg18[(4'he):(3'h4)] ?
                  (reg21[(3'h6):(1'h1)] ?
                      $signed(wire11) : (((wire12 * wire14) + (wire12 ?
                          wire20 : wire20)) & $signed($unsigned(reg23)))) : (-($signed(wire20) << (|{reg19}))));
              reg25 <= ((8'h9e) != wire14[(1'h1):(1'h0)]);
            end
          else
            begin
              reg21 <= wire14[(3'h4):(1'h1)];
              reg22 <= wire9;
              reg23 <= wire13[(2'h2):(1'h0)];
            end
        end
      reg26 <= wire16[(3'h4):(1'h0)];
      reg27 <= wire15;
    end
  always
    @(posedge clk) begin
      if ((-{$signed(reg18[(4'h9):(4'h9)])}))
        begin
          reg28 <= reg27[(5'h11):(4'he)];
          reg29 <= wire13[(1'h1):(1'h0)];
          reg30 <= reg26[(3'h6):(3'h5)];
          if ((((wire11[(1'h0):(1'h0)] >= (wire13 || wire20)) ?
                  (+reg22[(2'h2):(1'h0)]) : (^reg23[(3'h7):(3'h4)])) ?
              $signed((!({reg29} >> ((7'h41) == (8'h9f))))) : $signed((!reg27[(1'h0):(1'h0)]))))
            begin
              reg31 <= $signed((($signed((7'h43)) || {(wire11 >> reg22),
                  (wire15 ? wire14 : reg28)}) && reg23[(3'h4):(3'h4)]));
              reg32 <= $signed((wire14 >> {$signed($signed(wire12)),
                  $signed(reg26[(4'ha):(3'h5)])}));
            end
          else
            begin
              reg31 <= wire11;
              reg32 <= (+wire9);
              reg33 <= (7'h42);
              reg34 <= (wire13 ?
                  ((+$unsigned($signed(reg28))) ?
                      $unsigned(wire16) : $unsigned((^~(wire11 ?
                          reg18 : reg25)))) : reg28[(3'h6):(3'h5)]);
              reg35 <= wire9[(2'h3):(1'h0)];
            end
          reg36 <= $unsigned($unsigned(($unsigned((wire15 ^~ reg25)) ^ reg18[(3'h4):(3'h4)])));
        end
      else
        begin
          reg28 <= $signed({(($unsigned((8'hb1)) * wire9[(2'h2):(1'h1)]) | reg19)});
          reg29 <= wire12;
          reg30 <= wire14;
          reg31 <= $signed((reg21[(3'h4):(2'h2)] ?
              $signed($signed((+reg25))) : reg31));
          if ((reg23[(3'h7):(1'h0)] <= wire13))
            begin
              reg32 <= $unsigned($unsigned(((wire13 > wire16[(1'h0):(1'h0)]) ^~ (reg31[(3'h6):(3'h4)] ?
                  (&wire13) : ((7'h40) * reg29)))));
              reg33 <= ((^~(^~$signed($unsigned(reg17)))) || $signed($unsigned(reg24)));
              reg34 <= (reg17 * (|reg29));
            end
          else
            begin
              reg32 <= (($signed((~&$unsigned((8'ha8)))) != reg23) ?
                  wire15[(1'h0):(1'h0)] : reg22[(4'ha):(1'h0)]);
              reg33 <= (~^$unsigned($unsigned({(reg26 ? wire12 : wire15),
                  (+(8'ha2))})));
              reg34 <= wire13[(1'h0):(1'h0)];
              reg35 <= ($signed($unsigned(reg17)) ?
                  reg17[(2'h2):(1'h0)] : (|reg34));
              reg36 <= ($signed(wire14[(2'h3):(1'h0)]) ?
                  reg35[(3'h7):(2'h2)] : $signed($unsigned((-((8'h9e) + reg19)))));
            end
        end
      reg37 <= $unsigned(((reg34[(3'h5):(3'h4)] ?
              $signed((reg24 && reg32)) : reg25) ?
          reg29 : (!(!$unsigned((8'ha8))))));
    end
  assign wire38 = $unsigned((~|(~&$unsigned((reg22 <= (8'ha5))))));
  assign wire39 = {{(|($unsigned(reg37) ? reg25 : (reg22 ? wire13 : reg21)))}};
endmodule
