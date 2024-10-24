module top
#(parameter param96 = (^({(8'hae)} | ((8'hba) <= (((8'ha1) ? (8'hb4) : (8'hb0)) ? {(8'h9f)} : ((8'hb4) ? (8'hbb) : (8'hbf)))))), 
parameter param97 = ((|(~&param96)) || (param96 ? (^~{(~param96)}) : (^~(((8'hbe) ? param96 : param96) >= {param96, param96})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1d2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(3'h6):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire0;
  wire signed [(3'h7):(1'h0)] wire95;
  wire [(5'h13):(1'h0)] wire93;
  wire [(3'h6):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(5'h14):(1'h0)] wire40;
  wire [(5'h15):(1'h0)] wire37;
  wire [(4'h9):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire33;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(4'h8):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h13):(1'h0)] reg50 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg44 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hb):(1'h0)] reg41 = (1'h0);
  reg [(4'he):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg16 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg15 = (1'h0);
  reg [(5'h10):(1'h0)] reg14 = (1'h0);
  reg [(3'h7):(1'h0)] reg13 = (1'h0);
  reg [(5'h12):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg [(4'hf):(1'h0)] reg10 = (1'h0);
  reg [(4'h8):(1'h0)] reg9 = (1'h0);
  reg [(2'h3):(1'h0)] reg8 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg7 = (1'h0);
  reg signed [(4'he):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg5 = (1'h0);
  assign y = {wire95,
                 wire93,
                 wire54,
                 wire53,
                 wire40,
                 wire37,
                 wire36,
                 wire35,
                 wire33,
                 wire4,
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
                 reg42,
                 reg41,
                 reg39,
                 reg38,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = (wire0 * wire3);
  always
    @(posedge clk) begin
      if ($signed({$signed(wire4)}))
        begin
          reg5 <= $unsigned((($unsigned(((8'hb5) * wire1)) == ($unsigned(wire3) ?
                  $signed(wire0) : (wire1 ? (8'hb3) : wire3))) ?
              $signed({wire2[(1'h0):(1'h0)], $signed(wire2)}) : (8'hb3)));
          if (wire0)
            begin
              reg6 <= {wire2,
                  (|(wire4[(3'h7):(2'h3)] ?
                      {((8'hba) ?
                              wire1 : reg5)} : $unsigned($unsigned(wire3))))};
              reg7 <= wire3[(3'h5):(2'h3)];
              reg8 <= (reg6 ? $unsigned($signed(reg6[(4'hc):(2'h3)])) : wire4);
            end
          else
            begin
              reg6 <= reg6;
              reg7 <= $signed(reg8);
              reg8 <= ((($unsigned((-reg8)) <= wire3) ?
                  (wire3 ?
                      $unsigned($unsigned(wire2)) : $unsigned($unsigned(reg5))) : (reg5[(2'h3):(2'h2)] || ((wire4 >> (8'haf)) ?
                      $unsigned(wire4) : $unsigned(reg6)))) ~^ (~^{(reg5[(3'h7):(2'h2)] ?
                      (+wire3) : $unsigned(reg8))}));
            end
          reg9 <= reg6[(3'h6):(3'h4)];
          if (($unsigned(wire2[(1'h0):(1'h0)]) ?
              wire0[(3'h6):(3'h6)] : {$unsigned((wire1 ?
                      (~|wire2) : $signed(reg7)))}))
            begin
              reg10 <= reg6;
              reg11 <= (^($unsigned($signed(wire2[(4'hc):(4'hc)])) ?
                  (((wire4 | wire4) ? (reg6 + (7'h41)) : {wire0}) ?
                      (reg5 >= $unsigned(reg9)) : {(!(7'h41)),
                          reg7[(3'h7):(1'h1)]}) : wire3[(4'hd):(3'h5)]));
            end
          else
            begin
              reg10 <= ($signed(wire0[(3'h4):(1'h1)]) ?
                  $unsigned((($signed(reg6) ?
                      {(7'h40)} : {wire3,
                          wire0}) << (wire4 && wire4))) : $unsigned($signed(reg8[(2'h2):(1'h1)])));
              reg11 <= (({reg10[(3'h7):(2'h3)]} ?
                      wire4[(4'h9):(1'h1)] : $signed(reg6[(4'ha):(3'h6)])) ?
                  (8'ha7) : (8'hbc));
              reg12 <= (&(|(!$signed((wire1 <= reg7)))));
            end
          reg13 <= ($unsigned(reg12[(4'hd):(3'h5)]) ?
              reg9[(2'h2):(1'h0)] : {(($unsigned(reg12) > reg11[(1'h1):(1'h0)]) ?
                      (reg9 ^ $unsigned(reg11)) : (reg6[(4'hd):(4'hd)] ?
                          (^reg11) : (+reg5))),
                  {$unsigned($signed(reg9)), reg11[(1'h0):(1'h0)]}});
        end
      else
        begin
          reg5 <= $unsigned($unsigned($signed(reg5[(3'h4):(3'h4)])));
          reg6 <= reg8[(1'h0):(1'h0)];
          if ($unsigned((|$unsigned($signed((reg7 | reg13))))))
            begin
              reg7 <= (($unsigned(((reg12 ? reg7 : wire3) ?
                      (wire1 >>> reg12) : reg5[(4'hd):(1'h0)])) || (~^reg9)) ?
                  reg5[(3'h4):(1'h0)] : (^~$unsigned(reg5[(4'h9):(3'h4)])));
              reg8 <= (reg8[(1'h0):(1'h0)] <= wire3[(1'h1):(1'h1)]);
              reg9 <= ((^~$unsigned($signed(wire0))) << wire2[(4'h9):(2'h3)]);
            end
          else
            begin
              reg7 <= (7'h40);
              reg8 <= {($signed(((~reg13) ? (~&wire2) : reg11[(2'h2):(1'h1)])) ?
                      $unsigned((wire3[(3'h7):(2'h3)] + reg5[(3'h4):(1'h1)])) : (~&reg13)),
                  reg10[(3'h7):(3'h6)]};
              reg9 <= $unsigned((7'h41));
              reg10 <= reg9[(3'h6):(2'h2)];
              reg11 <= wire2;
            end
          reg12 <= {wire4};
        end
      if ({reg5[(1'h1):(1'h0)],
          (wire1 ?
              ({reg11[(1'h1):(1'h0)],
                  (^~(8'hbe))} << $unsigned(reg6)) : ($signed((reg8 >>> reg10)) ?
                  (~(~reg11)) : (~wire2[(1'h1):(1'h1)])))})
        begin
          reg14 <= reg12[(2'h3):(2'h2)];
          reg15 <= ({$signed(reg12)} ? reg10 : reg6[(3'h7):(1'h1)]);
        end
      else
        begin
          reg14 <= $signed({(|$unsigned($unsigned(reg9))),
              ($signed((8'h9c)) ?
                  (reg13[(3'h6):(1'h1)] ?
                      (reg10 != (7'h43)) : wire3) : ((wire1 != reg8) ?
                      reg6[(3'h5):(3'h5)] : $signed(reg10)))});
          if ($unsigned((7'h42)))
            begin
              reg15 <= $signed((wire2[(4'ha):(4'h8)] ?
                  (^$unsigned($signed(reg10))) : (~reg14[(2'h2):(1'h1)])));
            end
          else
            begin
              reg15 <= (reg7 && (reg12 | (reg7 ?
                  (|(8'ha0)) : {$signed(reg5)})));
              reg16 <= (reg9[(3'h6):(1'h0)] < (reg13 == $unsigned($signed((8'hab)))));
              reg17 <= $signed((+(&({reg7} - (reg13 & reg9)))));
            end
        end
      reg18 <= ($unsigned(wire4[(5'h11):(4'hc)]) * reg16[(3'h4):(1'h1)]);
      reg19 <= $signed((+wire3));
    end
  module20 #() modinst34 (.wire22(reg10), .clk(clk), .y(wire33), .wire23(reg14), .wire21(reg19), .wire24(reg17));
  assign wire35 = (((($unsigned(wire33) == $signed(reg11)) ^ ((wire1 ~^ reg18) ?
                          (~|wire33) : (reg9 ? wire33 : reg17))) ?
                      (($signed(reg12) ?
                              $signed(reg17) : wire4[(4'h9):(1'h1)]) ?
                          $signed(reg6[(3'h4):(2'h3)]) : ({wire3} ?
                              $signed(reg7) : (8'ha0))) : (~|reg14[(4'h9):(4'h9)])) == $unsigned(reg15));
  assign wire36 = reg13;
  assign wire37 = (reg13 ? {$signed((8'haa))} : wire33);
  always
    @(posedge clk) begin
      reg38 <= $signed(((&($signed(reg5) || (reg7 ? wire1 : (8'hbc)))) ?
          (~|reg10[(3'h4):(1'h1)]) : ($signed((reg8 ?
              wire36 : reg18)) >> $signed((reg5 * reg6)))));
      reg39 <= $unsigned(($signed({reg13}) - (+wire37[(1'h1):(1'h0)])));
    end
  assign wire40 = reg17;
  always
    @(posedge clk) begin
      reg41 <= (({(reg18[(1'h0):(1'h0)] ? $unsigned(reg18) : $signed(reg18)),
                  ((~|(8'ha8)) ? wire0[(1'h1):(1'h0)] : {reg15})} ?
              $unsigned($unsigned((reg17 + wire1))) : reg13) ?
          (8'haa) : ($signed($unsigned((~|reg7))) - ($signed((8'hb9)) >>> $unsigned(wire36))));
      reg42 <= $signed((wire0 ?
          {$unsigned((~wire0)),
              reg6[(4'hc):(1'h1)]} : (wire0 & ($unsigned(wire1) > {(8'h9e),
              reg39}))));
      if (reg6)
        begin
          reg43 <= ($signed(reg39) ?
              $signed(((+(reg39 >> reg10)) << $unsigned((~^reg38)))) : wire36);
          reg44 <= $unsigned(((reg42 ?
                  (!(reg14 & reg10)) : (!reg5[(5'h12):(1'h1)])) ?
              $unsigned($unsigned((~^wire37))) : $signed(wire37)));
          if ((^~($unsigned({(reg17 ? reg10 : wire40),
              $unsigned(reg39)}) || (($unsigned(wire3) >> {wire33}) ?
              ((&reg17) ?
                  (|reg41) : $unsigned((8'had))) : ((reg7 && reg41) ^~ reg7[(3'h7):(2'h3)])))))
            begin
              reg45 <= $unsigned((reg16 ?
                  $unsigned($unsigned((reg43 < reg16))) : (wire33[(3'h4):(1'h0)] != (reg7 != reg38))));
              reg46 <= $signed($signed($unsigned(wire36)));
            end
          else
            begin
              reg45 <= ((wire0 > (+($unsigned(wire3) ?
                  $unsigned(reg16) : $signed(reg14)))) && reg38[(2'h2):(2'h2)]);
              reg46 <= $signed(reg45);
            end
          if (($unsigned(($unsigned((reg38 ? reg39 : reg41)) ?
                  $signed(reg12) : $unsigned($unsigned(reg19)))) ?
              {(wire33 - $unsigned((~|reg41)))} : {((-wire2[(4'h9):(2'h2)]) ?
                      ((^wire33) + (wire3 ? wire2 : reg42)) : ((7'h44) ?
                          wire0 : wire1)),
                  $signed($unsigned((^~reg5)))}))
            begin
              reg47 <= (wire36 ? $unsigned(reg43[(1'h0):(1'h0)]) : reg13);
              reg48 <= (+reg6);
              reg49 <= reg12;
              reg50 <= (reg11[(2'h3):(1'h1)] ~^ ((($signed(reg43) >>> (~|wire3)) ?
                      wire1[(2'h3):(2'h3)] : ((~&reg44) + (reg14 != reg6))) ?
                  ((8'hbb) ?
                      ($signed(reg14) ?
                          $unsigned(reg18) : wire37[(3'h6):(3'h4)]) : reg9[(3'h5):(2'h2)]) : {reg44[(2'h2):(2'h2)],
                      $signed((~reg17))}));
              reg51 <= $unsigned(($unsigned((wire37 ?
                      $signed(wire36) : (wire4 ? (8'ha0) : wire0))) ?
                  ($unsigned(wire37) < (8'hbc)) : wire1[(3'h6):(3'h5)]));
            end
          else
            begin
              reg47 <= reg44;
            end
          reg52 <= (8'h9c);
        end
      else
        begin
          reg43 <= reg13[(1'h0):(1'h0)];
          reg44 <= (|$unsigned(({(reg46 ? reg18 : wire37)} ?
              $signed(reg44) : wire40[(5'h10):(3'h4)])));
        end
    end
  assign wire53 = {reg44, $signed(wire4[(1'h0):(1'h0)])};
  assign wire54 = reg8[(2'h2):(1'h0)];
  module55 #() modinst94 (.wire59(wire2), .wire57(reg45), .y(wire93), .clk(clk), .wire58(reg44), .wire56(wire0));
  assign wire95 = (wire4 * {((reg7[(4'h8):(3'h7)] + reg39) ?
                          $signed(((8'hb9) < wire93)) : wire1)});
endmodule

module module55  (y, clk, wire56, wire57, wire58, wire59);
  output wire [(32'h8c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire56;
  input wire signed [(5'h13):(1'h0)] wire57;
  input wire signed [(4'hf):(1'h0)] wire58;
  input wire [(3'h5):(1'h0)] wire59;
  wire signed [(4'h9):(1'h0)] wire92;
  wire signed [(2'h2):(1'h0)] wire91;
  wire signed [(4'hd):(1'h0)] wire60;
  wire [(5'h15):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire66;
  wire [(5'h10):(1'h0)] wire67;
  wire signed [(4'hd):(1'h0)] wire89;
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg [(3'h6):(1'h0)] reg61 = (1'h0);
  assign y = {wire92,
                 wire91,
                 wire60,
                 wire62,
                 wire66,
                 wire67,
                 wire89,
                 reg65,
                 reg64,
                 reg63,
                 reg61,
                 (1'h0)};
  assign wire60 = (+{((8'hbc) + {wire59, wire56})});
  always
    @(posedge clk) begin
      reg61 <= wire56;
    end
  assign wire62 = $unsigned($signed($unsigned(reg61[(3'h5):(3'h5)])));
  always
    @(posedge clk) begin
      reg63 <= wire60[(3'h4):(1'h0)];
      reg64 <= $unsigned((({{wire56,
              (8'hab)}} ^~ (+(-wire60))) > (^~wire62[(1'h0):(1'h0)])));
      reg65 <= (~^wire60[(4'h9):(4'h8)]);
    end
  assign wire66 = $signed({(wire57[(4'hc):(3'h6)] ?
                          $unsigned((wire60 != wire58)) : wire58)});
  assign wire67 = ({$signed($unsigned((wire56 ? wire60 : wire58))),
                          $unsigned($signed((|wire57)))} ?
                      (~^(((8'hb0) ? $signed(wire56) : wire57) ?
                          $unsigned((|(7'h40))) : ((^reg65) ?
                              $unsigned(wire58) : (|reg63)))) : (wire59[(1'h0):(1'h0)] ^~ ($signed(reg63[(2'h3):(2'h3)]) ?
                          ((wire66 ? wire66 : (8'ha9)) ^ reg61) : (8'ha2))));
  module68 #() modinst90 (.wire70(wire60), .clk(clk), .wire69(wire57), .y(wire89), .wire73(wire58), .wire72(reg63), .wire71(reg64));
  assign wire91 = (~|$unsigned($signed({$unsigned((7'h44)),
                      wire66[(4'hb):(4'h9)]})));
  assign wire92 = ($signed($unsigned((|wire58))) ?
                      wire66[(4'hb):(4'ha)] : wire89[(1'h1):(1'h0)]);
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h56):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire24;
  input wire [(4'hd):(1'h0)] wire23;
  input wire [(4'hf):(1'h0)] wire22;
  input wire signed [(4'hc):(1'h0)] wire21;
  wire signed [(2'h2):(1'h0)] wire32;
  wire [(3'h5):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  reg [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg [(4'he):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  assign y = {wire32,
                 wire31,
                 wire30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg25 <= wire23;
      reg26 <= wire22[(4'he):(4'hd)];
      reg27 <= reg26;
      reg28 <= ($signed((8'ha9)) ? {$unsigned(reg27)} : wire24);
      reg29 <= reg28;
    end
  assign wire30 = $unsigned(wire22);
  assign wire31 = $unsigned(((reg29[(4'hc):(4'h9)] ?
                      $signed($signed(wire30)) : (reg29[(4'hd):(2'h3)] ?
                          wire30[(1'h0):(1'h0)] : wire24)) <<< wire24));
  assign wire32 = ($unsigned($unsigned(wire22)) * ($signed($signed((-wire21))) > {(wire21[(3'h4):(1'h1)] ?
                          (^~wire21) : {wire22, wire30}),
                      {(+(8'ha9)), $unsigned(wire23)}}));
endmodule

module module68  (y, clk, wire73, wire72, wire71, wire70, wire69);
  output wire [(32'ha3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire73;
  input wire signed [(5'h10):(1'h0)] wire72;
  input wire signed [(4'hd):(1'h0)] wire71;
  input wire signed [(2'h3):(1'h0)] wire70;
  input wire [(5'h13):(1'h0)] wire69;
  wire [(4'h8):(1'h0)] wire88;
  wire signed [(5'h11):(1'h0)] wire87;
  wire signed [(3'h7):(1'h0)] wire86;
  wire [(4'hf):(1'h0)] wire84;
  wire [(5'h10):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire82;
  wire [(4'hf):(1'h0)] wire81;
  wire signed [(2'h2):(1'h0)] wire80;
  wire signed [(5'h13):(1'h0)] wire79;
  wire [(5'h11):(1'h0)] wire78;
  wire signed [(3'h5):(1'h0)] wire77;
  wire signed [(4'h9):(1'h0)] wire76;
  wire [(4'h8):(1'h0)] wire75;
  wire signed [(3'h4):(1'h0)] wire74;
  reg signed [(5'h11):(1'h0)] reg85 = (1'h0);
  assign y = {wire88,
                 wire87,
                 wire86,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 reg85,
                 (1'h0)};
  assign wire74 = wire70;
  assign wire75 = wire74;
  assign wire76 = $unsigned(wire75[(3'h6):(1'h0)]);
  assign wire77 = $signed((~|wire73[(4'h8):(3'h4)]));
  assign wire78 = {wire70[(2'h2):(1'h1)]};
  assign wire79 = wire71;
  assign wire80 = wire76;
  assign wire81 = $unsigned(wire76);
  assign wire82 = ({{wire81, (+(wire72 || (8'ha6)))}} ?
                      (!(^wire74)) : $unsigned({$signed({wire76}),
                          $signed((~wire72))}));
  assign wire83 = {(-wire76[(3'h5):(2'h3)]),
                      ((((-wire70) ? (wire80 >= wire78) : (wire78 & wire71)) ?
                              wire73[(2'h2):(1'h0)] : wire76) ?
                          $signed((wire69[(2'h3):(2'h3)] ?
                              (~&wire77) : (8'hba))) : (wire75 != (wire82 == wire76[(2'h3):(2'h2)])))};
  assign wire84 = ((&wire83) ?
                      (^wire83[(4'h8):(3'h4)]) : ((($signed((8'hb2)) ?
                              $unsigned((8'hac)) : (wire82 <<< wire82)) >= {wire69}) ?
                          (wire79[(4'hc):(3'h7)] ?
                              $signed((wire82 << wire70)) : $unsigned((wire81 ?
                                  wire72 : wire79))) : (^~(wire78 <<< wire82[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg85 <= $unsigned((~&({$signed((8'h9d)),
          wire76[(3'h7):(1'h0)]} > $signed($signed(wire70)))));
    end
  assign wire86 = ($signed({((wire79 <= wire70) ?
                              wire73 : $unsigned(wire70))}) ?
                      $unsigned((&((wire82 + wire82) ?
                          $signed(wire74) : $unsigned((8'ha4))))) : (8'hb9));
  assign wire87 = ((8'ha7) == (wire77 ?
                      (((7'h40) >> (wire76 ?
                          wire79 : wire82)) * (^$unsigned(wire75))) : {(&$signed(wire78))}));
  assign wire88 = (8'hb9);
endmodule
