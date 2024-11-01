module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h6f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h13):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire10;
  wire [(4'h9):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire12;
  wire signed [(2'h2):(1'h0)] wire74;
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg8 = (1'h0);
  assign y = {wire5,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire74,
                 reg6,
                 reg7,
                 reg8,
                 (1'h0)};
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= $signed($unsigned({wire2[(4'hc):(3'h6)],
          ((wire3 ? wire2 : (7'h40)) ? (wire3 ^ wire3) : $signed(wire3))}));
      reg7 <= $signed(reg6[(1'h1):(1'h1)]);
      reg8 <= wire2;
    end
  assign wire9 = (8'hb0);
  assign wire10 = wire3;
  assign wire11 = (reg6[(4'hc):(4'h8)] << wire2);
  assign wire12 = $signed(($unsigned(reg6[(3'h4):(2'h2)]) ?
                      $signed(((wire9 ?
                          wire1 : (8'ha1)) >= (~&wire4))) : wire10));
  module13 #() modinst75 (.wire17(wire9), .y(wire74), .wire15(reg7), .wire16(wire1), .wire14(wire5), .clk(clk));
endmodule

module module13
#(parameter param73 = (^(~^((((8'ha7) ? (8'had) : (8'hae)) ? (~&(8'hb3)) : ((8'ha4) ? (8'ha7) : (8'hb9))) >= {((8'ha0) ^ (8'hab))}))))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h62):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire17;
  input wire signed [(3'h6):(1'h0)] wire16;
  input wire signed [(3'h4):(1'h0)] wire15;
  input wire signed [(5'h15):(1'h0)] wire14;
  wire signed [(5'h12):(1'h0)] wire72;
  wire [(5'h14):(1'h0)] wire71;
  wire signed [(5'h14):(1'h0)] wire70;
  wire signed [(4'hc):(1'h0)] wire65;
  reg signed [(2'h3):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg67 = (1'h0);
  assign y = {wire72, wire71, wire70, wire65, reg69, reg68, reg67, (1'h0)};
  module18 #() modinst66 (wire65, clk, wire17, wire15, wire16, wire14, (8'hb0));
  always
    @(posedge clk) begin
      reg67 <= (wire65 ? wire17 : wire15);
      reg68 <= wire14[(1'h1):(1'h0)];
      reg69 <= $unsigned($signed((wire15[(3'h4):(2'h2)] ?
          (wire17 & (8'hb4)) : ({wire16, wire16} ?
              wire15[(1'h0):(1'h0)] : $unsigned((8'hb8))))));
    end
  assign wire70 = ($unsigned(((^reg67[(3'h4):(1'h0)]) ?
                      {((7'h41) && wire16),
                          $unsigned(wire16)} : wire16[(2'h2):(1'h0)])) << ((($signed(reg67) ?
                          (-wire16) : (reg67 ? (8'ha2) : reg68)) || (^reg67)) ?
                      ($unsigned($signed(wire15)) ?
                          (((8'hab) ? (8'had) : reg68) ?
                              (reg68 ?
                                  wire14 : wire15) : $signed(reg68)) : wire16[(2'h2):(1'h1)]) : (($unsigned(wire15) ?
                          wire65[(1'h0):(1'h0)] : reg68) > $signed($unsigned(wire14)))));
  assign wire71 = ($unsigned(((+(wire14 ? wire17 : wire16)) ^ $signed({wire16,
                      wire17}))) > wire65[(4'h9):(3'h6)]);
  assign wire72 = $signed($signed(wire17));
endmodule

module module18
#(parameter param64 = (&{(^(((8'ha5) ? (8'ha1) : (7'h42)) ^~ (+(8'ha2)))), ((((8'hbd) ? (7'h43) : (8'ha3)) | {(8'hbb), (8'h9f)}) - (((8'hbd) << (8'hb0)) >>> {(8'ha0), (8'h9d)}))}))
(y, clk, wire23, wire22, wire21, wire20, wire19);
  output wire [(32'h1ce):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire23;
  input wire signed [(2'h3):(1'h0)] wire22;
  input wire [(2'h2):(1'h0)] wire21;
  input wire [(5'h15):(1'h0)] wire20;
  input wire [(5'h11):(1'h0)] wire19;
  wire signed [(4'h9):(1'h0)] wire63;
  wire [(4'hb):(1'h0)] wire62;
  wire signed [(4'ha):(1'h0)] wire61;
  wire signed [(3'h7):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire59;
  wire signed [(5'h13):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire49;
  wire signed [(3'h5):(1'h0)] wire48;
  wire [(4'ha):(1'h0)] wire31;
  wire signed [(4'hb):(1'h0)] wire25;
  wire [(4'h9):(1'h0)] wire24;
  reg [(5'h13):(1'h0)] reg57 = (1'h0);
  reg [(3'h7):(1'h0)] reg56 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg55 = (1'h0);
  reg [(4'h9):(1'h0)] reg54 = (1'h0);
  reg [(5'h10):(1'h0)] reg53 = (1'h0);
  reg [(3'h7):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg51 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg50 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(5'h14):(1'h0)] reg45 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg44 = (1'h0);
  reg signed [(4'he):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg41 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg40 = (1'h0);
  reg [(4'ha):(1'h0)] reg39 = (1'h0);
  reg [(3'h4):(1'h0)] reg38 = (1'h0);
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h7):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  assign y = {wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire49,
                 wire48,
                 wire31,
                 wire25,
                 wire24,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
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
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  assign wire24 = $unsigned(((((^wire23) ? (wire21 + wire19) : wire19) ?
                          wire20 : wire21[(1'h0):(1'h0)]) ?
                      (&(wire23 ? {wire22} : wire22[(2'h2):(1'h1)])) : wire20));
  assign wire25 = (&wire20[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg26 <= (~$unsigned($signed($unsigned(wire21[(1'h0):(1'h0)]))));
      reg27 <= $signed((8'hb5));
      reg28 <= ((((~^wire23) ?
              $signed(wire23) : ((reg27 ? wire24 : wire22) ?
                  ((8'ha8) <<< (8'hb9)) : (wire20 ? wire22 : (8'h9e)))) ?
          wire21[(2'h2):(1'h0)] : {$signed({wire21})}) + $unsigned(({wire21[(1'h0):(1'h0)],
              (wire20 ? reg27 : wire22)} ?
          $unsigned(wire19[(4'hc):(3'h7)]) : $signed($unsigned(wire22)))));
    end
  always
    @(posedge clk) begin
      reg29 <= {$unsigned($unsigned(reg27)), reg27[(3'h4):(1'h1)]};
      reg30 <= reg29[(1'h1):(1'h1)];
    end
  assign wire31 = $signed(((($signed(reg28) ? ((7'h41) < wire20) : (8'hba)) ?
                      $unsigned((wire25 ? wire19 : wire23)) : {(!wire19),
                          $unsigned(reg28)}) != {($unsigned(wire19) ?
                          (wire24 ^~ reg28) : wire21[(2'h2):(2'h2)]),
                      {reg30[(4'hb):(4'hb)]}}));
  always
    @(posedge clk) begin
      reg32 <= (8'ha8);
      reg33 <= (($signed(((7'h41) ? (^(8'haf)) : (wire23 ? wire21 : (8'ha2)))) ?
          reg30[(4'hb):(1'h0)] : wire31[(2'h2):(2'h2)]) ^ {wire25[(3'h5):(1'h1)]});
      if (((wire22 ?
          (|(reg28 ^ ((8'hb9) == reg33))) : ($unsigned({reg28}) ?
              ($unsigned(reg27) ?
                  $unsigned(wire21) : ((8'ha4) ?
                      wire25 : wire21)) : ({(8'hbc)} ?
                  wire19[(4'hc):(2'h3)] : (reg33 ?
                      wire31 : reg33)))) ^~ wire25[(3'h7):(1'h0)]))
        begin
          reg34 <= reg33[(1'h1):(1'h1)];
          reg35 <= ($signed((((|wire22) * (reg29 >= (8'ha4))) ?
                  ($unsigned(reg26) ?
                      (reg27 * reg29) : reg29[(2'h3):(1'h1)]) : (&((8'hb9) ?
                      reg32 : wire20)))) ?
              ($signed(reg29) ?
                  (^wire25[(4'ha):(2'h3)]) : (~|(8'hae))) : ((($signed(wire31) >>> (wire19 ?
                          reg30 : reg30)) ?
                      (~$unsigned(wire24)) : (-wire19)) ?
                  ({wire25[(4'h9):(3'h7)]} | (~&{wire23})) : ({wire20} ?
                      reg29[(3'h7):(2'h3)] : $signed(wire22[(2'h2):(1'h1)]))));
          if ($unsigned(wire19[(5'h10):(2'h2)]))
            begin
              reg36 <= (|(reg35[(3'h6):(3'h6)] ^ wire24));
              reg37 <= $unsigned($unsigned(wire31));
              reg38 <= ($signed($unsigned($signed($signed(reg26)))) ?
                  reg29 : $unsigned($unsigned((!$unsigned((8'haf))))));
              reg39 <= $signed((7'h43));
              reg40 <= {$unsigned(reg35)};
            end
          else
            begin
              reg36 <= $unsigned((($signed((reg38 ^ reg38)) ?
                      reg40[(2'h2):(1'h1)] : ($signed(reg30) ?
                          (reg30 <= reg30) : (reg33 ? reg28 : reg34))) ?
                  $signed($signed($unsigned(reg30))) : $signed(reg27[(1'h1):(1'h0)])));
              reg37 <= $unsigned((reg29[(2'h2):(2'h2)] ^ $unsigned((reg36 ?
                  (~(8'hb1)) : ((8'hb4) ~^ reg36)))));
            end
          reg41 <= (8'hbf);
          reg42 <= ($unsigned($unsigned((&reg30[(1'h1):(1'h0)]))) ^ {(^~$signed(reg37)),
              $unsigned(wire31[(2'h2):(1'h1)])});
        end
      else
        begin
          reg34 <= $signed((8'h9e));
          reg35 <= (|$signed(($unsigned((&reg36)) ? reg30 : reg30)));
          if (reg39)
            begin
              reg36 <= $unsigned((~|(~|{(&wire24), {reg29, wire22}})));
              reg37 <= (wire23 <= $signed(((^$signed(reg30)) ?
                  $signed($signed(wire25)) : ($signed(wire21) - reg36[(4'hd):(4'hd)]))));
              reg38 <= (wire20[(3'h4):(2'h3)] ?
                  {$signed(wire21[(1'h1):(1'h0)]),
                      reg30[(3'h7):(2'h2)]} : $unsigned(((reg26[(1'h0):(1'h0)] ?
                          reg35[(4'ha):(1'h1)] : (8'hb5)) ?
                      ((wire31 ?
                          reg39 : reg32) + reg27) : reg37[(4'hb):(3'h5)])));
              reg39 <= {wire21[(1'h0):(1'h0)], reg30};
            end
          else
            begin
              reg36 <= $signed($signed(reg34));
              reg37 <= $unsigned($signed((&($signed(wire21) && wire23))));
              reg38 <= ($unsigned(reg37[(2'h2):(1'h1)]) || (((reg40[(1'h1):(1'h0)] ?
                      {reg30} : reg34[(2'h2):(1'h0)]) * (~(reg30 ?
                      wire19 : reg27))) ?
                  (reg40 ?
                      (((7'h42) >> reg38) >> reg41[(4'hc):(3'h4)]) : $signed($unsigned(reg39))) : $signed((~&(8'ha4)))));
            end
          reg40 <= $unsigned($signed(reg32));
        end
      if ({((8'ha3) ?
              (~&{(^~reg41), $unsigned(reg28)}) : wire22[(1'h0):(1'h0)]),
          ((^(reg41 >> (reg38 > (8'hb9)))) ?
              ((~^$unsigned(reg34)) + ($signed(reg39) < (reg28 ?
                  reg30 : reg27))) : (8'ha2))})
        begin
          reg43 <= $signed({(~^(8'hbf)),
              ($unsigned((reg29 ? (8'hb4) : (8'ha2))) && $unsigned(reg42))});
          reg44 <= (reg32 > (!reg36[(4'ha):(1'h0)]));
          reg45 <= $unsigned(((((reg37 ~^ wire25) && reg29) ?
                  (&(reg38 + reg43)) : (~|wire31[(4'h9):(4'h8)])) ?
              $unsigned($signed((wire31 ?
                  (8'ha4) : reg33))) : {reg33[(4'hb):(3'h4)]}));
          reg46 <= reg38;
        end
      else
        begin
          reg43 <= ((~(8'ha2)) ? reg41 : $signed(reg39[(4'h9):(3'h5)]));
        end
      reg47 <= ({reg32[(2'h2):(1'h1)],
              ((&(8'hb8)) ?
                  ((reg34 ? wire25 : reg46) <= (|reg43)) : $signed((wire31 ?
                      reg42 : (8'hb4))))} ?
          (^(((-(8'hb7)) ?
                  (wire24 ? reg42 : reg30) : (wire24 ? wire21 : reg41)) ?
              $signed($signed(reg36)) : wire31)) : ({$signed((|(8'ha5))),
              reg29} >> $signed($signed((&reg39)))));
    end
  assign wire48 = ($signed(($unsigned($signed(wire20)) >= ((8'ha4) ~^ $unsigned(wire31)))) ?
                      (reg36[(4'h8):(3'h6)] | (~&reg33[(3'h5):(1'h1)])) : (reg27[(3'h4):(1'h1)] ?
                          reg47[(3'h4):(2'h3)] : reg28));
  assign wire49 = wire22;
  always
    @(posedge clk) begin
      if ({reg28[(3'h5):(3'h4)], (-$unsigned({{reg36}, wire20}))})
        begin
          reg50 <= reg40[(2'h3):(1'h1)];
          reg51 <= (~^wire24[(3'h4):(2'h2)]);
        end
      else
        begin
          reg50 <= $signed($unsigned((^~$unsigned((8'hb4)))));
          if ($signed($unsigned((reg34 ?
              reg45[(3'h5):(2'h3)] : ($unsigned(wire49) ?
                  (~|(8'hbf)) : (reg47 ? reg33 : reg29))))))
            begin
              reg51 <= ($unsigned(reg32[(5'h10):(4'hf)]) ? (8'hb2) : reg38);
              reg52 <= reg46[(2'h2):(2'h2)];
              reg53 <= $unsigned(($signed(((8'ha0) >= $unsigned(wire48))) ^~ $unsigned({(reg32 >> reg39)})));
            end
          else
            begin
              reg51 <= $signed((~|(~|($unsigned((7'h44)) ^~ (+(8'hb8))))));
              reg52 <= (8'ha1);
              reg53 <= reg27;
              reg54 <= (^~{reg51[(3'h5):(3'h4)]});
              reg55 <= (reg42 < $signed($signed(((wire19 ?
                  wire49 : reg54) * (reg52 < (8'ha3))))));
            end
        end
      reg56 <= reg30[(3'h5):(1'h1)];
      reg57 <= reg55;
    end
  assign wire58 = ({{reg54[(4'h8):(3'h7)], wire49[(4'hb):(3'h6)]}, (~&reg38)} ?
                      $unsigned(reg39[(4'h8):(2'h3)]) : {{wire21,
                              $unsigned({(8'haf)})}});
  assign wire59 = $signed(wire31[(4'h8):(3'h4)]);
  assign wire60 = (&{$unsigned($signed(reg56)), wire59});
  assign wire61 = (+wire59);
  assign wire62 = wire24[(2'h3):(1'h0)];
  assign wire63 = $signed((~&reg39));
endmodule
