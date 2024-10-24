module top
#(parameter param74 = (-{({{(8'ha9)}, ((8'hba) + (8'hb6))} < (((8'hab) >> (7'h44)) ? (+(8'ha4)) : ((8'hb4) ? (8'h9e) : (8'hb8)))), (^(8'hac))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h83):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  wire signed [(4'hc):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire5;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(4'hb):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire13;
  wire [(5'h12):(1'h0)] wire14;
  wire signed [(4'ha):(1'h0)] wire72;
  reg [(4'hc):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  assign y = {wire4,
                 wire5,
                 wire6,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire72,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = wire0[(3'h5):(1'h1)];
  assign wire5 = (({(8'hb4), (&wire1)} <= ((|(wire0 || wire0)) ?
                     ((~^wire1) ?
                         ((8'hac) || wire3) : $unsigned(wire0)) : wire4[(3'h4):(2'h3)])) ^ wire4);
  assign wire6 = (($signed(wire3[(2'h3):(2'h3)]) + {{(wire2 >> (8'ha2)),
                             $unsigned((8'ha5))},
                         wire2[(2'h2):(1'h0)]}) ?
                     $unsigned($signed($unsigned((wire5 ?
                         wire5 : wire1)))) : {(8'hba)});
  always
    @(posedge clk) begin
      reg7 <= (((((wire6 ?
                  wire3 : wire1) + wire6) && $unsigned((wire2 || (8'ha8)))) ?
              (~&wire2) : (8'hac)) ?
          ($unsigned($unsigned(wire3[(3'h4):(1'h1)])) ?
              {$signed((8'hae))} : $signed($unsigned($signed((8'hba))))) : wire5);
      reg8 <= wire3[(1'h0):(1'h0)];
    end
  assign wire9 = (((!(wire2[(4'hb):(4'hb)] ?
                         wire1[(1'h0):(1'h0)] : (wire1 ^ reg7))) ?
                     $signed((^(^wire3))) : $unsigned((&wire2))) >>> {wire6[(3'h6):(3'h6)]});
  assign wire10 = wire3;
  assign wire11 = $signed((~&$signed(wire1)));
  assign wire12 = $unsigned((7'h42));
  assign wire13 = reg7;
  assign wire14 = (~&reg7);
  module15 #() modinst73 (.clk(clk), .wire19(wire3), .wire18(wire9), .y(wire72), .wire16(reg8), .wire17(wire0));
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(4'h8):(1'h0)] wire18;
  input wire [(2'h3):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire71;
  wire [(4'hf):(1'h0)] wire70;
  wire [(4'hc):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire [(3'h6):(1'h0)] wire35;
  wire signed [(4'ha):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(4'hb):(1'h0)] wire21;
  wire [(5'h12):(1'h0)] wire20;
  reg signed [(4'h9):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h5):(1'h0)] reg32 = (1'h0);
  reg [(3'h4):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire68,
                 wire37,
                 wire36,
                 wire35,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
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
                 (1'h0)};
  assign wire20 = wire19;
  assign wire21 = (wire18[(1'h1):(1'h0)] * (({(~|wire19)} | ((wire20 ?
                              (7'h43) : wire17) ?
                          (wire17 ^~ wire17) : wire19[(3'h5):(3'h4)])) ?
                      (wire16 ?
                          wire18 : (wire16[(3'h6):(3'h6)] ?
                              (wire16 ?
                                  wire16 : (8'hbf)) : wire16)) : (($signed(wire18) > (wire18 ?
                          wire16 : wire17)) & (wire16 ?
                          ((8'haa) << (7'h44)) : (wire16 > wire16)))));
  assign wire22 = $unsigned($signed(wire16));
  assign wire23 = (~&wire22[(3'h4):(1'h1)]);
  always
    @(posedge clk) begin
      if (wire17[(2'h2):(1'h0)])
        begin
          reg24 <= (7'h44);
        end
      else
        begin
          reg24 <= $unsigned(((wire19 >> (~wire18)) ?
              (((~&(8'hb3)) ? wire21 : wire20) << wire16) : (wire17 ?
                  wire18 : ({wire17, wire16} ?
                      $signed(wire19) : (wire19 <= reg24)))));
          reg25 <= wire18;
        end
      if ($unsigned($signed(((8'ha9) ?
          wire18[(4'h8):(1'h0)] : (wire20 ? wire20 : wire21)))))
        begin
          reg26 <= $signed((wire16 << ((~&$unsigned(wire21)) ?
              wire18 : $signed({wire22}))));
          if ($unsigned(((reg26[(3'h7):(1'h1)] ~^ {(reg26 <<< reg26),
                  (wire21 ? wire20 : reg24)}) ?
              ((~&(8'haf)) ^~ ((!wire19) ?
                  ((8'hbf) ? (8'had) : reg25) : $unsigned(wire20))) : {(wire22 ?
                      $signed((8'h9c)) : wire18[(3'h7):(3'h4)])})))
            begin
              reg27 <= wire19;
              reg28 <= wire18[(1'h1):(1'h0)];
              reg29 <= wire19;
              reg30 <= (wire18 ~^ (+(wire22 ?
                  ((!wire17) ?
                      (-wire23) : $unsigned(wire20)) : $signed((wire16 & wire16)))));
              reg31 <= wire20[(4'hc):(4'h8)];
            end
          else
            begin
              reg27 <= reg28[(4'h8):(1'h1)];
              reg28 <= reg27;
              reg29 <= ({(wire22 == (reg30[(3'h4):(2'h3)] ^ wire23))} ?
                  {reg27, $unsigned($unsigned((8'ha4)))} : wire18);
            end
          reg32 <= (~|(wire22[(3'h7):(3'h4)] != reg28[(1'h1):(1'h1)]));
          reg33 <= ($signed($unsigned((reg27[(2'h2):(1'h1)] ?
              (~&reg24) : $signed(reg27)))) || ($signed((8'h9c)) ?
              $signed(reg26) : (~^((reg24 >> reg26) ~^ wire18))));
          reg34 <= (~^((&$signed($signed(reg27))) ^~ wire20));
        end
      else
        begin
          if ((~&$unsigned($signed(reg34[(4'h9):(2'h3)]))))
            begin
              reg26 <= wire18;
              reg27 <= (&((~|$signed((reg30 ? reg27 : reg31))) ?
                  (-wire22) : $signed((wire19[(4'h8):(1'h0)] ?
                      $signed(wire22) : $signed(wire17)))));
              reg28 <= wire21;
            end
          else
            begin
              reg26 <= (8'hb7);
              reg27 <= $signed($signed((~|(~|(wire22 * reg31)))));
              reg28 <= (~^$unsigned($unsigned((!(reg31 ? (8'hb4) : wire23)))));
              reg29 <= wire16;
              reg30 <= $signed((({{wire16,
                          reg33}} <= $signed($unsigned(wire16))) ?
                  {$signed((reg26 ^ wire20)),
                      wire18} : (^~$signed($signed(wire18)))));
            end
        end
    end
  assign wire35 = (|wire19);
  assign wire36 = reg24;
  assign wire37 = ($unsigned($signed($signed((wire35 ?
                      wire20 : wire36)))) * (^{$signed(wire21), wire23}));
  module38 #() modinst69 (wire68, clk, wire37, wire22, wire21, wire19);
  assign wire70 = ($signed((~$unsigned(reg27[(2'h3):(1'h0)]))) * wire18);
  assign wire71 = $signed((~$signed(wire23[(1'h0):(1'h0)])));
endmodule

module module38  (y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'h15e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h4):(1'h0)] wire42;
  input wire [(4'hb):(1'h0)] wire41;
  input wire [(4'ha):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  wire signed [(5'h11):(1'h0)] wire52;
  wire signed [(3'h7):(1'h0)] wire51;
  wire [(4'he):(1'h0)] wire50;
  wire [(4'hd):(1'h0)] wire45;
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'hb):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h15):(1'h0)] reg62 = (1'h0);
  reg [(4'he):(1'h0)] reg61 = (1'h0);
  reg [(5'h14):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg59 = (1'h0);
  reg [(5'h11):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h11):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(5'h12):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg49 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire45,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg44,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= $signed(wire41[(4'h8):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg44 <= ((($signed($unsigned(reg43)) ?
              ((wire39 >>> wire42) >>> wire42[(1'h1):(1'h1)]) : (&reg43)) << $unsigned(((wire41 << wire40) != $signed(reg43)))) ?
          (^~$signed(((wire39 ?
              reg43 : (8'hae)) > (wire42 <= reg43)))) : wire40[(2'h2):(1'h1)]);
    end
  assign wire45 = (&((wire39[(4'hb):(1'h1)] ?
                          (~|(wire42 <<< wire41)) : ({reg44} ?
                              wire39 : $signed((8'hbc)))) ?
                      $signed((~$signed(wire40))) : ((8'ha3) << (~(wire39 ?
                          (8'hb0) : wire40)))));
  always
    @(posedge clk) begin
      reg46 <= (~&wire40);
      reg47 <= ($unsigned((~wire41[(4'ha):(1'h1)])) ?
          $unsigned(reg46[(4'h8):(1'h1)]) : $signed(reg46[(2'h2):(1'h1)]));
      reg48 <= $unsigned(((8'hae) ?
          wire40[(3'h5):(1'h1)] : ((reg44 ?
              reg43[(3'h7):(1'h1)] : wire41[(4'h9):(2'h3)]) & $unsigned((-reg44)))));
    end
  always
    @(posedge clk) begin
      reg49 <= $signed($unsigned($signed((~wire41))));
    end
  assign wire50 = $unsigned({(8'ha4)});
  assign wire51 = wire42[(1'h0):(1'h0)];
  assign wire52 = reg46;
  always
    @(posedge clk) begin
      if ($signed((wire41 ?
          $unsigned(($unsigned((8'ha9)) < $signed(reg44))) : (!reg47))))
        begin
          reg53 <= {((-($signed(reg47) ^~ wire42)) != (wire40 - wire50)),
              $signed(wire39[(3'h6):(3'h4)])};
          reg54 <= $unsigned(((|reg46[(2'h2):(1'h1)]) ~^ (~&$unsigned($signed(wire41)))));
          reg55 <= wire40[(3'h6):(1'h1)];
          reg56 <= {((wire52 ?
                      ($signed(reg49) ?
                          wire39[(4'hd):(1'h0)] : reg47[(4'h8):(2'h3)]) : ((wire42 >= (8'hb2)) != (~^(8'hb9)))) ?
                  $signed({(!wire40)}) : ($signed($signed(reg48)) && $signed((reg49 ?
                      reg44 : reg47)))),
              ($unsigned(((+wire52) == (wire41 <= wire50))) ?
                  $unsigned(wire50) : (8'hba))};
          reg57 <= ({$unsigned((!$signed((8'ha7)))),
                  (($signed(reg54) ?
                      (wire40 ?
                          reg47 : reg43) : {wire40}) && ($unsigned(reg53) ?
                      $signed(reg47) : {wire39, reg55}))} ?
              {(wire42[(2'h3):(1'h1)] ?
                      (reg48 ?
                          {wire52,
                              reg47} : wire50[(4'he):(4'he)]) : (^$unsigned(wire39)))} : wire50[(3'h7):(3'h6)]);
        end
      else
        begin
          reg53 <= (|$signed(wire41[(4'h8):(3'h4)]));
          reg54 <= ((+reg48) | {{(wire52 ? {wire39} : $unsigned(reg44))},
              reg55[(2'h2):(1'h1)]});
          reg55 <= (&$unsigned(((!$signed(reg44)) * (^~(wire45 <<< reg53)))));
        end
      reg58 <= ((+$unsigned(reg57[(4'ha):(1'h0)])) ?
          (~&$signed((!$unsigned(reg54)))) : $unsigned(reg57[(1'h1):(1'h0)]));
      if ((reg58[(3'h6):(2'h3)] - (8'ha1)))
        begin
          reg59 <= $unsigned((^~(&(wire39 ?
              reg43[(3'h6):(2'h3)] : wire41[(3'h4):(1'h0)]))));
          reg60 <= reg57[(4'h9):(3'h6)];
          reg61 <= reg57;
          if (($signed($unsigned($unsigned((reg60 <<< (8'haf))))) > reg53[(4'ha):(4'h9)]))
            begin
              reg62 <= (($unsigned($unsigned(reg54)) ?
                  {{(8'haa),
                          (wire51 > (8'hbc))}} : $signed(reg53[(4'he):(2'h2)])) >= ((($unsigned(reg48) ?
                      (|(8'hab)) : wire50) < $unsigned(reg59)) ?
                  (8'h9d) : $signed(reg47[(4'h8):(1'h0)])));
              reg63 <= reg61[(3'h7):(2'h2)];
              reg64 <= (+($signed($signed((reg55 << reg61))) > reg53[(4'hd):(4'h8)]));
            end
          else
            begin
              reg62 <= {(~reg49)};
              reg63 <= reg43;
              reg64 <= ($unsigned(((wire45 ? wire51 : (reg44 ~^ reg63)) ?
                  wire41[(4'ha):(4'h8)] : ((8'ha1) ?
                      wire52 : {(8'hba)}))) >= $unsigned(reg60));
              reg65 <= $unsigned($unsigned(reg44));
            end
          reg66 <= (wire40[(2'h2):(1'h1)] || wire39);
        end
      else
        begin
          reg59 <= $signed((-reg56[(2'h2):(1'h1)]));
          reg60 <= (reg44 ? reg58[(4'ha):(2'h3)] : {$unsigned(wire40)});
          reg61 <= (|$signed((^({wire42} ?
              (reg57 ? reg56 : (8'ha4)) : ((8'ha3) ? reg59 : reg46)))));
          reg62 <= ($signed($unsigned(reg66)) ?
              $signed($unsigned(wire41)) : (8'ha0));
        end
      reg67 <= ($unsigned({reg49}) ~^ ((reg55 ?
              {(wire39 ? reg46 : wire41), (|(8'h9c))} : (8'hac)) ?
          reg55[(3'h5):(1'h0)] : reg44));
    end
endmodule
