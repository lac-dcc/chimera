module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h7d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(3'h4):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire73;
  wire signed [(3'h6):(1'h0)] wire72;
  wire signed [(2'h2):(1'h0)] wire71;
  wire signed [(5'h13):(1'h0)] wire69;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire4;
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg8 = (1'h0);
  assign y = {wire73,
                 wire72,
                 wire71,
                 wire69,
                 wire5,
                 wire4,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire4 = (((|($unsigned(wire0) <<< $unsigned(wire0))) ?
                     {$unsigned((wire3 < wire1))} : wire0[(3'h7):(3'h5)]) << (~^(!(wire3 ?
                     (wire3 ? wire1 : wire3) : (~wire0)))));
  assign wire5 = (wire2 ?
                     wire0 : {((wire0[(4'hb):(4'hb)] ?
                                 ((8'ha7) | wire1) : wire2) ?
                             wire1[(4'ha):(4'ha)] : wire0[(4'hc):(4'ha)])});
  always
    @(posedge clk) begin
      reg6 <= {($unsigned($unsigned(wire2[(1'h1):(1'h0)])) ^~ $unsigned($unsigned(wire2))),
          wire4[(1'h1):(1'h0)]};
      reg7 <= {$unsigned(((8'hbf) + {$signed(reg6)}))};
      reg8 <= (((&({reg7} ? (wire4 ? reg6 : reg6) : {reg6, wire5})) ?
          (&$signed($unsigned(wire2))) : (!(((8'hb3) != wire4) ?
              (wire0 | wire2) : reg7[(2'h3):(2'h2)]))) > $unsigned((wire4 ^ (|wire1))));
    end
  module9 #() modinst70 (.wire12(reg7), .wire10(wire0), .y(wire69), .wire11(reg6), .wire13(reg8), .clk(clk), .wire14(wire4));
  assign wire71 = wire3[(3'h6):(3'h5)];
  assign wire72 = ((wire3 >> (&$unsigned($signed((8'hb6))))) ?
                      (8'had) : ((^~$signed($unsigned(reg8))) && $unsigned(wire4[(5'h12):(3'h7)])));
  assign wire73 = $signed((((&wire5[(4'ha):(4'ha)]) < reg8) && reg6[(3'h4):(1'h0)]));
endmodule

module module9
#(parameter param67 = ({(+{((8'hb4) ? (8'hb2) : (8'ha5)), (^(8'ha3))})} ? (~|(({(8'hb5)} ? ((8'ha9) ^ (8'hb3)) : (~^(8'had))) ? (!((8'hbc) ? (7'h41) : (8'hba))) : ((8'ha6) + (!(8'hb1))))) : {(~|((~&(8'h9f)) ~^ {(8'ha4)})), ((((8'ha1) << (8'h9e)) >> (^~(8'ha0))) << (((8'ha1) < (8'hab)) - ((8'had) ? (8'hb1) : (8'ha7))))}), 
parameter param68 = param67)
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hc3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire14;
  input wire signed [(5'h14):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  wire signed [(4'hc):(1'h0)] wire66;
  wire [(2'h3):(1'h0)] wire58;
  wire signed [(4'he):(1'h0)] wire57;
  wire signed [(4'hc):(1'h0)] wire54;
  wire [(4'hf):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire24;
  wire signed [(5'h14):(1'h0)] wire23;
  wire signed [(2'h2):(1'h0)] wire22;
  wire [(3'h7):(1'h0)] wire21;
  wire signed [(5'h12):(1'h0)] wire20;
  wire [(3'h7):(1'h0)] wire19;
  wire signed [(2'h2):(1'h0)] wire18;
  wire [(4'hb):(1'h0)] wire17;
  wire [(3'h4):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  reg signed [(3'h5):(1'h0)] reg65 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg62 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg56 = (1'h0);
  assign y = {wire66,
                 wire58,
                 wire57,
                 wire54,
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
                 wire15,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg56,
                 (1'h0)};
  assign wire15 = $unsigned(($signed($signed(wire10[(4'ha):(2'h2)])) ?
                      wire11[(1'h0):(1'h0)] : wire13));
  assign wire16 = $unsigned(($unsigned((((8'hab) ? wire14 : wire11) ?
                      $signed((8'hb7)) : (wire13 ?
                          wire15 : (8'ha0)))) <<< (~$signed((wire14 ?
                      wire14 : wire15)))));
  assign wire17 = ((wire15 & wire12[(5'h11):(2'h3)]) ~^ $signed($unsigned((^~wire16))));
  assign wire18 = wire17;
  assign wire19 = ({{$unsigned(wire13), $unsigned($signed(wire18))}} ?
                      (-(^wire15[(1'h0):(1'h0)])) : ($signed(wire11[(4'hb):(3'h6)]) - wire17));
  assign wire20 = wire13[(4'ha):(4'h8)];
  assign wire21 = wire10[(1'h1):(1'h0)];
  assign wire22 = $unsigned((+(({wire16, wire20} << (wire14 <= wire16)) ?
                      $signed($signed(wire15)) : $signed($unsigned(wire15)))));
  assign wire23 = ((+($unsigned((!(8'hba))) <= ((wire16 & wire20) ?
                      $signed(wire11) : (wire20 < wire17)))) & $unsigned(($signed((wire11 ?
                          wire18 : wire16)) ?
                      ((wire16 ? wire12 : wire10) ?
                          $signed(wire18) : (wire14 ?
                              wire17 : wire22)) : $unsigned(((8'hb6) ?
                          wire22 : wire14)))));
  assign wire24 = wire13;
  assign wire25 = $signed(wire16);
  module26 #() modinst55 (wire54, clk, wire25, wire14, wire24, wire17);
  always
    @(posedge clk) begin
      reg56 <= (|wire21);
    end
  assign wire57 = $unsigned($signed((~((wire24 ?
                      wire11 : (7'h43)) || wire16))));
  assign wire58 = reg56;
  always
    @(posedge clk) begin
      reg59 <= $signed($signed($unsigned(({wire13} ?
          $signed(wire18) : (&reg56)))));
      if (($unsigned(wire12[(4'hb):(1'h1)]) <= (7'h41)))
        begin
          reg60 <= ({wire57,
              ($signed($unsigned(wire22)) ?
                  $unsigned(wire13) : wire20[(3'h6):(1'h1)])} >>> {(^~wire15[(1'h0):(1'h0)]),
              ($unsigned((^~reg59)) << (-$unsigned(reg59)))});
          reg61 <= ($signed(wire10) ?
              ($signed($signed(((8'hbc) || reg56))) ?
                  {{wire57, wire23},
                      {wire58[(1'h1):(1'h1)],
                          (+wire15)}} : $unsigned(wire18[(2'h2):(2'h2)])) : wire54);
          reg62 <= wire20[(4'hc):(1'h0)];
          if (reg59)
            begin
              reg63 <= (+(&wire13[(4'hd):(1'h0)]));
              reg64 <= {((~^$unsigned($signed(reg56))) ? wire21 : (-wire24))};
            end
          else
            begin
              reg63 <= wire12;
            end
        end
      else
        begin
          if (({reg59[(4'hf):(4'hc)]} ?
              {$unsigned($signed((wire20 + reg62))),
                  wire58[(2'h2):(1'h0)]} : $signed((7'h40))))
            begin
              reg60 <= ((reg64 ?
                  (wire17[(2'h3):(1'h0)] ?
                      ($signed(wire16) >= {wire19,
                          (8'hb1)}) : $signed((+wire22))) : (~&{(wire19 < wire12),
                      (~&reg56)})) >= wire22);
              reg61 <= ((8'hae) ?
                  reg61 : ($signed(($signed(wire13) ?
                          (wire14 || wire16) : wire21[(2'h3):(2'h2)])) ?
                      (($signed(reg64) ~^ wire18) << (|(wire14 << reg60))) : ($signed((wire24 ?
                              wire15 : reg64)) ?
                          (-$signed(wire14)) : $unsigned(((8'ha5) ?
                              wire25 : reg59)))));
              reg62 <= wire57;
              reg63 <= ($signed(($signed(wire22) >= $signed((reg63 & reg59)))) ?
                  wire57 : $signed($signed(wire58[(2'h2):(1'h1)])));
            end
          else
            begin
              reg60 <= {(~&$signed(wire12[(3'h7):(1'h1)])), wire21};
              reg61 <= reg60;
            end
        end
      reg65 <= ($unsigned({$unsigned(wire13[(2'h3):(2'h2)])}) ?
          $signed({{{wire57}, {wire23, reg60}}}) : wire15);
    end
  assign wire66 = ((&((~$signed((8'hb0))) ?
                          ($signed((8'haa)) ? (8'ha9) : (8'hbf)) : (wire21 ?
                              $signed((8'ha9)) : {reg65}))) ?
                      {wire11, reg65} : {($unsigned((wire12 ?
                              wire20 : wire14)) >= wire24),
                          (((wire54 ^ reg60) * $unsigned(wire23)) < ($unsigned(wire57) ?
                              $unsigned(wire10) : $signed((8'hb6))))});
endmodule

module module26
#(parameter param52 = (^(~|({{(8'hae)}} ? {(-(8'h9c))} : (((8'hb2) + (8'hbb)) ? {(7'h40)} : (~(8'hb5)))))), 
parameter param53 = (^(!param52)))
(y, clk, wire30, wire29, wire28, wire27);
  output wire [(32'h10d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire30;
  input wire [(4'hd):(1'h0)] wire29;
  input wire [(3'h4):(1'h0)] wire28;
  input wire [(4'hb):(1'h0)] wire27;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(5'h13):(1'h0)] wire49;
  wire [(5'h12):(1'h0)] wire48;
  wire signed [(4'hc):(1'h0)] wire33;
  wire signed [(5'h10):(1'h0)] wire32;
  wire signed [(4'h9):(1'h0)] wire31;
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'he):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg43 = (1'h0);
  reg [(5'h13):(1'h0)] reg42 = (1'h0);
  reg [(4'h9):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(5'h13):(1'h0)] reg36 = (1'h0);
  reg [(4'hd):(1'h0)] reg35 = (1'h0);
  reg [(4'hf):(1'h0)] reg34 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire33,
                 wire32,
                 wire31,
                 reg47,
                 reg46,
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
                 reg34,
                 (1'h0)};
  assign wire31 = $unsigned({wire29[(3'h4):(3'h4)],
                      (wire27 ?
                          {wire29} : (wire29[(3'h7):(3'h6)] ?
                              $unsigned(wire28) : (~^(8'ha6))))});
  assign wire32 = ((wire28 ~^ ({wire31, $signed(wire31)} ?
                      (wire29[(3'h5):(2'h3)] ?
                          $signed((8'ha5)) : (|wire29)) : $signed({wire29}))) ~^ wire30);
  assign wire33 = (-$signed((8'hb9)));
  always
    @(posedge clk) begin
      reg34 <= $unsigned((+(^~($signed((8'ha8)) ^ wire29))));
      if ($signed($signed($signed(((+wire28) ?
          (reg34 ? wire30 : wire33) : (wire33 <<< wire27))))))
        begin
          if ($signed(($signed(({wire27, wire29} ^ $signed((8'hbe)))) ?
              {(wire29[(2'h3):(1'h0)] ? (~wire29) : $unsigned((8'ha9))),
                  wire32} : (wire30[(3'h4):(1'h1)] ?
                  wire31[(4'h9):(1'h0)] : $unsigned((^wire33))))))
            begin
              reg35 <= $signed((($unsigned(wire28) ?
                      ($signed(wire27) ?
                          wire33[(4'hb):(2'h2)] : $unsigned(wire28)) : (wire30 ?
                          wire30[(1'h1):(1'h0)] : (reg34 ? wire30 : wire32))) ?
                  $unsigned((8'ha1)) : {($unsigned(wire30) | (wire31 + (8'hb3))),
                      ((wire29 < wire33) <= $unsigned(wire31))}));
              reg36 <= $unsigned($signed((~|$unsigned((reg34 + wire31)))));
              reg37 <= (reg35[(1'h1):(1'h1)] ?
                  (~&reg36) : $signed((($unsigned(reg34) != wire31) ?
                      {(wire30 ? wire33 : reg34)} : (wire32 ?
                          $signed((8'hb3)) : $signed(wire29)))));
              reg38 <= wire27;
            end
          else
            begin
              reg35 <= $unsigned(reg36[(5'h12):(3'h4)]);
              reg36 <= (wire33 & reg36);
              reg37 <= (8'hac);
            end
          reg39 <= {reg36[(4'h8):(3'h4)],
              ((^~$signed(reg37)) == wire28[(3'h4):(2'h2)])};
        end
      else
        begin
          reg35 <= wire27[(3'h7):(3'h7)];
          reg36 <= reg34[(3'h6):(1'h0)];
        end
    end
  always
    @(posedge clk) begin
      reg40 <= $signed(wire29);
      reg41 <= (wire27 ? reg34 : wire33);
    end
  always
    @(posedge clk) begin
      reg42 <= (|$signed(wire27[(2'h3):(2'h3)]));
      if ($signed(wire30))
        begin
          reg43 <= ((~&(+$signed((&wire31)))) ?
              {{(&wire28)}} : (reg38 ?
                  wire28[(3'h4):(1'h0)] : $unsigned(reg37)));
        end
      else
        begin
          reg43 <= wire31[(1'h1):(1'h0)];
          reg44 <= (8'hb6);
          reg45 <= {$signed(wire33)};
          reg46 <= $unsigned(reg38);
        end
      reg47 <= $unsigned({$unsigned(wire31[(3'h7):(2'h3)]),
          $signed($signed($unsigned(reg44)))});
    end
  assign wire48 = {$unsigned(reg45)};
  assign wire49 = ((~^$signed(reg46[(4'hd):(4'hb)])) ?
                      $unsigned($unsigned((7'h42))) : {reg45});
  assign wire50 = ($unsigned(wire33) ?
                      $signed((&((8'hb8) || $signed(reg46)))) : reg38);
  assign wire51 = ($unsigned((~&reg36[(3'h6):(1'h1)])) > (((|{wire29,
                      (8'ha9)}) << (~^$unsigned(wire29))) <<< {reg47[(2'h3):(2'h2)],
                      reg45}));
endmodule
