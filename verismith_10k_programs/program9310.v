module top
#(parameter param71 = ((^(+{(!(8'hb9)), ((8'ha8) != (7'h43))})) > (+((((8'hbb) ? (8'had) : (8'hb3)) ? ((8'hab) ? (8'h9c) : (8'ha0)) : (&(7'h44))) ? (((8'h9f) < (8'hbf)) ? {(8'ha8)} : ((8'h9c) > (8'h9f))) : (((8'ha4) ^ (8'ha9)) ^ ((8'haf) && (8'ha3)))))), 
parameter param72 = (&((param71 ~^ (param71 << (param71 ? param71 : (8'hb3)))) ? (param71 ? param71 : ({param71, param71} ? (param71 == param71) : param71)) : (param71 || {((8'hbc) ? param71 : param71)}))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire [(4'hc):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(5'h13):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire [(3'h6):(1'h0)] wire57;
  wire [(3'h7):(1'h0)] wire56;
  wire signed [(4'hd):(1'h0)] wire54;
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(3'h5):(1'h0)] reg61 = (1'h0);
  reg [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg58 = (1'h0);
  assign y = {wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire57,
                 wire56,
                 wire54,
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
  module4 #() modinst55 (.wire8(wire0), .clk(clk), .wire6(wire3), .wire7(wire1), .y(wire54), .wire5(wire2));
  assign wire56 = wire3[(1'h1):(1'h0)];
  assign wire57 = ($signed(wire2[(1'h0):(1'h0)]) ?
                      {$unsigned((wire0 <<< $signed(wire54)))} : $unsigned(((8'h9e) ?
                          ($signed(wire0) != {(7'h44)}) : (~&$unsigned(wire0)))));
  always
    @(posedge clk) begin
      if (((wire57[(3'h6):(2'h2)] & $signed((wire54 | wire0))) ?
          (wire2[(4'hc):(3'h4)] ?
              $signed((wire1[(5'h10):(4'ha)] ^ (wire54 ?
                  (8'hb0) : (8'haf)))) : wire56[(3'h7):(3'h5)]) : {$unsigned(wire3)}))
        begin
          if (($signed((+((~|wire3) ?
              $signed((8'hb8)) : $unsigned(wire1)))) >>> $unsigned(((~^$unsigned((8'hae))) < ($signed(wire1) ?
              wire2 : (wire0 > wire2))))))
            begin
              reg58 <= {{$unsigned($signed({(8'haf)})), wire2}};
              reg59 <= (~&{{(~{wire57, wire3})},
                  $signed(((~^wire56) ~^ wire54))});
            end
          else
            begin
              reg58 <= $unsigned((wire3[(4'hc):(4'hb)] << $signed(((~^wire0) ^~ wire1[(2'h3):(1'h1)]))));
              reg59 <= wire2;
            end
        end
      else
        begin
          reg58 <= ($signed(((&wire0) ?
              wire54[(4'hc):(4'ha)] : $signed($unsigned(wire1)))) - ((8'haf) ?
              wire57[(2'h2):(1'h0)] : $unsigned(wire2[(4'hb):(3'h7)])));
          if ((wire54 ?
              reg58[(4'h8):(3'h4)] : (({((8'hbc) >= reg59)} >>> {wire56}) << (!($unsigned(wire2) ?
                  wire54 : (7'h40))))))
            begin
              reg59 <= {(7'h43), $signed(reg59[(2'h2):(1'h1)])};
              reg60 <= wire57;
              reg61 <= (~&$signed($signed((wire0[(4'hb):(2'h3)] ?
                  reg59 : $signed(reg58)))));
              reg62 <= (wire56 ?
                  (&{((^(8'ha0)) >= (wire1 ? reg60 : wire1)),
                      $signed(wire1)}) : $signed(({$signed((8'h9f)),
                          (wire1 ? reg61 : reg58)} ?
                      {(wire2 ?
                              reg58 : wire1)} : ($unsigned(wire1) + $unsigned(wire57)))));
              reg63 <= ($signed({((~(8'hae)) < reg58),
                  $signed({(8'ha2)})}) >> ((8'h9d) + wire2));
            end
          else
            begin
              reg59 <= wire54[(3'h7):(3'h4)];
              reg60 <= $unsigned({(((wire1 & wire2) < (~reg62)) ?
                      $unsigned({(8'hac), wire57}) : ($unsigned(wire0) ?
                          (reg58 ^ reg60) : (~^wire54)))});
              reg61 <= wire57;
              reg62 <= (^~reg59[(1'h0):(1'h0)]);
            end
          reg64 <= reg59[(1'h0):(1'h0)];
        end
      reg65 <= ($unsigned($signed($unsigned(reg58[(4'h9):(2'h3)]))) ?
          $unsigned($signed($signed((!reg61)))) : ($signed(((^reg64) >= reg64[(1'h1):(1'h0)])) - wire2[(4'h9):(2'h2)]));
      reg66 <= (|(&reg65));
    end
  assign wire67 = reg62;
  assign wire68 = wire57;
  assign wire69 = $unsigned((($unsigned($unsigned(wire68)) != (reg58[(3'h5):(2'h2)] ?
                      wire3[(4'hd):(2'h2)] : {wire2})) == (8'hb3)));
  assign wire70 = $unsigned(wire57[(3'h5):(1'h0)]);
endmodule

module module4
#(parameter param52 = ((((((7'h43) ? (8'hab) : (8'ha7)) ? {(8'ha9), (8'hb1)} : ((8'ha1) << (8'haf))) ? {((8'hb8) == (8'ha8)), (~|(7'h43))} : ((|(8'haa)) ? ((8'hb7) & (8'hb9)) : ((8'h9c) ? (8'hba) : (8'ha0)))) ? {(((8'ha7) ^~ (8'ha7)) ? (^~(8'h9d)) : (8'h9d)), ((+(8'hae)) ? ((8'ha2) + (8'hb1)) : ((8'ha5) <= (8'ha2)))} : {((~^(8'hb1)) ? {(8'hb1), (7'h40)} : {(8'h9f)})}) ? (((((8'ha1) <= (8'ha1)) >= ((8'hb9) && (8'hb9))) < {{(8'hac)}, ((8'hb9) ? (8'h9c) : (8'h9c))}) ^~ ((+((8'h9d) ? (8'haf) : (8'hb7))) * (+((8'hbb) ? (8'haf) : (7'h41))))) : (~|(((~(8'hb6)) == ((8'h9d) ? (8'hb7) : (7'h41))) ? (((8'hac) ? (8'hbc) : (8'ha2)) ? ((8'hbc) ? (8'h9c) : (8'ha7)) : ((7'h40) ? (7'h41) : (8'had))) : (8'hb7)))), 
parameter param53 = param52)
(y, clk, wire5, wire6, wire7, wire8);
  output wire [(32'h69):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire5;
  input wire [(3'h6):(1'h0)] wire6;
  input wire signed [(5'h10):(1'h0)] wire7;
  input wire signed [(3'h7):(1'h0)] wire8;
  wire [(2'h2):(1'h0)] wire51;
  wire signed [(5'h11):(1'h0)] wire50;
  wire signed [(3'h6):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(4'hc):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire40;
  reg [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire44,
                 wire43,
                 wire42,
                 wire9,
                 wire40,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  assign wire9 = $unsigned(((((wire6 == wire7) ?
                         {wire8, wire6} : (wire7 ?
                             wire8 : wire7)) <= (~^$signed(wire6))) ?
                     ($unsigned($signed(wire5)) & wire8) : {$unsigned($unsigned(wire7)),
                         (wire5[(4'ha):(2'h2)] << $unsigned((8'h9d)))}));
  module10 #() modinst41 (wire40, clk, wire5, wire8, wire7, wire6, wire9);
  assign wire42 = ((wire6 ?
                      (^~((8'ha8) >>> (wire6 * (8'hb7)))) : ((|(wire8 ^ wire40)) ?
                          ($signed(wire7) ?
                              {wire5} : {wire7,
                                  wire40}) : $unsigned($signed((8'ha9))))) * ((((-wire9) ?
                      wire6[(3'h6):(3'h5)] : wire5) >> $unsigned(wire40[(1'h1):(1'h0)])) - wire7[(2'h2):(1'h0)]));
  assign wire43 = (+(wire40 != ((~|$signed(wire42)) + (~(~&wire40)))));
  assign wire44 = $signed(wire8[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if (wire44)
        begin
          reg45 <= ($signed((8'hbd)) + ($unsigned(wire9[(2'h2):(2'h2)]) ?
              $unsigned(({wire8,
                  wire40} * $unsigned(wire43))) : $signed((~^$signed(wire40)))));
          reg46 <= wire44;
          reg47 <= (!reg46[(3'h4):(3'h4)]);
        end
      else
        begin
          reg45 <= {$unsigned(wire9[(3'h5):(2'h2)]),
              ({$signed(wire9[(1'h1):(1'h0)]),
                      $unsigned(wire8[(3'h6):(2'h3)])} ?
                  {reg45, $signed((~&(8'hb9)))} : (7'h41))};
        end
    end
  assign wire48 = {wire40[(3'h7):(2'h2)]};
  assign wire49 = wire48;
  assign wire50 = wire5[(3'h4):(2'h2)];
  assign wire51 = (($unsigned((~^wire50)) + reg45[(3'h4):(2'h2)]) >= {($signed(reg45) ?
                          wire44 : wire40[(1'h1):(1'h0)])});
endmodule

module module10
#(parameter param39 = ((+{((8'hbc) > ((8'hb3) ? (8'hb6) : (7'h40)))}) ? (~|({((8'ha1) * (8'hb2)), ((8'ha6) ? (8'hb2) : (8'h9e))} | ((-(8'hab)) | ((8'hb7) ? (8'ha1) : (8'hb2))))) : {{((+(8'hb5)) || ((8'ha6) ? (8'ha7) : (8'hb2))), {((8'hb4) ? (8'ha3) : (8'hb9)), {(7'h40)}}}}))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h10f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire15;
  input wire [(3'h7):(1'h0)] wire14;
  input wire signed [(3'h4):(1'h0)] wire13;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire [(2'h3):(1'h0)] wire11;
  wire [(5'h11):(1'h0)] wire38;
  wire [(5'h11):(1'h0)] wire37;
  wire signed [(4'ha):(1'h0)] wire36;
  wire [(4'ha):(1'h0)] wire35;
  wire signed [(3'h4):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(5'h10):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire28;
  wire [(4'hc):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire [(3'h6):(1'h0)] wire24;
  wire signed [(3'h4):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'hc):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire [(4'h9):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  reg signed [(5'h10):(1'h0)] reg29 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg29,
                 (1'h0)};
  assign wire16 = wire11;
  assign wire17 = wire13;
  assign wire18 = wire14[(2'h2):(2'h2)];
  assign wire19 = wire16[(3'h5):(1'h1)];
  assign wire20 = wire18;
  assign wire21 = (^~$signed($signed((8'hae))));
  assign wire22 = $signed(wire18[(1'h1):(1'h1)]);
  assign wire23 = $unsigned({wire19});
  assign wire24 = (+$unsigned($unsigned((8'ha2))));
  assign wire25 = wire13[(2'h3):(1'h1)];
  assign wire26 = (((((7'h43) ?
                          wire25[(1'h1):(1'h0)] : (-wire24)) ^ $unsigned((wire13 >= wire17))) ?
                      $signed($signed(wire20)) : wire11[(1'h0):(1'h0)]) >>> wire21);
  assign wire27 = (wire20 ?
                      wire13 : (~$unsigned((^~(wire24 ? wire23 : wire19)))));
  assign wire28 = wire13;
  always
    @(posedge clk) begin
      reg29 <= $signed(((($signed(wire24) >= wire16[(4'hb):(2'h3)]) + (~wire22)) ?
          (+wire22[(2'h3):(2'h2)]) : $unsigned(((-(8'hbc)) == (wire27 ?
              wire11 : wire19)))));
    end
  assign wire30 = $unsigned(({$unsigned({wire19})} << $unsigned(wire26[(4'h8):(2'h2)])));
  assign wire31 = ({(wire22 || ((wire25 >> wire19) ? (!(8'hb0)) : wire12)),
                          (8'h9c)} ?
                      {((|$signed(wire22)) ?
                              ((wire28 >> wire30) ?
                                  wire14[(2'h2):(1'h0)] : wire25) : wire18[(1'h1):(1'h0)])} : (wire18[(2'h2):(2'h2)] <= (8'haf)));
  assign wire32 = $unsigned((($signed($signed(reg29)) - wire30[(2'h2):(1'h0)]) ?
                      wire11[(2'h3):(2'h3)] : ((!wire16[(3'h4):(2'h2)]) >= $unsigned(wire18))));
  assign wire33 = ((~($signed({wire11, wire18}) <= {((7'h40) <<< wire13),
                      (wire20 ? wire32 : (8'hb7))})) ~^ $unsigned(wire11));
  assign wire34 = $unsigned(wire21);
  assign wire35 = (~|(^~wire19));
  assign wire36 = $unsigned(wire33);
  assign wire37 = wire27[(4'h8):(2'h2)];
  assign wire38 = (wire14 & wire13[(1'h0):(1'h0)]);
endmodule
