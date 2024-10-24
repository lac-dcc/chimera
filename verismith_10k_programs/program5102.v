module top
#(parameter param80 = (8'hb9), 
parameter param81 = param80)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hbf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(3'h7):(1'h0)] wire1;
  input wire [(5'h11):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire78;
  wire signed [(2'h3):(1'h0)] wire15;
  wire signed [(4'hf):(1'h0)] wire4;
  reg signed [(4'hc):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg [(3'h7):(1'h0)] reg7 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h4):(1'h0)] reg11 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'he):(1'h0)] reg13 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg16 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  assign y = {wire78,
                 wire15,
                 wire4,
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
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 (1'h0)};
  assign wire4 = {wire2[(4'h8):(4'h8)]};
  always
    @(posedge clk) begin
      reg5 <= (~|wire4[(1'h0):(1'h0)]);
      reg6 <= (wire2 ?
          ($signed((^~(-wire3))) <= (|((|wire4) ?
              ((8'ha5) ? wire4 : wire4) : $unsigned(wire4)))) : wire3);
      if ($unsigned((~&wire4[(4'hc):(4'hc)])))
        begin
          reg7 <= ($unsigned(((reg6 ?
              wire4 : (|reg5)) * $unsigned($signed(wire2)))) || $unsigned({$signed(reg6)}));
        end
      else
        begin
          reg7 <= (({reg5} ?
                  ((wire0 <<< wire0[(4'ha):(4'ha)]) ?
                      ({wire4} - {wire4}) : ((~^(7'h43)) <= $unsigned(wire4))) : (wire0 ?
                      (wire0 ~^ reg5[(4'ha):(2'h3)]) : ({wire2} ?
                          (!wire1) : wire4[(3'h6):(3'h5)]))) ?
              (~&(((!(8'hbe)) >>> (wire2 ? wire0 : wire0)) ?
                  $unsigned((~|wire0)) : ((wire3 < reg6) ?
                      {(8'ha7)} : {wire0}))) : ({($signed(wire3) ?
                          wire2 : (wire3 ? wire3 : wire1)),
                      wire3[(4'hc):(1'h0)]} ?
                  $unsigned(reg6) : (((reg7 ? reg6 : (7'h44)) ?
                      reg7 : $unsigned(wire1)) < (~$signed(wire3)))));
          reg8 <= {wire4[(3'h6):(3'h5)], reg6[(4'hc):(2'h3)]};
          if ((((reg7[(2'h3):(2'h3)] + wire1) ?
                  (-wire4[(4'hb):(4'hb)]) : reg6[(3'h7):(1'h0)]) ?
              wire2[(4'hf):(4'hc)] : {(reg6[(3'h5):(2'h3)] ?
                      ($unsigned(wire1) * wire1) : $unsigned((wire2 >> (8'had))))}))
            begin
              reg9 <= wire0[(3'h6):(2'h2)];
              reg10 <= wire0;
              reg11 <= (^($unsigned($signed(wire2)) ?
                  $signed($signed($unsigned(wire1))) : {(reg10 <= (reg7 ?
                          wire1 : reg5))}));
              reg12 <= reg5;
              reg13 <= reg7;
            end
          else
            begin
              reg9 <= (^((~&((wire0 ? reg8 : reg11) ?
                      (wire0 ? (8'ha5) : wire0) : (reg11 != reg9))) ?
                  ((reg5[(3'h6):(1'h1)] ?
                      (^reg6) : (reg8 ^~ reg8)) + $signed($signed(reg13))) : wire4));
            end
        end
      reg14 <= ($signed((($unsigned((8'haf)) - reg12[(5'h11):(1'h1)]) ?
          $unsigned((reg11 ?
              wire4 : (8'hb4))) : (&(8'hb0)))) & $signed((({wire0} ?
          reg6 : {reg5}) & reg7[(1'h1):(1'h0)])));
    end
  assign wire15 = (8'h9e);
  always
    @(posedge clk) begin
      reg16 <= $unsigned((|wire4));
      reg17 <= $signed($signed(wire3[(1'h0):(1'h0)]));
      reg18 <= reg11;
    end
  always
    @(posedge clk) begin
      reg19 <= wire1[(1'h0):(1'h0)];
    end
  module20 #() modinst79 (wire78, clk, reg5, reg9, wire0, wire1, reg8);
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h131):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire25;
  input wire [(4'hb):(1'h0)] wire24;
  input wire [(4'h8):(1'h0)] wire23;
  input wire [(3'h7):(1'h0)] wire22;
  input wire signed [(5'h10):(1'h0)] wire21;
  wire [(3'h4):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire [(5'h12):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(5'h14):(1'h0)] wire72;
  reg signed [(3'h7):(1'h0)] reg47 = (1'h0);
  reg signed [(4'he):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg45 = (1'h0);
  reg signed [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg41 = (1'h0);
  reg [(3'h4):(1'h0)] reg40 = (1'h0);
  reg [(4'h9):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  reg [(3'h6):(1'h0)] reg37 = (1'h0);
  reg [(5'h15):(1'h0)] reg36 = (1'h0);
  reg [(5'h13):(1'h0)] reg35 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg34 = (1'h0);
  reg [(4'h8):(1'h0)] reg33 = (1'h0);
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg [(5'h13):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire72,
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
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 (1'h0)};
  always
    @(posedge clk) begin
      if (($signed(wire21[(4'h9):(3'h5)]) ?
          (|((!(^(8'ha6))) ?
              (!$unsigned((8'ha7))) : ($unsigned(wire21) - $signed((7'h41))))) : wire23[(2'h3):(1'h1)]))
        begin
          reg26 <= (wire24 - wire23);
          reg27 <= wire25;
          reg28 <= ($unsigned($unsigned($signed(wire25[(3'h4):(3'h4)]))) ?
              (!wire25) : ((($signed(reg27) * $unsigned(wire23)) >= $unsigned(reg26[(1'h1):(1'h1)])) == wire23[(2'h3):(1'h1)]));
        end
      else
        begin
          if ((^~wire22[(3'h5):(2'h2)]))
            begin
              reg26 <= ((wire23[(3'h7):(1'h1)] ?
                      $unsigned($unsigned($signed(wire24))) : wire23) ?
                  $unsigned((|((~wire21) + $signed(wire23)))) : ((((wire23 ?
                              (8'ha4) : wire23) ?
                          $unsigned(wire22) : $signed(wire25)) >= ((wire22 && wire21) ?
                          (wire25 ? reg28 : reg28) : (reg27 ^~ wire25))) ?
                      ((wire25 ? wire25 : $unsigned(reg26)) ?
                          wire22[(3'h4):(1'h1)] : (~$unsigned(wire22))) : (reg27 != $signed({wire25,
                          reg26}))));
            end
          else
            begin
              reg26 <= wire22[(3'h5):(1'h0)];
              reg27 <= (~^$unsigned($signed((wire25 != ((8'ha2) ?
                  wire25 : (8'hba))))));
              reg28 <= wire23[(3'h4):(1'h1)];
              reg29 <= ($signed($signed(((|(8'ha5)) ?
                  (reg28 ?
                      wire23 : (8'hbe)) : reg26[(1'h1):(1'h1)]))) << reg26);
              reg30 <= {{$signed({(wire23 & (7'h40)),
                          (reg28 ? wire21 : wire22)})}};
            end
          if ((wire24[(1'h1):(1'h0)] ?
              wire25[(3'h7):(1'h1)] : $unsigned((({wire25,
                      wire25} == $signed(wire24)) ?
                  wire25 : reg26[(3'h4):(3'h4)]))))
            begin
              reg31 <= $unsigned({$signed($unsigned((reg26 ?
                      reg27 : wire22)))});
              reg32 <= reg29[(3'h6):(3'h5)];
              reg33 <= $signed(($unsigned($unsigned($unsigned(reg30))) ?
                  $signed(reg26) : reg32));
              reg34 <= $signed($signed($unsigned((8'haa))));
              reg35 <= ($signed(((~&reg27) * reg32[(4'hd):(4'hb)])) ?
                  $signed((-(reg34[(1'h0):(1'h0)] <= (reg30 ?
                      reg31 : reg34)))) : reg26[(2'h3):(1'h1)]);
            end
          else
            begin
              reg31 <= (~reg26);
              reg32 <= wire23[(4'h8):(1'h0)];
              reg33 <= reg28;
            end
          reg36 <= (^$signed($unsigned(($unsigned(wire25) ?
              (8'hac) : $unsigned(reg30)))));
          reg37 <= $unsigned(((+reg36) ? reg34 : reg32[(1'h0):(1'h0)]));
        end
      if (wire22)
        begin
          reg38 <= $signed(((8'hb6) ?
              (^~((wire23 ?
                  (8'hb1) : reg37) ^ wire21[(4'ha):(2'h2)])) : ((~|reg34[(1'h0):(1'h0)]) ?
                  $unsigned((reg31 ? reg27 : wire22)) : reg29[(3'h5):(2'h3)])));
        end
      else
        begin
          reg38 <= {{(!$unsigned(wire24))},
              ($signed((^(reg29 + reg29))) ? wire23 : (-(7'h42)))};
        end
      if ((reg30[(3'h6):(3'h5)] ? $signed(reg30[(5'h13):(1'h1)]) : (8'ha9)))
        begin
          reg39 <= $signed(reg36[(3'h7):(3'h7)]);
          reg40 <= (~^$unsigned($unsigned(reg38[(5'h11):(4'hb)])));
        end
      else
        begin
          reg39 <= reg39[(3'h5):(2'h2)];
          reg40 <= {$signed((^(reg34[(1'h1):(1'h1)] >>> reg39[(1'h0):(1'h0)]))),
              wire25[(1'h1):(1'h0)]};
        end
      reg41 <= (reg29[(1'h0):(1'h0)] ?
          $unsigned((|(+(reg27 ? reg39 : reg30)))) : (reg38[(5'h14):(5'h14)] ?
              (((^~wire25) ? (reg30 - wire22) : reg37[(1'h1):(1'h1)]) ?
                  (~|(reg34 <<< reg26)) : wire24[(2'h2):(1'h1)]) : (~|{((8'hbc) ?
                      (8'haf) : reg38)})));
    end
  always
    @(posedge clk) begin
      reg42 <= {($unsigned({$signed(reg36)}) <<< reg32[(1'h0):(1'h0)])};
      reg43 <= (~reg34[(2'h2):(2'h2)]);
      reg44 <= (reg43[(1'h1):(1'h0)] ?
          (^$signed(($unsigned(reg26) + $signed(reg31)))) : {reg27,
              (~($signed(reg27) || reg30[(4'h9):(2'h3)]))});
      reg45 <= ((~^wire23) ?
          (wire25[(1'h0):(1'h0)] < $signed(((~|reg38) ?
              $signed(wire23) : $unsigned(reg37)))) : ($signed(({wire23} ?
              {reg41} : wire21)) >> $signed($unsigned(reg38))));
    end
  always
    @(posedge clk) begin
      reg46 <= (~&wire23[(1'h0):(1'h0)]);
      reg47 <= {($signed(((reg29 ? reg37 : wire23) ?
              (reg35 ? reg26 : reg36) : reg28)) < ((reg37[(3'h6):(1'h0)] ?
              (~wire24) : ((8'ha8) ? reg35 : reg44)) <<< (&$unsigned(reg26)))),
          ($signed(({reg46, reg44} >> $signed(reg39))) ?
              $unsigned((8'hb4)) : $signed(($signed(reg26) * reg26[(2'h2):(1'h0)])))};
    end
  module48 #() modinst73 (.y(wire72), .wire52(reg32), .wire51(reg46), .wire50(reg26), .wire49(reg36), .clk(clk));
  assign wire74 = {{reg31}};
  assign wire75 = {reg46, $signed($unsigned({(reg37 ? reg46 : reg29)}))};
  assign wire76 = (+($signed($unsigned((~|(8'hbd)))) ?
                      reg27 : $signed(({reg47} & reg42[(3'h4):(3'h4)]))));
  assign wire77 = ((~^{$unsigned((reg31 ? reg35 : (7'h43))),
                          ((reg44 || reg27) ? reg26 : $unsigned(wire25))}) ?
                      (+reg38[(3'h5):(3'h5)]) : (-($unsigned((reg38 ?
                          reg39 : wire24)) ^ reg34)));
endmodule

module module48
#(parameter param70 = ((~^((&((8'hb7) ? (8'hbe) : (8'hb3))) <= {(8'hb0)})) ? ((({(8'haa)} > (|(8'hb0))) < (((8'hac) & (8'hb1)) ? (~^(8'h9f)) : (7'h42))) && (8'ha1)) : ({((^~(8'ha3)) | ((8'h9f) ? (8'hb8) : (8'hab))), {(!(8'hb5))}} ? {(((8'ha6) ? (8'hb7) : (8'hac)) ? ((8'haf) ? (8'h9c) : (8'ha7)) : (~(7'h41))), (!((8'hab) ? (8'h9d) : (8'hb8)))} : ((8'h9d) & (+((8'ha8) ? (8'ha0) : (8'ha1)))))), 
parameter param71 = (!{(((&param70) ? (param70 ? param70 : param70) : (-(8'hbb))) ? param70 : (+{(8'hb7), param70})), (param70 ? param70 : {(+param70)})}))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire51;
  input wire [(2'h3):(1'h0)] wire50;
  input wire signed [(4'hf):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire signed [(4'h9):(1'h0)] wire67;
  wire signed [(4'ha):(1'h0)] wire66;
  wire [(4'h8):(1'h0)] wire65;
  wire [(3'h6):(1'h0)] wire63;
  wire [(5'h10):(1'h0)] wire62;
  wire [(5'h13):(1'h0)] wire61;
  wire signed [(3'h5):(1'h0)] wire60;
  wire [(4'ha):(1'h0)] wire59;
  wire signed [(5'h14):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire [(4'h8):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire [(4'hc):(1'h0)] wire53;
  reg [(2'h3):(1'h0)] reg64 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg64,
                 (1'h0)};
  assign wire53 = (wire52 ?
                      $signed(($unsigned(wire50) < {$unsigned(wire51)})) : wire49[(2'h3):(2'h3)]);
  assign wire54 = (wire49[(3'h4):(2'h3)] ?
                      (~$signed(((wire52 && wire51) ?
                          $unsigned(wire50) : (wire52 >= wire50)))) : wire53[(3'h7):(2'h2)]);
  assign wire55 = $signed((^~(~&(~|wire53[(3'h7):(3'h5)]))));
  assign wire56 = (8'hb0);
  assign wire57 = ((((wire55[(4'h9):(3'h7)] ^ ((8'ha7) ? wire53 : wire53)) ?
                          ($unsigned(wire55) ?
                              $signed((8'hb2)) : {wire49}) : (wire52[(1'h0):(1'h0)] ~^ (wire52 ?
                              wire51 : wire52))) * ((|wire52[(2'h3):(2'h2)]) ?
                          ((8'hbe) >>> $unsigned(wire52)) : (~|wire53[(4'hb):(4'h9)]))) ?
                      (wire50[(2'h2):(1'h1)] ^ (&{(wire53 ? wire54 : wire53),
                          $unsigned(wire50)})) : (wire50 ?
                          (wire50 ^~ wire53[(1'h0):(1'h0)]) : $signed((~&$signed(wire49)))));
  assign wire58 = (&wire52);
  assign wire59 = $unsigned((^~wire52));
  assign wire60 = $signed((^wire51));
  assign wire61 = wire58[(4'ha):(2'h3)];
  assign wire62 = $signed($signed({((^wire57) ~^ wire56), wire58}));
  assign wire63 = (-$unsigned({$unsigned(wire60)}));
  always
    @(posedge clk) begin
      reg64 <= $unsigned($unsigned({((wire62 ?
              wire52 : wire56) > wire52[(2'h2):(1'h0)]),
          $unsigned($unsigned(wire51))}));
    end
  assign wire65 = wire52[(2'h3):(2'h2)];
  assign wire66 = $signed(wire58);
  assign wire67 = (wire58[(4'h8):(4'h8)] ? $unsigned((|(~(+wire58)))) : wire49);
  assign wire68 = wire57;
  assign wire69 = ((wire67[(3'h6):(3'h5)] ?
                          wire49 : (({wire67, reg64} ?
                              $signed(wire56) : ((8'h9e) ?
                                  wire55 : wire57)) && (8'hb4))) ?
                      wire57 : wire66);
endmodule
