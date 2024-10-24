module top
#(parameter param71 = (((^(!((8'had) ? (8'hb8) : (7'h42)))) & {((-(8'hab)) ~^ ((8'had) ? (8'hb8) : (8'hab)))}) <= ({{{(8'hab), (8'hb0)}}, (((8'hbe) ? (8'hb5) : (8'h9f)) ? {(8'had), (8'ha6)} : ((8'haf) * (7'h43)))} ? {({(8'ha9), (8'hb0)} ? {(8'ha4), (8'hb6)} : ((8'hac) ? (8'ha0) : (7'h44))), {(|(8'hbc)), (8'hbd)}} : (&(+((8'hac) ? (8'hba) : (8'hb5)))))), 
parameter param72 = (param71 > (-(((param71 + param71) ? param71 : param71) ? {(param71 >> param71), (param71 ? param71 : param71)} : ({param71} ^~ param71)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h85):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire4;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire0;
  wire [(2'h3):(1'h0)] wire69;
  wire signed [(5'h12):(1'h0)] wire12;
  wire [(5'h14):(1'h0)] wire11;
  wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire8;
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  assign y = {wire69,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg5,
                 reg6,
                 reg7,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (($signed(wire4[(2'h3):(1'h1)]) ?
              $signed(wire3[(4'hb):(1'h0)]) : $signed($signed(((8'ha7) ?
                  wire4 : wire1)))) ?
          wire3 : $unsigned($unsigned(wire0)));
    end
  always
    @(posedge clk) begin
      reg6 <= $unsigned(((($signed(wire3) ?
              wire3 : wire0[(3'h5):(2'h3)]) < (&(wire3 == wire0))) ?
          (wire3[(4'h9):(1'h1)] ^ (((8'hb5) | wire3) ?
              $unsigned(wire0) : $signed(wire4))) : (reg5 <<< (wire2 && $signed(wire3)))));
      reg7 <= wire0[(1'h0):(1'h0)];
    end
  assign wire8 = (((!$unsigned($signed((8'hae)))) ?
                         reg7[(4'hc):(2'h2)] : wire4) ?
                     (~&wire0) : reg5[(2'h2):(2'h2)]);
  assign wire9 = ($unsigned(({{wire3, wire0}} ?
                         wire0[(1'h1):(1'h0)] : ({wire8, wire4} ?
                             (+wire1) : {wire0}))) ?
                     $unsigned($unsigned(($unsigned(wire4) && wire0[(1'h1):(1'h0)]))) : $signed(wire2[(2'h2):(2'h2)]));
  assign wire10 = wire3;
  assign wire11 = $unsigned((wire10[(4'hd):(4'hb)] ? reg5 : $signed((8'ha3))));
  assign wire12 = {reg7, wire11};
  module13 #() modinst70 (.clk(clk), .wire15(reg6), .y(wire69), .wire18(wire2), .wire16(wire12), .wire14(wire8), .wire17(wire11));
endmodule

module module13  (y, clk, wire18, wire17, wire16, wire15, wire14);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire18;
  input wire [(5'h14):(1'h0)] wire17;
  input wire signed [(5'h12):(1'h0)] wire16;
  input wire signed [(4'h9):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire68;
  wire [(3'h4):(1'h0)] wire67;
  wire [(5'h14):(1'h0)] wire63;
  wire [(5'h15):(1'h0)] wire61;
  wire signed [(5'h15):(1'h0)] wire28;
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(3'h7):(1'h0)] reg65 = (1'h0);
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg27 = (1'h0);
  reg [(5'h15):(1'h0)] reg26 = (1'h0);
  reg [(4'hf):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(3'h6):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg19 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire63,
                 wire61,
                 wire28,
                 reg66,
                 reg65,
                 reg64,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg19 <= $signed(wire15[(4'h9):(1'h1)]);
      if (wire16)
        begin
          reg20 <= wire18[(4'he):(4'hd)];
          if ((+(7'h40)))
            begin
              reg21 <= wire15;
              reg22 <= wire15[(3'h7):(2'h3)];
              reg23 <= $signed((+(wire16 ?
                  $unsigned(reg22) : $unsigned((wire17 ? reg21 : (7'h40))))));
            end
          else
            begin
              reg21 <= $signed($signed(reg22[(1'h1):(1'h1)]));
              reg22 <= $unsigned($unsigned(reg19[(4'h8):(1'h1)]));
              reg23 <= {reg20};
              reg24 <= reg21;
              reg25 <= {wire14[(3'h6):(2'h2)]};
            end
        end
      else
        begin
          reg20 <= (reg20[(2'h2):(1'h1)] ?
              {((^~reg24[(3'h5):(3'h4)]) ?
                      (|$unsigned(wire16)) : {wire16[(4'hc):(1'h1)]})} : ($unsigned($unsigned((&(8'h9c)))) ?
                  reg22[(3'h4):(2'h3)] : wire15));
          reg21 <= $signed((8'hb6));
          if ($unsigned(wire17[(4'he):(4'hd)]))
            begin
              reg22 <= ((8'ha1) & (((!reg23) - (!(wire16 ? reg19 : reg21))) ?
                  {($unsigned(reg25) ?
                          $unsigned(wire14) : ((7'h41) ? wire16 : wire14)),
                      ($unsigned(reg20) ?
                          $unsigned(wire14) : reg23[(2'h3):(2'h2)])} : wire14));
            end
          else
            begin
              reg22 <= reg24;
              reg23 <= $signed((~^$unsigned((~|(wire14 ? reg23 : reg24)))));
              reg24 <= $signed((($signed($signed(wire17)) * (reg25 >> reg21[(3'h4):(1'h1)])) ?
                  (+($unsigned(reg19) + wire15)) : ((|{reg24,
                      reg24}) << (reg24 == ((7'h42) <= wire14)))));
            end
          reg25 <= reg19;
          reg26 <= ($signed((reg21[(3'h5):(3'h5)] - (!(reg24 ?
              reg19 : reg24)))) > reg19[(3'h4):(1'h1)]);
        end
      reg27 <= (~$unsigned($unsigned($signed($unsigned(reg22)))));
    end
  assign wire28 = {reg19, $unsigned((~&wire17))};
  module29 #() modinst62 (.wire30(wire18), .wire31(reg19), .wire32(wire14), .clk(clk), .wire33(reg25), .y(wire61));
  assign wire63 = wire18[(5'h10):(4'hf)];
  always
    @(posedge clk) begin
      reg64 <= $unsigned((|({reg27} <= $unsigned($unsigned(wire18)))));
      reg65 <= reg23[(3'h6):(2'h3)];
      reg66 <= (reg22[(2'h3):(1'h0)] ?
          reg27 : (~$unsigned(reg23[(3'h5):(1'h1)])));
    end
  assign wire67 = $signed((!{(8'hb1), (reg25 ? (~^wire16) : (^~(8'h9f)))}));
  assign wire68 = (+((^(-$signed(wire63))) ?
                      $unsigned({$unsigned((8'ha7)),
                          (reg21 ? reg66 : reg24)}) : ((|reg65) ?
                          wire14 : wire18[(4'hb):(1'h0)])));
endmodule

module module29  (y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h13a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire33;
  input wire signed [(4'hd):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire31;
  input wire signed [(5'h12):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire signed [(5'h10):(1'h0)] wire38;
  wire signed [(4'hf):(1'h0)] wire37;
  wire [(3'h7):(1'h0)] wire36;
  wire [(5'h11):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  reg [(4'he):(1'h0)] reg60 = (1'h0);
  reg [(3'h5):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg54 = (1'h0);
  reg [(4'h8):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(5'h12):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg [(3'h5):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg41 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 (1'h0)};
  assign wire34 = $signed(wire32);
  assign wire35 = (((wire32[(1'h1):(1'h1)] ?
                      (wire32 == wire30) : wire34) <= (wire30 ?
                      wire34[(3'h4):(2'h3)] : (~$signed(wire33)))) * wire33[(3'h5):(2'h2)]);
  assign wire36 = (&$unsigned($signed(({wire32, wire30} || wire31))));
  assign wire37 = {$unsigned($signed(({wire33} << {wire30})))};
  assign wire38 = ($signed(wire37) || {wire36[(3'h4):(2'h3)],
                      wire33[(4'ha):(3'h6)]});
  assign wire39 = wire37[(1'h1):(1'h0)];
  assign wire40 = $unsigned((8'ha9));
  always
    @(posedge clk) begin
      reg41 <= $signed($signed((wire36 ? (8'haa) : {$unsigned((8'ha0))})));
      if ((~((($unsigned(wire34) > (|wire34)) ?
          wire39[(2'h2):(1'h1)] : reg41) > $signed(wire34[(4'h8):(2'h3)]))))
        begin
          if ({wire37[(4'h8):(2'h3)],
              (($unsigned(wire34) ?
                  (~&$unsigned((8'hb3))) : (~|(!wire35))) ^ wire35[(4'h9):(2'h3)])})
            begin
              reg42 <= $unsigned({wire34[(3'h6):(3'h6)], $signed(wire39)});
            end
          else
            begin
              reg42 <= $unsigned((~^(&$unsigned(wire36[(2'h3):(1'h0)]))));
            end
        end
      else
        begin
          reg42 <= $unsigned((~wire31));
          reg43 <= (&$unsigned((((wire32 <<< wire36) >>> (wire37 == wire36)) ?
              wire32 : {$signed((8'hb8)), (wire38 >> wire31)})));
          reg44 <= {$unsigned(($unsigned((|wire30)) >> $unsigned($signed(wire37)))),
              (wire39[(1'h1):(1'h0)] << $unsigned({$unsigned((8'haa)),
                  wire37[(3'h5):(3'h5)]}))};
          reg45 <= $signed(($signed(wire34) ?
              wire39[(2'h3):(1'h0)] : ($unsigned((~wire38)) ?
                  ((wire36 ? (8'hb3) : wire31) ? wire38 : wire34) : ((wire39 ?
                          wire32 : wire33) ?
                      (|wire31) : (reg42 ? reg41 : wire39)))));
        end
      reg46 <= $unsigned(((((reg43 & wire40) > wire31) <<< ((~|reg45) || $signed(wire33))) < (wire32[(4'hd):(3'h7)] ?
          $signed($signed(reg45)) : ($signed(wire31) >> (8'ha9)))));
    end
  always
    @(posedge clk) begin
      reg47 <= (8'ha4);
      if ($unsigned(($unsigned(((^reg47) ?
              (wire40 < reg41) : {wire30, wire40})) ?
          $signed((8'h9d)) : ((8'ha8) ~^ ({reg43, reg43} ?
              (wire34 ? wire30 : reg45) : (^reg42))))))
        begin
          if ((wire36[(3'h6):(1'h0)] ?
              $unsigned(wire37[(2'h3):(1'h1)]) : wire33))
            begin
              reg48 <= ({{(~$unsigned(wire34)), (~&$unsigned(reg47))},
                  $signed(((wire38 + (8'haa)) ?
                      (wire35 ?
                          reg44 : wire34) : $signed(reg41)))} != ((8'hbf) + (~$signed((+reg47)))));
              reg49 <= $signed((wire39 ?
                  $unsigned($signed($signed(reg48))) : $signed(reg41[(3'h4):(2'h2)])));
            end
          else
            begin
              reg48 <= reg45[(2'h3):(2'h3)];
            end
        end
      else
        begin
          reg48 <= wire40;
          if (wire36[(3'h7):(3'h4)])
            begin
              reg49 <= reg44[(2'h3):(1'h0)];
              reg50 <= wire30;
              reg51 <= (wire38[(4'ha):(3'h6)] ?
                  reg47 : (~$signed(((reg47 >> wire36) ^~ (8'hb3)))));
            end
          else
            begin
              reg49 <= wire36;
              reg50 <= (~reg51[(4'h8):(2'h2)]);
              reg51 <= wire36;
              reg52 <= (7'h42);
              reg53 <= ((wire40 ?
                  (|$signed({wire39})) : (wire30 ~^ wire36)) ~^ reg44[(3'h4):(1'h0)]);
            end
          reg54 <= (|$unsigned((!wire33[(4'h8):(4'h8)])));
          if (reg54)
            begin
              reg55 <= reg49;
              reg56 <= {$unsigned((+reg45))};
              reg57 <= (wire38 ?
                  $signed($signed(reg50[(1'h0):(1'h0)])) : (8'hb5));
              reg58 <= $signed($unsigned($unsigned({(wire36 ?
                      reg52 : reg50)})));
              reg59 <= (-($unsigned($unsigned((8'hae))) ?
                  $signed($signed($signed(reg57))) : $unsigned(wire33)));
            end
          else
            begin
              reg55 <= {reg50[(2'h3):(2'h3)]};
              reg56 <= reg57;
              reg57 <= reg51;
              reg58 <= {({$unsigned(((8'ha9) ^ wire39))} ?
                      $unsigned($unsigned($unsigned(reg54))) : reg52[(3'h7):(2'h2)]),
                  {reg59}};
            end
          reg60 <= reg57;
        end
    end
endmodule
