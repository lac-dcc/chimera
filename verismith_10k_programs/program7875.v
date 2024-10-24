module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hee):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h14):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire [(4'hf):(1'h0)] wire74;
  wire signed [(5'h15):(1'h0)] wire72;
  wire signed [(3'h4):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(4'hf):(1'h0)] wire9;
  wire signed [(5'h11):(1'h0)] wire8;
  wire signed [(4'ha):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  reg [(3'h7):(1'h0)] reg73 = (1'h0);
  reg [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(5'h11):(1'h0)] reg70 = (1'h0);
  reg [(4'hd):(1'h0)] reg69 = (1'h0);
  reg [(5'h14):(1'h0)] reg68 = (1'h0);
  reg [(4'hc):(1'h0)] reg5 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
                 wire67,
                 wire66,
                 wire64,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 reg73,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
                 reg5,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= (~|$signed($unsigned(wire1[(2'h3):(2'h2)])));
    end
  assign wire6 = ((|$signed(wire2)) ?
                     (($signed(wire2[(1'h1):(1'h0)]) ?
                             ((reg5 ? wire4 : wire4) ?
                                 {reg5,
                                     wire0} : wire4) : (wire0[(4'hd):(4'h9)] || wire3)) ?
                         $unsigned(($unsigned(wire4) ?
                             (8'h9f) : {wire0})) : wire0) : {(-$signed({wire3}))});
  assign wire7 = $signed({($unsigned(wire0[(4'he):(3'h5)]) ?
                         wire3[(2'h2):(1'h0)] : wire0),
                     wire2[(5'h12):(2'h3)]});
  assign wire8 = {{(wire1[(4'ha):(3'h4)] ^ wire2[(3'h7):(2'h2)])}};
  assign wire9 = ($unsigned($signed($unsigned($unsigned((8'ha3))))) >>> (8'hb5));
  assign wire10 = (((($signed(wire6) ?
                          (wire8 & wire3) : $signed((8'ha3))) && $unsigned(wire7[(3'h5):(3'h5)])) ?
                      ((~^$unsigned(reg5)) >>> (^~reg5)) : {((wire9 ?
                              wire6 : wire6) ^~ (wire2 ?
                              wire2 : wire8))}) == wire3);
  module11 #() modinst65 (.clk(clk), .wire15(wire6), .wire13(wire4), .wire14(wire2), .wire12(wire8), .y(wire64));
  assign wire66 = wire64;
  assign wire67 = (!(wire1 >>> wire1));
  always
    @(posedge clk) begin
      reg68 <= $unsigned(((wire0 ~^ $unsigned(wire3)) ?
          $signed(wire64[(1'h0):(1'h0)]) : reg5));
      reg69 <= $unsigned($unsigned(((!wire9) ^ wire66)));
      reg70 <= {$unsigned(((wire64 & {wire4}) ?
              $signed((wire8 | wire8)) : {$unsigned((8'hb8)),
                  (reg68 ? wire9 : wire4)})),
          {$signed(((~^wire66) << reg69[(1'h0):(1'h0)])), wire2}};
      reg71 <= {((((reg69 ? wire9 : wire0) ~^ (wire8 ?
              wire8 : reg69)) >> (8'ha2)) >= $signed($signed((^wire67)))),
          $signed(wire9)};
    end
  assign wire72 = wire7[(4'h8):(3'h5)];
  always
    @(posedge clk) begin
      reg73 <= $unsigned($unsigned(((wire0[(3'h5):(2'h2)] || (wire4 >>> wire10)) ?
          (-$signed(wire2)) : $signed((8'hb8)))));
    end
  assign wire74 = (wire72[(3'h7):(3'h6)] ?
                      {$signed(((reg5 >> (8'hb3)) + (|wire1))),
                          wire4[(3'h7):(1'h1)]} : $unsigned(wire6));
  assign wire75 = wire74[(2'h3):(1'h0)];
  assign wire76 = wire75;
  assign wire77 = ((reg70[(4'he):(2'h2)] ?
                          $unsigned((&wire2)) : (!(wire66 ?
                              ((7'h40) ? wire2 : wire2) : wire3))) ?
                      wire1[(1'h0):(1'h0)] : (8'haf));
endmodule

module module11
#(parameter param62 = {(({((8'ha4) ? (8'hb0) : (8'h9e)), ((7'h40) ? (8'hb2) : (8'hae))} ? (((7'h43) ? (8'hb7) : (8'hb5)) ^~ ((8'h9c) ? (7'h40) : (8'hae))) : (((8'hb0) ~^ (7'h40)) ? ((8'haf) < (8'had)) : ((8'h9f) ? (8'hb8) : (8'ha1)))) ^ {({(7'h44), (8'hb2)} ~^ (~^(8'ha0))), ({(8'hb2)} > (~^(7'h44)))})}, 
parameter param63 = (param62 ^ {(param62 < ((param62 & (8'hbb)) ? param62 : (~param62))), ((&(~|param62)) ? (param62 == (param62 * param62)) : ((param62 & param62) >= (~param62)))}))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h40):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire15;
  input wire signed [(2'h3):(1'h0)] wire14;
  input wire [(4'hf):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire12;
  wire [(3'h5):(1'h0)] wire61;
  wire signed [(5'h13):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire55;
  assign y = {wire61, wire60, wire59, wire58, wire57, wire55, (1'h0)};
  module16 #() modinst56 (.wire20(wire15), .wire18(wire13), .y(wire55), .wire19(wire12), .wire21(wire14), .wire17((8'hbb)), .clk(clk));
  assign wire57 = $unsigned((8'hb8));
  assign wire58 = wire13;
  assign wire59 = $signed(($unsigned(wire13[(4'hf):(3'h7)]) ?
                      $unsigned(wire55[(1'h0):(1'h0)]) : (~^wire13)));
  assign wire60 = wire59;
  assign wire61 = (wire57[(2'h3):(1'h0)] ?
                      $signed(wire58[(4'h8):(3'h4)]) : (wire12 ?
                          ($unsigned((!wire59)) >> $unsigned($signed(wire15))) : ((|(|wire58)) >> $signed($signed(wire12)))));
endmodule

module module16
#(parameter param54 = (((-(8'hab)) >= (~((^(8'ha3)) <= (8'ha7)))) <<< (^((((8'hb5) != (8'h9e)) ? (^~(8'ha2)) : ((8'hbd) ? (8'ha4) : (8'hb1))) && (^~{(8'hb5), (8'haa)})))))
(y, clk, wire21, wire20, wire19, wire18, wire17);
  output wire [(32'h143):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(4'ha):(1'h0)] wire18;
  input wire [(4'hd):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire53;
  wire signed [(4'h9):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire45;
  wire signed [(4'he):(1'h0)] wire44;
  wire signed [(2'h2):(1'h0)] wire26;
  wire signed [(3'h6):(1'h0)] wire25;
  wire signed [(2'h3):(1'h0)] wire24;
  wire [(4'hb):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(3'h4):(1'h0)] reg47 = (1'h0);
  reg [(4'hb):(1'h0)] reg43 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h7):(1'h0)] reg41 = (1'h0);
  reg [(5'h10):(1'h0)] reg40 = (1'h0);
  reg [(4'hc):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg [(4'hc):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg31 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire46,
                 wire45,
                 wire44,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 reg49,
                 reg48,
                 reg47,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
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
                 reg28,
                 reg27,
                 (1'h0)};
  assign wire22 = $signed(wire18);
  assign wire23 = (|(($unsigned({wire18, (8'hac)}) > (8'ha7)) ?
                      (($signed(wire22) ?
                          wire20 : $unsigned(wire18)) & $signed(wire19)) : wire21[(2'h2):(1'h0)]));
  assign wire24 = $signed(wire19[(3'h5):(2'h3)]);
  assign wire25 = ({$signed(wire21[(1'h1):(1'h0)]),
                          (^~((wire22 ? wire18 : wire18) ?
                              (wire24 | (8'hbc)) : (wire22 <= wire19)))} ?
                      $unsigned($signed($signed(wire20[(3'h5):(3'h5)]))) : $unsigned((~^((wire22 ?
                              wire17 : wire21) ?
                          (^~wire23) : $signed(wire19)))));
  assign wire26 = $signed(wire21[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg27 <= wire18[(2'h2):(1'h1)];
      reg28 <= wire24;
      if (wire22)
        begin
          reg29 <= $unsigned($signed($unsigned($unsigned($signed(wire26)))));
          reg30 <= wire18;
          reg31 <= $signed((wire19[(4'ha):(2'h3)] && $unsigned(((~reg27) ?
              $signed(reg27) : (~reg27)))));
        end
      else
        begin
          reg29 <= ({$signed(wire20[(4'he):(4'hc)])} ^ (wire22[(2'h2):(1'h1)] ?
              ($signed(wire17[(4'h8):(4'h8)]) ^ ((wire26 ?
                  wire23 : reg28) ~^ (wire19 ?
                  wire19 : wire23))) : ($unsigned($unsigned(wire19)) ?
                  wire19[(4'he):(4'h8)] : $unsigned($unsigned(reg30)))));
          if ($signed(((+((wire18 >> wire22) < reg27[(1'h1):(1'h0)])) >> {wire21[(2'h2):(2'h2)]})))
            begin
              reg30 <= ($unsigned((~wire25[(3'h5):(2'h2)])) == (((wire18 ?
                      {wire23, wire25} : ((8'hb6) == (8'ha3))) > wire24) ?
                  wire19[(5'h10):(4'hc)] : ($signed((wire17 ?
                          wire22 : wire25)) ?
                      $signed(reg27[(1'h0):(1'h0)]) : (8'h9c))));
              reg31 <= $unsigned((({(&reg31), reg27[(1'h0):(1'h0)]} ?
                  ($signed(wire24) ? wire22 : wire18) : ((~&reg28) ?
                      (&reg28) : wire22)) ~^ ($unsigned({reg27}) > wire26[(1'h0):(1'h0)])));
              reg32 <= reg28[(2'h2):(2'h2)];
            end
          else
            begin
              reg30 <= wire20;
              reg31 <= (reg28 ? $signed($unsigned(wire24)) : wire19);
              reg32 <= wire25[(3'h4):(3'h4)];
              reg33 <= wire26;
            end
          reg34 <= {({wire21, wire20[(5'h10):(4'he)]} ?
                  $signed(reg29) : ($unsigned((wire17 > (8'ha0))) <= ($signed(reg28) == (reg31 ?
                      wire22 : wire26))))};
          reg35 <= wire17[(4'hd):(1'h1)];
        end
    end
  always
    @(posedge clk) begin
      if (($signed({reg27}) < wire17[(4'hb):(3'h6)]))
        begin
          if ($unsigned($unsigned((^~((!reg32) - wire26[(1'h0):(1'h0)])))))
            begin
              reg36 <= ($signed({reg32[(3'h7):(3'h6)]}) ~^ (wire26[(1'h0):(1'h0)] | (~^(~&wire22))));
              reg37 <= (!$signed(($signed((reg32 <= (7'h42))) ?
                  reg29[(3'h5):(3'h4)] : (+(~|wire19)))));
              reg38 <= ($signed(reg36) >>> (~|$unsigned($signed(wire23[(2'h3):(1'h1)]))));
              reg39 <= (~^reg35);
              reg40 <= $signed($unsigned(($unsigned((wire25 && reg37)) <= reg36)));
            end
          else
            begin
              reg36 <= reg32;
              reg37 <= (&({{wire24, reg39}} >> $unsigned(((8'hab) ?
                  wire18 : (8'ha0)))));
            end
        end
      else
        begin
          reg36 <= $signed({$unsigned(((reg40 + reg38) == $signed(wire24)))});
        end
      reg41 <= {$unsigned($signed({(wire17 != reg28)}))};
      reg42 <= wire18;
      reg43 <= $unsigned({(~wire21[(1'h0):(1'h0)])});
    end
  assign wire44 = ($signed({reg27}) ?
                      ($signed(reg42) && reg41[(3'h5):(3'h4)]) : ((({(7'h43),
                              reg40} | $signed(wire26)) ^~ (reg38 | {wire25})) ?
                          wire19[(3'h6):(3'h5)] : {(-wire18[(4'ha):(3'h6)])}));
  assign wire45 = wire24[(1'h0):(1'h0)];
  assign wire46 = $signed($signed($signed(reg40)));
  always
    @(posedge clk) begin
      reg47 <= $signed((&$signed({(+reg38)})));
      reg48 <= ({((~(-wire46)) == ((+reg37) ?
              reg35[(3'h4):(2'h2)] : (reg37 ? reg35 : reg32))),
          ((&(reg43 ? wire23 : wire18)) & (8'haf))} - $signed(reg39));
      reg49 <= ((((^~reg30[(3'h7):(3'h6)]) >= wire21) ?
              ((^(wire17 != (8'hbd))) ?
                  {wire19} : reg37[(2'h3):(2'h3)]) : wire25) ?
          reg47 : (($unsigned({reg27}) && ($signed(reg27) | (reg28 <<< reg37))) ?
              ((^~(reg27 ? (7'h42) : reg35)) ?
                  reg42 : (wire46 && $unsigned(reg37))) : ($unsigned((reg35 ?
                      reg33 : reg32)) ?
                  $unsigned((^~reg39)) : ($unsigned(wire22) ?
                      (wire44 ? reg47 : reg28) : ((8'hb5) >= wire18)))));
    end
  assign wire50 = ((((8'hb9) ?
                      (&(wire24 ? (8'ha2) : wire26)) : ((reg49 || wire45) ?
                          (+wire22) : (reg34 ?
                              reg31 : reg28))) >= (((^~reg32) ~^ reg30) ?
                      reg43 : wire45)) <= (^wire20[(4'hd):(4'h9)]));
  assign wire51 = reg32;
  assign wire52 = reg49;
  assign wire53 = (~&$signed((~wire18)));
endmodule
