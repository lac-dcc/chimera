module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire82;
  wire [(5'h15):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(4'he):(1'h0)] wire79;
  wire [(3'h5):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire77;
  wire signed [(4'he):(1'h0)] wire76;
  wire signed [(4'ha):(1'h0)] wire75;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(3'h4):(1'h0)] wire73;
  wire [(5'h13):(1'h0)] wire72;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(5'h10):(1'h0)] wire17;
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(5'h12):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg90 = (1'h0);
  reg [(5'h12):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg88 = (1'h0);
  reg [(5'h10):(1'h0)] reg87 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg86 = (1'h0);
  reg [(4'h9):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg83 = (1'h0);
  assign y = {wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire17,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 (1'h0)};
  module4 #() modinst18 (.clk(clk), .y(wire17), .wire6(wire3), .wire7(wire1), .wire8(wire2), .wire5(wire0));
  module19 #() modinst71 (wire70, clk, wire17, wire0, wire1, wire2);
  assign wire72 = $unsigned(((wire17[(4'hb):(4'hb)] && {{wire1, (8'hb7)}}) ?
                      $signed(wire2) : {((&wire0) ?
                              (wire2 - wire70) : (-(7'h44))),
                          {wire1[(5'h10):(4'ha)],
                              ((8'hac) ? wire3 : wire70)}}));
  assign wire73 = $unsigned($unsigned(wire17));
  assign wire74 = ((~|(((+wire72) > ((8'hba) ?
                      wire3 : wire72)) && wire1[(4'h9):(3'h5)])) < (!wire72[(5'h10):(4'h8)]));
  assign wire75 = wire74[(4'hf):(3'h4)];
  assign wire76 = (8'ha3);
  assign wire77 = wire75[(4'h8):(2'h2)];
  assign wire78 = (8'hbb);
  assign wire79 = wire77;
  assign wire80 = (~^wire79);
  assign wire81 = (8'hb3);
  assign wire82 = (^~($unsigned(wire79) ?
                      $signed(wire79[(3'h6):(1'h1)]) : (^wire75)));
  always
    @(posedge clk) begin
      reg83 <= ($signed(((!wire2[(4'ha):(4'h9)]) ?
              {(wire17 - wire82), (wire70 < wire2)} : wire78)) ?
          (-(wire74[(4'he):(4'hd)] ^ (((8'haf) ?
              wire76 : wire2) > wire74))) : (^wire0[(4'hb):(3'h7)]));
      if ($unsigned(($signed((8'hb2)) ?
          {((wire73 && wire1) ? wire70 : $unsigned(wire76)),
              (wire79[(1'h1):(1'h1)] ?
                  wire80[(1'h1):(1'h0)] : $signed((7'h41)))} : {$unsigned(((8'haf) ?
                  wire74 : (8'haf)))})))
        begin
          reg84 <= $unsigned((reg83[(5'h12):(4'hf)] | reg83));
        end
      else
        begin
          if (($signed((|wire3[(4'hb):(1'h0)])) & $signed((($signed(wire76) >> (wire78 & wire74)) ^~ (^$unsigned(wire77))))))
            begin
              reg84 <= $signed((wire17[(4'hd):(3'h4)] ?
                  reg83 : $unsigned({(wire76 || wire77), wire17})));
            end
          else
            begin
              reg84 <= reg83;
              reg85 <= reg84;
              reg86 <= $unsigned(reg85[(3'h4):(2'h2)]);
              reg87 <= wire73;
              reg88 <= $unsigned(wire1[(4'hf):(4'hd)]);
            end
          reg89 <= $signed((+(($signed(reg86) ?
                  $unsigned(wire3) : (wire2 && wire74)) ?
              wire74 : $signed($unsigned(wire74)))));
          if (({{{wire70, $unsigned(wire77)}}} < (wire75 ?
              wire74 : (&$unsigned($unsigned((8'hb3)))))))
            begin
              reg90 <= (wire17[(2'h2):(1'h1)] > wire79);
              reg91 <= (+($unsigned(wire75[(3'h7):(3'h6)]) ?
                  (((wire70 >> (8'hb1)) ? (~&reg85) : wire75[(2'h3):(2'h3)]) ?
                      {wire70[(1'h0):(1'h0)]} : ($signed(reg83) < (8'ha2))) : reg85[(4'h9):(4'h8)]));
            end
          else
            begin
              reg90 <= (~&(((~^(^~wire74)) ?
                      (-(+wire82)) : wire1[(5'h10):(4'ha)]) ?
                  $unsigned(wire82[(4'h8):(3'h5)]) : $unsigned(reg91[(4'hb):(1'h1)])));
              reg91 <= ((&$unsigned((wire70 <<< wire82))) ?
                  reg88[(3'h5):(2'h2)] : wire70[(4'hb):(3'h7)]);
            end
        end
      reg92 <= wire70[(4'ha):(3'h7)];
    end
endmodule

module module19
#(parameter param68 = (((8'hbb) ~^ ((~&((7'h41) * (8'hb8))) ~^ (((7'h42) <<< (8'hbd)) ? ((8'h9c) * (8'h9f)) : ((8'ha4) < (7'h44))))) * ((~&({(8'hab)} ^ ((8'haf) ? (8'hb3) : (8'haf)))) ~^ (({(8'hb8), (8'hbe)} <= (~(8'hb6))) ? {{(8'hb4), (8'hb5)}, ((8'ha5) ? (8'ha6) : (8'hae))} : ((8'hb3) ? (^(8'ha8)) : (&(8'hbb)))))), 
parameter param69 = param68)
(y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h104):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire23;
  input wire [(5'h11):(1'h0)] wire22;
  input wire [(5'h10):(1'h0)] wire21;
  input wire signed [(5'h11):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(3'h4):(1'h0)] wire65;
  wire [(4'hd):(1'h0)] wire49;
  wire signed [(3'h6):(1'h0)] wire48;
  wire [(5'h10):(1'h0)] wire47;
  wire [(4'hd):(1'h0)] wire46;
  wire [(5'h13):(1'h0)] wire44;
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg signed [(4'he):(1'h0)] reg63 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg62 = (1'h0);
  reg [(4'h8):(1'h0)] reg61 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg59 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg58 = (1'h0);
  reg [(5'h12):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg55 = (1'h0);
  reg [(5'h13):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg [(2'h3):(1'h0)] reg52 = (1'h0);
  reg [(3'h5):(1'h0)] reg51 = (1'h0);
  reg [(2'h3):(1'h0)] reg50 = (1'h0);
  assign y = {wire67,
                 wire66,
                 wire65,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
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
                 (1'h0)};
  module24 #() modinst45 (.clk(clk), .wire28(wire23), .wire26(wire21), .y(wire44), .wire25((8'hbd)), .wire27(wire22), .wire29(wire20));
  assign wire46 = (((+$signed($signed(wire21))) ?
                          ((~|wire23[(3'h7):(1'h0)]) >= {(8'hac),
                              ((8'hb1) ?
                                  (8'hb6) : wire44)}) : ($unsigned($unsigned(wire21)) <<< $signed($unsigned(wire22)))) ?
                      wire22 : $unsigned($unsigned({{wire21},
                          $signed(wire22)})));
  assign wire47 = wire44[(3'h7):(2'h3)];
  assign wire48 = (wire20 ?
                      (^~wire46[(4'h9):(1'h1)]) : ((~&wire20) && (wire22[(3'h6):(1'h1)] == ((wire21 ?
                              wire20 : wire23) ?
                          (wire21 ? wire46 : wire23) : (8'ha5)))));
  assign wire49 = $signed(wire23);
  always
    @(posedge clk) begin
      if (wire23)
        begin
          reg50 <= $signed((&wire46[(2'h3):(1'h1)]));
        end
      else
        begin
          if (wire23[(4'hd):(4'hd)])
            begin
              reg50 <= ({$signed(($unsigned(wire44) ?
                          wire48[(3'h4):(1'h1)] : (wire46 > wire44))),
                      $signed((!wire22[(1'h0):(1'h0)]))} ?
                  (~|wire48) : wire47[(4'hd):(3'h5)]);
            end
          else
            begin
              reg50 <= $unsigned((~(($unsigned(wire20) * wire23[(3'h7):(3'h5)]) ?
                  $unsigned((-reg50)) : wire46[(4'ha):(2'h3)])));
              reg51 <= (|wire20);
              reg52 <= $signed(wire20);
            end
          reg53 <= $signed(($unsigned($signed(wire22[(4'hc):(4'hc)])) <<< (wire46[(3'h4):(3'h4)] >> wire48[(1'h0):(1'h0)])));
          reg54 <= ($signed(((~&wire21[(4'hb):(2'h2)]) ?
                  $unsigned((^wire49)) : wire20)) ?
              {(~|($unsigned(wire48) >> {wire44,
                      reg53}))} : (((wire49[(2'h3):(2'h3)] ?
                          reg51 : $unsigned(wire23)) ?
                      {wire20[(4'ha):(3'h7)], $unsigned(reg52)} : ((~|(8'haf)) ?
                          wire44[(4'h9):(4'h9)] : (wire21 > wire20))) ?
                  ($unsigned((+wire21)) != wire47) : reg52));
          reg55 <= ($unsigned(wire23) && ({$unsigned((reg53 <<< wire23)),
              (reg50 ?
                  (wire47 > (8'hb5)) : ((8'h9d) >>> wire21))} ^~ $signed(($signed(reg54) ?
              $signed(reg50) : (8'ha2)))));
          if (wire22)
            begin
              reg56 <= ((+(!reg53)) ?
                  reg50 : ((^~$unsigned(wire48[(1'h0):(1'h0)])) ?
                      (&wire46) : $signed(reg53)));
              reg57 <= $unsigned(wire21[(4'hf):(4'hd)]);
              reg58 <= ($signed(reg51) * $unsigned($unsigned(({(8'hae)} ~^ wire49[(3'h6):(1'h0)]))));
              reg59 <= (wire48[(2'h2):(1'h0)] ~^ wire46);
              reg60 <= $signed($unsigned(((|(8'h9c)) ?
                  {$unsigned((8'haa)), reg51} : ((reg55 || wire22) ?
                      wire20 : (!wire23)))));
            end
          else
            begin
              reg56 <= ($unsigned($signed(((reg51 || wire21) * wire20))) ?
                  wire20[(3'h7):(3'h6)] : ((~$signed($signed(reg57))) >> wire46[(4'h8):(3'h6)]));
              reg57 <= (((~$signed($signed(wire46))) ^~ $unsigned({{(8'haf),
                          reg54},
                      (!(8'hb5))})) ?
                  reg58[(3'h6):(3'h5)] : ($unsigned((wire44[(1'h1):(1'h0)] ?
                          (reg52 != reg54) : $signed(reg53))) ?
                      {($signed(wire44) ?
                              ((8'ha2) ? wire21 : reg52) : wire22)} : (reg56 ?
                          reg54 : ($unsigned(reg51) ?
                              (|reg56) : $unsigned((8'ha7))))));
              reg58 <= {((wire46[(1'h0):(1'h0)] ?
                          $signed((^wire21)) : {reg55[(1'h1):(1'h1)]}) ?
                      (reg54[(4'hf):(4'hc)] ?
                          ($signed(wire49) ?
                              (-reg50) : (reg55 ?
                                  (8'hb2) : wire47)) : $signed($signed(reg57))) : (((^~wire22) >= (reg56 ^~ reg54)) ?
                          reg52 : $unsigned($unsigned(wire23)))),
                  (^~reg59[(1'h1):(1'h0)])};
            end
        end
      reg61 <= $signed(wire46);
      reg62 <= $signed($unsigned($signed($unsigned($signed(wire49)))));
      reg63 <= ((reg57 >= $unsigned({(-(8'ha3))})) != (~(wire47[(4'ha):(2'h2)] << (|(reg58 ?
          wire46 : reg54)))));
      reg64 <= reg63[(4'h8):(2'h2)];
    end
  assign wire65 = (wire49[(4'hc):(4'hb)] ?
                      $signed((~|{(|(8'ha4))})) : reg52[(1'h1):(1'h1)]);
  assign wire66 = wire21[(4'hd):(2'h3)];
  assign wire67 = reg64;
endmodule

module module4
#(parameter param15 = ({((((8'hb4) ? (8'ha7) : (8'hbd)) ? ((7'h43) >> (7'h44)) : (|(8'ha7))) ? (((8'hae) - (8'hb5)) ? (!(7'h44)) : ((8'had) ? (8'haa) : (8'ha1))) : (&((8'haa) ? (8'hb7) : (8'ha1)))), ((((8'hb5) && (8'hbb)) <<< ((8'hbe) == (8'hae))) | (((8'ha3) ? (8'ha6) : (8'ha9)) ? ((8'ha3) <= (8'ha1)) : (&(8'hbe))))} ? (((^~((8'hb1) < (8'ha2))) ? (^~(8'h9f)) : (8'hb4)) * ((~|((7'h44) ? (8'ha2) : (8'ha9))) && (~((7'h40) ? (8'hb4) : (8'hae))))) : ((|(~^((8'hbb) + (8'ha5)))) ? ((((7'h40) ? (8'hbc) : (8'haa)) || ((8'h9c) >>> (8'hb1))) ? (((8'ha7) ? (8'ha4) : (8'hac)) ^ {(8'hbf)}) : {((8'hae) ? (8'hae) : (8'hb0))}) : ((7'h44) || ((8'hb2) * (~(7'h42)))))), 
parameter param16 = param15)
(y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'h44):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire8;
  input wire signed [(3'h7):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire14;
  wire [(3'h7):(1'h0)] wire13;
  wire signed [(4'h8):(1'h0)] wire11;
  wire [(4'he):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire9;
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  assign y = {wire14, wire13, wire11, wire10, wire9, reg12, (1'h0)};
  assign wire9 = (8'ha2);
  assign wire10 = $unsigned((!((wire8 || (^~wire6)) ?
                      (8'hb6) : {$signed((8'ha8)), wire9[(1'h1):(1'h0)]})));
  assign wire11 = (($signed(wire5) ? (^wire9) : wire5[(3'h6):(3'h4)]) ?
                      (~(~^($signed(wire5) ?
                          (^wire6) : wire5))) : $signed($unsigned(wire8)));
  always
    @(posedge clk) begin
      reg12 <= $unsigned($unsigned($signed((wire10 ?
          (wire11 >> wire8) : wire9[(3'h7):(3'h7)]))));
    end
  assign wire13 = wire10[(2'h2):(1'h1)];
  assign wire14 = ({$unsigned(((wire8 ?
                          (8'had) : (8'h9e)) ^~ wire11[(1'h1):(1'h0)])),
                      (~(|(wire11 ^~ reg12)))} != {reg12[(3'h4):(1'h0)],
                      $unsigned($signed($unsigned(reg12)))});
endmodule

module module24
#(parameter param43 = (!((+(((8'hb2) ? (8'ha7) : (8'h9c)) ? ((8'hb8) <= (8'hb8)) : (^(8'hbe)))) <= ((((7'h41) ? (8'hae) : (8'hba)) ? ((8'hb4) >> (8'h9e)) : {(8'haa), (8'hbd)}) >= (~((8'hb5) <= (8'h9c)))))))
(y, clk, wire29, wire28, wire27, wire26, wire25);
  output wire [(32'h7a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire29;
  input wire [(4'hd):(1'h0)] wire28;
  input wire signed [(3'h4):(1'h0)] wire27;
  input wire [(5'h10):(1'h0)] wire26;
  input wire signed [(5'h11):(1'h0)] wire25;
  wire [(4'he):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(4'h9):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire33;
  wire signed [(4'ha):(1'h0)] wire32;
  wire [(4'h8):(1'h0)] wire31;
  wire [(4'he):(1'h0)] wire30;
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg [(4'hf):(1'h0)] reg36 = (1'h0);
  reg [(4'h8):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg34 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 (1'h0)};
  assign wire30 = $unsigned($signed((~|{wire25, $signed(wire26)})));
  assign wire31 = $unsigned(((($signed(wire28) ?
                          $unsigned(wire26) : (wire30 & wire26)) ?
                      $signed((&wire30)) : {$signed(wire27)}) ^~ (({wire27} ?
                          $signed(wire27) : $signed(wire29)) ?
                      wire29 : wire30[(4'hc):(1'h1)])));
  assign wire32 = (~($unsigned((wire29[(1'h1):(1'h1)] ?
                      $unsigned(wire25) : (!wire26))) >>> $unsigned(wire25)));
  assign wire33 = (8'ha7);
  always
    @(posedge clk) begin
      reg34 <= (wire33[(3'h4):(3'h4)] ^ $unsigned(wire28));
      reg35 <= wire30;
      reg36 <= wire31[(3'h7):(3'h7)];
      reg37 <= ($unsigned(wire33[(2'h3):(2'h2)]) ?
          reg34[(1'h0):(1'h0)] : (~^((!wire27) ?
              $unsigned(reg34) : $unsigned((-reg34)))));
      reg38 <= (|(8'haf));
    end
  assign wire39 = $unsigned(wire30);
  assign wire40 = $signed($signed(wire27));
  assign wire41 = $unsigned((~^wire27[(3'h4):(1'h1)]));
  assign wire42 = $signed(($unsigned($signed($unsigned(wire27))) ?
                      $unsigned(wire30) : $unsigned($unsigned($signed(wire26)))));
endmodule
