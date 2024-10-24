module top
#(parameter param90 = (!(((((8'ha3) << (8'hbc)) ? ((7'h40) ? (8'hab) : (8'ha5)) : ((7'h41) ? (7'h40) : (8'ha2))) & ((~|(8'hbd)) ? ((8'hb4) ? (8'ha6) : (8'hb9)) : (~|(8'hbc)))) | ((((8'h9e) ? (8'ha7) : (7'h41)) ? (~(8'hb6)) : (^~(8'ha4))) & (!(^(8'hba)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h138):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire0;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire3;
  wire [(2'h2):(1'h0)] wire89;
  wire [(4'ha):(1'h0)] wire88;
  wire signed [(5'h13):(1'h0)] wire87;
  wire signed [(4'hf):(1'h0)] wire86;
  wire [(4'h9):(1'h0)] wire85;
  wire [(3'h6):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire signed [(3'h6):(1'h0)] wire82;
  wire signed [(4'hc):(1'h0)] wire81;
  wire signed [(5'h11):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(4'hb):(1'h0)] wire78;
  wire [(5'h11):(1'h0)] wire77;
  wire [(4'hf):(1'h0)] wire76;
  wire signed [(4'hf):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire34;
  wire [(4'hf):(1'h0)] wire35;
  wire signed [(2'h3):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire74;
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg7 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire4,
                 wire32,
                 wire34,
                 wire35,
                 wire36,
                 wire74,
                 reg37,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = ($signed((($unsigned(wire1) ?
                         wire0[(3'h4):(1'h0)] : (8'ha9)) ^~ wire1[(5'h10):(2'h3)])) ?
                     wire0 : ((wire3 ? wire0 : ({wire0} * wire0)) ?
                         ({$signed((8'hb3)), wire1} ?
                             wire1[(1'h1):(1'h0)] : $signed((&wire0))) : ($signed({(8'hb4)}) >>> (~^{(8'hb1)}))));
  always
    @(posedge clk) begin
      reg5 <= $unsigned(((((&wire3) ?
          wire2[(3'h5):(2'h3)] : (^~wire1)) >= $unsigned(wire4)) < wire3));
      reg6 <= (((~&$unsigned(wire0[(2'h3):(1'h1)])) <= $unsigned($signed((-wire1)))) >> ((+((8'ha9) ?
              wire4[(4'hc):(2'h2)] : $unsigned(wire3))) ?
          wire4 : $unsigned(wire4)));
      reg7 <= $signed((wire1 ? $signed((!(wire1 ? wire2 : wire0))) : {wire3}));
    end
  module8 #() modinst33 (wire32, clk, reg5, wire0, wire3, reg6);
  assign wire34 = (((((wire2 ? reg5 : (8'ha7)) ?
                      reg6 : $signed(wire4)) - ((wire4 ?
                      (7'h42) : reg7) <= $signed(wire3))) <<< $unsigned(wire0[(4'ha):(3'h5)])) != $unsigned((8'hb3)));
  assign wire35 = ({wire32,
                      (!$unsigned((-reg7)))} != $unsigned($unsigned((~&((8'hb5) * (8'hb9))))));
  assign wire36 = (wire32[(3'h7):(2'h2)] ?
                      $signed($signed(((~|(8'ha6)) == reg7[(3'h6):(1'h0)]))) : (8'ha9));
  always
    @(posedge clk) begin
      reg37 <= (((~wire0) ?
              (wire34[(2'h2):(1'h1)] ?
                  ((^reg5) ?
                      {wire2} : (wire2 ?
                          reg7 : wire4)) : reg7[(4'h9):(3'h5)]) : (+(wire36 - reg5[(3'h4):(2'h2)]))) ?
          $unsigned({wire35}) : ((wire3 ?
              wire4[(2'h3):(1'h1)] : {(wire32 ? wire36 : (8'hb7))}) & reg7));
    end
  module38 #() modinst75 (wire74, clk, reg7, wire2, reg37, wire35, wire4);
  assign wire76 = $signed((-((wire1 ? {reg37} : (reg7 ? (8'h9e) : reg37)) ?
                      ((wire35 < wire4) >= (+wire34)) : $unsigned(reg7))));
  assign wire77 = (((wire35[(4'h8):(2'h3)] <= ((+reg6) ?
                              $signed(wire3) : wire35)) ?
                          $signed(reg6[(4'h8):(3'h6)]) : (wire36[(2'h3):(2'h2)] <= (|(-wire2)))) ?
                      (~&(wire74[(4'hc):(4'h9)] ?
                          $unsigned((!reg37)) : wire32[(1'h1):(1'h0)])) : ($unsigned(((reg6 < wire34) ?
                          (+wire4) : (wire32 ?
                              wire2 : wire3))) > (~|wire32[(4'hf):(1'h0)])));
  assign wire78 = wire2;
  assign wire79 = wire0;
  assign wire80 = wire74;
  assign wire81 = $signed($unsigned((~$unsigned((wire3 ? (8'hb3) : wire74)))));
  assign wire82 = $signed((wire78[(1'h1):(1'h1)] > $signed((~&$signed(wire78)))));
  assign wire83 = ({reg7, wire79} && $signed(wire79));
  assign wire84 = ($unsigned(wire32[(4'ha):(1'h1)]) ?
                      (wire4 + $unsigned((!wire82))) : wire34[(3'h4):(3'h4)]);
  assign wire85 = (wire32 ^ $signed(({(wire74 ?
                          reg5 : (8'h9e))} != $unsigned($unsigned(wire4)))));
  assign wire86 = wire81;
  assign wire87 = ($signed((wire2[(4'hd):(3'h7)] && wire36[(2'h2):(1'h1)])) >> {(~|$signed($unsigned(wire3)))});
  assign wire88 = {$unsigned({$unsigned(reg6), (-$unsigned(wire74))})};
  assign wire89 = (-(-(~|wire78[(4'h8):(3'h4)])));
endmodule

module module38
#(parameter param72 = {(^~(~^(((8'hae) && (8'hbb)) ? ((8'ha5) * (7'h44)) : ((8'ha0) >>> (8'ha5)))))}, 
parameter param73 = ({{(|param72), (param72 << (-param72))}} ? (param72 | param72) : ((~^{((8'hac) < param72)}) ? (!(~^{(8'ha6), param72})) : (-((param72 + param72) & param72)))))
(y, clk, wire39, wire40, wire41, wire42, wire43);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire39;
  input wire [(4'hf):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire41;
  input wire signed [(4'ha):(1'h0)] wire42;
  input wire signed [(3'h7):(1'h0)] wire43;
  wire [(5'h14):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(4'he):(1'h0)] wire68;
  wire signed [(4'hb):(1'h0)] wire65;
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'hd):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg48 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg54 = (1'h0);
  assign y = {wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire65,
                 reg67,
                 reg44,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 reg51,
                 reg52,
                 reg53,
                 reg54,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg44 <= $unsigned(wire42);
      if ($signed(wire41[(3'h7):(1'h1)]))
        begin
          reg45 <= wire39[(4'hd):(3'h7)];
          reg46 <= $signed(reg44[(4'hc):(2'h3)]);
          if (wire42[(3'h6):(3'h6)])
            begin
              reg47 <= reg44;
              reg48 <= wire40;
              reg49 <= $unsigned(reg44);
              reg50 <= (((~&((^~wire40) ?
                  (reg49 != wire39) : (reg47 > reg45))) != {$unsigned($unsigned(reg49))}) ^ (~&(((wire43 ^ reg45) & ((8'ha1) >= reg45)) | {wire42[(3'h7):(2'h3)],
                  wire43})));
            end
          else
            begin
              reg47 <= ((8'haa) ?
                  reg45 : ((&(^wire42[(1'h0):(1'h0)])) ?
                      $signed(reg48) : (~|(^(wire42 ? (8'hac) : wire41)))));
              reg48 <= reg45[(1'h0):(1'h0)];
              reg49 <= reg44;
              reg50 <= (&$unsigned((~^($unsigned(wire43) ?
                  (reg50 ^ reg50) : $signed(reg50)))));
              reg51 <= {$signed(((+$unsigned(reg44)) ?
                      reg48[(1'h1):(1'h1)] : $signed({wire40, (8'hb3)})))};
            end
        end
      else
        begin
          reg45 <= (-reg46[(4'h9):(4'h8)]);
          reg46 <= $signed((($unsigned($unsigned(wire40)) << $signed((~&reg44))) ?
              $unsigned(reg47[(4'ha):(3'h4)]) : reg45[(2'h3):(2'h2)]));
          if ((^{$unsigned(((wire41 > reg49) ? {reg44} : (wire41 ^~ wire43))),
              reg51[(3'h6):(3'h6)]}))
            begin
              reg47 <= {(wire40[(4'h9):(1'h1)] ?
                      (~({reg46} ? $signed(reg45) : (|(7'h40)))) : reg47)};
              reg48 <= (8'ha3);
              reg49 <= {(-($signed($unsigned(reg44)) ~^ {wire41[(5'h13):(4'h9)]}))};
              reg50 <= $signed(($unsigned($unsigned({(8'hb8), wire41})) ?
                  wire41 : reg46));
              reg51 <= wire41[(3'h5):(2'h3)];
            end
          else
            begin
              reg47 <= reg50[(1'h1):(1'h1)];
              reg48 <= reg51;
              reg49 <= $unsigned(($unsigned({$signed(reg50)}) != ($unsigned($signed(wire42)) ?
                  {{reg49, reg49}} : $unsigned((wire41 & (7'h43))))));
              reg50 <= reg45;
              reg51 <= reg47;
            end
        end
      reg52 <= $signed($unsigned({($unsigned(wire40) ?
              wire40[(3'h5):(2'h3)] : (wire43 >> reg48))}));
      reg53 <= reg44[(1'h0):(1'h0)];
      reg54 <= reg47[(1'h0):(1'h0)];
    end
  module55 #() modinst66 (wire65, clk, reg48, reg44, wire40, reg54);
  always
    @(posedge clk) begin
      reg67 <= $signed((|wire39[(5'h10):(4'he)]));
    end
  assign wire68 = {((($unsigned(reg45) ?
                          {reg67,
                              reg51} : ((8'ha9) ~^ reg46)) || wire40[(4'hc):(3'h5)]) - (~&$unsigned(reg49[(3'h5):(2'h3)]))),
                      $signed((wire43[(3'h5):(3'h4)] ^ ((wire40 & wire43) ?
                          $signed(wire65) : (reg52 ? reg67 : (8'ha2)))))};
  assign wire69 = (+$signed(wire43));
  assign wire70 = $signed(($unsigned($signed($signed(reg50))) ?
                      ((+(reg51 ? wire40 : reg52)) <<< {$signed(reg44),
                          $unsigned(reg52)}) : wire39));
  assign wire71 = $signed(wire69[(3'h5):(3'h4)]);
endmodule

module module8
#(parameter param31 = (({({(8'hbc)} >= (+(8'hbb)))} ? (~&(((8'hb5) ? (8'hb1) : (8'hb5)) - (~|(7'h43)))) : (!(((8'hb8) ? (8'ha3) : (8'hbf)) ? (8'hae) : (!(8'haa))))) ? {{(~((8'h9e) || (8'hb7))), (((8'hbe) ? (7'h40) : (8'hb3)) ? ((8'hb4) * (8'hb2)) : ((8'ha0) ? (8'hb7) : (8'ha0)))}} : ((7'h43) | (({(8'ha6), (8'h9d)} ? (~|(8'ha7)) : {(8'hba)}) ? ((~&(8'haf)) ? (~^(7'h40)) : ((8'hb2) * (8'hb7))) : ({(8'ha8), (8'ha0)} ? ((8'ha8) > (8'ha8)) : ((8'h9e) ? (8'hab) : (8'ha9)))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire12;
  input wire [(5'h13):(1'h0)] wire11;
  input wire signed [(4'hb):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  wire signed [(3'h7):(1'h0)] wire30;
  wire signed [(5'h15):(1'h0)] wire28;
  wire signed [(4'hc):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  assign y = {wire30, wire28, wire14, wire13, (1'h0)};
  assign wire13 = $unsigned(wire12);
  assign wire14 = ((wire12 << (!(!wire12))) ?
                      ($signed($unsigned((&wire9))) & wire11[(1'h0):(1'h0)]) : (^~$unsigned((-wire9))));
  module15 #() modinst29 (.clk(clk), .wire18(wire13), .wire16(wire9), .y(wire28), .wire19(wire11), .wire17(wire10));
  assign wire30 = $unsigned(wire13[(3'h7):(3'h5)]);
endmodule

module module15  (y, clk, wire19, wire18, wire17, wire16);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire [(4'hb):(1'h0)] wire17;
  input wire [(4'h8):(1'h0)] wire16;
  wire [(4'hc):(1'h0)] wire27;
  wire [(4'hb):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire [(4'hb):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire20;
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  assign y = {wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire20,
                 reg21,
                 (1'h0)};
  assign wire20 = wire18;
  always
    @(posedge clk) begin
      reg21 <= {(~&($signed($unsigned(wire17)) ?
              wire19[(4'ha):(2'h2)] : (wire20[(1'h1):(1'h1)] < (wire17 != wire17))))};
    end
  assign wire22 = (~^$signed($signed({wire18, (wire18 ^ wire18)})));
  assign wire23 = wire19[(4'he):(1'h1)];
  assign wire24 = wire23;
  assign wire25 = wire17[(4'h9):(3'h7)];
  assign wire26 = $signed(({$unsigned((reg21 ? wire20 : (8'ha8)))} ?
                      {$signed(((8'h9f) ^~ wire22))} : ({(wire25 ~^ wire24)} ?
                          $unsigned((-wire16)) : wire19[(3'h5):(1'h1)])));
  assign wire27 = ((&($signed((~&wire20)) || $unsigned($unsigned((8'ha9))))) << (8'hba));
endmodule

module module55
#(parameter param64 = (~^({(!((8'ha4) ? (8'had) : (7'h40))), (!(&(8'hab)))} > ((&((8'hb2) ? (8'ha9) : (8'ha9))) && (^~((7'h41) == (8'hb3)))))))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'h2e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire59;
  input wire signed [(5'h12):(1'h0)] wire58;
  input wire signed [(4'h8):(1'h0)] wire57;
  input wire [(5'h10):(1'h0)] wire56;
  wire signed [(3'h5):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire [(5'h12):(1'h0)] wire60;
  assign y = {wire63, wire62, wire61, wire60, (1'h0)};
  assign wire60 = $unsigned($unsigned((wire56 ?
                      ((~wire56) > $signed(wire56)) : (8'hbc))));
  assign wire61 = (^(wire57 > $unsigned((8'hbc))));
  assign wire62 = $unsigned(($unsigned(wire57) ?
                      (wire56[(1'h0):(1'h0)] <= ($signed(wire61) ?
                          wire60[(5'h10):(4'ha)] : $unsigned((8'h9e)))) : (8'ha9)));
  assign wire63 = wire58[(4'hd):(2'h3)];
endmodule
