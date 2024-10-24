module top
#(parameter param87 = (8'h9c), 
parameter param88 = (~((&(&(&param87))) ^~ param87)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hb9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire4;
  input wire [(4'h8):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire [(4'ha):(1'h0)] wire78;
  wire [(4'he):(1'h0)] wire33;
  wire [(4'hf):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(3'h4):(1'h0)] wire29;
  wire [(5'h13):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire6;
  wire [(4'hd):(1'h0)] wire5;
  reg [(5'h12):(1'h0)] reg86 = (1'h0);
  reg [(5'h15):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg82 = (1'h0);
  assign y = {wire81,
                 wire80,
                 wire78,
                 wire33,
                 wire32,
                 wire31,
                 wire29,
                 wire7,
                 wire6,
                 wire5,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 (1'h0)};
  assign wire5 = (($signed((wire0[(2'h2):(1'h0)] ?
                         $signed(wire1) : $unsigned(wire3))) ?
                     (wire1[(3'h7):(3'h7)] ?
                         ((wire0 ? wire2 : wire3) ?
                             wire3 : wire1[(3'h7):(3'h5)]) : {((8'hab) ?
                                 wire0 : wire4),
                             $signed(wire1)}) : $unsigned($unsigned((~|(8'haa))))) <<< wire0[(4'hb):(3'h4)]);
  assign wire6 = wire3;
  assign wire7 = (&{$unsigned((8'ha1))});
  module8 #() modinst30 (.y(wire29), .wire11(wire4), .wire12(wire5), .wire10(wire7), .clk(clk), .wire9(wire6));
  assign wire31 = $signed(wire0[(4'he):(3'h4)]);
  assign wire32 = (wire4 < {(wire1 ?
                          $unsigned((wire3 > wire29)) : ($unsigned((8'h9c)) ?
                              wire4[(3'h7):(3'h4)] : $signed(wire29))),
                      (((&(7'h43)) ?
                              (wire4 ? wire4 : wire5) : (wire2 ?
                                  wire4 : (8'hbf))) ?
                          $signed((wire2 ? wire5 : wire1)) : wire29)});
  assign wire33 = (&($unsigned({(wire5 == wire31),
                      (wire29 <<< wire1)}) <= $signed(wire29)));
  module34 #() modinst79 (.wire37(wire29), .wire35(wire0), .y(wire78), .wire38(wire32), .clk(clk), .wire36(wire33));
  assign wire80 = wire29;
  assign wire81 = wire3[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg82 <= ($unsigned($signed($unsigned($unsigned(wire81)))) ?
          (8'hb2) : (8'hbf));
      reg83 <= $signed((wire5[(1'h1):(1'h1)] ?
          ($signed((wire4 ? wire31 : wire80)) ?
              (~&$signed(wire29)) : $signed(reg82)) : {$signed($unsigned(wire81)),
              (wire78 > wire81)}));
      reg84 <= {($signed((~|(~wire3))) > ((wire78 ~^ wire7) ?
              (wire0[(3'h4):(2'h2)] + ((8'hbf) << wire1)) : wire0)),
          wire32[(3'h4):(2'h2)]};
      reg85 <= wire0[(4'hc):(3'h5)];
      reg86 <= wire31;
    end
endmodule

module module34
#(parameter param76 = (((~(!((8'hb3) ? (8'h9c) : (8'ha2)))) < ((~&(~^(8'h9d))) ? (8'ha5) : {(&(8'h9e)), ((8'hb6) << (8'hac))})) ? ((~^(8'hba)) ? {(~{(8'hbb)})} : {({(8'h9c)} > ((7'h41) << (8'hae))), (((8'h9e) ? (8'hb7) : (8'h9f)) ? (-(8'hae)) : ((7'h41) != (8'hb7)))}) : (&(~^(((8'hb1) <= (8'haf)) + (~^(8'haf)))))), 
parameter param77 = (&param76))
(y, clk, wire35, wire36, wire37, wire38);
  output wire [(32'h42):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire35;
  input wire signed [(4'he):(1'h0)] wire36;
  input wire signed [(3'h4):(1'h0)] wire37;
  input wire signed [(3'h4):(1'h0)] wire38;
  wire signed [(3'h5):(1'h0)] wire75;
  wire [(5'h11):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire40;
  wire signed [(3'h5):(1'h0)] wire41;
  wire signed [(4'hb):(1'h0)] wire72;
  assign y = {wire75, wire74, wire39, wire40, wire41, wire72, (1'h0)};
  assign wire39 = $signed(wire36[(4'h8):(1'h0)]);
  assign wire40 = $unsigned($unsigned(wire37));
  assign wire41 = wire40;
  module42 #() modinst73 (.y(wire72), .wire43(wire39), .wire46(wire35), .clk(clk), .wire44(wire38), .wire47(wire36), .wire45(wire40));
  assign wire74 = $unsigned(wire37[(2'h2):(2'h2)]);
  assign wire75 = $unsigned((^~wire74[(3'h4):(2'h3)]));
endmodule

module module8
#(parameter param27 = (~^(((~(8'hbf)) ? {((8'hbc) <= (8'hb3))} : (^~(8'h9e))) < {(~|((8'had) ? (8'ha7) : (8'hb7))), (~^(-(8'ha7)))})), 
parameter param28 = (param27 ^~ (((((8'haa) != param27) ? {param27, param27} : (param27 ? param27 : param27)) - (-(param27 ^ param27))) + (param27 ? (param27 ~^ (^param27)) : (8'had)))))
(y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'ha6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h6):(1'h0)] wire12;
  input wire signed [(4'he):(1'h0)] wire11;
  input wire signed [(5'h13):(1'h0)] wire10;
  input wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(5'h12):(1'h0)] wire26;
  wire signed [(5'h14):(1'h0)] wire25;
  wire [(5'h15):(1'h0)] wire23;
  wire [(5'h12):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire [(4'he):(1'h0)] wire16;
  wire [(4'h9):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(2'h2):(1'h0)] wire13;
  reg [(3'h6):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg [(2'h3):(1'h0)] reg17 = (1'h0);
  assign y = {wire26,
                 wire25,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 reg24,
                 reg19,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire13 = $unsigned($unsigned((wire11 <<< (|((8'hb9) >>> wire12)))));
  assign wire14 = $unsigned($signed((wire11 ?
                      $signed({wire9, wire12}) : wire9[(3'h5):(1'h0)])));
  assign wire15 = $signed($signed(((~|wire11) ?
                      ((&wire14) ~^ $signed(wire10)) : $unsigned($signed(wire12)))));
  assign wire16 = wire12[(2'h3):(1'h0)];
  always
    @(posedge clk) begin
      reg17 <= wire11[(4'hd):(4'hc)];
      reg18 <= wire14;
      reg19 <= $unsigned($unsigned(wire10[(4'he):(4'he)]));
    end
  assign wire20 = (~(((wire12 >= wire15[(4'h8):(3'h4)]) ?
                      (-(~^(8'h9d))) : ($signed(wire12) ?
                          wire14 : (reg19 ?
                              wire13 : wire9))) | $unsigned(wire16)));
  assign wire21 = wire11[(3'h6):(2'h3)];
  assign wire22 = wire12[(3'h4):(2'h2)];
  assign wire23 = ({(8'hbe),
                      ($signed($signed(wire16)) ?
                          {wire20[(1'h0):(1'h0)],
                              wire14[(3'h7):(2'h2)]} : (~|(wire10 + (8'hbb))))} ^ (!$signed(wire14[(1'h1):(1'h1)])));
  always
    @(posedge clk) begin
      reg24 <= wire14;
    end
  assign wire25 = $signed((&(((reg18 ? wire12 : wire12) ?
                      (wire12 ~^ wire21) : (wire15 == wire12)) <<< wire9)));
  assign wire26 = wire23[(5'h13):(3'h7)];
endmodule

module module42
#(parameter param70 = (^~(8'ha5)), 
parameter param71 = param70)
(y, clk, wire47, wire46, wire45, wire44, wire43);
  output wire [(32'h112):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire47;
  input wire [(4'h8):(1'h0)] wire46;
  input wire [(5'h11):(1'h0)] wire45;
  input wire [(3'h4):(1'h0)] wire44;
  input wire signed [(4'ha):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire69;
  wire [(3'h5):(1'h0)] wire68;
  wire [(4'h9):(1'h0)] wire50;
  wire [(5'h14):(1'h0)] wire49;
  wire signed [(5'h12):(1'h0)] wire48;
  reg signed [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg66 = (1'h0);
  reg [(4'ha):(1'h0)] reg65 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg [(2'h2):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(4'hc):(1'h0)] reg57 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg53 = (1'h0);
  reg [(4'ha):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg51 = (1'h0);
  assign y = {wire69,
                 wire68,
                 wire50,
                 wire49,
                 wire48,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire48 = $unsigned($unsigned(wire47));
  assign wire49 = $unsigned($unsigned((8'hb2)));
  assign wire50 = wire47;
  always
    @(posedge clk) begin
      if ($unsigned(({(~&(wire47 - wire43))} >> (8'hb7))))
        begin
          if ((^$unsigned($unsigned(wire46[(3'h7):(3'h7)]))))
            begin
              reg51 <= {$unsigned((wire49 * $signed({wire43}))),
                  (wire46[(3'h4):(2'h2)] > (+$unsigned((wire43 ?
                      wire45 : wire43))))};
              reg52 <= {wire45};
              reg53 <= $signed((-wire46[(3'h4):(1'h1)]));
            end
          else
            begin
              reg51 <= reg52[(3'h7):(2'h2)];
            end
        end
      else
        begin
          reg51 <= $signed(wire47[(4'he):(3'h5)]);
        end
      if ($signed(((^~reg53) >= ((!(wire44 > reg52)) == ($unsigned(wire49) ?
          (|wire48) : (!reg52))))))
        begin
          if ($signed({($unsigned((~&reg52)) > wire44[(1'h1):(1'h1)])}))
            begin
              reg54 <= ($unsigned((($signed(reg51) ?
                      wire46 : ((8'hb7) | wire49)) ?
                  (wire49 ?
                      (reg51 < wire47) : {wire49}) : (|(wire47 < reg51)))) >>> (reg53 ?
                  ($unsigned(wire44[(3'h4):(2'h2)]) - $signed((reg52 != wire43))) : ((reg52 < wire48[(4'he):(4'h9)]) ^ ((wire44 > wire44) ?
                      wire45 : $unsigned(wire48)))));
              reg55 <= (((((reg53 ? wire46 : reg53) ?
                  (|reg53) : wire47[(2'h2):(2'h2)]) ^ wire50[(2'h2):(2'h2)]) + reg53[(3'h6):(3'h5)]) | {(!(^~wire46[(2'h2):(1'h0)])),
                  wire50});
              reg56 <= ($unsigned($unsigned(wire49[(3'h4):(2'h2)])) << (reg52[(3'h7):(2'h2)] ?
                  $unsigned((^~reg55)) : ({(^~wire46), $signed((8'hb7))} ?
                      $signed((&wire45)) : wire46[(3'h6):(3'h4)])));
              reg57 <= (({(-{wire50}), reg53} ?
                  (+$signed(wire44[(2'h2):(2'h2)])) : (8'hb3)) * wire49[(4'he):(4'hd)]);
              reg58 <= wire43[(2'h3):(2'h2)];
            end
          else
            begin
              reg54 <= ($unsigned(reg56) ?
                  (^~(reg52 ~^ reg58)) : wire45[(2'h3):(1'h1)]);
              reg55 <= (8'hbd);
            end
          reg59 <= $signed(reg51[(3'h5):(2'h3)]);
          reg60 <= $unsigned(wire48);
          if ($signed(wire48[(4'h9):(4'h9)]))
            begin
              reg61 <= ($unsigned((((|wire50) & (+reg58)) ?
                      $signed((wire45 >>> wire46)) : reg58)) ?
                  {reg53[(3'h4):(2'h3)],
                      reg55[(3'h5):(3'h4)]} : reg54[(4'hf):(4'h8)]);
            end
          else
            begin
              reg61 <= (($signed($unsigned($unsigned(reg60))) >>> {$signed($signed(reg57)),
                      ((^reg59) == (reg60 <= reg56))}) ?
                  wire47 : (((8'hb4) & $unsigned(reg60[(4'hd):(2'h2)])) ?
                      $unsigned(((wire48 >>> reg57) ?
                          reg55 : $signed(reg59))) : ((!(8'ha7)) * reg61)));
              reg62 <= $unsigned(($signed((~|reg57)) || (wire46[(3'h7):(3'h7)] * ((reg57 ?
                      wire45 : reg55) ?
                  (wire47 < wire44) : ((8'hb5) <<< wire48)))));
              reg63 <= wire50[(3'h7):(3'h4)];
            end
          if ($signed((($unsigned({(8'ha4), reg63}) ?
              $signed((reg60 > reg57)) : (-((8'hb3) ?
                  reg52 : wire43))) >= ($signed((wire48 | wire45)) | $signed($signed((8'haf)))))))
            begin
              reg64 <= $unsigned((|reg51[(4'ha):(4'ha)]));
            end
          else
            begin
              reg64 <= reg58;
              reg65 <= (^(reg53 ?
                  (((reg64 ?
                      wire47 : wire48) ~^ $unsigned(wire44)) * (~&$signed(reg58))) : ($unsigned($unsigned(reg51)) ?
                      wire44[(1'h0):(1'h0)] : $signed((reg63 ?
                          reg51 : (8'hbf))))));
            end
        end
      else
        begin
          reg54 <= (($unsigned($unsigned((wire47 - reg51))) ?
                  (!reg62[(3'h4):(1'h0)]) : ({reg60, (~^reg61)} ?
                      (8'hba) : {$signed(reg58)})) ?
              (8'had) : (reg59 & $unsigned($unsigned((-reg52)))));
          reg55 <= {(^~$signed({{wire43, wire50}, (reg65 ? (8'hbc) : reg52)}))};
          reg56 <= $signed({(((8'hb8) <<< (~^reg57)) & (~&$signed(wire44))),
              $unsigned((&$unsigned(reg57)))});
        end
      if ((&(($signed({wire45}) == $signed($unsigned(reg59))) ?
          reg51 : (reg58 - reg58[(1'h0):(1'h0)]))))
        begin
          reg66 <= (reg60 ^ wire45[(2'h3):(2'h2)]);
        end
      else
        begin
          reg66 <= $signed($unsigned($signed((~(+reg62)))));
          reg67 <= (reg54 ?
              $unsigned((($signed(reg65) + (~reg53)) ?
                  wire49 : (~^wire44))) : $unsigned(($signed(((8'h9f) ?
                  wire48 : wire50)) ~^ (reg63[(4'he):(4'h8)] ?
                  reg57 : $unsigned(wire48)))));
        end
    end
  assign wire68 = {$unsigned(({(~(8'hb6))} ?
                          (^~$signed(reg57)) : (|reg59[(1'h1):(1'h0)]))),
                      reg53};
  assign wire69 = (wire47 ?
                      {(reg52[(1'h1):(1'h1)] ?
                              $unsigned((reg51 ?
                                  wire68 : (8'hbe))) : ($unsigned((8'ha0)) + wire46)),
                          $unsigned({$signed(reg53),
                              wire45})} : (~^(-(!$unsigned(reg51)))));
endmodule
