module top
#(parameter param69 = ((!{(((8'ha1) && (8'h9c)) ? ((8'ha5) ? (8'hb6) : (8'ha2)) : ((8'hb2) ? (8'ha4) : (8'hab))), {(-(8'ha2))}}) >> (~^(((!(8'hbf)) ? {(8'hbd)} : {(8'h9c), (7'h44)}) << (+((8'hae) ? (8'h9c) : (8'h9e)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire3;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire65;
  wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'h9):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  assign y = {wire65,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg68,
                 reg67,
                 (1'h0)};
  assign wire4 = $signed(wire3);
  assign wire5 = $signed(wire0);
  assign wire6 = $signed($unsigned({wire3[(4'hc):(3'h4)]}));
  assign wire7 = wire0;
  assign wire8 = wire3;
  assign wire9 = wire1[(3'h6):(3'h5)];
  module10 #() modinst66 (.wire13(wire9), .wire12(wire3), .wire14(wire1), .wire11(wire8), .y(wire65), .clk(clk));
  always
    @(posedge clk) begin
      reg67 <= wire6;
      reg68 <= (wire6[(5'h14):(3'h5)] - wire2);
    end
endmodule

module module10
#(parameter param63 = ((~^{(~|(-(8'ha0))), ({(7'h42), (8'h9d)} <<< ((8'hba) ^~ (8'ha9)))}) <<< (~((((8'hae) ? (8'hbf) : (8'hbf)) - (!(8'ha6))) ~^ (^~((8'ha5) <<< (8'hb5)))))), 
parameter param64 = param63)
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h132):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire14;
  input wire [(3'h6):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(4'hf):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire42;
  wire [(4'h8):(1'h0)] wire41;
  wire [(5'h10):(1'h0)] wire40;
  wire [(3'h6):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire15;
  reg signed [(4'hd):(1'h0)] reg62 = (1'h0);
  reg [(4'ha):(1'h0)] reg61 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(2'h3):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg57 = (1'h0);
  reg [(3'h4):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(2'h2):(1'h0)] reg54 = (1'h0);
  reg [(4'hc):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg49 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg43 = (1'h0);
  assign y = {wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire15,
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
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 (1'h0)};
  assign wire15 = wire13[(2'h3):(2'h3)];
  module16 #() modinst37 (.y(wire36), .clk(clk), .wire20(wire12), .wire17(wire11), .wire18(wire14), .wire19(wire15));
  assign wire38 = ({(^$signed((+wire13)))} ?
                      $signed($unsigned($unsigned($unsigned(wire13)))) : wire11[(2'h2):(1'h0)]);
  assign wire39 = (~&wire13[(3'h5):(3'h4)]);
  assign wire40 = ((((+$signed((8'h9d))) ? wire36 : wire38[(4'h8):(3'h5)]) ?
                      wire38[(4'h8):(2'h2)] : wire39) < $signed(((8'hb9) >> $signed(wire36))));
  assign wire41 = ((~|(~|{(wire40 + wire39)})) ?
                      wire38[(3'h4):(1'h0)] : wire38);
  assign wire42 = {$signed(($unsigned((wire14 >= wire14)) ^ (((8'hb7) << wire13) - wire36[(4'hb):(4'h8)]))),
                      {wire40[(3'h7):(2'h2)]}};
  always
    @(posedge clk) begin
      if ($signed((wire39[(2'h3):(2'h3)] && (wire42[(4'h9):(1'h0)] ?
          wire14 : (-wire38[(2'h3):(1'h1)])))))
        begin
          reg43 <= (^~(-{(~|$signed(wire12))}));
          reg44 <= $unsigned({(^$unsigned(wire14)),
              (wire42 ?
                  $signed((wire14 <<< wire15)) : $signed(((8'h9d) ?
                      wire14 : wire41)))});
          if ($signed((~^{(~(^(8'ha3))), ((wire13 == reg44) - (~&wire42))})))
            begin
              reg45 <= $signed(wire38[(3'h4):(2'h2)]);
            end
          else
            begin
              reg45 <= ($signed($unsigned($signed((+wire39)))) ^ reg43);
              reg46 <= (wire40[(4'hf):(4'hf)] || (!(8'h9f)));
              reg47 <= $signed($unsigned(wire42[(4'ha):(3'h7)]));
              reg48 <= ($signed(reg44) >>> $unsigned((^~(wire38[(1'h1):(1'h0)] + $signed((7'h40))))));
            end
          reg49 <= $signed(($signed(((wire38 & wire14) <<< $signed(wire41))) >> wire40));
          if (wire40)
            begin
              reg50 <= (~&{((wire15[(4'hf):(4'hd)] ?
                          ((8'ha5) ? (8'hac) : reg45) : wire12) ?
                      (!reg43[(1'h0):(1'h0)]) : {(8'hbb), $unsigned(wire40)}),
                  wire42[(3'h4):(1'h1)]});
              reg51 <= $unsigned((wire40[(3'h5):(1'h1)] ?
                  (+$unsigned($unsigned(wire41))) : wire13[(1'h1):(1'h0)]));
            end
          else
            begin
              reg50 <= (wire15 ?
                  (wire14 ~^ $unsigned((~reg50))) : $signed($signed((&(wire11 != (8'ha2))))));
              reg51 <= $unsigned(((((wire15 > (8'hb8)) && (reg50 <= (8'had))) ?
                      (reg45[(3'h5):(1'h0)] >>> wire11) : $signed({wire42})) ?
                  $signed((^$unsigned(wire39))) : (wire38 ?
                      ((reg51 ?
                          wire38 : wire15) * reg48) : ({(8'hb9)} != (~^wire15)))));
              reg52 <= (^~wire38[(1'h1):(1'h0)]);
              reg53 <= ($signed(((wire11[(2'h2):(1'h1)] ?
                      {reg52} : (^wire39)) >>> {reg51[(5'h15):(2'h2)],
                      reg44[(1'h0):(1'h0)]})) ?
                  ((~($signed(reg48) ^ $signed((8'had)))) <= wire36) : $signed($unsigned((wire38 ?
                      reg52 : wire38))));
              reg54 <= wire40[(4'hd):(4'hb)];
            end
        end
      else
        begin
          reg43 <= {wire42[(4'hb):(4'h9)], wire15[(4'hd):(3'h4)]};
          if (reg50)
            begin
              reg44 <= $unsigned(wire13[(1'h1):(1'h1)]);
            end
          else
            begin
              reg44 <= (8'hbf);
              reg45 <= $signed(reg49);
              reg46 <= (wire15[(1'h0):(1'h0)] ?
                  $signed((|reg52)) : ($unsigned((wire41[(2'h3):(2'h3)] ?
                          reg48[(2'h2):(1'h0)] : wire14)) ?
                      (7'h42) : reg46[(3'h4):(3'h4)]));
            end
          reg47 <= $signed((($unsigned(reg44[(1'h1):(1'h1)]) || (|(wire42 && (8'ha1)))) ?
              (^(-(reg49 ?
                  wire13 : wire41))) : $unsigned((reg50 ^~ (wire41 * wire36)))));
        end
      reg55 <= $signed($signed(wire11));
      reg56 <= {wire12};
      if ((~|wire38))
        begin
          if ($unsigned(wire14))
            begin
              reg57 <= $signed($signed($unsigned($unsigned((8'hb9)))));
              reg58 <= (wire15[(4'ha):(1'h0)] ~^ reg45);
            end
          else
            begin
              reg57 <= ((^(^reg46[(3'h7):(3'h6)])) == $signed({$signed($unsigned(reg50)),
                  wire13}));
              reg58 <= wire36[(4'hb):(4'ha)];
              reg59 <= (|$signed((~^{$signed(reg52)})));
              reg60 <= $unsigned(wire39);
            end
        end
      else
        begin
          if ((reg44[(3'h5):(1'h0)] ~^ (|$signed($unsigned((reg51 << (7'h42)))))))
            begin
              reg57 <= (($unsigned(((reg57 < reg50) ?
                  (8'hba) : (7'h42))) >> (|$signed((!reg48)))) || reg47);
              reg58 <= (8'ha6);
              reg59 <= (~|{((~&(+wire42)) ?
                      wire42[(4'hd):(4'hb)] : $signed($signed(reg50)))});
              reg60 <= (8'hb0);
              reg61 <= $signed(wire39[(2'h3):(2'h3)]);
            end
          else
            begin
              reg57 <= wire14[(5'h13):(4'he)];
            end
        end
      reg62 <= reg61;
    end
endmodule

module module16
#(parameter param35 = (!({((!(8'hb6)) ? (8'hbc) : ((8'hb6) ? (8'ha9) : (8'hbd)))} <<< ({((8'hac) ? (8'ha5) : (7'h42))} != (^~((8'hbc) ? (7'h42) : (8'ha4)))))))
(y, clk, wire20, wire19, wire18, wire17);
  output wire [(32'hb1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire20;
  input wire signed [(5'h14):(1'h0)] wire19;
  input wire signed [(4'he):(1'h0)] wire18;
  input wire [(4'hf):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire25;
  wire signed [(4'hf):(1'h0)] wire24;
  wire signed [(4'h9):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire signed [(5'h12):(1'h0)] wire21;
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(5'h11):(1'h0)] reg31 = (1'h0);
  reg [(5'h14):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg26 = (1'h0);
  assign y = {wire34,
                 wire25,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire21 = wire19[(4'hb):(3'h6)];
  assign wire22 = ((^~($signed({wire17}) ?
                      (|wire19[(4'h9):(2'h3)]) : (^(wire21 | wire18)))) + wire18[(4'hb):(4'h9)]);
  assign wire23 = $unsigned(wire20[(2'h2):(1'h1)]);
  assign wire24 = ($unsigned(wire21[(5'h10):(4'hd)]) && wire18[(2'h3):(2'h2)]);
  assign wire25 = wire22[(3'h6):(2'h2)];
  always
    @(posedge clk) begin
      reg26 <= $unsigned(((-(^~$unsigned(wire17))) ?
          (wire19[(4'hc):(4'hb)] >= $unsigned((~^wire22))) : $signed($signed(((8'hab) ~^ wire22)))));
      reg27 <= $signed((wire18[(3'h4):(2'h3)] >= {$signed($unsigned((8'ha1))),
          wire18}));
      reg28 <= ($signed({(~&$unsigned(wire24))}) ?
          (!(~|(-{wire20}))) : (wire22 < $signed(reg26[(3'h5):(3'h4)])));
    end
  always
    @(posedge clk) begin
      reg29 <= reg26;
      reg30 <= $unsigned((8'hb7));
      reg31 <= $signed($signed(((-reg27) ?
          (!(wire22 ? wire23 : wire24)) : $unsigned($signed(reg27)))));
      reg32 <= reg30;
      reg33 <= (reg26[(2'h2):(1'h0)] ^ $unsigned((!$signed($signed(reg29)))));
    end
  assign wire34 = wire23[(2'h3):(1'h1)];
endmodule
