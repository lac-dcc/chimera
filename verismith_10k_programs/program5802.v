module top
#(parameter param85 = (({((7'h40) ? ((8'hbc) ? (8'h9d) : (8'ha3)) : ((8'ha9) || (7'h44)))} ? (-(|(^~(8'hb9)))) : (^~(&(!(8'hbb))))) ? ((~&(((8'hba) ? (8'hb0) : (7'h40)) << ((8'hbc) ? (8'hab) : (8'ha9)))) ? ({((8'ha9) + (8'hb7))} ? (!((8'ha4) ? (8'h9e) : (7'h42))) : (((8'ha8) >>> (8'ha8)) ? ((8'hbd) + (8'hb1)) : ((8'ha3) ? (8'h9e) : (8'hbf)))) : (!(((8'haa) ? (7'h42) : (8'hab)) ? {(8'hb0)} : (8'hb8)))) : {(((|(8'hb7)) ? ((8'hbe) ? (8'ha5) : (8'h9f)) : (^(8'hba))) ? ((&(8'hb8)) ? ((8'ha8) >>> (8'ha8)) : ((8'hae) ? (8'hb0) : (8'ha6))) : (((8'hb6) ? (8'h9f) : (8'hba)) ? {(8'ha0)} : (!(8'hb0)))), {((~&(8'hb4)) < ((8'hb7) ? (8'h9f) : (8'ha7)))}}), 
parameter param86 = param85)
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h5d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire signed [(4'hd):(1'h0)] wire84;
  wire [(4'hb):(1'h0)] wire82;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire6;
  wire signed [(4'h8):(1'h0)] wire80;
  reg signed [(5'h13):(1'h0)] reg83 = (1'h0);
  assign y = {wire84, wire82, wire4, wire5, wire6, wire80, reg83, (1'h0)};
  assign wire4 = (wire0[(1'h0):(1'h0)] ?
                     (~((|wire0[(4'hc):(4'hc)]) ?
                         (((8'hb8) < wire3) ^~ ((8'hbe) ?
                             wire1 : wire0)) : {(wire1 ?
                                 wire3 : wire0)})) : wire1);
  assign wire5 = ({$unsigned(wire3[(5'h10):(4'hf)])} ?
                     (8'hb7) : (|$unsigned(wire1)));
  assign wire6 = {$unsigned((~^wire0)),
                     $unsigned((($unsigned(wire0) ?
                             wire0 : $unsigned((8'hbb))) ?
                         wire1[(2'h2):(1'h0)] : (wire5[(1'h1):(1'h0)] ?
                             wire3 : (wire3 << (8'ha3)))))};
  module7 #() modinst81 (.y(wire80), .wire12(wire0), .wire11(wire1), .clk(clk), .wire9(wire5), .wire8(wire3), .wire10(wire6));
  assign wire82 = wire2;
  always
    @(posedge clk) begin
      reg83 <= {(&(+(&(wire0 <= wire2)))),
          ((wire4[(4'hd):(4'ha)] != $signed((8'h9c))) < $unsigned($unsigned(wire6[(1'h1):(1'h1)])))};
    end
  assign wire84 = ($signed({$unsigned(wire0[(5'h10):(4'h8)]),
                          $unsigned($signed(wire82))}) ?
                      wire4 : $unsigned({$signed($signed(wire0)),
                          wire5[(2'h3):(2'h2)]}));
endmodule

module module7  (y, clk, wire12, wire11, wire10, wire9, wire8);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire [(3'h4):(1'h0)] wire9;
  input wire [(5'h15):(1'h0)] wire8;
  wire [(4'h8):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire [(2'h2):(1'h0)] wire77;
  wire signed [(5'h13):(1'h0)] wire42;
  wire signed [(4'hf):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire15;
  wire signed [(4'h9):(1'h0)] wire14;
  wire [(5'h15):(1'h0)] wire13;
  wire [(5'h15):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire75;
  assign y = {wire79,
                 wire78,
                 wire77,
                 wire42,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire44,
                 wire75,
                 (1'h0)};
  assign wire13 = wire9[(1'h0):(1'h0)];
  assign wire14 = wire11;
  assign wire15 = wire14[(4'h8):(2'h3)];
  assign wire16 = (~|wire14);
  assign wire17 = $signed(wire11);
  module18 #() modinst43 (wire42, clk, wire12, wire13, wire11, wire9, wire15);
  assign wire44 = (wire14 && $signed($unsigned($unsigned({wire8}))));
  module45 #() modinst76 (.wire48(wire17), .wire49(wire42), .clk(clk), .wire50(wire12), .wire46(wire11), .y(wire75), .wire47(wire44));
  assign wire77 = $unsigned(wire9);
  assign wire78 = $unsigned(wire16[(4'h8):(2'h2)]);
  assign wire79 = {wire17};
endmodule

module module45
#(parameter param74 = (-((({(8'hb8), (8'hbe)} >= {(8'hb5), (8'hbd)}) ? {((8'h9d) ? (8'ha4) : (8'h9e))} : (8'hb3)) ? ((((8'h9e) ^~ (7'h41)) ^ (|(8'hb3))) ^~ (&(&(8'h9f)))) : {({(8'hbf), (8'hb7)} ? ((8'ha6) ? (8'hb1) : (8'ha3)) : ((8'hb8) ? (8'had) : (8'hb0)))})))
(y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h10e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire50;
  input wire signed [(3'h7):(1'h0)] wire49;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire signed [(5'h15):(1'h0)] wire47;
  input wire [(3'h7):(1'h0)] wire46;
  wire signed [(4'h8):(1'h0)] wire73;
  wire signed [(4'h9):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire71;
  wire signed [(2'h2):(1'h0)] wire57;
  wire signed [(5'h12):(1'h0)] wire56;
  wire signed [(5'h15):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(5'h11):(1'h0)] wire52;
  wire [(4'hc):(1'h0)] wire51;
  reg [(4'h8):(1'h0)] reg70 = (1'h0);
  reg [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg68 = (1'h0);
  reg [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(3'h6):(1'h0)] reg64 = (1'h0);
  reg [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg58 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
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
                 (1'h0)};
  assign wire51 = wire49[(2'h3):(2'h2)];
  assign wire52 = $unsigned({(((wire51 > wire46) ?
                          {wire46,
                              wire49} : $unsigned(wire50)) | wire51[(3'h5):(1'h1)]),
                      ($signed(wire49) ?
                          $unsigned({wire46, (8'h9f)}) : wire48)});
  assign wire53 = (8'haa);
  assign wire54 = ($unsigned(wire53) ?
                      ($unsigned(wire49[(2'h2):(1'h1)]) ?
                          wire52[(2'h3):(2'h3)] : ((~|(-wire46)) ?
                              {wire48} : (~|(wire47 ?
                                  wire47 : wire51)))) : wire52);
  assign wire55 = (-(~|((^(!wire49)) ?
                      {$signed(wire54),
                          (wire54 ? (8'ha2) : wire48)} : (^~wire48))));
  assign wire56 = ((-$unsigned({$signed(wire46),
                      ((8'hb8) ? wire53 : wire49)})) | wire46[(2'h2):(1'h0)]);
  assign wire57 = (wire48 * {({(~^(8'h9c))} >>> {$signed((7'h43)),
                          $signed(wire55)})});
  always
    @(posedge clk) begin
      reg58 <= {$signed({((-wire57) && wire50), $signed($signed(wire52))})};
      reg59 <= wire50[(3'h4):(2'h3)];
      if (wire51)
        begin
          if ((^~$unsigned($unsigned($unsigned($signed(wire50))))))
            begin
              reg60 <= reg59;
              reg61 <= reg58;
              reg62 <= (~$signed((^~$unsigned(wire56[(4'hd):(2'h3)]))));
              reg63 <= wire53[(2'h3):(2'h2)];
            end
          else
            begin
              reg60 <= ($signed({wire50[(1'h0):(1'h0)],
                  $signed($signed((8'hbd)))}) & $unsigned($unsigned(wire51)));
              reg61 <= ((reg61 ^~ wire55) ?
                  (reg58 << $unsigned((~|$unsigned(reg58)))) : (wire56[(5'h11):(4'h8)] ?
                      ((wire48[(3'h5):(1'h0)] == (wire46 <= wire49)) != $signed(wire46[(3'h5):(3'h5)])) : ($signed({reg60}) ?
                          ((~&wire52) ?
                              (~&reg61) : reg62) : reg60[(3'h4):(2'h2)])));
              reg62 <= reg59[(2'h2):(1'h0)];
              reg63 <= {{({wire57, (reg62 ? wire48 : wire52)} ?
                          wire48 : (!reg61[(2'h2):(1'h0)])),
                      $signed(wire54[(4'hc):(3'h7)])},
                  $unsigned(wire50[(1'h1):(1'h0)])};
            end
          reg64 <= wire54;
          reg65 <= $unsigned($unsigned(wire54));
          reg66 <= {({{(8'hb2), $signed(wire56)}, reg62} + {(((8'hba) ?
                          wire48 : (8'haf)) ?
                      $unsigned(wire56) : (wire46 ? (8'had) : (7'h44))),
                  $signed(wire47)}),
              reg58[(4'h8):(3'h6)]};
          reg67 <= ((8'h9c) ?
              $signed(({$unsigned((8'ha9)),
                  (!wire47)} != $signed(reg60))) : ((wire50[(1'h0):(1'h0)] ^ reg64[(1'h1):(1'h1)]) != (8'hb4)));
        end
      else
        begin
          if ($unsigned(reg67[(3'h4):(1'h1)]))
            begin
              reg60 <= $signed(((^($signed((8'hb1)) ?
                      (~wire53) : (wire46 ? reg63 : (7'h41)))) ?
                  $signed(($unsigned(wire46) | (wire56 - reg61))) : (~^((wire50 ?
                          reg60 : wire55) ?
                      wire57[(1'h0):(1'h0)] : $signed(wire51)))));
              reg61 <= (!wire47);
              reg62 <= reg58[(3'h4):(1'h1)];
            end
          else
            begin
              reg60 <= wire57[(1'h0):(1'h0)];
            end
          if ({(|($unsigned($unsigned(reg64)) ^~ ($unsigned(reg64) + ((8'haa) ?
                  wire52 : wire46))))})
            begin
              reg63 <= $unsigned({(8'hbd), (8'hab)});
            end
          else
            begin
              reg63 <= (-(~|(-$signed(wire50))));
            end
          if ({$signed(wire50[(2'h2):(1'h0)])})
            begin
              reg64 <= {$signed($signed(($unsigned(wire47) ?
                      reg58 : {wire48})))};
              reg65 <= $unsigned(wire48[(3'h5):(1'h0)]);
            end
          else
            begin
              reg64 <= $unsigned((^(^$signed({reg64, wire57}))));
              reg65 <= wire51;
              reg66 <= $signed(($unsigned(($unsigned(wire53) ?
                      wire47[(5'h10):(3'h6)] : (+(8'ha7)))) ?
                  $unsigned(reg67[(2'h3):(2'h3)]) : ((+{reg59}) >>> (~^wire52))));
            end
          reg67 <= $signed(reg58[(4'h8):(2'h2)]);
          reg68 <= ($unsigned({$unsigned($unsigned(reg67))}) * reg67[(1'h0):(1'h0)]);
        end
      reg69 <= $unsigned((((wire52[(4'h9):(2'h3)] ?
              $unsigned((8'hbb)) : reg59) ?
          ((reg68 ? wire55 : reg68) ?
              wire47[(5'h15):(1'h0)] : $signed(reg68)) : (reg66[(1'h0):(1'h0)] ?
              (wire57 ? reg58 : reg60) : reg61[(2'h2):(2'h2)])) || {(~wire46),
          wire50}));
      reg70 <= reg60[(3'h6):(2'h3)];
    end
  assign wire71 = $signed((8'hb7));
  assign wire72 = (((((|reg61) ?
                      (^wire54) : (reg64 ?
                          reg62 : (8'ha1))) <= $signed(reg61[(3'h6):(1'h0)])) ~^ (-(((8'hb3) ~^ reg66) ?
                      {wire51,
                          reg60} : wire49[(1'h1):(1'h1)]))) ^~ ($signed(wire57[(1'h1):(1'h0)]) ?
                      ({(reg61 >>> reg69)} ?
                          reg65[(3'h7):(3'h5)] : (wire53 ?
                              reg59[(4'h8):(3'h4)] : (|(8'hbd)))) : $unsigned($signed((wire53 || wire47)))));
  assign wire73 = $unsigned((^reg58[(3'h6):(3'h6)]));
endmodule

module module18
#(parameter param41 = (((-({(8'hbb)} ? ((8'hb7) ? (8'hb8) : (8'ha3)) : (+(8'h9f)))) ^~ {(8'hb1)}) ? {({((8'hbf) ? (8'h9e) : (8'ha3))} ? ({(8'ha8), (8'hbe)} <= (~(8'hb6))) : (((8'hb6) << (8'ha9)) ^ ((8'ha8) * (8'ha8)))), {(((8'hbf) ^ (8'haf)) ? ((8'ha0) != (8'hb6)) : ((8'ha3) | (8'ha6)))}} : {{(((7'h41) + (7'h40)) ? (8'h9f) : (&(8'hb0)))}, {(+((8'ha5) >>> (8'hba))), (((7'h42) - (8'ha7)) - ((8'hbb) ? (8'hb2) : (8'ha3)))}}))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'hc6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire23;
  input wire [(4'he):(1'h0)] wire22;
  input wire signed [(5'h12):(1'h0)] wire21;
  input wire signed [(3'h4):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire40;
  wire [(2'h3):(1'h0)] wire39;
  wire [(3'h6):(1'h0)] wire28;
  wire signed [(5'h11):(1'h0)] wire27;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'h8):(1'h0)] wire25;
  wire [(5'h12):(1'h0)] wire24;
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h13):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg30 = (1'h0);
  reg [(4'he):(1'h0)] reg29 = (1'h0);
  assign y = {wire40,
                 wire39,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
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
                 (1'h0)};
  assign wire24 = wire21;
  assign wire25 = ($unsigned(((|(~wire20)) != (^~{wire21}))) >= $signed($unsigned(wire23[(4'ha):(3'h5)])));
  assign wire26 = $signed({(($signed(wire22) ? (&wire24) : $signed(wire19)) ?
                          wire20 : {wire23, wire21[(1'h0):(1'h0)]}),
                      {((^~wire19) ? (wire21 < wire22) : (8'haa))}});
  assign wire27 = wire24;
  assign wire28 = wire21;
  always
    @(posedge clk) begin
      reg29 <= wire22;
      if (wire28[(1'h0):(1'h0)])
        begin
          reg30 <= $unsigned(wire19);
        end
      else
        begin
          if ((((-$signed((wire28 ? wire26 : wire28))) ?
              (8'ha0) : $signed((((8'h9e) ? reg30 : wire25) <<< (wire24 ?
                  wire24 : wire27)))) >>> $signed((wire28[(2'h2):(1'h1)] << $signed((|(8'hbc)))))))
            begin
              reg30 <= {$unsigned(wire26),
                  $signed(($unsigned((wire27 <= wire24)) <= (~^(wire24 ?
                      wire25 : wire22))))};
              reg31 <= (8'hbd);
              reg32 <= wire21;
              reg33 <= ($signed($signed(wire25[(2'h3):(1'h0)])) ?
                  reg29 : wire27);
            end
          else
            begin
              reg30 <= (8'h9c);
              reg31 <= wire19[(4'hb):(4'ha)];
              reg32 <= reg29[(1'h1):(1'h1)];
              reg33 <= wire24[(4'ha):(2'h2)];
              reg34 <= (^~wire20);
            end
          reg35 <= (reg31[(1'h0):(1'h0)] | (wire26 ?
              wire24[(2'h3):(1'h0)] : $signed($unsigned(reg30))));
          reg36 <= {wire22, (8'hb7)};
          reg37 <= $unsigned({$unsigned($signed((+wire24))), wire28});
          reg38 <= ((({(~|reg30), (~&wire19)} ?
                  (~&{reg29,
                      wire25}) : $signed(wire22[(4'he):(2'h2)])) <<< reg30[(4'hf):(4'h9)]) ?
              {(8'ha7)} : (-wire19));
        end
    end
  assign wire39 = wire23;
  assign wire40 = ({({(wire25 ? reg32 : reg32),
                          reg32[(1'h1):(1'h0)]} || $unsigned($signed(reg30))),
                      ($signed((~^reg34)) + $signed($unsigned(reg33)))} ~^ reg33);
endmodule
