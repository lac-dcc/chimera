module top
#(parameter param87 = ({(|(^~{(8'ha2)})), (|((~|(8'hb5)) >= ((8'ha5) ? (8'hbb) : (8'ha8))))} ? (~^(~(|(^(8'hbe))))) : {((&((8'ha0) <<< (8'ha6))) * (&(^(8'hb1))))}))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h127):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(5'h12):(1'h0)] wire86;
  wire signed [(4'hd):(1'h0)] wire85;
  wire [(3'h5):(1'h0)] wire84;
  wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire51;
  wire [(2'h3):(1'h0)] wire53;
  wire [(4'hb):(1'h0)] wire54;
  wire [(2'h3):(1'h0)] wire55;
  wire [(4'hc):(1'h0)] wire68;
  wire signed [(5'h12):(1'h0)] wire69;
  wire [(4'ha):(1'h0)] wire82;
  reg [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg66 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(4'he):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(3'h5):(1'h0)] reg60 = (1'h0);
  reg [(3'h6):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg [(4'he):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  assign y = {wire86,
                 wire85,
                 wire84,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire51,
                 wire53,
                 wire54,
                 wire55,
                 wire68,
                 wire69,
                 wire82,
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 reg61,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
                 (1'h0)};
  assign wire4 = $unsigned((wire3 <= {(!(^~wire1))}));
  assign wire5 = wire1[(3'h7):(2'h2)];
  assign wire6 = $signed(($unsigned((~&(!wire5))) ^ wire5));
  assign wire7 = (({{wire5[(4'hd):(4'hd)], $unsigned(wire6)},
                         wire4[(1'h0):(1'h0)]} ?
                     {((wire0 ?
                             wire1 : wire3) ^ ((8'hb2) ~^ wire2))} : wire6[(1'h0):(1'h0)]) ^~ (8'hb8));
  module8 #() modinst52 (.wire12(wire0), .clk(clk), .wire11(wire4), .wire10(wire5), .y(wire51), .wire9(wire6));
  assign wire53 = ((((wire2[(3'h5):(1'h0)] ~^ $signed(wire5)) ?
                      ((^wire4) | (wire5 ~^ (7'h41))) : ((wire7 ^ wire51) ?
                          (wire7 == wire51) : (wire51 * wire7))) ~^ (8'hb8)) < $signed($signed($unsigned(wire1))));
  assign wire54 = {{((~^{wire6}) ? wire5[(2'h3):(2'h2)] : $signed(wire2)),
                          (!(wire4 & ((8'hbb) != (8'ha3))))}};
  assign wire55 = $unsigned(wire51[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      reg56 <= wire54[(3'h6):(1'h1)];
      if ((^~wire1))
        begin
          if ($signed({$signed((^~(8'ha0)))}))
            begin
              reg57 <= wire53[(1'h0):(1'h0)];
              reg58 <= wire3;
              reg59 <= $unsigned(wire7);
              reg60 <= wire55;
            end
          else
            begin
              reg57 <= wire5[(2'h2):(2'h2)];
            end
        end
      else
        begin
          reg57 <= $unsigned(wire1[(2'h2):(1'h1)]);
          reg58 <= wire53;
          reg59 <= reg59[(2'h2):(1'h1)];
          if ((wire0 >>> (wire5[(4'hd):(3'h7)] ?
              wire4[(4'ha):(2'h2)] : (($unsigned((8'h9e)) == (wire51 < wire7)) ?
                  (^$unsigned(reg59)) : (wire54[(3'h6):(3'h5)] >>> (-wire3))))))
            begin
              reg60 <= ((($unsigned(reg57[(2'h3):(2'h3)]) ?
                          ((~&reg57) ?
                              $signed(reg56) : (wire7 == wire53)) : (~wire55[(2'h2):(1'h1)])) ?
                      $unsigned(((wire4 ? wire3 : wire55) - wire1)) : (8'ha0)) ?
                  ({(+(-wire7))} >>> reg58[(3'h6):(1'h0)]) : (-wire55[(1'h0):(1'h0)]));
              reg61 <= (~^$signed(((8'hab) >>> (wire53 * {reg59}))));
            end
          else
            begin
              reg60 <= (((!(wire51[(4'he):(1'h0)] >= (8'hbe))) ^~ $signed(($unsigned(reg56) < (wire53 != reg58)))) ?
                  (&{$signed((reg60 ? reg58 : wire0)),
                      wire7}) : (($unsigned((8'had)) ?
                      ((wire5 ? reg61 : wire55) ?
                          (reg59 != wire0) : $signed(wire54)) : ({reg59,
                              wire3} ?
                          wire7[(1'h1):(1'h0)] : wire6)) >= $signed(wire1[(4'hb):(1'h0)])));
              reg61 <= ((reg58 ?
                  (wire4 ?
                      {(~reg60),
                          $unsigned(reg58)} : (~|{reg60})) : ((+$unsigned(wire53)) ?
                      reg59 : (~^(^wire53)))) ^~ (!{(8'hbc)}));
              reg62 <= wire0;
            end
        end
      reg63 <= (~|(reg57 ?
          $unsigned((((8'had) >> reg57) ~^ $signed((8'h9f)))) : (^$signed($signed(reg60)))));
      reg64 <= (~wire3);
    end
  always
    @(posedge clk) begin
      if ($unsigned((|($unsigned($unsigned(reg56)) + $unsigned(reg59[(2'h2):(1'h1)])))))
        begin
          reg65 <= reg63[(3'h5):(2'h3)];
          reg66 <= (reg65 != (wire5 ?
              (~|$signed($unsigned(wire51))) : (+((reg60 && reg64) && wire4))));
        end
      else
        begin
          reg65 <= wire1[(2'h3):(2'h3)];
          reg66 <= (reg63 ?
              $unsigned(wire0) : $unsigned(($signed($signed((8'hbc))) ?
                  ({wire5} ^~ (wire0 ?
                      wire5 : (8'h9f))) : wire5[(3'h7):(1'h1)])));
          reg67 <= ((({{reg57, wire3}, wire55[(1'h0):(1'h0)]} ?
                  $signed(wire5) : (wire1 ?
                      ((8'hac) ? wire3 : (8'hb6)) : wire2)) ?
              $unsigned((wire53[(1'h0):(1'h0)] ?
                  (~^wire0) : reg64[(4'h9):(1'h0)])) : ($signed($signed(wire7)) ?
                  ({wire0} - (~|wire4)) : wire6[(3'h4):(2'h2)])) <= reg58);
        end
    end
  assign wire68 = ($signed(((8'hb0) == (wire51 ?
                          $unsigned(reg56) : wire7[(2'h2):(1'h0)]))) ?
                      reg59 : reg59);
  assign wire69 = wire3;
  module70 #() modinst83 (wire82, clk, reg61, wire2, wire3, wire5, reg63);
  assign wire84 = reg59[(3'h5):(1'h0)];
  assign wire85 = (wire54[(3'h6):(2'h3)] ~^ (|$signed(wire6)));
  assign wire86 = reg67[(4'hf):(4'hc)];
endmodule

module module70
#(parameter param80 = ((^(8'hbe)) <= {{(8'hbf)}, (((~^(8'hb2)) ^~ ((8'hb3) + (7'h42))) - (((8'h9f) > (8'hab)) + (!(8'ha8))))}), 
parameter param81 = (~^(|(&(param80 == {(8'hb3)})))))
(y, clk, wire75, wire74, wire73, wire72, wire71);
  output wire [(32'h31):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire75;
  input wire [(2'h3):(1'h0)] wire74;
  input wire [(4'hd):(1'h0)] wire73;
  input wire signed [(4'hd):(1'h0)] wire72;
  input wire [(4'hb):(1'h0)] wire71;
  wire [(5'h14):(1'h0)] wire79;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(3'h6):(1'h0)] wire76;
  reg [(3'h6):(1'h0)] reg78 = (1'h0);
  assign y = {wire79, wire77, wire76, reg78, (1'h0)};
  assign wire76 = $unsigned((!(wire72[(3'h7):(2'h2)] > $unsigned(wire73))));
  assign wire77 = wire73;
  always
    @(posedge clk) begin
      reg78 <= $signed({(((|wire73) >= $signed(wire73)) ?
              wire75 : wire74[(2'h2):(2'h2)]),
          (^~((~&wire72) ? wire77 : wire74[(2'h2):(1'h0)]))});
    end
  assign wire79 = ($signed(wire76[(3'h6):(1'h1)]) ?
                      (~($signed($signed(wire76)) <= $unsigned((~&wire72)))) : wire73[(4'hc):(4'hc)]);
endmodule

module module8
#(parameter param49 = {(((-((8'haa) ? (8'hb4) : (8'had))) * (^((8'hbb) ? (8'had) : (7'h42)))) * ((((8'ha7) + (8'haa)) < ((7'h41) ? (8'hb0) : (7'h40))) ? (^~{(8'h9c)}) : (((8'hb9) > (8'ha2)) < ((8'ha6) < (8'haa)))))}, 
parameter param50 = ((param49 | ({(|(8'ha7))} <= (~&(~param49)))) <= ({((param49 * (7'h42)) & (^(8'h9e)))} ? {{(~param49)}, (^(!param49))} : (&(param49 << (&param49))))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'h199):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire [(4'h8):(1'h0)] wire9;
  wire [(5'h14):(1'h0)] wire48;
  wire signed [(5'h15):(1'h0)] wire29;
  wire signed [(4'ha):(1'h0)] wire17;
  wire [(3'h5):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(2'h3):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  reg [(5'h11):(1'h0)] reg47 = (1'h0);
  reg [(5'h15):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg [(4'h8):(1'h0)] reg42 = (1'h0);
  reg [(5'h10):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg39 = (1'h0);
  reg [(3'h7):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg25 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg22 = (1'h0);
  reg [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg18 = (1'h0);
  assign y = {wire48,
                 wire29,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
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
  assign wire13 = (((wire10[(3'h6):(3'h4)] * wire11) ?
                      wire10[(5'h10):(3'h4)] : $unsigned($signed($unsigned(wire12)))) > (8'hbe));
  assign wire14 = (8'hbc);
  assign wire15 = $unsigned((|wire13[(4'he):(2'h2)]));
  assign wire16 = ($unsigned($unsigned((~|wire12[(4'hd):(4'hc)]))) > ({(wire11 ?
                          (~|wire11) : {wire15}),
                      {{wire15, wire10}}} >= wire10[(2'h3):(1'h1)]));
  assign wire17 = wire10;
  always
    @(posedge clk) begin
      if ($signed(wire13))
        begin
          reg18 <= wire15[(1'h1):(1'h1)];
          reg19 <= (8'hb1);
          reg20 <= $unsigned((+($unsigned($unsigned(wire14)) && {(wire9 >> reg18),
              wire15[(2'h2):(1'h0)]})));
          reg21 <= $signed(($signed((~((8'ha1) ?
              reg19 : reg20))) || (wire12 | (wire12 ?
              (wire13 ? wire11 : wire12) : (wire9 || wire14)))));
          reg22 <= ((reg18[(1'h1):(1'h0)] ?
                  (((wire13 <<< wire16) ?
                      $unsigned(wire14) : wire15[(1'h0):(1'h0)]) + (~wire12)) : reg19[(1'h1):(1'h1)]) ?
              ($unsigned(($signed(reg20) ~^ (-wire17))) ?
                  wire11[(1'h0):(1'h0)] : $unsigned(((reg18 >> wire10) | reg21[(2'h3):(1'h0)]))) : {wire10,
                  $unsigned(wire9[(4'h8):(1'h0)])});
        end
      else
        begin
          reg18 <= (~|reg19);
          reg19 <= (~^wire14[(1'h0):(1'h0)]);
          reg20 <= ({(&((wire11 ? wire10 : wire14) >>> $signed(wire11)))} ?
              {(((8'hb0) >= $signed(wire11)) ?
                      (&reg19[(3'h5):(3'h4)]) : ({(8'hbd), (8'ha1)} + {reg18})),
                  wire16[(1'h1):(1'h1)]} : (wire9[(2'h2):(1'h0)] ?
                  {reg21,
                      {wire15[(2'h3):(2'h3)],
                          $unsigned(reg21)}} : (~($unsigned(reg20) ?
                      $unsigned((8'hac)) : wire12))));
          reg21 <= (reg21 >> {wire15[(3'h6):(3'h5)],
              ((+(|reg21)) ? ((8'had) < {wire12, (8'hbd)}) : wire17)});
        end
      if ((|$signed(($signed((reg18 ? wire9 : wire9)) ? reg18 : wire10))))
        begin
          if (wire11)
            begin
              reg23 <= (^wire13);
              reg24 <= $signed($signed(reg22[(5'h13):(4'h8)]));
              reg25 <= {{(~|(reg24[(3'h5):(3'h4)] ?
                          wire10 : (wire11 == (7'h43))))},
                  (wire11 ? reg18[(4'he):(4'h9)] : (-wire15))};
              reg26 <= {$signed(((wire9[(1'h0):(1'h0)] <= (+wire10)) - ((reg24 ?
                          wire10 : reg19) ?
                      (^~(8'hba)) : {wire14, reg20}))),
                  $unsigned((~|$unsigned($signed(wire14))))};
            end
          else
            begin
              reg23 <= (8'hbd);
              reg24 <= (wire17 > (7'h40));
              reg25 <= reg19[(3'h6):(3'h4)];
            end
          reg27 <= (^(($signed((|reg23)) ^~ ($unsigned(reg26) | wire13)) ~^ reg19[(3'h7):(3'h4)]));
        end
      else
        begin
          reg23 <= ($signed($signed(reg27[(2'h2):(2'h2)])) ?
              $signed((^((reg23 ?
                  (8'hb3) : reg24) <= (|reg19)))) : {(wire16[(1'h1):(1'h0)] | $unsigned((^~reg24))),
                  reg19[(3'h5):(1'h1)]});
          reg24 <= reg24;
          reg25 <= ($unsigned($unsigned(((wire10 ?
              reg27 : reg22) | (~wire11)))) >= reg20[(5'h12):(1'h0)]);
        end
      reg28 <= $signed($signed((~wire15[(2'h2):(2'h2)])));
    end
  assign wire29 = ((reg28[(4'he):(3'h5)] - $signed((wire12 == (reg18 <<< wire13)))) ?
                      {reg23[(1'h1):(1'h1)],
                          (reg25[(4'hb):(2'h3)] ?
                              reg18[(3'h7):(3'h4)] : ($unsigned(wire13) < (wire15 ?
                                  wire13 : reg25)))} : wire9);
  always
    @(posedge clk) begin
      reg30 <= ($unsigned({reg18}) ?
          reg26[(3'h7):(3'h5)] : wire9[(2'h3):(2'h2)]);
      if (reg18)
        begin
          reg31 <= {(~|(($signed((8'h9f)) ?
                  (reg28 ? wire12 : (8'ha3)) : (wire15 ?
                      reg24 : reg19)) - wire11[(3'h7):(2'h3)]))};
          if (((+wire11[(4'hd):(4'hd)]) ?
              ($signed(reg25[(5'h10):(3'h7)]) - reg28[(1'h1):(1'h1)]) : wire11[(1'h1):(1'h1)]))
            begin
              reg32 <= (wire17[(4'ha):(4'h8)] > ($signed((8'haf)) ?
                  $signed(wire13) : $signed(({(8'hb2)} ?
                      {reg23, (8'haa)} : reg27))));
            end
          else
            begin
              reg32 <= $unsigned((reg19 >= (reg23[(3'h6):(2'h2)] || $unsigned(wire17))));
              reg33 <= (~&wire16[(3'h4):(2'h3)]);
              reg34 <= (!(~|$signed($signed(reg28))));
              reg35 <= $signed(wire14);
            end
        end
      else
        begin
          reg31 <= wire15;
          reg32 <= reg30[(2'h2):(1'h0)];
        end
      if (($unsigned({((reg30 & reg34) >>> wire29[(4'hc):(3'h7)])}) || $signed((~&$unsigned(reg21[(1'h0):(1'h0)])))))
        begin
          if ((8'h9f))
            begin
              reg36 <= $signed((~&reg27[(1'h0):(1'h0)]));
              reg37 <= reg35[(1'h1):(1'h0)];
              reg38 <= ((!{reg25[(3'h5):(2'h2)], {reg24, $unsigned(reg20)}}) ?
                  (~&($signed($unsigned(reg33)) || $unsigned($signed(reg35)))) : reg36[(4'h8):(2'h3)]);
              reg39 <= wire12[(4'hd):(4'h9)];
              reg40 <= $signed((&reg20[(3'h6):(3'h6)]));
            end
          else
            begin
              reg36 <= wire15[(2'h2):(2'h2)];
              reg37 <= (|reg40);
              reg38 <= reg36[(2'h3):(2'h3)];
              reg39 <= $unsigned($unsigned(($unsigned($unsigned(wire29)) ?
                  $unsigned($unsigned(reg35)) : reg21[(2'h2):(2'h2)])));
              reg40 <= {$unsigned(wire16)};
            end
          reg41 <= ((({$signed(reg27)} ?
                  ({wire13} || $signed(reg34)) : reg25) < $signed(reg27)) ?
              $signed({reg22,
                  $signed((reg19 ?
                      reg18 : reg20))}) : (wire14 == ($signed($signed(reg24)) ?
                  (&{reg23}) : (^~$unsigned(reg38)))));
        end
      else
        begin
          if ({($signed(((!reg32) && $signed(reg32))) ?
                  (((reg40 ? reg26 : wire9) ? (^~wire9) : $signed(reg38)) ?
                      reg33 : (8'hb4)) : ((~wire10) ?
                      (+reg30[(3'h4):(2'h2)]) : $unsigned(reg24))),
              $unsigned(wire17)})
            begin
              reg36 <= $signed($signed((|((reg18 ^ reg23) * {reg31}))));
              reg37 <= (7'h41);
              reg38 <= $unsigned(($unsigned((-(-(8'ha2)))) ?
                  $unsigned(($signed(reg30) + $unsigned(reg20))) : {reg37[(4'he):(4'h9)],
                      ((reg38 << wire13) ? $unsigned((8'ha5)) : {(7'h40)})}));
              reg39 <= reg23[(3'h5):(2'h3)];
            end
          else
            begin
              reg36 <= reg22;
              reg37 <= $signed($signed({wire15, $unsigned((reg39 > reg23))}));
              reg38 <= (reg33[(4'h9):(2'h2)] != wire9[(1'h1):(1'h1)]);
            end
          reg40 <= reg37[(4'h8):(3'h7)];
          if ((!($unsigned(((!reg39) ?
                  reg39[(2'h2):(1'h1)] : $signed(wire10))) ?
              (~|$signed((wire17 ? wire16 : reg18))) : reg28)))
            begin
              reg41 <= ($signed(reg33[(3'h5):(2'h3)]) ?
                  (~^$signed($signed((~wire14)))) : ({((-reg28) - reg41),
                      reg31[(3'h5):(3'h5)]} < ($unsigned((wire29 ?
                      wire12 : reg21)) <<< ((^~reg27) == (~^wire16)))));
              reg42 <= wire12[(5'h10):(1'h0)];
              reg43 <= (&(($signed((|wire10)) > ((reg32 * reg38) ?
                      (~reg32) : wire16)) ?
                  reg27 : (wire10[(3'h5):(1'h0)] ?
                      (reg32 ^~ {reg18}) : reg30[(1'h1):(1'h0)])));
            end
          else
            begin
              reg41 <= (($unsigned(reg33[(1'h1):(1'h0)]) ?
                      ($unsigned((reg31 == wire14)) ?
                          (8'h9f) : $signed(wire15[(1'h1):(1'h0)])) : reg39[(1'h1):(1'h0)]) ?
                  (reg18[(4'h9):(4'h8)] ~^ ($signed((!wire13)) ?
                      (wire9 ^ {wire17, reg22}) : {{reg21, (8'ha9)},
                          ((8'ha4) ? reg42 : reg37)})) : reg22);
              reg42 <= $signed($signed(reg34[(1'h0):(1'h0)]));
              reg43 <= (^(reg26[(1'h0):(1'h0)] >> ($signed((wire29 >= wire12)) + (7'h44))));
            end
          if (((!reg36[(3'h6):(2'h2)]) > $unsigned($unsigned(wire9[(1'h0):(1'h0)]))))
            begin
              reg44 <= $signed({reg20[(3'h6):(3'h4)]});
            end
          else
            begin
              reg44 <= reg39;
              reg45 <= (~|reg32);
              reg46 <= (reg35[(1'h0):(1'h0)] ? $signed(reg39) : $signed(reg36));
            end
          reg47 <= (~|(reg34[(1'h0):(1'h0)] ?
              $unsigned(((reg44 ? reg28 : reg18) ?
                  {reg21} : $unsigned(reg35))) : $signed((reg21 ^ (reg25 ?
                  reg43 : reg43)))));
        end
    end
  assign wire48 = $signed($unsigned(($unsigned($signed(reg41)) > $signed(reg22))));
endmodule
