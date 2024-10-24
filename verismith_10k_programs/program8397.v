module top
#(parameter param89 = (((8'hab) >> ((((8'hbb) ? (8'h9c) : (8'hbd)) >= ((8'hb9) ^~ (8'hb0))) * (|((7'h42) ~^ (8'haf))))) & (((^~((8'ha3) >= (7'h40))) ^~ ((8'hbc) ? (~|(8'hb2)) : {(8'hb4)})) ? {(((7'h42) ? (8'hac) : (8'hb8)) ? ((8'ha6) >= (8'haa)) : {(8'ha1)}), {((7'h42) << (8'ha0))}} : (8'hbc))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(4'hc):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire76;
  wire [(5'h11):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(2'h3):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire8;
  wire signed [(3'h6):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  wire signed [(4'ha):(1'h0)] wire4;
  wire [(3'h5):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire30;
  wire signed [(5'h12):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire33;
  wire [(4'hb):(1'h0)] wire34;
  wire signed [(4'hb):(1'h0)] wire35;
  wire [(3'h7):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire37;
  wire signed [(5'h12):(1'h0)] wire74;
  reg [(4'hd):(1'h0)] reg88 = (1'h0);
  reg [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg86 = (1'h0);
  reg [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(5'h14):(1'h0)] reg84 = (1'h0);
  reg [(2'h2):(1'h0)] reg83 = (1'h0);
  reg [(2'h2):(1'h0)] reg82 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg81 = (1'h0);
  reg [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg78 = (1'h0);
  reg [(5'h13):(1'h0)] reg77 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  assign y = {wire76,
                 wire27,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 wire29,
                 wire30,
                 wire31,
                 wire33,
                 wire34,
                 wire35,
                 wire36,
                 wire37,
                 wire74,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg32,
                 (1'h0)};
  assign wire4 = wire1;
  assign wire5 = (&$unsigned((((+wire2) ? $signed(wire0) : (wire0 && wire0)) ?
                     wire0 : (&(&wire4)))));
  assign wire6 = (wire1 ? wire3 : wire4);
  assign wire7 = (8'hb2);
  assign wire8 = (&(wire7 * {wire1[(4'h8):(1'h1)]}));
  assign wire9 = (wire7[(3'h6):(2'h2)] ?
                     ((wire2 & ((&wire7) ^~ ((8'had) * wire8))) - $signed(($unsigned(wire7) ?
                         (8'haa) : (~|wire5)))) : wire8[(5'h13):(5'h13)]);
  assign wire10 = (^~{(wire7[(3'h6):(3'h4)] ?
                          $signed((wire2 >>> wire5)) : {(~wire6),
                              $signed(wire3)}),
                      (({wire8, wire9} ? (wire8 ~^ (8'ha3)) : {wire7}) ?
                          wire7[(3'h6):(2'h3)] : ($unsigned(wire2) ?
                              (wire4 | wire9) : (wire9 & wire9)))});
  assign wire11 = $signed((+$signed(((wire5 ? wire9 : wire10) ?
                      wire3[(1'h0):(1'h0)] : {wire10}))));
  module12 #() modinst28 (wire27, clk, wire10, wire0, wire4, wire8, wire2);
  assign wire29 = $unsigned($signed(({(wire5 ? wire11 : wire10),
                      $unsigned(wire1)} ^~ {$signed((8'h9c)),
                      $signed(wire11)})));
  assign wire30 = {{$signed(wire2), $signed(wire3[(1'h1):(1'h1)])}};
  assign wire31 = (~|(&wire9));
  always
    @(posedge clk) begin
      reg32 <= (wire10[(3'h6):(3'h4)] ^~ wire7[(1'h0):(1'h0)]);
    end
  assign wire33 = (wire9 * $signed($unsigned($unsigned(wire9[(1'h1):(1'h0)]))));
  assign wire34 = (-$unsigned((^~(!reg32[(1'h0):(1'h0)]))));
  assign wire35 = {wire6};
  assign wire36 = ((+({$unsigned(wire9), $unsigned((8'hb7))} <<< (reg32 ?
                      $signed(wire8) : $unsigned(wire2)))) - ({({wire2} << (-wire31)),
                      $signed($unsigned(reg32))} >> ((&(wire6 >= wire1)) && ((wire7 | wire27) ?
                      (~&wire5) : (7'h40)))));
  assign wire37 = reg32;
  module38 #() modinst75 (wire74, clk, wire33, wire29, reg32, wire1);
  assign wire76 = {wire29[(3'h4):(2'h2)],
                      (~&($signed(wire11[(3'h5):(2'h3)]) ?
                          wire27 : ((wire27 ?
                              wire9 : wire27) >>> wire0[(3'h6):(3'h6)])))};
  always
    @(posedge clk) begin
      reg77 <= wire9;
      if ($signed($signed((!(wire2[(4'hc):(1'h0)] | (wire5 - (8'had)))))))
        begin
          reg78 <= wire27[(3'h5):(1'h0)];
        end
      else
        begin
          reg78 <= (wire33 ?
              (wire4[(3'h6):(2'h2)] ?
                  wire1[(1'h0):(1'h0)] : wire37) : {(((wire10 ?
                              (8'h9c) : (7'h42)) ?
                          $signed(wire27) : ((8'hba) ? wire2 : reg32)) ?
                      wire29 : (^~((8'ha5) ? wire37 : wire1))),
                  $signed($signed((~&reg32)))});
          reg79 <= $signed(($unsigned(((wire76 ? wire6 : (8'ha7)) ?
              wire29 : $signed(wire8))) ~^ reg32[(4'h9):(4'h9)]));
          reg80 <= wire11[(3'h4):(2'h2)];
          if ((({reg80[(2'h3):(1'h1)]} ?
                  ((^wire11) << wire6[(5'h12):(4'hf)]) : $signed(wire7[(3'h4):(1'h1)])) ?
              {$signed(($signed(wire37) ? (8'h9c) : (!wire10))),
                  $unsigned((wire0[(1'h1):(1'h0)] ?
                      reg79 : wire35[(2'h3):(2'h2)]))} : {(|($signed(reg32) ?
                      (wire11 ? wire3 : reg80) : wire29[(1'h0):(1'h0)]))}))
            begin
              reg81 <= wire0[(4'hb):(3'h5)];
              reg82 <= reg32[(2'h2):(1'h1)];
            end
          else
            begin
              reg81 <= (reg79 ~^ (reg82 >> (wire33 <= $signed($unsigned(wire34)))));
              reg82 <= $unsigned($signed(((reg79[(3'h7):(1'h0)] | $signed(wire4)) ?
                  (wire37 ^~ wire29[(3'h4):(2'h2)]) : (!$unsigned(wire2)))));
              reg83 <= (~^wire74[(3'h6):(3'h5)]);
              reg84 <= $signed($unsigned((($unsigned(wire31) ?
                  (wire34 ?
                      reg82 : (8'ha1)) : wire34[(2'h2):(1'h0)]) ^ $signed(((8'ha6) ?
                  wire29 : (8'haf))))));
            end
          reg85 <= ($unsigned($unsigned(wire33[(4'h9):(1'h0)])) < ((8'hb9) ?
              reg78 : $signed(($signed(wire37) <<< wire7[(1'h1):(1'h0)]))));
        end
      reg86 <= {$unsigned((+wire11))};
      reg87 <= (reg86[(1'h1):(1'h1)] ?
          {({{wire31, (8'h9c)},
                  $signed(reg77)} >> {$unsigned(reg85)})} : (8'ha1));
      reg88 <= wire1;
    end
endmodule

module module38
#(parameter param73 = ((!(~&(((8'hba) ^ (8'hab)) && ((8'hb3) >= (8'ha2))))) - {({(&(8'hb8)), {(8'hab)}} ? ({(8'haf)} ? ((8'hbf) ? (8'haf) : (8'hbe)) : ((8'h9e) | (7'h42))) : (7'h42)), ((|((8'hb6) > (7'h44))) ? ((+(8'h9c)) <<< {(8'hb7), (8'hbc)}) : {{(8'ha2)}, ((8'ha1) ? (8'h9d) : (8'ha4))})}))
(y, clk, wire42, wire41, wire40, wire39);
  output wire [(32'hdb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire42;
  input wire signed [(2'h3):(1'h0)] wire41;
  input wire [(3'h6):(1'h0)] wire40;
  input wire [(5'h13):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire72;
  wire [(3'h4):(1'h0)] wire71;
  wire [(5'h12):(1'h0)] wire69;
  wire [(4'hd):(1'h0)] wire59;
  wire signed [(5'h11):(1'h0)] wire58;
  wire [(5'h14):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire55;
  wire [(5'h13):(1'h0)] wire44;
  reg signed [(3'h4):(1'h0)] reg70 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(2'h3):(1'h0)] reg67 = (1'h0);
  reg [(5'h13):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg63 = (1'h0);
  reg [(2'h3):(1'h0)] reg62 = (1'h0);
  reg [(4'h9):(1'h0)] reg61 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  assign y = {wire72,
                 wire71,
                 wire69,
                 wire59,
                 wire58,
                 wire57,
                 wire55,
                 wire44,
                 reg70,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg43,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg43 <= wire42[(2'h3):(2'h2)];
    end
  assign wire44 = (|{wire40[(1'h1):(1'h0)],
                      $signed($signed($unsigned(wire42)))});
  module45 #() modinst56 (.clk(clk), .wire48(wire44), .wire46(reg43), .wire47(wire42), .y(wire55), .wire50(wire40), .wire49(wire39));
  assign wire57 = (wire39 < $signed(wire40[(3'h6):(2'h3)]));
  assign wire58 = reg43;
  assign wire59 = (!(reg43[(2'h3):(2'h2)] * {$unsigned((!wire44)),
                      reg43[(1'h1):(1'h1)]}));
  always
    @(posedge clk) begin
      reg60 <= (wire55 + ((wire40 ? wire44 : $signed((^wire44))) ?
          $unsigned($unsigned($signed(wire59))) : wire55));
      if (wire41)
        begin
          reg61 <= $signed(reg43[(3'h6):(1'h0)]);
          reg62 <= wire39[(3'h5):(2'h3)];
        end
      else
        begin
          reg61 <= (&{wire39});
          reg62 <= reg60;
          if (reg62)
            begin
              reg63 <= ($signed({$signed($signed(wire57)),
                      (wire39[(5'h11):(5'h11)] > reg61[(2'h2):(1'h1)])}) ?
                  (^~$signed(((wire44 <<< wire57) ?
                      (reg60 ? wire59 : wire40) : (wire41 ?
                          reg43 : (8'hb9))))) : ((~($signed(wire57) + wire57[(4'hc):(3'h7)])) ?
                      (wire39[(3'h4):(2'h2)] ?
                          wire55[(3'h6):(1'h0)] : $unsigned({reg43})) : wire57));
              reg64 <= $unsigned($signed($signed($signed((wire59 ?
                  (7'h42) : wire42)))));
              reg65 <= $unsigned((($unsigned($unsigned((7'h44))) <<< $unsigned($signed(reg61))) <= {(|$unsigned(reg63))}));
              reg66 <= (((8'ha0) - (((reg43 ? wire39 : reg60) ?
                          (!reg64) : (reg64 & wire58)) ?
                      (wire40 ?
                          (wire59 ^~ (8'ha8)) : $signed(wire40)) : wire44)) ?
                  reg64[(4'hd):(2'h2)] : $unsigned((8'ha7)));
            end
          else
            begin
              reg63 <= $signed(wire42[(4'h9):(1'h1)]);
              reg64 <= ((|wire55[(1'h1):(1'h1)]) && ($unsigned($unsigned(wire39[(4'he):(3'h4)])) ?
                  wire41[(2'h2):(1'h1)] : wire40));
              reg65 <= reg63;
            end
          reg67 <= $unsigned(reg61);
        end
      reg68 <= reg67[(2'h2):(2'h2)];
    end
  assign wire69 = wire39;
  always
    @(posedge clk) begin
      reg70 <= wire39;
    end
  assign wire71 = ((~|$signed(({wire55} != (reg63 ?
                      wire39 : reg65)))) >>> (8'hb7));
  assign wire72 = $signed($unsigned(wire58));
endmodule

module module12  (y, clk, wire17, wire16, wire15, wire14, wire13);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire17;
  input wire [(3'h7):(1'h0)] wire16;
  input wire signed [(3'h6):(1'h0)] wire15;
  input wire [(2'h3):(1'h0)] wire14;
  input wire [(3'h5):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire26;
  wire signed [(4'he):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  wire [(4'h9):(1'h0)] wire23;
  wire [(3'h6):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire21;
  wire [(5'h15):(1'h0)] wire20;
  wire signed [(5'h10):(1'h0)] wire19;
  wire signed [(4'ha):(1'h0)] wire18;
  assign y = {wire26,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 (1'h0)};
  assign wire18 = ($unsigned($unsigned({(!wire17),
                      wire14})) >>> $signed({($signed(wire17) ?
                          (wire17 ^~ wire17) : (-wire14)),
                      (!$unsigned(wire17))}));
  assign wire19 = wire16;
  assign wire20 = {{($unsigned($unsigned((8'hb4))) ?
                              wire19[(3'h4):(1'h0)] : wire19[(4'h9):(3'h6)]),
                          wire19[(1'h0):(1'h0)]},
                      $signed($signed((~&(wire19 ? (8'ha9) : wire13))))};
  assign wire21 = {$signed($signed(wire15[(3'h4):(2'h3)])),
                      wire18[(4'ha):(1'h0)]};
  assign wire22 = wire20[(3'h5):(3'h4)];
  assign wire23 = wire22[(3'h5):(2'h2)];
  assign wire24 = wire23[(2'h2):(2'h2)];
  assign wire25 = wire16;
  assign wire26 = {$signed($unsigned(($signed((8'hb6)) - {wire19, wire23})))};
endmodule

module module45  (y, clk, wire50, wire49, wire48, wire47, wire46);
  output wire [(32'h36):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire50;
  input wire [(5'h13):(1'h0)] wire49;
  input wire signed [(3'h5):(1'h0)] wire48;
  input wire signed [(4'h9):(1'h0)] wire47;
  input wire signed [(3'h6):(1'h0)] wire46;
  wire [(4'hb):(1'h0)] wire54;
  wire signed [(4'he):(1'h0)] wire53;
  wire [(4'h9):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire51;
  assign y = {wire54, wire53, wire52, wire51, (1'h0)};
  assign wire51 = $unsigned((wire50 ? wire49 : $signed(wire50)));
  assign wire52 = $unsigned(wire51);
  assign wire53 = (^~($signed($signed((wire47 ? wire49 : wire47))) > wire46));
  assign wire54 = wire50;
endmodule
