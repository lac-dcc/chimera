module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h13):(1'h0)] wire0;
  wire signed [(4'ha):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire85;
  wire signed [(5'h10):(1'h0)] wire84;
  wire signed [(4'hc):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(3'h4):(1'h0)] wire81;
  wire signed [(4'ha):(1'h0)] wire80;
  wire [(2'h3):(1'h0)] wire79;
  wire [(5'h10):(1'h0)] wire77;
  wire [(3'h5):(1'h0)] wire76;
  wire [(3'h7):(1'h0)] wire75;
  wire [(4'hd):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg78,
                 (1'h0)};
  assign wire4 = (|((!wire0) - $unsigned(($unsigned(wire2) ?
                     wire3 : (~wire2)))));
  assign wire5 = {(wire4 ?
                         $signed($unsigned(((8'hb3) ?
                             wire0 : wire1))) : ((-wire2[(5'h13):(5'h11)]) ?
                             ({(8'hb8)} > $signed(wire4)) : $signed((wire1 + wire0))))};
  assign wire6 = (|{wire2[(4'hd):(3'h5)],
                     (wire3 ?
                         $signed(wire3) : (wire5 * wire3[(5'h14):(1'h0)]))});
  assign wire7 = $unsigned(wire6);
  module8 #() modinst73 (wire72, clk, wire1, wire6, wire2, wire5);
  assign wire74 = wire1[(5'h13):(2'h3)];
  assign wire75 = (wire3 | (&($unsigned($signed(wire3)) >= (|(wire74 >> wire3)))));
  assign wire76 = wire72;
  assign wire77 = wire7[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg78 <= wire77;
    end
  assign wire79 = ((({(|wire74)} ~^ (8'h9f)) ?
                      (~^(8'ha7)) : ($unsigned((wire74 ?
                          wire75 : reg78)) != (~|(wire5 ?
                          wire3 : (8'h9e))))) <= ($signed((+$unsigned(wire1))) ?
                      wire2[(5'h11):(4'hc)] : wire1));
  assign wire80 = ($signed({$unsigned((wire4 << wire6)),
                      $signed((8'hb0))}) < $unsigned(({(wire76 ?
                              wire1 : wire79),
                          (wire4 ? wire5 : wire0)} ?
                      ((wire2 ? wire77 : wire77) ?
                          (wire3 == (7'h43)) : ((7'h43) >> wire7)) : wire74)));
  assign wire81 = {wire80[(3'h4):(1'h0)]};
  assign wire82 = $unsigned($signed({((wire76 ^ wire0) ?
                          (reg78 ? wire0 : wire81) : {wire3, wire7})}));
  assign wire83 = (+{(($unsigned(wire76) ?
                          (wire80 ?
                              wire0 : (8'hb3)) : wire5) || wire75[(3'h7):(3'h6)])});
  assign wire84 = wire6;
  assign wire85 = (~|(wire74 ^~ wire82));
  assign wire86 = $signed(wire3);
endmodule

module module8
#(parameter param70 = (~&(((((8'hb9) || (8'ha7)) ~^ ((8'h9d) > (8'h9e))) ? {(8'hba)} : ({(8'hb8)} ? ((8'hbc) >>> (8'hb1)) : (~&(8'hb4)))) ? (~^{((7'h41) ? (7'h42) : (8'hb5)), (+(8'h9c))}) : (8'hb4))), 
parameter param71 = (((~(param70 ? param70 : (!param70))) ? {((param70 >= param70) == (param70 ? param70 : (8'hb0)))} : ((-(-param70)) ? param70 : {(param70 > param70)})) | ((+(param70 & (param70 ? param70 : (8'haf)))) | ((8'hae) != ({param70, (8'hb8)} != (8'ha5))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h7e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(4'hf):(1'h0)] wire9;
  wire [(3'h7):(1'h0)] wire68;
  wire [(5'h12):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire14;
  wire signed [(3'h6):(1'h0)] wire13;
  reg [(5'h12):(1'h0)] reg20 = (1'h0);
  reg [(3'h5):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg16 = (1'h0);
  assign y = {wire68,
                 wire21,
                 wire15,
                 wire14,
                 wire13,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 (1'h0)};
  assign wire13 = (wire10[(2'h3):(1'h0)] || $signed($unsigned((((8'ha7) >>> wire9) ?
                      $unsigned(wire10) : $unsigned(wire12)))));
  assign wire14 = ($signed(wire11[(4'h8):(4'h8)]) >>> $signed($signed(({wire11} && ((8'ha2) * wire9)))));
  assign wire15 = (~&((~((wire11 ? (8'h9d) : wire13) ?
                      (~wire14) : ((8'hba) ?
                          wire12 : (8'ha6)))) == (~^((wire11 ?
                          wire10 : wire13) ?
                      $signed(wire14) : (~&wire12)))));
  always
    @(posedge clk) begin
      reg16 <= $signed($signed((8'hb7)));
      reg17 <= (wire15[(1'h1):(1'h0)] != ((8'hb7) << $signed(wire15[(4'he):(3'h7)])));
      reg18 <= wire11;
      reg19 <= wire10;
      reg20 <= ($signed(($signed($signed(wire15)) ~^ ((-reg17) ?
              wire10 : (reg16 ? (8'h9e) : (8'hb9))))) ?
          $unsigned(wire15[(4'h9):(4'h9)]) : wire13[(3'h4):(3'h4)]);
    end
  assign wire21 = (|(wire14[(2'h3):(2'h2)] >> wire12[(1'h1):(1'h1)]));
  module22 #() modinst69 (.clk(clk), .wire26(wire9), .wire23(reg18), .y(wire68), .wire25(reg19), .wire24(wire10));
endmodule

module module22  (y, clk, wire26, wire25, wire24, wire23);
  output wire [(32'h1e4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire26;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire signed [(5'h12):(1'h0)] wire24;
  input wire signed [(4'hb):(1'h0)] wire23;
  wire [(4'hc):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire66;
  wire signed [(5'h12):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(4'hf):(1'h0)] wire45;
  wire [(5'h11):(1'h0)] wire35;
  wire [(4'hd):(1'h0)] wire34;
  wire signed [(4'h9):(1'h0)] wire33;
  wire [(5'h15):(1'h0)] wire32;
  wire [(4'hb):(1'h0)] wire31;
  wire [(5'h15):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  wire signed [(3'h5):(1'h0)] wire27;
  reg signed [(4'h9):(1'h0)] reg64 = (1'h0);
  reg [(3'h5):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg58 = (1'h0);
  reg [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(4'hd):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg53 = (1'h0);
  reg [(3'h4):(1'h0)] reg52 = (1'h0);
  reg [(4'he):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(5'h11):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(3'h5):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h5):(1'h0)] reg37 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg36 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire46,
                 wire45,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
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
                 reg49,
                 reg48,
                 reg47,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 (1'h0)};
  assign wire27 = ($signed((8'hb2)) ?
                      ($unsigned($unsigned(wire26[(1'h0):(1'h0)])) <<< ($unsigned((wire25 ?
                          wire24 : wire25)) > wire25)) : $signed(($signed($unsigned(wire25)) <<< ($unsigned(wire24) >= $unsigned(wire24)))));
  assign wire28 = wire24[(4'h9):(1'h0)];
  assign wire29 = ((&(|{((7'h40) > (8'ha0)), $signed(wire23)})) ?
                      wire24 : wire27[(3'h5):(2'h2)]);
  assign wire30 = ($unsigned(wire27) ?
                      wire26 : (+(!(+((7'h41) ? wire27 : wire29)))));
  assign wire31 = (($signed(wire28) <= {$signed((|wire28))}) << (^(~|$signed(wire28[(4'ha):(2'h3)]))));
  assign wire32 = ((wire26[(1'h0):(1'h0)] ?
                          (wire27 ?
                              ($signed(wire25) ?
                                  $unsigned(wire27) : (wire29 + (8'hb5))) : $signed({wire31,
                                  wire25})) : wire27[(2'h3):(1'h1)]) ?
                      wire26[(2'h3):(2'h2)] : wire25[(2'h2):(1'h1)]);
  assign wire33 = wire27[(2'h3):(2'h2)];
  assign wire34 = ($signed(((wire23 ? (^wire28) : $unsigned(wire26)) ?
                      ($signed((7'h43)) * wire26) : wire25[(1'h1):(1'h1)])) ~^ (({{(8'ha5)},
                      $signed(wire31)} + wire23[(3'h5):(3'h4)]) && (wire26 + wire26[(3'h5):(2'h2)])));
  assign wire35 = (($signed((wire31[(2'h2):(1'h1)] >>> wire34[(4'hd):(1'h0)])) || (($unsigned(wire30) <<< (-wire23)) <= ($signed(wire34) ?
                      {wire27} : (wire27 < wire31)))) ~^ $unsigned(wire28));
  always
    @(posedge clk) begin
      reg36 <= wire27;
      if ($unsigned({$signed(wire33[(1'h0):(1'h0)])}))
        begin
          reg37 <= $unsigned((!(wire29[(4'hc):(2'h2)] ?
              reg36[(1'h1):(1'h0)] : ({(8'ha5),
                  wire34} - $unsigned((7'h41))))));
          reg38 <= wire28[(5'h12):(4'he)];
          if ({(&((+$signed(reg36)) ?
                  $signed(wire25[(2'h2):(2'h2)]) : (~&$signed(wire32))))})
            begin
              reg39 <= (^((wire31 ?
                      reg36 : (wire31[(4'h9):(4'h9)] < wire26[(1'h1):(1'h0)])) ?
                  ($unsigned(reg36) && {reg37,
                      (reg38 ?
                          wire25 : wire24)}) : $unsigned({$unsigned(wire33),
                      (^~wire31)})));
              reg40 <= $signed($unsigned((reg37 < {(~^(8'h9f)),
                  $signed(reg36)})));
              reg41 <= {$unsigned(($unsigned({wire24}) || ($signed(wire23) - (reg37 >>> reg36))))};
              reg42 <= (^(~$signed(wire27[(1'h1):(1'h1)])));
            end
          else
            begin
              reg39 <= $unsigned(({reg37[(1'h0):(1'h0)],
                      ((wire27 < wire25) ?
                          $signed(reg37) : reg41[(2'h2):(1'h0)])} ?
                  (&wire24) : $unsigned(wire35[(4'h9):(4'h9)])));
              reg40 <= $unsigned($unsigned(((reg41 ?
                      $signed(wire30) : (wire30 || wire27)) ?
                  (wire29 < wire27[(3'h4):(1'h0)]) : $unsigned((8'ha0)))));
              reg41 <= wire35[(4'h9):(3'h4)];
              reg42 <= (wire25[(1'h1):(1'h1)] - $signed($signed(wire25[(3'h4):(3'h4)])));
            end
          reg43 <= ((($unsigned(wire32) + ((wire29 && wire24) ?
                      (wire31 ? wire27 : wire26) : reg36)) ?
                  (~|((reg36 ^ wire31) ?
                      (+(8'h9e)) : (wire25 ?
                          wire25 : wire24))) : (-($unsigned(wire35) ?
                      wire27 : (reg40 ? reg42 : wire30)))) ?
              $unsigned((+reg40[(1'h1):(1'h1)])) : (wire35[(2'h2):(2'h2)] != wire26));
          reg44 <= ((((~|{reg41, (8'hb9)}) ?
                      (^wire33[(4'h8):(1'h0)]) : (reg41 ?
                          (reg42 ? wire34 : wire23) : reg36[(1'h1):(1'h0)])) ?
                  ((8'hb1) ?
                      $unsigned((reg43 ?
                          wire30 : (8'hb2))) : $signed(reg39)) : ((|reg40) >= wire35[(4'hc):(4'hc)])) ?
              $unsigned((8'ha7)) : wire28[(3'h7):(2'h2)]);
        end
      else
        begin
          reg37 <= (+wire32);
        end
    end
  assign wire45 = (wire26 == $unsigned(wire24));
  assign wire46 = wire27[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg47 <= ((((reg37 ?
              $unsigned(reg39) : $unsigned((8'ha1))) >= ($signed(wire27) ?
              $signed(reg37) : (wire25 <<< wire23))) > $unsigned($unsigned($signed(wire23)))) ?
          (((wire25[(2'h3):(1'h1)] ? (wire31 * reg37) : (!reg42)) ^ (^~(wire28 ?
              (8'ha5) : (7'h44)))) | $unsigned((|(wire46 ~^ wire46)))) : {{(!$unsigned(wire32)),
                  ({reg39, (8'haa)} <= reg39[(2'h2):(1'h1)])}});
    end
  always
    @(posedge clk) begin
      reg48 <= $signed(reg47);
      if (wire28[(1'h0):(1'h0)])
        begin
          reg49 <= ($signed((~^$unsigned((reg37 ^~ reg44)))) || $signed((8'hb4)));
          reg50 <= $signed((($unsigned((8'ha5)) ?
              {$unsigned((8'hac)),
                  reg40} : reg49[(3'h6):(2'h3)]) & $unsigned($signed((reg40 ?
              (8'hb0) : reg43)))));
          reg51 <= (!$signed((reg49 <<< (7'h41))));
          reg52 <= wire27;
        end
      else
        begin
          reg49 <= (8'hb3);
          reg50 <= ($signed($unsigned((8'ha5))) == $unsigned(wire32));
          reg51 <= {$unsigned($signed($unsigned(((8'ha5) ? (8'hbd) : wire46)))),
              (reg52[(1'h0):(1'h0)] ?
                  ($signed($unsigned(reg52)) ?
                      {$unsigned(wire31)} : (~|((8'hb6) - reg44))) : reg41[(3'h4):(1'h1)])};
          reg52 <= reg49[(3'h7):(3'h5)];
        end
      if ((~|($unsigned(reg42[(4'hc):(3'h6)]) ?
          $unsigned(wire35[(2'h3):(2'h3)]) : $signed($unsigned($unsigned((7'h41)))))))
        begin
          if ((-((-(|$unsigned(wire29))) ? reg37[(1'h0):(1'h0)] : wire46)))
            begin
              reg53 <= (reg44[(2'h2):(2'h2)] ?
                  $unsigned(({$signed((8'hbe)),
                      (^~wire27)} & reg43[(4'hd):(1'h0)])) : (((-(&wire24)) || wire45[(4'he):(4'hc)]) - $unsigned($signed((~reg48)))));
              reg54 <= ($unsigned(({((8'hb9) ?
                      reg36 : (8'ha8))} - (8'ha0))) || (~$signed((^(wire25 ?
                  (7'h44) : reg52)))));
              reg55 <= {(($signed($signed(reg39)) <= $unsigned((reg52 != reg39))) ?
                      (~&$signed((^~wire34))) : reg52),
                  ((+(reg36[(1'h0):(1'h0)] | (wire28 < wire24))) ?
                      ($unsigned(reg42[(4'hd):(3'h5)]) >>> $signed((wire23 ?
                          reg49 : wire33))) : ((((8'hba) ? wire35 : (8'hbe)) ?
                          (~&reg40) : ((8'hb3) || (8'hb6))) << reg54))};
              reg56 <= reg41[(2'h2):(2'h2)];
            end
          else
            begin
              reg53 <= wire31[(2'h2):(1'h1)];
            end
          reg57 <= {reg55};
          if (wire25)
            begin
              reg58 <= $unsigned($signed((-wire26[(4'hf):(1'h0)])));
              reg59 <= (-reg41[(1'h0):(1'h0)]);
            end
          else
            begin
              reg58 <= (|(~|(^wire33[(4'h8):(4'h8)])));
              reg59 <= wire33[(3'h4):(2'h2)];
              reg60 <= $signed(reg38);
              reg61 <= ((8'hb2) & $signed($signed((~&reg58[(5'h10):(1'h0)]))));
              reg62 <= $unsigned(reg38[(1'h0):(1'h0)]);
            end
          reg63 <= $unsigned((((~|(~reg38)) || {$unsigned(reg50),
                  (wire33 ? reg44 : wire32)}) ?
              {(~|((8'ha1) ? reg58 : reg55)),
                  $signed(reg62[(2'h3):(1'h1)])} : $unsigned((7'h44))));
        end
      else
        begin
          reg53 <= $signed({($unsigned({(8'ha6)}) * $signed((wire27 ?
                  reg48 : reg41))),
              (reg50 >> wire31)});
          reg54 <= $unsigned(wire26[(4'hf):(2'h3)]);
          reg55 <= $signed((~^{({reg62, reg41} ? $signed(reg52) : wire35)}));
          if ($signed((((|{(8'ha9)}) && wire28) ?
              {$unsigned((&wire25))} : reg56)))
            begin
              reg56 <= $unsigned((+wire25[(2'h2):(1'h1)]));
              reg57 <= wire28;
              reg58 <= $unsigned((~|{wire24[(4'hc):(3'h4)]}));
              reg59 <= $signed((~$unsigned((~^(-(8'ha6))))));
              reg60 <= reg57;
            end
          else
            begin
              reg56 <= (&reg43[(4'hc):(3'h5)]);
              reg57 <= wire35[(3'h6):(1'h0)];
            end
        end
      reg64 <= wire31;
    end
  assign wire65 = (wire33[(4'h9):(3'h5)] ^ (wire46[(2'h2):(1'h0)] ?
                      {reg61} : $unsigned(wire25[(1'h1):(1'h0)])));
  assign wire66 = $signed($unsigned(($unsigned(reg57[(1'h1):(1'h0)]) != wire31)));
  assign wire67 = {(~(($unsigned(reg61) ? $signed(reg41) : (reg36 - reg52)) ?
                          (!(reg48 > reg59)) : wire24))};
endmodule
