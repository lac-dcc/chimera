module top
#(parameter param81 = {(|({((8'h9f) ? (8'hb5) : (8'ha2)), {(7'h41)}} << (~|((8'h9f) ? (8'hb6) : (8'ha6))))), {(~&(((8'ha6) & (8'hbb)) & (|(8'hb4)))), ((((7'h42) >>> (8'hbc)) || ((8'hbf) ? (8'hbd) : (7'h41))) >>> {((8'hab) ? (8'hb5) : (8'hb0))})}})
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h98):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire80;
  wire signed [(3'h5):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire signed [(4'hf):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire4;
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg [(4'h9):(1'h0)] reg10 = (1'h0);
  reg [(4'h9):(1'h0)] reg9 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg7 = (1'h0);
  reg [(4'ha):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  assign y = {wire80,
                 wire78,
                 wire77,
                 wire75,
                 wire4,
                 reg79,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (~|wire3[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg5 <= $unsigned({wire0[(3'h7):(3'h5)],
          $signed(($signed((7'h42)) > (&wire1)))});
    end
  always
    @(posedge clk) begin
      reg6 <= (~($unsigned((~^$signed(wire0))) & ((+wire1) ?
          $unsigned((wire4 << wire1)) : ((wire3 ~^ wire4) ?
              wire2 : (wire3 ? wire1 : wire2)))));
      if (wire4[(4'hb):(3'h6)])
        begin
          reg7 <= $unsigned($unsigned(wire4));
        end
      else
        begin
          reg7 <= wire1[(1'h1):(1'h1)];
          reg8 <= reg6[(3'h6):(3'h5)];
          reg9 <= reg6[(4'h9):(3'h5)];
          reg10 <= $signed(($unsigned($unsigned(reg6)) ?
              (^{(!reg5)}) : (~&reg6[(3'h6):(3'h4)])));
        end
    end
  module11 #() modinst76 (wire75, clk, reg6, wire0, wire2, reg8);
  assign wire77 = ((~&$signed({reg6})) ?
                      $signed(wire2) : (wire0[(1'h1):(1'h1)] ?
                          $unsigned(((reg5 ?
                              wire75 : wire1) + (~wire75))) : wire4[(3'h4):(1'h0)]));
  assign wire78 = (~reg9[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg79 <= ($unsigned(wire1[(2'h3):(1'h1)]) ?
          (|({(wire0 ? wire2 : reg9), $unsigned(wire0)} ^ ($unsigned(wire3) ?
              (wire75 ?
                  reg10 : (8'ha6)) : wire0[(4'hc):(4'hb)]))) : {(|($signed((7'h40)) << reg5[(2'h2):(2'h2)]))});
    end
  assign wire80 = $unsigned(((~{(wire77 ?
                          reg8 : reg9)}) ^~ (^$unsigned(reg6[(3'h5):(2'h2)]))));
endmodule

module module11
#(parameter param73 = {(({((8'ha1) ? (8'hbc) : (7'h41))} * (^(|(8'had)))) >= ((((8'hb4) ? (7'h43) : (8'h9f)) & {(8'ha5)}) ? (8'hb7) : (-(8'ha2))))}, 
parameter param74 = (^~param73))
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire signed [(4'hd):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire72;
  wire [(4'hb):(1'h0)] wire70;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire49;
  wire signed [(2'h3):(1'h0)] wire48;
  wire signed [(2'h2):(1'h0)] wire47;
  wire [(4'h9):(1'h0)] wire46;
  wire [(3'h5):(1'h0)] wire42;
  wire [(4'ha):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire40;
  wire signed [(5'h12):(1'h0)] wire39;
  wire [(4'hc):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire29;
  wire [(5'h14):(1'h0)] wire16;
  reg [(5'h13):(1'h0)] reg52 = (1'h0);
  reg [(3'h4):(1'h0)] reg51 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg45 = (1'h0);
  reg [(3'h7):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg38 = (1'h0);
  reg [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg34 = (1'h0);
  reg [(4'hf):(1'h0)] reg33 = (1'h0);
  reg [(5'h13):(1'h0)] reg32 = (1'h0);
  assign y = {wire72,
                 wire70,
                 wire53,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire31,
                 wire29,
                 wire16,
                 reg52,
                 reg51,
                 reg50,
                 reg45,
                 reg44,
                 reg43,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 reg32,
                 (1'h0)};
  assign wire16 = ($unsigned($signed({$signed(wire12),
                      (8'h9e)})) & $signed($signed($signed($unsigned(wire12)))));
  module17 #() modinst30 (wire29, clk, wire14, wire15, wire12, wire16);
  assign wire31 = (^wire15);
  always
    @(posedge clk) begin
      reg32 <= (wire14 <= ($unsigned(wire13[(2'h2):(2'h2)]) ?
          (~&(~wire15)) : $unsigned(wire16)));
      if (wire31)
        begin
          reg33 <= wire29[(1'h0):(1'h0)];
          reg34 <= (8'ha1);
          reg35 <= ({wire13, $unsigned(wire16)} ?
              wire31[(3'h6):(1'h1)] : (8'hb5));
          reg36 <= $signed(wire15[(3'h4):(1'h0)]);
        end
      else
        begin
          reg33 <= reg35[(4'h8):(3'h7)];
          reg34 <= $unsigned(wire16);
          reg35 <= reg34[(4'hb):(3'h7)];
          reg36 <= {($unsigned($unsigned((8'hb4))) ^ (^((reg33 ?
                  wire14 : (8'hbf)) << $unsigned(reg34)))),
              $unsigned({$unsigned({wire31, wire14}),
                  (wire14[(4'h9):(4'h8)] ? (|wire13) : $unsigned(wire29))})};
        end
      reg37 <= ((^~$unsigned(((8'hac) < $unsigned(wire13)))) >>> reg34);
      reg38 <= reg33[(3'h4):(2'h2)];
    end
  assign wire39 = wire13[(2'h2):(2'h2)];
  assign wire40 = ($unsigned(wire15) ^ (~&(-wire29[(4'ha):(4'h9)])));
  assign wire41 = wire39[(3'h6):(2'h3)];
  assign wire42 = $unsigned((~|wire31[(4'h8):(3'h4)]));
  always
    @(posedge clk) begin
      reg43 <= (~^reg37);
      reg44 <= ((-reg38) == $signed($unsigned({(reg37 ? wire41 : reg33),
          reg34})));
      reg45 <= {(wire31 * (((wire14 | reg35) ?
                  (reg44 ? reg43 : wire29) : {reg32}) ?
              $unsigned(((8'hb0) + (8'ha1))) : ((8'hbc) ?
                  (wire41 - wire39) : (8'haa)))),
          (8'hbf)};
    end
  assign wire46 = (~&$unsigned({((wire14 ?
                          wire31 : wire13) && $signed(reg44))}));
  assign wire47 = $signed(wire29);
  assign wire48 = (reg37 * $signed(wire40[(3'h6):(1'h1)]));
  assign wire49 = (~^({$signed(reg44)} & (((^wire40) ?
                      wire15[(3'h5):(3'h5)] : (wire39 ?
                          wire12 : wire15)) << ({reg33} >= wire31[(4'h8):(1'h1)]))));
  always
    @(posedge clk) begin
      reg50 <= $unsigned(reg43[(3'h6):(1'h1)]);
      reg51 <= wire14;
      reg52 <= {(7'h40), $signed(reg44[(3'h4):(1'h1)])};
    end
  assign wire53 = (reg43 >= $signed($unsigned($unsigned($signed(reg34)))));
  module54 #() modinst71 (wire70, clk, wire53, reg35, wire13, reg34);
  assign wire72 = wire41;
endmodule

module module54
#(parameter param69 = (~|((+{((8'ha8) ? (8'h9f) : (8'ha3)), ((8'haf) ^~ (7'h41))}) ? ((8'hbc) & (~|((8'hb2) ? (8'hb2) : (8'ha5)))) : (|(~|(~|(8'ha8)))))))
(y, clk, wire58, wire57, wire56, wire55);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire58;
  input wire [(4'he):(1'h0)] wire57;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire [(4'hc):(1'h0)] wire55;
  wire [(4'hf):(1'h0)] wire68;
  wire signed [(4'h8):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire61;
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg65 = (1'h0);
  reg [(2'h2):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg62 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire61,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg60,
                 reg59,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg59 <= (wire56[(5'h15):(3'h6)] ?
          $signed($unsigned(wire58[(2'h3):(1'h0)])) : ({(~^$signed(wire55))} ?
              wire58[(3'h4):(2'h3)] : wire57[(1'h0):(1'h0)]));
      reg60 <= $signed(wire56[(5'h10):(1'h0)]);
    end
  assign wire61 = wire57;
  always
    @(posedge clk) begin
      reg62 <= wire58;
      if ($signed(wire55[(3'h6):(3'h5)]))
        begin
          reg63 <= (((~|wire58) - (wire57 ~^ (+$unsigned(wire56)))) ?
              $signed((wire55 * ({wire58, wire57} ?
                  (reg59 ?
                      reg62 : wire56) : (wire55 + wire58)))) : $signed(((~(~&wire55)) || $signed($signed(reg62)))));
          reg64 <= (reg60 ?
              $unsigned($signed(((~reg60) + $signed(reg62)))) : reg60[(4'hd):(3'h7)]);
        end
      else
        begin
          if ($signed((reg59 | $signed(reg63))))
            begin
              reg63 <= (~^{(&((!wire58) ?
                      wire55[(3'h7):(3'h5)] : $signed((7'h40)))),
                  (!$unsigned(reg62[(2'h3):(1'h1)]))});
              reg64 <= ((!(wire61[(4'ha):(4'ha)] ~^ ((~|wire58) == (~&wire56)))) == wire61[(4'ha):(3'h5)]);
              reg65 <= $unsigned((^(!($signed(reg64) ?
                  $unsigned(reg59) : $signed((8'hbb))))));
              reg66 <= $unsigned(wire56);
            end
          else
            begin
              reg63 <= (($signed($signed($unsigned(wire58))) ?
                      {reg64[(1'h0):(1'h0)], reg62} : (-((wire61 - reg62) ?
                          $unsigned(reg62) : {wire58, reg60}))) ?
                  $signed($unsigned(wire56)) : {(reg66[(2'h2):(2'h2)] ?
                          ((wire55 ? reg62 : wire56) ?
                              {reg60,
                                  wire55} : (|wire61)) : $signed((reg59 + (8'hb8)))),
                      (wire56[(3'h7):(2'h3)] >>> (wire56 & wire56[(4'ha):(4'ha)]))});
              reg64 <= (8'hb2);
              reg65 <= $signed(wire55);
            end
        end
    end
  assign wire67 = $unsigned(wire55);
  assign wire68 = wire56;
endmodule

module module17
#(parameter param28 = (^((+(7'h41)) ? {(+{(8'hb3)}), ((|(8'ha7)) & (|(8'ha3)))} : (8'hb7))))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h3a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire21;
  input wire [(4'h8):(1'h0)] wire20;
  input wire signed [(4'hd):(1'h0)] wire19;
  input wire [(4'h9):(1'h0)] wire18;
  wire signed [(3'h5):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire26;
  wire [(4'ha):(1'h0)] wire25;
  wire signed [(4'h8):(1'h0)] wire24;
  wire [(4'h8):(1'h0)] wire23;
  wire signed [(4'he):(1'h0)] wire22;
  assign y = {wire27, wire26, wire25, wire24, wire23, wire22, (1'h0)};
  assign wire22 = $signed(wire20);
  assign wire23 = $signed((~({$signed(wire21)} ?
                      ((wire18 ?
                          wire20 : wire19) << wire20) : $signed(wire21[(1'h1):(1'h0)]))));
  assign wire24 = (^~($unsigned(($unsigned(wire22) ? {(8'hba)} : (7'h43))) ?
                      ($signed((!wire19)) ?
                          wire19 : wire20[(3'h7):(3'h5)]) : $signed(wire23)));
  assign wire25 = (^(~($unsigned($signed(wire22)) <<< (|(wire19 ^ wire18)))));
  assign wire26 = ({$unsigned((+(wire23 ? wire20 : wire19))), {wire22}} ?
                      $signed(wire23) : ({(+wire22), (~|$unsigned((8'hb7)))} ?
                          wire22[(4'ha):(2'h2)] : (((wire24 != wire24) ?
                              (wire21 ?
                                  wire19 : wire20) : wire21) ^ ((wire19 | (8'hb6)) * (~^(8'hb5))))));
  assign wire27 = wire20;
endmodule
