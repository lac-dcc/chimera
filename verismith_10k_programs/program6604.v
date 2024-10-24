module top
#(parameter param111 = ({(&(((8'hae) ^~ (8'ha9)) * (^(8'hb6))))} - (!{{((8'ha4) ? (8'hb5) : (8'ha4)), (~&(8'hb5))}, (-(^(8'hbe)))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h6c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire1;
  input wire signed [(3'h6):(1'h0)] wire0;
  wire signed [(5'h15):(1'h0)] wire110;
  wire signed [(3'h7):(1'h0)] wire108;
  wire [(5'h15):(1'h0)] wire9;
  wire [(5'h15):(1'h0)] wire8;
  wire [(5'h14):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire6;
  wire [(3'h4):(1'h0)] wire5;
  wire signed [(4'h8):(1'h0)] wire4;
  assign y = {wire110,
                 wire108,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 (1'h0)};
  assign wire4 = ($unsigned(({(wire3 ? wire1 : wire2)} ?
                         (wire3 != $signed(wire2)) : {(~|wire3)})) ?
                     wire3[(2'h2):(2'h2)] : $signed(wire0));
  assign wire5 = $unsigned((^$unsigned(wire1)));
  assign wire6 = wire2[(4'ha):(3'h4)];
  assign wire7 = wire1[(2'h2):(1'h0)];
  assign wire8 = {wire4[(1'h0):(1'h0)]};
  assign wire9 = $signed(((wire8[(1'h0):(1'h0)] && $signed((~wire0))) ^ wire4));
  module10 #() modinst109 (wire108, clk, wire7, wire8, wire2, wire0);
  assign wire110 = $signed(wire5);
endmodule

module module10
#(parameter param107 = (~&((~&(((8'hbc) ? (8'h9f) : (8'hae)) == ((8'hb2) ~^ (8'ha4)))) ? (^({(7'h43), (8'hb6)} + ((8'hb2) && (8'hba)))) : {(^~((8'hb0) ? (7'h41) : (8'hbd)))})))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'h34a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire14;
  input wire signed [(5'h15):(1'h0)] wire13;
  input wire [(2'h3):(1'h0)] wire12;
  input wire signed [(3'h6):(1'h0)] wire11;
  wire [(5'h15):(1'h0)] wire90;
  wire [(3'h6):(1'h0)] wire81;
  wire signed [(4'hd):(1'h0)] wire80;
  wire signed [(4'hc):(1'h0)] wire79;
  wire signed [(2'h2):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire77;
  wire signed [(4'h8):(1'h0)] wire76;
  wire [(4'hd):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire74;
  wire signed [(5'h10):(1'h0)] wire73;
  wire [(4'hc):(1'h0)] wire72;
  wire signed [(5'h15):(1'h0)] wire70;
  wire signed [(5'h12):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  reg [(4'hc):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg105 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg104 = (1'h0);
  reg [(4'ha):(1'h0)] reg103 = (1'h0);
  reg [(5'h10):(1'h0)] reg102 = (1'h0);
  reg [(3'h4):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg99 = (1'h0);
  reg [(3'h7):(1'h0)] reg98 = (1'h0);
  reg [(4'ha):(1'h0)] reg97 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg96 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg95 = (1'h0);
  reg [(4'hc):(1'h0)] reg94 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(4'ha):(1'h0)] reg91 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg [(4'hb):(1'h0)] reg88 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg87 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(5'h13):(1'h0)] reg82 = (1'h0);
  reg [(5'h12):(1'h0)] reg48 = (1'h0);
  reg [(4'hc):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  reg [(4'he):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg42 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg40 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg39 = (1'h0);
  reg [(5'h12):(1'h0)] reg38 = (1'h0);
  reg [(5'h14):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg33 = (1'h0);
  reg [(5'h14):(1'h0)] reg32 = (1'h0);
  reg [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg21 = (1'h0);
  reg [(4'hf):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg19 = (1'h0);
  reg [(3'h6):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg15 = (1'h0);
  assign y = {wire90,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire49,
                 wire25,
                 wire24,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg92,
                 reg91,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg48,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(wire12)))
        begin
          if ($unsigned($unsigned(wire14)))
            begin
              reg15 <= {wire11[(3'h4):(3'h4)], $signed(wire12[(2'h3):(1'h1)])};
              reg16 <= $signed(wire14);
            end
          else
            begin
              reg15 <= ((+$signed(wire11)) ?
                  wire12[(2'h2):(1'h0)] : (^~$unsigned($signed(reg16))));
              reg16 <= (~^($unsigned({$signed(wire12),
                  $unsigned(wire14)}) ^~ $signed($unsigned(wire14))));
              reg17 <= $signed($signed({{wire14},
                  (reg15[(4'hc):(4'ha)] ~^ $signed(wire12))}));
            end
          if ($signed($unsigned($unsigned(wire14[(4'h9):(3'h6)]))))
            begin
              reg18 <= wire12;
              reg19 <= reg17;
              reg20 <= (+($unsigned((reg17[(5'h10):(4'ha)] == $unsigned(reg19))) ?
                  $unsigned(((reg17 > reg16) | (8'h9e))) : ({$unsigned(reg15),
                      $unsigned(wire14)} * $unsigned($unsigned(reg15)))));
              reg21 <= reg16;
              reg22 <= reg17;
            end
          else
            begin
              reg18 <= {(~|reg22[(3'h5):(2'h2)]),
                  (reg22 || (((~^wire13) ? (~(8'ha0)) : reg17[(4'hd):(4'hb)]) ?
                      ({reg19,
                          reg19} ^ wire14[(4'hb):(4'h8)]) : ((wire14 ^ reg21) <= $signed((8'hb6)))))};
            end
        end
      else
        begin
          reg15 <= (($unsigned(wire12[(2'h2):(2'h2)]) ?
              $signed($signed((reg19 > reg21))) : $signed(wire12[(2'h3):(1'h1)])) ~^ (reg21[(4'hf):(4'hd)] ?
              reg19 : reg19));
          reg16 <= (8'haa);
          reg17 <= ((~|reg20[(3'h4):(3'h4)]) ?
              $signed(reg21) : $unsigned(reg22[(1'h1):(1'h0)]));
          if (wire12[(1'h1):(1'h1)])
            begin
              reg18 <= (^$signed(wire13[(4'hb):(4'h8)]));
              reg19 <= (wire14 >>> $unsigned((^~$unsigned($signed(reg18)))));
            end
          else
            begin
              reg18 <= $signed({(!$signed(reg20[(3'h7):(1'h1)]))});
            end
        end
      reg23 <= (reg20[(2'h2):(2'h2)] >= wire13);
    end
  assign wire24 = wire14[(4'hb):(4'hb)];
  assign wire25 = (reg17 << (~&(|(~|$signed(reg18)))));
  always
    @(posedge clk) begin
      reg26 <= $signed((reg20 * wire11[(2'h2):(1'h0)]));
      if (wire11)
        begin
          if ($signed(($signed((|$signed(reg20))) != ((~(~reg22)) ?
              ($signed(wire24) ?
                  reg23 : $signed(reg20)) : $unsigned($unsigned(reg23))))))
            begin
              reg27 <= $signed(reg20[(3'h6):(3'h5)]);
              reg28 <= (~^{reg18,
                  (((~(8'hae)) ? reg20[(4'h8):(1'h1)] : $unsigned(reg26)) ?
                      reg19 : $signed(wire25))});
              reg29 <= reg19;
              reg30 <= $signed(reg26[(1'h0):(1'h0)]);
            end
          else
            begin
              reg27 <= (reg20[(2'h2):(1'h0)] * (wire25[(2'h2):(1'h0)] ?
                  (~&(~^$signed(reg20))) : (wire25 ?
                      ($signed(wire25) >= (-wire12)) : wire11[(1'h1):(1'h0)])));
            end
          if ($signed(wire14[(3'h7):(2'h3)]))
            begin
              reg31 <= ($signed({reg29,
                  ((8'hb7) ~^ (reg29 ?
                      reg21 : (8'h9c)))}) <= $unsigned($unsigned({wire14})));
              reg32 <= (!(($signed($signed((8'hbb))) ?
                      wire13[(4'h9):(2'h2)] : $unsigned((-reg19))) ?
                  (reg20 <= $unsigned((8'hb7))) : $signed($signed(reg30))));
            end
          else
            begin
              reg31 <= reg18;
              reg32 <= (~reg26[(3'h4):(3'h4)]);
              reg33 <= reg17;
              reg34 <= $signed((8'hbb));
              reg35 <= reg20[(3'h7):(3'h4)];
            end
        end
      else
        begin
          reg27 <= {($unsigned(($unsigned(reg30) ? {reg23} : (7'h40))) ?
                  $unsigned(reg34[(2'h3):(2'h3)]) : (!((^~reg29) + (reg35 == reg22))))};
          if ((~$signed(wire25)))
            begin
              reg28 <= $unsigned($unsigned(((!(reg32 ? reg30 : reg20)) ?
                  reg30 : $signed((reg21 != wire13)))));
              reg29 <= (wire25 >> reg19[(3'h4):(1'h0)]);
              reg30 <= $unsigned((+(|$unsigned((wire24 >= reg20)))));
              reg31 <= reg18;
              reg32 <= {(8'h9c),
                  (~$unsigned({(reg28 ^ (8'ha8)), reg32[(3'h4):(1'h1)]}))};
            end
          else
            begin
              reg28 <= $signed((8'ha3));
            end
          reg33 <= (^reg17[(4'hf):(1'h1)]);
        end
      if (({reg34[(1'h1):(1'h1)]} == $signed({($signed(reg15) ?
              ((8'hbd) ? reg34 : reg19) : reg27[(4'ha):(2'h3)])})))
        begin
          reg36 <= $signed(reg16[(1'h0):(1'h0)]);
        end
      else
        begin
          if (reg15)
            begin
              reg36 <= (8'hb7);
            end
          else
            begin
              reg36 <= $unsigned($signed(reg36[(4'h8):(3'h4)]));
              reg37 <= reg18[(2'h2):(1'h0)];
              reg38 <= reg17;
              reg39 <= wire12[(2'h3):(2'h3)];
              reg40 <= (((reg26 >= $signed((reg15 << reg22))) ^ ($signed((reg27 ?
                      wire11 : reg19)) ?
                  ((-(8'hac)) * $unsigned(reg21)) : $unsigned($unsigned(reg30)))) >= (&(7'h40)));
            end
          if (((+((~|(7'h44)) ^~ (8'hb2))) >= $signed($signed($unsigned((^reg31))))))
            begin
              reg41 <= ((wire12 ?
                      $unsigned(reg34) : ((-(reg23 ? wire12 : reg30)) ?
                          ((reg28 && wire25) ?
                              (^wire13) : (reg28 ?
                                  (8'hbd) : reg32)) : $signed((wire13 ?
                              reg35 : reg38)))) ?
                  $signed((wire11[(3'h5):(2'h2)] ?
                      (^~wire11[(3'h4):(2'h2)]) : $signed(reg28))) : (($unsigned(reg26) ?
                      ((reg29 ?
                          reg33 : reg39) >= (8'h9e)) : (!reg27)) * $signed((wire24 ?
                      $unsigned(wire13) : reg30[(4'h9):(1'h0)]))));
              reg42 <= wire12;
            end
          else
            begin
              reg41 <= reg18[(3'h6):(2'h3)];
              reg42 <= (8'ha0);
              reg43 <= $signed(reg23[(3'h7):(2'h2)]);
              reg44 <= $signed(reg29[(1'h1):(1'h0)]);
              reg45 <= (reg22[(1'h0):(1'h0)] == ($unsigned((8'ha8)) ?
                  ($unsigned((!reg39)) > (~&(|reg23))) : $signed($signed(reg43[(3'h4):(1'h0)]))));
            end
          reg46 <= ((reg35[(2'h2):(1'h0)] ?
              ({(reg20 > reg45),
                  (reg19 ?
                      reg29 : reg31)} & $unsigned(reg35)) : $signed($signed({reg26}))) << reg28[(4'hc):(4'h8)]);
        end
      reg47 <= reg28;
      reg48 <= ({$signed($signed($unsigned(reg31))),
              (^~($signed(reg38) ? reg23[(3'h6):(3'h6)] : $signed(reg28)))} ?
          reg27[(4'ha):(4'h8)] : $unsigned(($unsigned((-reg19)) ?
              $unsigned(reg36) : reg41[(1'h1):(1'h1)])));
    end
  assign wire49 = (((reg41[(1'h0):(1'h0)] ?
                          $unsigned({reg47}) : $signed($unsigned((7'h43)))) ?
                      reg48 : $signed(reg46[(2'h2):(2'h2)])) >>> (reg43 ?
                      (~|$unsigned($signed(reg45))) : reg38));
  module50 #() modinst71 (.clk(clk), .y(wire70), .wire54(reg30), .wire52(reg32), .wire53(reg33), .wire51(reg37));
  assign wire72 = ((wire11[(3'h6):(2'h2)] ?
                          ((|(!reg20)) ?
                              reg45[(1'h1):(1'h1)] : reg48) : $unsigned({(reg29 ~^ reg28),
                              reg39[(3'h6):(3'h4)]})) ?
                      wire12[(2'h3):(1'h1)] : (^~$unsigned($unsigned($signed(wire13)))));
  assign wire73 = reg29;
  assign wire74 = ($unsigned((~&(^~wire12))) || (reg16 & ({wire25, reg44} ?
                      wire72 : wire72[(3'h7):(3'h5)])));
  assign wire75 = (reg30 * $signed(wire14));
  assign wire76 = $unsigned((|$signed((reg43[(1'h1):(1'h1)] ?
                      $unsigned((8'hbb)) : $signed(reg31)))));
  assign wire77 = reg21;
  assign wire78 = (~|(8'haa));
  assign wire79 = (+wire72[(2'h2):(1'h0)]);
  assign wire80 = (8'hb1);
  assign wire81 = $unsigned((8'hb2));
  always
    @(posedge clk) begin
      reg82 <= reg17;
      if (((reg43[(3'h6):(1'h0)] >= wire70[(5'h15):(1'h1)]) ?
          ($unsigned({$signed(reg20), wire49[(2'h2):(2'h2)]}) ?
              $unsigned(((wire78 >= reg17) ?
                  (wire80 || reg28) : $unsigned(reg47))) : ($signed($unsigned(wire24)) | (reg39 >= $unsigned(reg26)))) : $signed(reg34[(4'ha):(3'h7)])))
        begin
          if (($unsigned((reg23 ?
                  ($signed(reg28) && (-wire78)) : $signed(reg44))) ?
              $unsigned({({reg28} - reg38[(4'ha):(1'h0)]),
                  $signed(reg45)}) : (~|$signed($unsigned($unsigned((7'h40)))))))
            begin
              reg83 <= reg32;
            end
          else
            begin
              reg83 <= wire81[(3'h5):(2'h2)];
              reg84 <= reg43[(1'h0):(1'h0)];
              reg85 <= (((8'ha4) >>> reg36) ~^ wire77[(4'hc):(3'h4)]);
            end
        end
      else
        begin
          if ((reg85 | reg26))
            begin
              reg83 <= (|reg36[(4'hc):(4'hb)]);
              reg84 <= ((8'h9f) ?
                  (!(~|(|reg35))) : $signed(($unsigned($unsigned(reg46)) ?
                      reg31[(2'h2):(1'h1)] : (8'hae))));
              reg85 <= {$unsigned(($signed(reg39) ?
                      (&reg26) : (reg19 | (wire77 <<< wire75)))),
                  wire79};
              reg86 <= ($signed(({$unsigned((8'ha0)),
                  (^(8'hb1))} < {((8'ha3) >= (8'haf)), (7'h42)})) >>> wire76);
              reg87 <= (({((~wire24) ?
                          $unsigned((8'hb9)) : (wire25 ? (8'ha2) : reg41)),
                      (8'h9e)} ?
                  $unsigned((^~(reg38 | reg32))) : $signed((+(reg26 | (8'hab))))) <= reg45[(4'hd):(3'h6)]);
            end
          else
            begin
              reg83 <= wire24;
              reg84 <= (reg19 <<< $signed(reg36[(1'h0):(1'h0)]));
              reg85 <= (wire12[(2'h3):(1'h1)] ?
                  reg22[(2'h2):(2'h2)] : (^reg20));
            end
        end
      reg88 <= (^~reg32[(5'h12):(3'h4)]);
      reg89 <= reg22[(2'h2):(1'h0)];
    end
  assign wire90 = wire79[(1'h1):(1'h1)];
  always
    @(posedge clk) begin
      if (reg31)
        begin
          if ((8'hbd))
            begin
              reg91 <= {$unsigned($signed(reg89)), (~&wire81)};
              reg92 <= $unsigned((reg40[(2'h3):(1'h1)] ?
                  $unsigned((~^$signed(wire77))) : (reg86[(3'h7):(3'h5)] ?
                      reg37[(4'hd):(3'h6)] : (+((8'hba) ^ reg15)))));
            end
          else
            begin
              reg91 <= (reg18[(3'h5):(1'h0)] ?
                  (^($signed((wire72 ? reg85 : reg22)) ?
                      (8'haf) : $signed({reg85,
                          wire14}))) : (reg23[(4'h9):(2'h3)] ?
                      {(wire80 ?
                              {reg86} : $signed(wire11))} : reg20[(2'h3):(1'h1)]));
              reg92 <= wire14[(4'hd):(4'hb)];
              reg93 <= ($signed(($signed((reg29 && reg87)) << (|(wire76 * reg33)))) > $signed((wire12 ?
                  (-(wire79 || reg26)) : $unsigned((wire70 ?
                      wire72 : reg46)))));
              reg94 <= reg43;
              reg95 <= (8'ha1);
            end
          if ($signed($unsigned($signed(($unsigned(reg36) & (reg83 ?
              wire90 : reg36))))))
            begin
              reg96 <= $unsigned(wire76[(3'h4):(2'h2)]);
              reg97 <= (|wire70[(5'h12):(4'hb)]);
              reg98 <= (~(~^reg34[(3'h4):(2'h2)]));
            end
          else
            begin
              reg96 <= ((+(&((wire13 ? wire77 : reg42) ?
                      (8'hb8) : $unsigned((8'hac))))) ?
                  (~|((reg20 ^~ ((8'hbd) ? (8'hb7) : (8'h9c))) ?
                      ($unsigned(reg45) ?
                          wire11 : reg31[(2'h3):(2'h3)]) : reg82[(4'ha):(2'h2)])) : reg23[(1'h1):(1'h0)]);
              reg97 <= (reg32 << ($unsigned({reg23[(3'h7):(2'h2)]}) ?
                  reg83[(1'h0):(1'h0)] : reg98));
              reg98 <= (reg98 ^ (&wire76[(4'h8):(3'h4)]));
            end
          reg99 <= $unsigned(reg83[(3'h4):(1'h0)]);
          reg100 <= reg23[(3'h5):(2'h3)];
          reg101 <= $signed(wire77);
        end
      else
        begin
          reg91 <= (($unsigned($unsigned((~&(8'h9f)))) ?
              ((~$signed(reg35)) || reg96) : $unsigned((^{(8'ha6),
                  reg33}))) & $signed(reg31[(1'h0):(1'h0)]));
          reg92 <= $signed(($signed(wire81[(2'h2):(1'h1)]) ?
              $signed(((+(8'hbe)) + (reg97 ?
                  reg95 : reg89))) : ($unsigned($unsigned(reg39)) < $signed((|(8'hb3))))));
        end
      reg102 <= $unsigned($signed(wire70[(1'h1):(1'h1)]));
      reg103 <= $unsigned((8'ha5));
      if ($unsigned($unsigned(reg27)))
        begin
          reg104 <= ((-reg83[(1'h0):(1'h0)]) > (~reg23));
          reg105 <= reg20;
        end
      else
        begin
          reg104 <= $unsigned({$unsigned($signed((wire72 ^~ (8'hbb)))),
              $unsigned(reg36)});
          reg105 <= wire81[(3'h5):(2'h3)];
        end
      reg106 <= $signed($unsigned((($signed((8'hbf)) ?
              (reg22 > wire80) : reg43) ?
          {wire80[(1'h0):(1'h0)]} : {(~|reg93)})));
    end
endmodule

module module50
#(parameter param69 = {(({((8'hab) >>> (8'hac))} ? (((8'ha7) ? (8'hae) : (8'hb5)) ? (7'h42) : ((8'hab) || (8'hb4))) : {((8'hb8) >> (8'hba)), ((7'h44) <= (8'hbb))}) ? ((((8'ha3) <<< (8'ha7)) ? ((8'hb8) | (8'h9c)) : ((7'h42) <<< (7'h42))) - (((8'hb0) ? (8'ha4) : (8'hb8)) * ((8'ha6) ? (8'hb8) : (8'h9c)))) : ((((8'ha6) ? (7'h41) : (8'hbb)) * ((8'haa) ^ (8'ha4))) + {{(8'hac)}, {(8'haf)}})), (((7'h42) ? ((!(8'haf)) ? (^~(8'haf)) : ((8'hae) ? (8'h9e) : (8'ha4))) : (^~(|(8'hb1)))) != (|(((8'h9d) > (8'hab)) ? ((8'ha5) ? (8'haf) : (8'had)) : (-(8'hac)))))})
(y, clk, wire54, wire53, wire52, wire51);
  output wire [(32'h97):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire54;
  input wire signed [(5'h12):(1'h0)] wire53;
  input wire [(5'h12):(1'h0)] wire52;
  input wire [(5'h14):(1'h0)] wire51;
  wire [(4'hb):(1'h0)] wire65;
  wire [(4'ha):(1'h0)] wire64;
  wire signed [(5'h11):(1'h0)] wire63;
  wire [(3'h5):(1'h0)] wire62;
  wire [(4'hc):(1'h0)] wire61;
  wire signed [(5'h11):(1'h0)] wire58;
  wire signed [(3'h7):(1'h0)] wire57;
  wire signed [(4'h8):(1'h0)] wire56;
  wire signed [(4'hc):(1'h0)] wire55;
  reg signed [(5'h10):(1'h0)] reg68 = (1'h0);
  reg [(5'h10):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg60 = (1'h0);
  reg [(3'h4):(1'h0)] reg59 = (1'h0);
  assign y = {wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 reg68,
                 reg67,
                 reg66,
                 reg60,
                 reg59,
                 (1'h0)};
  assign wire55 = $unsigned(wire53[(2'h2):(2'h2)]);
  assign wire56 = wire54[(1'h0):(1'h0)];
  assign wire57 = ($unsigned((8'ha6)) ?
                      (^$signed($signed((wire51 ?
                          wire52 : wire54)))) : {$signed({$unsigned(wire52)})});
  assign wire58 = ((wire54 <= (7'h40)) ? wire54 : wire56[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg59 <= (~&{(8'hb3)});
      reg60 <= ($unsigned(wire56) ?
          wire57[(1'h1):(1'h0)] : wire51[(2'h3):(1'h0)]);
    end
  assign wire61 = (+((((reg59 ? wire58 : wire54) ?
                              (wire56 ? reg60 : wire58) : (|wire53)) ?
                          wire57[(1'h1):(1'h1)] : {(wire56 ?
                                  wire56 : wire52)}) ?
                      ({{wire57, wire51},
                          (reg60 ?
                              wire54 : wire54)} && ($unsigned(wire58) ^~ wire54[(2'h3):(2'h2)])) : wire57[(1'h0):(1'h0)]));
  assign wire62 = (($unsigned(wire51) != {(wire56 * ((8'ha5) >= wire58)),
                      wire58[(3'h6):(3'h5)]}) ^ (!(!(~^((8'ha8) ?
                      wire55 : (8'hb0))))));
  assign wire63 = $unsigned({((wire51[(2'h3):(2'h3)] ?
                          $signed(wire61) : reg60) ^ {((8'hac) ?
                              wire51 : wire54),
                          wire62}),
                      $unsigned(($signed(wire62) > (reg60 != (8'hbf))))});
  assign wire64 = reg59[(1'h0):(1'h0)];
  assign wire65 = wire58[(4'hb):(3'h6)];
  always
    @(posedge clk) begin
      reg66 <= $unsigned((^(($unsigned(wire53) - wire51) > wire57)));
      reg67 <= ((((wire65[(2'h2):(2'h2)] & {wire65, wire53}) ?
              $signed(wire64[(4'ha):(4'h8)]) : ($unsigned((7'h40)) ?
                  (wire61 ? wire58 : wire62) : (wire52 ?
                      (8'hb9) : (8'ha1)))) * $unsigned($signed((wire51 ?
              wire58 : wire64)))) ?
          $unsigned((~(reg60 ^ (reg66 >= wire57)))) : $unsigned(reg59));
      reg68 <= $unsigned({wire62});
    end
endmodule
