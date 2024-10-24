module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire signed [(3'h7):(1'h0)] wire1;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire4;
  wire signed [(3'h4):(1'h0)] wire41;
  wire [(3'h4):(1'h0)] wire40;
  wire signed [(4'ha):(1'h0)] wire39;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire signed [(2'h2):(1'h0)] wire10;
  wire [(3'h5):(1'h0)] wire11;
  wire [(5'h14):(1'h0)] wire12;
  wire [(2'h3):(1'h0)] wire37;
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg8 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire5,
                 wire6,
                 wire10,
                 wire11,
                 wire12,
                 wire37,
                 reg7,
                 reg8,
                 reg9,
                 (1'h0)};
  assign wire5 = {wire0[(1'h1):(1'h1)],
                     $signed($signed(((&wire1) ^ (wire3 ? wire2 : wire1))))};
  assign wire6 = (&wire4[(4'hc):(4'ha)]);
  always
    @(posedge clk) begin
      reg7 <= (((($signed((8'hb9)) << $signed(wire1)) - $unsigned($signed(wire2))) ?
          ($unsigned($unsigned(wire1)) ?
              wire6[(3'h5):(2'h3)] : $unsigned(wire5[(4'h9):(3'h4)])) : wire0[(4'hb):(3'h4)]) == (wire0 ?
          wire0 : (((wire2 ? (7'h42) : wire3) != {wire1}) >> (8'hb9))));
      reg8 <= ((wire2 ? wire0 : wire4[(1'h0):(1'h0)]) ? reg7 : wire6);
      reg9 <= $unsigned((8'hba));
    end
  assign wire10 = (wire4[(5'h10):(4'h9)] || $unsigned($unsigned((8'hbf))));
  assign wire11 = $unsigned($unsigned(({(wire1 ? wire5 : reg7)} ?
                      (reg8 >> wire5) : wire5)));
  assign wire12 = $unsigned(wire1);
  module13 #() modinst38 (.wire16(wire0), .wire14(wire1), .clk(clk), .wire15(wire12), .y(wire37), .wire17(reg7));
  assign wire39 = ((^~wire1[(2'h2):(2'h2)]) > (8'hbe));
  assign wire40 = $unsigned(wire10);
  assign wire41 = (((&wire11[(2'h2):(1'h0)]) ?
                          {($unsigned(wire39) ?
                                  wire6[(2'h3):(1'h1)] : wire12)} : ($unsigned((wire39 && wire37)) ?
                              wire37[(1'h1):(1'h1)] : reg8[(3'h4):(2'h2)])) ?
                      wire1 : ($unsigned(wire39[(4'h9):(3'h5)]) ?
                          (reg9 ~^ (reg7[(2'h3):(1'h0)] ?
                              wire3[(4'hd):(1'h0)] : wire6)) : (wire10 && {wire6[(1'h0):(1'h0)]})));
endmodule

module module13
#(parameter param36 = (~|{(+(((8'hbc) ? (8'hb8) : (8'h9e)) == (~(8'ha7)))), (((~(8'ha7)) ? (&(7'h41)) : ((8'ha7) ^~ (8'hb9))) ? {((8'hae) ? (8'h9d) : (8'ha4)), {(8'hb7), (8'ha1)}} : {(+(8'hb2))})}))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'hca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  input wire signed [(5'h14):(1'h0)] wire15;
  input wire [(2'h2):(1'h0)] wire14;
  wire [(4'h9):(1'h0)] wire35;
  wire [(4'hb):(1'h0)] wire34;
  wire [(4'h8):(1'h0)] wire33;
  reg signed [(5'h15):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  reg [(4'hc):(1'h0)] reg24 = (1'h0);
  reg [(4'hc):(1'h0)] reg23 = (1'h0);
  reg [(3'h4):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg20 = (1'h0);
  reg [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(5'h15):(1'h0)] reg18 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg18 <= (-wire15[(3'h4):(3'h4)]);
      reg19 <= $signed((!$unsigned(($signed(wire17) != (wire17 * (8'hbe))))));
      reg20 <= $unsigned(reg19[(3'h5):(1'h1)]);
    end
  always
    @(posedge clk) begin
      reg21 <= $signed($signed(($signed({reg20, wire15}) >> {(wire17 ?
              wire15 : wire17),
          $unsigned(reg20)})));
      if (wire14)
        begin
          reg22 <= wire16[(1'h0):(1'h0)];
          if ((reg20 ?
              ((wire14 ^ $signed((|reg18))) ?
                  wire17[(4'h9):(3'h4)] : (~^(^~(reg22 ^ reg20)))) : (((^~reg22) ?
                  (^$signed((8'hac))) : ($unsigned((8'hbb)) ?
                      reg18 : (wire17 ?
                          wire14 : wire16))) && $unsigned($signed((^reg20))))))
            begin
              reg23 <= reg20[(3'h4):(2'h2)];
            end
          else
            begin
              reg23 <= reg20;
              reg24 <= ((({reg23, (reg21 && reg20)} ?
                          wire17[(3'h6):(3'h6)] : ({reg19, (8'had)} ?
                              (!(8'hbb)) : $signed(reg18))) ?
                      (reg20[(4'ha):(3'h4)] > (8'ha7)) : wire17[(3'h5):(2'h2)]) ?
                  $signed($signed(reg19[(3'h4):(3'h4)])) : $unsigned((((&wire14) ?
                          $signed(reg23) : $unsigned(wire15)) ?
                      reg18 : $signed((~reg18)))));
              reg25 <= (8'hbe);
            end
          if ((reg23 ?
              ({(+(reg18 > wire14)),
                  {wire17[(1'h0):(1'h0)],
                      (&(8'ha1))}} == wire14[(2'h2):(1'h1)]) : ($signed((+$unsigned(wire15))) >= (&(reg24[(4'hb):(3'h4)] >= (wire15 ?
                  (7'h42) : reg25))))))
            begin
              reg26 <= reg21;
              reg27 <= (($unsigned(((|wire16) ^ $unsigned(reg23))) ?
                      (~^$unsigned($signed(reg22))) : (!reg21[(1'h1):(1'h1)])) ?
                  reg18 : $unsigned(reg18[(4'he):(2'h3)]));
              reg28 <= $signed((($signed($unsigned(reg25)) ?
                      (reg27[(1'h0):(1'h0)] ?
                          (wire15 <= reg23) : wire17[(4'h8):(4'h8)]) : reg22[(1'h1):(1'h0)]) ?
                  ((reg19 >>> (wire15 ? reg23 : wire14)) ?
                      ($unsigned(reg20) ?
                          (wire16 ?
                              reg27 : reg20) : reg18[(5'h12):(1'h1)]) : reg22[(1'h0):(1'h0)]) : $unsigned(reg23[(4'ha):(4'ha)])));
              reg29 <= ($unsigned(wire17) ?
                  (((wire14[(2'h2):(1'h1)] ?
                      (8'hb8) : reg23[(2'h3):(1'h0)]) >= (reg24 ?
                      (reg20 == (8'ha2)) : reg22)) * wire14[(2'h2):(1'h0)]) : (reg18[(3'h4):(1'h1)] && $unsigned($unsigned((~|reg23)))));
              reg30 <= $unsigned({$unsigned((8'hb3)), $signed(wire17)});
            end
          else
            begin
              reg26 <= ($signed(((~^$signed(wire17)) & (((8'hbc) || reg22) ?
                      $unsigned(wire14) : reg26))) ?
                  reg24 : $signed({{{reg26, (8'ha6)}}}));
              reg27 <= (reg18 ?
                  (((!reg18) ?
                          reg30[(4'hf):(4'hd)] : {reg22,
                              reg18[(5'h12):(3'h5)]}) ?
                      ({reg28} ?
                          ($signed((8'hb8)) ?
                              wire15[(1'h1):(1'h1)] : {reg27}) : {{reg27,
                                  reg18}}) : reg28[(3'h5):(1'h1)]) : reg18[(4'h9):(2'h3)]);
              reg28 <= (-$signed({$unsigned($signed(wire17)),
                  wire15[(1'h0):(1'h0)]}));
              reg29 <= {reg20[(4'h9):(1'h1)],
                  (reg21 + {((~&wire16) ? wire15 : {wire17}),
                      {((8'h9f) ? reg24 : wire14)}})};
              reg30 <= (^~wire14[(1'h1):(1'h0)]);
            end
        end
      else
        begin
          reg22 <= $unsigned((($signed((reg29 >> reg21)) ^~ ((wire14 && (8'hbe)) ?
                  reg27 : (reg29 << (7'h40)))) ?
              (^~wire14) : reg28[(2'h3):(2'h2)]));
          reg23 <= $unsigned(reg19);
          if (reg18[(4'he):(3'h4)])
            begin
              reg24 <= reg24;
              reg25 <= (!((8'h9f) == $unsigned(($signed((8'ha3)) ^ (reg28 & reg30)))));
              reg26 <= ((reg19 ?
                  reg30 : ($signed($unsigned(reg23)) <= reg25)) && {wire16[(1'h0):(1'h0)],
                  ((~^$unsigned(reg27)) ?
                      {(^~reg28), (wire16 | (8'hae))} : {{reg23}, wire16})});
              reg27 <= reg22[(2'h2):(1'h0)];
              reg28 <= (-$unsigned((&reg24[(3'h4):(3'h4)])));
            end
          else
            begin
              reg24 <= $unsigned(($signed(reg30) || (+$signed($unsigned(reg20)))));
              reg25 <= $unsigned((reg25 ?
                  wire17 : $signed(((~|reg28) ? $signed(wire14) : wire17))));
              reg26 <= {(~&wire16),
                  (($signed($unsigned(reg21)) || reg21[(2'h2):(1'h0)]) ^ wire16[(2'h2):(2'h2)])};
            end
          reg29 <= wire16[(1'h0):(1'h0)];
        end
      reg31 <= (~^reg26);
      reg32 <= ((reg21 ?
              $unsigned(((reg18 ? wire17 : reg20) ?
                  reg18 : (reg25 ?
                      reg29 : (7'h43)))) : $unsigned($unsigned((8'h9f)))) ?
          $unsigned($signed(reg18)) : ($signed(reg20) ?
              reg29[(4'he):(4'hd)] : reg26[(4'hc):(4'h9)]));
    end
  assign wire33 = (8'hae);
  assign wire34 = (|($unsigned({$signed(wire16), (reg20 ? wire33 : reg21)}) ?
                      (reg30 >= wire17) : ((~|$signed(reg25)) ?
                          (((8'hb6) ?
                              wire16 : reg22) < $signed(reg27)) : $signed(reg20[(3'h5):(1'h1)]))));
  assign wire35 = (+(~^$signed(reg22[(3'h4):(1'h0)])));
endmodule
