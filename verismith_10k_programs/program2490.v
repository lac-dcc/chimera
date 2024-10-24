module top
#(parameter param65 = ((({((8'hb7) ? (8'haa) : (8'h9e))} ? (((7'h44) ? (8'had) : (7'h42)) < (~|(8'hae))) : (|((8'hb9) ^ (8'h9c)))) * ((((8'ha4) || (8'haa)) ? {(8'hbc), (8'h9f)} : {(8'hb3)}) <<< (~^((8'hbf) ? (8'hb5) : (8'hbc))))) ? (~&(^~((~^(8'ha4)) || ((8'hb7) ? (8'hbb) : (7'h43))))) : ({{((8'hbc) >>> (7'h42))}} >>> ((+((8'ha6) ? (8'hb9) : (8'hb4))) ? (((8'hb2) ? (8'hb8) : (8'haa)) ? ((8'hab) - (8'ha1)) : {(8'hae)}) : (|((8'hb7) ? (8'ha7) : (8'hbd)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hbb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire2;
  input wire signed [(4'hb):(1'h0)] wire3;
  wire signed [(4'he):(1'h0)] wire64;
  wire [(5'h15):(1'h0)] wire63;
  wire [(2'h3):(1'h0)] wire62;
  wire signed [(4'hc):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire [(4'hf):(1'h0)] wire59;
  wire signed [(5'h10):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(5'h14):(1'h0)] wire4;
  wire signed [(4'h8):(1'h0)] wire5;
  wire [(4'hc):(1'h0)] wire6;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire55;
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire55,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = (|((((|(8'hbb)) ? (wire1 >= wire0) : (|wire0)) ?
                         (!(~|wire1)) : {$signed(wire0)}) ?
                     (((wire4 < wire0) ?
                             ((7'h42) >> wire1) : $unsigned(wire3)) ?
                         (wire1 ?
                             (wire1 ? wire2 : wire0) : (wire0 ?
                                 wire4 : wire1)) : $signed($unsigned(wire4))) : (wire4 ?
                         $signed($unsigned(wire4)) : wire3)));
  assign wire6 = (~$signed(wire2));
  assign wire7 = $unsigned($unsigned((&(!{wire5, wire0}))));
  module8 #() modinst56 (.wire13(wire4), .wire11(wire7), .wire10(wire0), .y(wire55), .clk(clk), .wire12(wire3), .wire9(wire1));
  assign wire57 = wire1[(4'h9):(2'h3)];
  assign wire58 = ($signed(($signed($signed(wire0)) ?
                      $signed((wire5 ~^ wire6)) : ((wire3 << wire5) ?
                          (wire3 * wire6) : $signed(wire2)))) ^~ wire4);
  assign wire59 = ((-$signed(wire4[(4'hf):(4'h8)])) ?
                      (~|(8'ha0)) : ($unsigned((wire7 ?
                              wire0[(2'h2):(1'h1)] : wire1[(4'h8):(3'h6)])) ?
                          wire6 : wire2));
  assign wire60 = ((^(~&{$unsigned(wire3),
                      (wire7 <= wire5)})) >>> wire59[(4'h8):(3'h4)]);
  assign wire61 = wire60[(4'h8):(4'h8)];
  assign wire62 = wire7;
  assign wire63 = (wire4 >>> wire61);
  assign wire64 = (wire6 == {((((8'ha6) ? (7'h40) : (8'ha5)) ?
                          wire1 : (wire1 ? wire5 : wire61)) ^~ (wire62 ?
                          $unsigned(wire3) : (8'hba)))});
endmodule

module module8
#(parameter param54 = ((~|(~((|(8'hb8)) < (~(8'hb8))))) != (!(8'haa))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h60):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(4'ha):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  wire [(5'h10):(1'h0)] wire53;
  wire signed [(3'h4):(1'h0)] wire52;
  wire signed [(5'h11):(1'h0)] wire51;
  wire [(4'hf):(1'h0)] wire50;
  wire [(3'h5):(1'h0)] wire14;
  wire [(5'h12):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire48;
  assign y = {wire53, wire52, wire51, wire50, wire14, wire15, wire48, (1'h0)};
  assign wire14 = $unsigned((&$unsigned(wire11[(2'h2):(1'h1)])));
  assign wire15 = ((~^wire10[(1'h1):(1'h0)]) ?
                      $signed(($signed(((8'hbf) ? wire11 : wire10)) ?
                          (~&wire11[(4'hb):(4'hb)]) : $unsigned(wire10[(3'h7):(3'h4)]))) : wire13);
  module16 #() modinst49 (wire48, clk, wire9, wire13, wire12, wire10, wire15);
  assign wire50 = (($signed({{wire10}}) ^~ (8'ha3)) + (^(wire12 ?
                      ($signed(wire11) ?
                          (wire11 ? wire10 : wire9) : wire11) : ((&(8'ha5)) ?
                          (wire14 >= wire14) : $signed(wire11)))));
  assign wire51 = (~^wire15[(3'h5):(1'h1)]);
  assign wire52 = (&{$unsigned({$unsigned((8'ha0))})});
  assign wire53 = (((-(~&(wire50 && wire9))) ?
                      wire48 : (!(+$unsigned(wire11)))) == $signed(((^~(wire13 ?
                          wire9 : wire15)) ?
                      $unsigned((wire14 | wire52)) : ((~wire9) ^~ (!wire52)))));
endmodule

module module16  (y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h115):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hb):(1'h0)] wire21;
  input wire signed [(4'h9):(1'h0)] wire20;
  input wire signed [(4'ha):(1'h0)] wire19;
  input wire signed [(4'h8):(1'h0)] wire18;
  input wire signed [(5'h12):(1'h0)] wire17;
  wire signed [(2'h3):(1'h0)] wire47;
  wire [(3'h5):(1'h0)] wire46;
  wire signed [(5'h14):(1'h0)] wire45;
  wire [(4'h8):(1'h0)] wire44;
  wire signed [(4'he):(1'h0)] wire43;
  wire signed [(4'hd):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire signed [(3'h6):(1'h0)] wire40;
  wire signed [(3'h7):(1'h0)] wire39;
  wire [(3'h5):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire23;
  wire signed [(5'h13):(1'h0)] wire22;
  reg [(4'hc):(1'h0)] reg37 = (1'h0);
  reg [(4'hb):(1'h0)] reg36 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg34 = (1'h0);
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(3'h6):(1'h0)] reg30 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  assign y = {wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire23,
                 wire22,
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
                 (1'h0)};
  assign wire22 = $unsigned((8'had));
  assign wire23 = wire21[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg24 <= (~^($signed(wire20) & (wire20 - $signed($unsigned(wire19)))));
      reg25 <= wire20[(3'h6):(3'h4)];
      reg26 <= (|$signed({$unsigned($signed(reg25)),
          ((wire21 >= reg24) < ((8'hbd) & wire17))}));
      reg27 <= $unsigned(($unsigned($unsigned($unsigned(reg24))) ?
          wire22 : wire21));
      reg28 <= $signed($unsigned((+{((8'ha6) ? (8'hae) : reg27),
          $unsigned(reg25)})));
    end
  always
    @(posedge clk) begin
      if ($unsigned(wire20[(3'h6):(3'h4)]))
        begin
          reg29 <= wire23[(2'h2):(2'h2)];
        end
      else
        begin
          reg29 <= wire22;
          reg30 <= wire20;
          if ($signed(wire20[(3'h5):(2'h3)]))
            begin
              reg31 <= (reg26[(3'h6):(3'h4)] ^~ $unsigned({(reg29[(2'h2):(2'h2)] < (-(8'hb8)))}));
              reg32 <= ((reg27 ? reg30[(2'h2):(2'h2)] : wire17) ?
                  (8'haf) : reg27);
              reg33 <= {$unsigned($signed(({reg30, reg32} == (~(8'hbf))))),
                  ($signed(wire18) ?
                      ($signed($unsigned((8'ha0))) ?
                          reg24[(3'h5):(3'h5)] : (+(~wire21))) : (8'haf))};
              reg34 <= reg33[(1'h0):(1'h0)];
              reg35 <= $unsigned(wire20[(1'h1):(1'h0)]);
            end
          else
            begin
              reg31 <= {({$unsigned((~|wire17)),
                          ($signed(wire23) ?
                              reg32[(2'h3):(1'h1)] : reg28[(3'h4):(1'h1)])} ?
                      (wire23 != $signed(((8'hbc) ^~ reg32))) : reg26[(3'h4):(1'h0)]),
                  $unsigned({$unsigned($signed(reg24))})};
              reg32 <= reg27[(3'h7):(3'h7)];
              reg33 <= $signed({{reg27[(4'hf):(3'h5)]},
                  {(-$unsigned(wire22)), {$signed((8'hb0)), wire17}}});
              reg34 <= $unsigned(wire18);
              reg35 <= $signed((|$unsigned($unsigned((-wire23)))));
            end
        end
      reg36 <= wire22[(5'h13):(5'h12)];
      reg37 <= $unsigned((8'hb9));
    end
  assign wire38 = (~|(~^reg37));
  assign wire39 = (($signed(wire17) ^~ wire23[(3'h6):(3'h4)]) ?
                      (8'had) : wire17);
  assign wire40 = $signed($unsigned(($signed(wire17) ?
                      {reg29[(3'h4):(2'h3)]} : {(~&reg28)})));
  assign wire41 = {wire20[(1'h1):(1'h1)], $unsigned(wire20[(1'h0):(1'h0)])};
  assign wire42 = wire21;
  assign wire43 = wire40[(2'h2):(1'h0)];
  assign wire44 = reg33;
  assign wire45 = ((!(reg25 <<< $unsigned(((8'ha5) ? reg28 : reg24)))) ?
                      reg36 : $signed({({wire19, wire20} | (8'ha9))}));
  assign wire46 = ((({$signed(wire40), $signed(reg28)} > (reg25 ?
                          $unsigned(wire42) : wire20)) ?
                      (|(^~$signed(wire42))) : wire17[(1'h1):(1'h0)]) ^ ((^~(reg24[(3'h7):(1'h1)] ?
                      wire38[(2'h3):(2'h2)] : (wire42 ?
                          (8'hbf) : (8'ha3)))) | (reg37[(3'h6):(3'h6)] ?
                      wire19[(1'h0):(1'h0)] : (~&reg36[(4'h8):(3'h5)]))));
  assign wire47 = ({wire38[(2'h3):(2'h2)], (8'h9e)} >= (|wire43));
endmodule
