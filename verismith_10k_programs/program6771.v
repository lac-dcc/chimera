module top
#(parameter param78 = ((({((7'h43) ? (8'hb6) : (8'ha1))} ? ({(7'h44)} || ((8'hb2) ? (8'hb0) : (8'hbc))) : ((~^(7'h41)) ? {(8'hbf), (7'h41)} : {(8'hb4)})) ? ({((8'ha9) ? (8'hb3) : (8'hba)), {(8'hbf), (8'ha0)}} ? (8'hbd) : (~|((8'ha3) ~^ (8'haa)))) : (~((|(8'hb6)) ? ((8'hb8) && (8'hb3)) : ((8'hb1) && (8'had))))) ~^ ({(((8'hbc) ? (8'ha7) : (8'hba)) >>> ((8'h9d) ? (7'h41) : (8'haf)))} ? (8'ha3) : {(~&((8'hb8) | (7'h44))), (((8'hac) ? (7'h42) : (7'h44)) ? {(8'h9d), (8'had)} : ((8'hab) != (8'had)))})), 
parameter param79 = ((~param78) ? (-{(-(param78 ? param78 : (8'ha8))), param78}) : {((~&(param78 >>> param78)) ? ((~|param78) ? (param78 | param78) : (param78 ? param78 : param78)) : param78)}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  wire [(3'h5):(1'h0)] wire77;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire75;
  reg signed [(2'h2):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  reg [(4'hf):(1'h0)] reg6 = (1'h0);
  reg [(4'h8):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg9 = (1'h0);
  reg [(3'h7):(1'h0)] reg10 = (1'h0);
  reg [(5'h14):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(5'h13):(1'h0)] reg13 = (1'h0);
  reg [(3'h4):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg15 = (1'h0);
  assign y = {wire77,
                 wire16,
                 wire17,
                 wire75,
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 reg14,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= (($signed(wire2[(3'h7):(3'h4)]) > (~|($signed((8'h9f)) - $unsigned(wire3)))) ?
          (~|$signed($signed((^~wire2)))) : (^$signed($signed($signed(wire3)))));
      if ((~^wire2[(3'h5):(2'h3)]))
        begin
          if ((~$unsigned($unsigned(((~wire2) << reg4[(1'h1):(1'h0)])))))
            begin
              reg5 <= wire2;
              reg6 <= (wire3[(4'hd):(4'hc)] ?
                  reg4 : ((|$unsigned((^(8'h9e)))) ?
                      (((^wire1) ? $signed(wire3) : (-wire0)) ?
                          $signed(((8'hb6) ?
                              (8'hb6) : wire3)) : $unsigned((~&reg5))) : $signed(wire0[(4'h9):(3'h6)])));
              reg7 <= {(~$unsigned($unsigned($unsigned(reg5))))};
              reg8 <= (-((reg7[(4'h8):(2'h2)] <<< reg6) ?
                  (|($signed(wire3) ^ (wire1 ^~ reg7))) : wire0));
            end
          else
            begin
              reg5 <= $signed($unsigned({((wire3 ? reg4 : reg5) ?
                      ((8'hbc) ? wire3 : reg8) : (~|reg8)),
                  $signed((&wire0))}));
              reg6 <= $unsigned(((8'hac) && reg7));
              reg7 <= wire2;
            end
          reg9 <= $unsigned((8'hb8));
          if ({$signed($unsigned({reg5, $signed((8'hae))})),
              {{((!reg5) ^~ (reg5 ? wire2 : wire3))}}})
            begin
              reg10 <= $signed($signed($signed(reg9[(3'h7):(3'h7)])));
              reg11 <= (reg5[(4'hd):(1'h1)] != reg6);
              reg12 <= ((~&wire0[(3'h7):(3'h4)]) ?
                  reg10[(1'h0):(1'h0)] : $unsigned(({(reg9 - wire3)} ?
                      {reg6, {wire2}} : (wire0 | (reg7 ? wire1 : reg5)))));
              reg13 <= $signed($signed({{(~&reg10)}}));
              reg14 <= (^wire0);
            end
          else
            begin
              reg10 <= $unsigned((-(!{(-wire0), $signed(reg5)})));
              reg11 <= ((~($signed(reg6[(1'h1):(1'h1)]) ?
                      {{(8'ha6), (8'h9c)},
                          $unsigned(reg7)} : (reg8[(3'h6):(1'h1)] ?
                          reg11[(4'hc):(3'h6)] : wire2[(4'h9):(4'h8)]))) ?
                  reg12 : $signed({$unsigned(wire1[(3'h7):(2'h3)]),
                      (^(reg5 ? reg9 : reg4))}));
              reg12 <= $unsigned(($signed($signed((wire3 >> reg9))) <= {{(wire2 >= (8'hba)),
                      $signed(reg5)}}));
              reg13 <= (~($unsigned({(wire1 ? (8'hbf) : wire2), {reg11}}) ?
                  (8'hb0) : reg5[(5'h12):(4'hd)]));
              reg14 <= $signed(reg9[(4'h9):(4'h8)]);
            end
          reg15 <= (($unsigned((~&wire1)) ^ ($signed($unsigned(wire3)) & (wire3[(2'h3):(1'h0)] ?
                  wire1 : reg9))) ?
              (wire2[(2'h2):(1'h0)] == (^$signed($unsigned(reg9)))) : (((7'h41) != wire2) ~^ (-{reg13})));
        end
      else
        begin
          reg5 <= wire2;
          reg6 <= $signed($unsigned($signed($unsigned(reg4))));
        end
    end
  assign wire16 = $unsigned((8'hb1));
  assign wire17 = wire1[(1'h1):(1'h0)];
  module18 #() modinst76 (.clk(clk), .wire19(wire0), .wire22(reg11), .y(wire75), .wire20(reg5), .wire21(reg15));
  assign wire77 = reg15;
endmodule

module module18  (y, clk, wire19, wire20, wire21, wire22);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire19;
  input wire [(5'h14):(1'h0)] wire20;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(5'h14):(1'h0)] wire22;
  wire signed [(4'hf):(1'h0)] wire74;
  wire [(5'h15):(1'h0)] wire73;
  wire [(5'h12):(1'h0)] wire23;
  wire signed [(3'h6):(1'h0)] wire24;
  wire [(4'hf):(1'h0)] wire25;
  wire signed [(3'h7):(1'h0)] wire71;
  assign y = {wire74, wire73, wire23, wire24, wire25, wire71, (1'h0)};
  assign wire23 = ($unsigned({(^wire21)}) ?
                      $signed({(~&(^wire20)),
                          (~|wire20[(2'h2):(1'h0)])}) : $unsigned((7'h42)));
  assign wire24 = (~&$unsigned(wire21));
  assign wire25 = $signed({$unsigned({wire22[(5'h11):(4'hb)], wire24})});
  module26 #() modinst72 (.wire28(wire19), .wire30(wire25), .wire27(wire23), .y(wire71), .clk(clk), .wire31(wire24), .wire29(wire21));
  assign wire73 = $signed((((8'hb3) << {wire71}) ?
                      (!$signed((!wire19))) : (~&wire19)));
  assign wire74 = $signed(($unsigned($unsigned($signed(wire20))) ?
                      (((|wire22) ? (wire20 ^ wire21) : (8'hb1)) ?
                          wire19 : ((-wire23) == wire22)) : wire24[(3'h5):(3'h4)]));
endmodule

module module26
#(parameter param69 = (((!(!((8'hb5) || (8'had)))) ? {(((8'hb5) | (8'ha0)) >>> ((8'ha4) ? (8'ha9) : (8'h9d))), (((8'ha0) ? (8'ha3) : (8'hbf)) - ((8'h9d) ? (8'hb2) : (8'hb7)))} : ({((8'hb3) ? (8'haf) : (8'hb5)), ((8'hb8) || (8'had))} ? (((8'hb4) < (8'ha0)) ? ((8'h9e) ? (7'h40) : (8'hb2)) : ((7'h41) ? (8'haa) : (8'hbc))) : ((~(8'hbd)) ? ((8'hb3) ? (8'hb7) : (8'ha1)) : ((8'haa) ? (8'hac) : (8'hb2))))) ? ((((|(8'hbf)) || (^(8'haa))) ? (((8'hab) ? (8'hb4) : (8'hae)) ? {(8'hb8), (8'hb1)} : {(8'hab), (8'h9f)}) : ((|(8'ha0)) >= ((8'hb6) != (8'ha5)))) >> (!(!((8'h9f) ? (8'ha0) : (8'hb2))))) : (8'h9c)), 
parameter param70 = ((8'hb8) ^~ {{param69}, ((~(param69 ? param69 : param69)) - ({(8'hbb)} >= {param69, param69}))}))
(y, clk, wire31, wire30, wire29, wire28, wire27);
  output wire [(32'h19b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire31;
  input wire [(4'hf):(1'h0)] wire30;
  input wire [(4'hb):(1'h0)] wire29;
  input wire signed [(4'h8):(1'h0)] wire28;
  input wire signed [(5'h11):(1'h0)] wire27;
  wire [(4'h9):(1'h0)] wire68;
  wire [(4'ha):(1'h0)] wire67;
  wire [(4'hc):(1'h0)] wire63;
  wire [(4'hf):(1'h0)] wire48;
  wire [(4'he):(1'h0)] wire47;
  wire [(4'ha):(1'h0)] wire46;
  wire signed [(2'h2):(1'h0)] wire45;
  wire [(5'h12):(1'h0)] wire44;
  wire signed [(5'h11):(1'h0)] wire43;
  wire signed [(4'hf):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire39;
  wire [(4'h9):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire37;
  wire signed [(4'he):(1'h0)] wire36;
  wire [(2'h2):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(3'h7):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(3'h7):(1'h0)] reg58 = (1'h0);
  reg [(4'hb):(1'h0)] reg57 = (1'h0);
  reg [(5'h15):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg55 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg [(2'h2):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg52 = (1'h0);
  reg [(3'h6):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg42 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire63,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 reg66,
                 reg65,
                 reg64,
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
                 reg42,
                 (1'h0)};
  assign wire32 = wire27;
  assign wire33 = $unsigned(wire30);
  assign wire34 = (^~$signed((~wire30[(4'ha):(2'h2)])));
  assign wire35 = {(+(((wire29 ? wire29 : wire31) ?
                              (wire30 ? wire27 : wire34) : (^~(8'hb8))) ?
                          $signed((wire29 <<< wire30)) : $unsigned((wire31 ~^ wire34)))),
                      wire33};
  assign wire36 = wire32[(5'h13):(1'h1)];
  assign wire37 = $signed($signed($unsigned((~|{wire28}))));
  assign wire38 = ({(^(wire35 > ((8'hb2) >> wire32))),
                      ((|wire30[(4'ha):(3'h6)]) || $unsigned((|wire30)))} + wire36);
  assign wire39 = $unsigned($unsigned((7'h42)));
  assign wire40 = ((^~(wire36[(1'h1):(1'h1)] ?
                      ($signed(wire33) ?
                          wire35 : (wire30 ?
                              wire31 : wire27)) : $signed($signed(wire37)))) >>> $unsigned((+wire27[(5'h11):(4'hb)])));
  assign wire41 = $signed(wire38[(2'h3):(1'h0)]);
  always
    @(posedge clk) begin
      reg42 <= (wire35[(1'h0):(1'h0)] * wire27[(3'h7):(3'h4)]);
    end
  assign wire43 = (wire27[(4'hd):(4'h9)] ?
                      ($signed($unsigned(wire31[(2'h2):(2'h2)])) ?
                          $unsigned((wire34 ?
                              $unsigned(wire27) : wire28)) : $signed($unsigned({wire27}))) : wire29[(2'h3):(2'h3)]);
  assign wire44 = $signed({wire33});
  assign wire45 = wire30;
  assign wire46 = (($signed(((wire45 ? wire33 : reg42) ?
                          (8'hb5) : wire39)) >= wire35[(1'h1):(1'h0)]) ?
                      ((wire37 ? $unsigned(wire29[(3'h4):(2'h2)]) : wire37) ?
                          $signed({wire30}) : wire38) : ({(wire35[(2'h2):(1'h1)] ?
                              wire39 : ((8'ha1) ? wire40 : wire35)),
                          $unsigned($unsigned(reg42))} <<< (($signed(wire32) || $unsigned(wire34)) ?
                          (|$unsigned(wire39)) : $signed($unsigned((7'h43))))));
  assign wire47 = $signed($signed((+wire27[(3'h4):(2'h3)])));
  assign wire48 = (~{{((wire35 ^~ wire33) ? (&wire44) : wire35)},
                      (wire38 ?
                          (wire45 ?
                              (-wire44) : wire43[(5'h11):(3'h4)]) : $unsigned($unsigned((8'h9d))))});
  always
    @(posedge clk) begin
      if (({(~|{(wire38 == (8'hbc))}),
          wire28[(2'h3):(2'h3)]} >>> ((~|$unsigned((wire44 && wire34))) ?
          ((~wire31) || $unsigned(((8'h9f) ?
              wire27 : (8'h9d)))) : wire47[(1'h0):(1'h0)])))
        begin
          reg49 <= (^~$unsigned(wire37[(3'h5):(1'h0)]));
          reg50 <= wire27;
          reg51 <= wire44;
        end
      else
        begin
          if ((|wire46[(1'h0):(1'h0)]))
            begin
              reg49 <= wire28[(1'h1):(1'h1)];
              reg50 <= (wire33 < reg42);
              reg51 <= $unsigned({wire39[(3'h5):(1'h1)]});
              reg52 <= (wire36[(4'hb):(3'h6)] != {(~|wire46[(3'h7):(2'h2)]),
                  $signed((~wire29))});
              reg53 <= (~&$signed(wire46[(3'h5):(2'h3)]));
            end
          else
            begin
              reg49 <= wire46;
              reg50 <= ($unsigned((wire41 ?
                      wire38[(4'h9):(3'h7)] : $signed((!wire45)))) ?
                  $unsigned($unsigned($signed($unsigned(wire34)))) : $signed((&(!(wire38 ?
                      wire47 : wire41)))));
            end
          reg54 <= (~&(wire47 * $signed($signed($signed(wire44)))));
          reg55 <= ($signed((~|(~&wire29))) < $unsigned((wire47 + (-wire47))));
        end
      if ($signed($unsigned(wire47[(1'h0):(1'h0)])))
        begin
          reg56 <= wire31[(3'h5):(2'h3)];
        end
      else
        begin
          reg56 <= $unsigned(wire47);
          if ($unsigned(wire39[(3'h4):(1'h1)]))
            begin
              reg57 <= reg49;
              reg58 <= {$unsigned($signed($signed(wire48)))};
              reg59 <= reg55;
              reg60 <= wire34[(1'h0):(1'h0)];
            end
          else
            begin
              reg57 <= wire43[(4'he):(1'h1)];
              reg58 <= $signed(reg52);
              reg59 <= $signed({reg52[(4'hf):(4'h8)]});
              reg60 <= (reg50[(1'h1):(1'h1)] >= wire32[(4'ha):(1'h1)]);
              reg61 <= ($unsigned({((reg50 == reg52) ?
                      ((8'h9f) != (8'ha7)) : (wire37 ^ reg60)),
                  reg59[(4'h9):(1'h0)]}) | (wire41[(1'h1):(1'h0)] ?
                  ($unsigned($unsigned(wire43)) ^~ wire32) : reg53));
            end
          reg62 <= (wire38 ?
              ((~^((wire41 & wire33) ? (reg60 == wire30) : $unsigned(reg49))) ?
                  ($unsigned({wire31}) > $signed((~^wire28))) : (8'hb7)) : $unsigned(wire35[(1'h0):(1'h0)]));
        end
    end
  assign wire63 = $unsigned($unsigned(($unsigned(((7'h42) ?
                      wire47 : reg50)) & ({reg53} ?
                      (wire36 ? wire31 : wire48) : reg54[(3'h6):(1'h1)]))));
  always
    @(posedge clk) begin
      reg64 <= (wire41[(4'he):(2'h3)] ?
          (wire48 ?
              {(~|{wire46,
                      (8'hb8)})} : (wire40[(4'hf):(3'h7)] >= ($unsigned((8'h9f)) > {wire30}))) : $unsigned(reg60));
      if (reg62)
        begin
          reg65 <= wire31[(2'h2):(2'h2)];
          reg66 <= {$signed((~^$signed($unsigned(reg60))))};
        end
      else
        begin
          reg65 <= (((((~&wire38) || (wire28 & wire38)) >> {$unsigned(reg54),
              (reg59 ?
                  wire34 : reg51)}) | wire32[(4'hd):(4'ha)]) * {($signed(((8'hae) != wire39)) ?
                  (wire30[(1'h1):(1'h1)] ?
                      ((8'hb7) ?
                          wire43 : reg56) : wire29) : (reg61 - wire36[(3'h4):(2'h2)])),
              wire29});
        end
    end
  assign wire67 = ((!$signed(($unsigned((8'ha2)) ?
                      wire48[(3'h4):(2'h3)] : (~|reg66)))) == (~&$unsigned(((reg60 ?
                      (8'hbf) : wire27) ~^ $unsigned(reg61)))));
  assign wire68 = (8'hb5);
endmodule
