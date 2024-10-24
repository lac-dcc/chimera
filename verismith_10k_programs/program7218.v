module top
#(parameter param82 = {((^~((|(8'haa)) ~^ {(8'ha3)})) + ((((8'hbb) < (8'hbe)) * {(8'hab)}) ? (8'ha6) : {((8'hbc) == (8'had)), ((7'h40) < (7'h44))})), (({((8'hb2) ? (8'ha3) : (8'ha4))} <= (~&(+(8'ha1)))) ? ((~((8'ha6) ? (8'h9c) : (8'ha6))) ? ((&(8'hb3)) ? ((8'haa) == (8'hb3)) : ((8'hbc) ? (8'h9f) : (8'hb9))) : {(+(8'had)), {(8'ha8)}}) : (^{(~(8'hb0))}))}, 
parameter param83 = (^~(&{param82})))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(4'hd):(1'h0)] wire1;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire3;
  input wire signed [(4'hb):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire81;
  wire signed [(5'h10):(1'h0)] wire80;
  wire [(4'hf):(1'h0)] wire79;
  wire [(3'h4):(1'h0)] wire78;
  wire signed [(5'h10):(1'h0)] wire77;
  wire [(2'h2):(1'h0)] wire76;
  wire [(5'h13):(1'h0)] wire75;
  wire signed [(4'hc):(1'h0)] wire74;
  wire signed [(3'h4):(1'h0)] wire73;
  wire [(3'h5):(1'h0)] wire72;
  wire [(4'hd):(1'h0)] wire71;
  wire signed [(3'h7):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(5'h15):(1'h0)] wire68;
  assign y = {wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire68,
                 (1'h0)};
  assign wire5 = {$signed(wire1)};
  assign wire6 = (+((+(wire0 ? (&wire2) : $signed((8'hb5)))) ?
                     wire3[(1'h0):(1'h0)] : wire2[(3'h6):(3'h5)]));
  assign wire7 = $unsigned((&({wire1[(3'h6):(2'h3)]} ?
                     wire0 : $signed($signed(wire1)))));
  assign wire8 = (^wire7);
  module9 #() modinst69 (wire68, clk, wire1, wire7, wire4, wire2, wire5);
  assign wire70 = (8'ha2);
  assign wire71 = $signed((wire0[(4'h9):(2'h2)] == ({(wire6 ?
                          wire8 : (8'ha1))} ^~ ($unsigned(wire70) ^ (+wire3)))));
  assign wire72 = $unsigned($signed($signed(wire3)));
  assign wire73 = $unsigned((~^($unsigned(wire3) <= $signed((-wire1)))));
  assign wire74 = (wire72 ?
                      {$signed($unsigned((wire4 > wire1))),
                          ((&(~|wire68)) ~^ wire5)} : ($unsigned((^~wire71)) ?
                          (~|wire70[(1'h0):(1'h0)]) : ($unsigned((wire70 ?
                              (8'hbf) : wire7)) && $signed((~wire6)))));
  assign wire75 = wire71;
  assign wire76 = wire70[(3'h5):(3'h4)];
  assign wire77 = (wire7 ?
                      (wire71[(3'h5):(2'h2)] ?
                          wire4 : $unsigned((8'hbb))) : ((~|((!wire8) | $signed(wire68))) == (((&wire75) ?
                          {wire7} : $unsigned(wire74)) ~^ (wire73 ?
                          $signed(wire74) : $unsigned(wire68)))));
  assign wire78 = $signed(((8'hb6) ?
                      {$unsigned(wire68)} : (wire8[(2'h2):(2'h2)] ?
                          $signed($signed(wire5)) : wire2)));
  assign wire79 = $signed($unsigned($signed({(wire6 ? wire1 : wire74)})));
  assign wire80 = (!((wire7 * wire4) ? wire1[(3'h7):(2'h3)] : wire8));
  assign wire81 = $unsigned(wire76[(1'h1):(1'h0)]);
endmodule

module module9
#(parameter param66 = ({(^{((8'haa) <<< (8'hb2)), ((8'hb6) && (8'hb1))}), {(((8'ha0) <<< (7'h43)) && ((7'h43) * (7'h43))), (((8'hb0) >>> (8'hab)) >= ((8'ha1) ~^ (8'h9d)))}} ? (^(((-(8'hb8)) || {(8'hb7)}) ? (|{(8'ha1), (8'hbf)}) : (-((8'had) != (8'hb3))))) : ((!(+{(7'h41), (8'ha8)})) ? (~^(((8'hb6) ? (8'had) : (8'ha6)) - ((8'hb8) ? (8'had) : (7'h40)))) : {{(~&(8'haa))}})), 
parameter param67 = (8'h9f))
(y, clk, wire10, wire11, wire12, wire13, wire14);
  output wire [(32'h6d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire10;
  input wire signed [(4'hd):(1'h0)] wire11;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'h8):(1'h0)] wire65;
  wire signed [(2'h3):(1'h0)] wire61;
  wire [(4'hf):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire58;
  wire signed [(5'h13):(1'h0)] wire15;
  wire signed [(4'h8):(1'h0)] wire16;
  wire signed [(3'h4):(1'h0)] wire56;
  reg [(4'hb):(1'h0)] reg64 = (1'h0);
  reg [(4'h8):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  assign y = {wire65,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire15,
                 wire16,
                 wire56,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire15 = (8'hbe);
  assign wire16 = (wire12 & wire12[(4'h9):(3'h7)]);
  module17 #() modinst57 (.wire21(wire16), .wire18(wire14), .clk(clk), .y(wire56), .wire20(wire15), .wire22(wire13), .wire19(wire11));
  assign wire58 = $unsigned({(-wire12[(1'h0):(1'h0)])});
  assign wire59 = {wire15[(2'h2):(2'h2)]};
  assign wire60 = wire56;
  assign wire61 = (~&wire11[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg62 <= wire61[(1'h0):(1'h0)];
      reg63 <= (8'hb2);
      reg64 <= wire11;
    end
  assign wire65 = (({$unsigned((wire14 ? wire10 : wire61))} <= (wire61 ?
                          (reg63 ?
                              reg62 : wire12[(4'h9):(1'h1)]) : (~|(wire10 <<< wire58)))) ?
                      $signed($signed(((wire13 ?
                          wire14 : reg63) && $signed(wire12)))) : reg62);
endmodule

module module17  (y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h150):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire22;
  input wire [(3'h7):(1'h0)] wire21;
  input wire [(5'h13):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  wire [(4'hf):(1'h0)] wire55;
  wire signed [(4'hd):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  wire signed [(3'h6):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(4'hb):(1'h0)] wire49;
  wire [(5'h10):(1'h0)] wire48;
  wire signed [(4'he):(1'h0)] wire47;
  wire signed [(3'h5):(1'h0)] wire46;
  wire signed [(4'hf):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  wire signed [(4'h9):(1'h0)] wire32;
  wire [(5'h11):(1'h0)] wire31;
  wire signed [(4'h8):(1'h0)] wire30;
  wire [(5'h15):(1'h0)] wire29;
  wire [(3'h5):(1'h0)] wire24;
  wire [(5'h10):(1'h0)] wire23;
  reg [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg [(5'h14):(1'h0)] reg41 = (1'h0);
  reg [(4'hc):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg37 = (1'h0);
  reg [(2'h2):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg [(5'h15):(1'h0)] reg25 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire24,
                 wire23,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire23 = (~wire19[(2'h2):(1'h0)]);
  assign wire24 = {$unsigned($unsigned(wire18[(3'h5):(1'h0)])), (8'hb3)};
  always
    @(posedge clk) begin
      reg25 <= wire23;
      reg26 <= reg25[(4'hc):(3'h5)];
      reg27 <= (~|wire19);
      reg28 <= {wire24[(1'h1):(1'h0)]};
    end
  assign wire29 = $unsigned(({(&(8'hbf))} + $unsigned((^reg27))));
  assign wire30 = (wire18 ?
                      ($unsigned(((reg27 == wire21) << wire21[(3'h6):(1'h1)])) ?
                          wire18[(3'h5):(3'h4)] : (-(~|(^reg26)))) : $unsigned(reg26));
  assign wire31 = ($unsigned((+$unsigned($signed(wire19)))) ?
                      wire21 : (^(~|wire30)));
  assign wire32 = ($unsigned(wire30) ? reg28 : wire18);
  assign wire33 = (reg26[(1'h1):(1'h1)] ? $signed(reg27) : wire23);
  assign wire34 = (+(~(wire21 ?
                      ($unsigned(wire30) ?
                          wire22[(2'h3):(1'h1)] : (reg26 ?
                              wire32 : reg26)) : $unsigned(wire21[(1'h0):(1'h0)]))));
  always
    @(posedge clk) begin
      reg35 <= (~&reg25);
      if ((+(&($unsigned(wire19) ?
          ((reg28 ? wire23 : (8'ha2)) ?
              (reg25 ?
                  wire18 : wire29) : $unsigned(wire23)) : ((wire34 ~^ reg27) ?
              (reg27 ? reg28 : reg28) : (wire22 ? wire33 : wire31))))))
        begin
          if (((!$signed(($unsigned(wire22) * $signed(wire34)))) ?
              (wire21[(3'h4):(2'h2)] ?
                  $unsigned(((wire18 ? wire30 : wire31) ?
                      $unsigned(wire20) : (reg35 ?
                          wire21 : wire19))) : reg27[(3'h6):(3'h4)]) : ($signed(reg27[(2'h3):(1'h1)]) >= {(reg28[(1'h0):(1'h0)] > (~^reg28))})))
            begin
              reg36 <= wire22[(5'h12):(3'h4)];
              reg37 <= ($unsigned(((((8'hb2) ? wire21 : wire20) ?
                          wire31[(5'h11):(4'hc)] : (~^wire20)) ?
                      reg26 : $signed($unsigned(reg26)))) ?
                  {{$unsigned((reg35 != wire19))}} : $signed((~^wire34)));
            end
          else
            begin
              reg36 <= (|($unsigned($signed((wire24 ?
                  wire19 : reg27))) != ($signed((&wire23)) << $unsigned((8'hbe)))));
              reg37 <= wire24[(1'h0):(1'h0)];
              reg38 <= wire24;
              reg39 <= (wire20[(3'h4):(2'h2)] ?
                  $signed(((reg38 ? wire31 : (!reg36)) ?
                      wire23[(3'h6):(3'h5)] : $unsigned(((8'ha8) ?
                          (8'h9c) : reg25)))) : ($unsigned((8'hb5)) <= (($unsigned(reg37) <<< (wire31 >>> reg25)) < wire24[(3'h4):(1'h0)])));
              reg40 <= (^$signed($unsigned(($signed(wire22) ?
                  wire24[(1'h0):(1'h0)] : $signed(reg35)))));
            end
          reg41 <= $unsigned((~|wire33));
        end
      else
        begin
          reg36 <= {{(~($unsigned(wire18) ?
                      (wire18 ? reg28 : wire24) : $unsigned(wire23))),
                  wire19[(2'h3):(2'h3)]},
              reg37[(2'h3):(2'h2)]};
          reg37 <= $signed(wire18[(3'h5):(1'h1)]);
          if ({reg25})
            begin
              reg38 <= ($unsigned(reg27[(1'h1):(1'h1)]) ?
                  wire29[(2'h3):(1'h1)] : {($signed(reg41[(5'h12):(2'h3)]) && ((!wire32) >> reg41))});
              reg39 <= (~|({wire21[(3'h6):(3'h5)],
                  wire18[(1'h0):(1'h0)]} & $unsigned({{wire19, wire31},
                  (7'h44)})));
              reg40 <= ((!wire32) ? wire34 : reg36);
            end
          else
            begin
              reg38 <= reg38;
            end
          if (({wire33,
              (wire22 ?
                  reg26[(1'h1):(1'h0)] : $signed(reg39[(1'h0):(1'h0)]))} | wire32))
            begin
              reg41 <= (~^$unsigned($signed(wire18[(3'h6):(3'h5)])));
              reg42 <= (&(~^reg37[(2'h2):(1'h0)]));
              reg43 <= (|$unsigned($signed(((~^reg41) ?
                  (reg39 ? wire24 : (8'haa)) : (wire22 || wire19)))));
            end
          else
            begin
              reg41 <= {{((wire20[(5'h13):(1'h1)] < (reg41 ?
                          wire22 : reg26)) & $unsigned($signed(reg42))),
                      $unsigned(((reg41 ^ wire33) >= {reg42, wire22}))},
                  {(+$unsigned($unsigned((8'hb2))))}};
              reg42 <= $signed((^~$unsigned((8'hb6))));
            end
        end
      reg44 <= $signed($unsigned({reg36[(1'h1):(1'h1)],
          wire18[(1'h0):(1'h0)]}));
      reg45 <= $signed((&(&(wire33 ? $unsigned(reg38) : (wire32 & wire33)))));
    end
  assign wire46 = reg44;
  assign wire47 = ($signed((^~reg44[(4'ha):(1'h1)])) ?
                      (reg41 ~^ (&($unsigned(wire21) ?
                          reg38 : ((8'h9e) > reg38)))) : (^~$signed($signed(reg40))));
  assign wire48 = ((-$signed(((wire22 & wire32) ?
                      $unsigned(wire30) : reg25))) | reg25[(3'h7):(3'h5)]);
  assign wire49 = reg25;
  assign wire50 = reg43;
  assign wire51 = reg28[(1'h1):(1'h0)];
  assign wire52 = (7'h42);
  assign wire53 = {(wire48 == wire24[(2'h2):(1'h0)])};
  assign wire54 = (&(~&wire31[(3'h5):(1'h0)]));
  assign wire55 = wire49;
endmodule
