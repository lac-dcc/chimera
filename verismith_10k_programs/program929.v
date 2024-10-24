module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire3;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire [(4'hc):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire0;
  wire signed [(5'h10):(1'h0)] wire77;
  wire signed [(5'h15):(1'h0)] wire75;
  wire signed [(5'h15):(1'h0)] wire74;
  wire [(4'hd):(1'h0)] wire73;
  wire [(5'h14):(1'h0)] wire72;
  wire signed [(4'h9):(1'h0)] wire70;
  wire signed [(3'h7):(1'h0)] wire6;
  wire signed [(4'ha):(1'h0)] wire5;
  wire signed [(5'h15):(1'h0)] wire4;
  reg [(3'h4):(1'h0)] reg76 = (1'h0);
  assign y = {wire77,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire70,
                 wire6,
                 wire5,
                 wire4,
                 reg76,
                 (1'h0)};
  assign wire4 = (~wire1[(3'h7):(2'h2)]);
  assign wire5 = (~^(!{(&wire2[(1'h0):(1'h0)])}));
  assign wire6 = ((wire2[(1'h0):(1'h0)] < $signed((~(wire0 ?
                     wire1 : wire2)))) * $unsigned(wire4[(3'h5):(2'h2)]));
  module7 #() modinst71 (.wire10(wire5), .clk(clk), .y(wire70), .wire9(wire3), .wire8(wire2), .wire11(wire4));
  assign wire72 = wire3[(1'h1):(1'h1)];
  assign wire73 = $unsigned(((((wire1 ? wire4 : wire0) ?
                          (-wire5) : $unsigned(wire70)) ?
                      $unsigned((wire3 + wire72)) : $signed(wire72)) | (~^wire1[(1'h1):(1'h1)])));
  assign wire74 = (((($signed(wire1) == {(8'ha3), wire6}) ?
                      $signed($unsigned(wire3)) : (8'hbb)) > ({$unsigned(wire4)} ?
                      ((-wire4) ^ wire70) : wire1[(3'h5):(1'h0)])) >= ($signed(wire3) ?
                      (~(8'haf)) : ({(wire73 ? wire72 : wire70),
                          (-wire70)} && ($signed(wire2) > (-wire3)))));
  assign wire75 = wire6;
  always
    @(posedge clk) begin
      reg76 <= ((8'ha9) ?
          ($unsigned(wire73) ?
              wire70 : ((wire1 != $signed(wire75)) ?
                  wire1 : wire4)) : $unsigned(wire0[(5'h10):(4'hb)]));
    end
  assign wire77 = (wire5[(3'h6):(3'h5)] ^ $signed(wire74));
endmodule

module module7
#(parameter param69 = {(8'hb0), {((((8'ha1) ^~ (8'haa)) <= ((8'ha2) > (8'ha8))) ? (((8'hb3) && (8'ha7)) + (~&(8'hb3))) : {(^~(8'haa))})}})
(y, clk, wire8, wire9, wire10, wire11);
  output wire [(32'h93):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(4'hf):(1'h0)] wire9;
  input wire signed [(3'h5):(1'h0)] wire10;
  input wire signed [(5'h15):(1'h0)] wire11;
  wire [(5'h10):(1'h0)] wire68;
  wire [(4'he):(1'h0)] wire67;
  wire [(5'h13):(1'h0)] wire65;
  wire signed [(5'h14):(1'h0)] wire12;
  wire signed [(5'h15):(1'h0)] wire13;
  wire signed [(3'h5):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(4'hd):(1'h0)] wire16;
  wire [(4'hd):(1'h0)] wire63;
  reg signed [(4'hd):(1'h0)] reg66 = (1'h0);
  assign y = {wire68,
                 wire67,
                 wire65,
                 wire12,
                 wire13,
                 wire14,
                 wire15,
                 wire16,
                 wire63,
                 reg66,
                 (1'h0)};
  assign wire12 = (-{$unsigned(($signed(wire10) ?
                          (wire11 >> (8'ha6)) : $signed(wire8)))});
  assign wire13 = (((wire12[(5'h14):(5'h12)] != wire8) ^~ (((wire12 ?
                          wire10 : wire11) ?
                      (~&wire9) : $signed(wire10)) + ($unsigned(wire9) * (8'ha6)))) + (+(~|(wire9[(2'h2):(1'h1)] >= {wire11,
                      wire8}))));
  assign wire14 = wire8[(4'hb):(4'hb)];
  assign wire15 = ((~^(~^$unsigned(wire11[(1'h1):(1'h1)]))) ^~ (!wire10[(1'h1):(1'h1)]));
  assign wire16 = $signed($unsigned(wire8));
  module17 #() modinst64 (wire63, clk, wire13, wire11, wire12, wire16, wire9);
  assign wire65 = (|(8'hbf));
  always
    @(posedge clk) begin
      reg66 <= wire13[(2'h3):(1'h1)];
    end
  assign wire67 = (^~(reg66 ?
                      ({wire14, (reg66 ? wire11 : wire65)} ?
                          wire13 : (^(!wire14))) : wire15));
  assign wire68 = wire13[(5'h14):(2'h2)];
endmodule

module module17
#(parameter param61 = {((({(8'hb7)} << (8'hb0)) ? ((~|(8'haa)) ? {(8'h9e), (8'ha9)} : ((8'ha5) ? (8'hbd) : (8'hbc))) : {(^(8'hba)), (~|(7'h40))}) ? {(~((8'h9e) >>> (8'ha0))), (!{(8'hbf), (8'hb8)})} : ((~{(8'haf)}) + (((8'haf) * (8'ha5)) * ((8'hb3) ^ (8'h9c))))), (((~|(8'ha1)) + (-((8'hac) ? (8'h9c) : (8'hb8)))) > ((-((8'hae) ? (8'h9c) : (8'hba))) ? (((7'h40) ? (8'ha8) : (8'hb1)) & {(8'hac), (8'hac)}) : (8'ha6)))}, 
parameter param62 = ({(((!param61) ? param61 : (-param61)) ? ((param61 ? param61 : param61) ? {param61, (8'hbc)} : (param61 ^ param61)) : ((param61 ? param61 : param61) ? {param61, param61} : (param61 ? (8'hbb) : (7'h43)))), {param61, (~|param61)}} & param61))
(y, clk, wire22, wire21, wire20, wire19, wire18);
  output wire [(32'h1a3):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire22;
  input wire [(5'h15):(1'h0)] wire21;
  input wire signed [(4'hf):(1'h0)] wire20;
  input wire [(4'hc):(1'h0)] wire19;
  input wire signed [(2'h3):(1'h0)] wire18;
  wire [(3'h7):(1'h0)] wire60;
  wire signed [(3'h4):(1'h0)] wire59;
  wire [(4'h8):(1'h0)] wire55;
  wire signed [(4'h8):(1'h0)] wire54;
  wire signed [(3'h4):(1'h0)] wire53;
  wire [(2'h2):(1'h0)] wire52;
  wire signed [(2'h3):(1'h0)] wire51;
  wire signed [(4'hb):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire49;
  wire signed [(5'h15):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(4'hd):(1'h0)] wire46;
  wire [(5'h15):(1'h0)] wire45;
  wire [(3'h4):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(5'h10):(1'h0)] wire42;
  wire [(5'h11):(1'h0)] wire41;
  wire signed [(4'hc):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(2'h2):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  reg signed [(3'h4):(1'h0)] reg58 = (1'h0);
  reg [(2'h2):(1'h0)] reg57 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg38 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg37 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg36 = (1'h0);
  reg [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'he):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg [(2'h2):(1'h0)] reg27 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg58,
                 reg57,
                 reg56,
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
                 (1'h0)};
  assign wire23 = (($unsigned(wire21) == $unsigned((^(wire22 ?
                          wire19 : (8'ha0))))) ?
                      wire21[(4'he):(3'h5)] : wire21);
  assign wire24 = ($unsigned($signed(((wire18 ?
                          wire22 : wire19) - $signed(wire21)))) ?
                      $signed((|$signed((wire18 != (8'hb2))))) : ({($unsigned(wire22) * wire23)} ?
                          wire21[(4'he):(3'h5)] : ($unsigned(wire23[(3'h7):(3'h7)]) ?
                              (8'hb6) : (wire19[(3'h5):(1'h1)] ?
                                  (|wire20) : $signed(wire18)))));
  assign wire25 = (^~($unsigned(wire23) >>> (wire24 >> wire24[(2'h2):(2'h2)])));
  assign wire26 = (($signed(wire19[(3'h7):(2'h3)]) != wire22[(3'h7):(3'h6)]) && {$signed(wire19[(1'h0):(1'h0)]),
                      {(^~(wire23 ? (8'hbb) : wire25)),
                          ((wire21 >= wire25) ?
                              (wire19 ? wire18 : (8'h9f)) : {wire19})}});
  always
    @(posedge clk) begin
      if ($signed($signed(wire21[(2'h3):(2'h2)])))
        begin
          reg27 <= wire23[(1'h1):(1'h0)];
          reg28 <= {(^~wire25[(2'h3):(2'h2)])};
        end
      else
        begin
          if ({{$unsigned($signed((~&wire24))),
                  ((~^$unsigned((8'hb4))) ?
                      $unsigned({reg28}) : wire24[(1'h1):(1'h1)])}})
            begin
              reg27 <= ($signed(wire25[(1'h1):(1'h1)]) ?
                  ((^~($unsigned((8'hb9)) ?
                      (&reg28) : ((8'hbf) == wire22))) <<< (8'ha4)) : (|wire24[(2'h2):(1'h0)]));
              reg28 <= ($unsigned(reg28[(5'h14):(1'h1)]) - $unsigned((wire20 > {(wire19 || reg27),
                  (8'ha8)})));
              reg29 <= ($signed($unsigned({{wire21}, wire25[(2'h3):(1'h1)]})) ?
                  wire20 : (^(((reg27 && wire19) | $signed(wire23)) ?
                      $signed((wire26 ? wire26 : wire22)) : ((wire20 ?
                              wire18 : (8'hbf)) ?
                          {wire25, wire22} : (wire20 > wire26)))));
            end
          else
            begin
              reg27 <= $signed((!$signed(reg28[(5'h13):(3'h6)])));
              reg28 <= wire19[(2'h3):(1'h1)];
              reg29 <= ((((~|(~&wire23)) ^~ ({reg27} < (wire23 + reg28))) ?
                  $unsigned((~(wire26 ?
                      reg27 : wire23))) : $unsigned({$unsigned(wire26),
                      (~&wire19)})) || ($unsigned(($signed(wire22) ?
                  (|(8'hb5)) : $unsigned(wire22))) <= wire26[(2'h2):(1'h1)]));
              reg30 <= $signed({(wire26 ~^ $unsigned(wire24)), $signed(reg27)});
              reg31 <= ((!$unsigned((reg30 ?
                  (wire26 ? wire24 : wire24) : (reg28 ?
                      wire19 : wire20)))) == $signed(($signed($unsigned(wire21)) ^~ {{wire26}})));
            end
          reg32 <= ((reg29[(4'hd):(1'h0)] ?
                  (((^(8'hbe)) ?
                      wire21[(4'hf):(4'hf)] : $unsigned(wire20)) ^ $unsigned($signed(wire24))) : (&{$signed(wire26),
                      (reg29 ? reg30 : reg30)})) ?
              {$unsigned(wire23[(3'h7):(3'h6)]),
                  (((wire21 ? reg28 : reg28) ?
                          $signed(reg31) : ((8'ha0) ? reg30 : wire22)) ?
                      {wire21,
                          $signed(wire26)} : $signed((8'hab)))} : $signed(reg27));
        end
      if ((~^((wire24 << ($unsigned(reg30) ?
          reg30[(3'h5):(1'h1)] : (reg27 | wire23))) << wire18)))
        begin
          if (wire23)
            begin
              reg33 <= (reg30 ~^ ($signed($signed((reg32 ? (8'h9e) : wire26))) ?
                  (|wire20[(3'h5):(2'h2)]) : $unsigned((-(7'h43)))));
              reg34 <= wire24[(1'h1):(1'h0)];
              reg35 <= (($signed(reg34) ?
                      wire19[(4'hb):(4'ha)] : ($signed((reg28 <= reg31)) ~^ ($signed(wire19) ?
                          wire18[(1'h0):(1'h0)] : (wire23 == reg34)))) ?
                  (|$signed($signed(wire19))) : $signed($unsigned(($signed(wire23) << $unsigned(wire22)))));
              reg36 <= $signed($signed((((wire23 ? reg28 : reg29) ?
                      $signed(reg28) : $signed((8'hbd))) ?
                  $signed(wire22) : ($signed(wire26) != (~wire19)))));
              reg37 <= (+$signed((&(8'ha8))));
            end
          else
            begin
              reg33 <= (|(((^~reg27[(1'h0):(1'h0)]) ?
                      $signed((~^wire19)) : $signed($unsigned(wire26))) ?
                  ((reg28[(5'h11):(1'h0)] ^~ (~|wire19)) ?
                      $signed((+(8'ha1))) : $unsigned(wire24[(1'h0):(1'h0)])) : wire24[(2'h2):(1'h0)]));
              reg34 <= wire18;
              reg35 <= ((wire26[(4'hc):(4'h8)] > (~^{reg31,
                  (wire19 ?
                      wire21 : wire21)})) + $unsigned($signed(($unsigned(wire26) ?
                  wire25 : {wire26}))));
              reg36 <= ((reg31[(1'h1):(1'h0)] ?
                      {$signed({reg31}), reg33[(1'h0):(1'h0)]} : (reg34 ?
                          (reg34[(3'h7):(2'h2)] ?
                              ((8'hb6) && (8'hbc)) : reg27) : (^~$unsigned(reg31)))) ?
                  (wire25[(1'h0):(1'h0)] ?
                      ((!$signed(reg31)) ?
                          (reg30[(3'h4):(3'h4)] ?
                              reg27 : (wire26 ?
                                  wire26 : reg27)) : ($signed((8'hab)) && (reg33 ?
                              wire19 : wire26))) : reg31) : (~&$signed(((reg29 != wire21) & (wire20 >>> (7'h43))))));
              reg37 <= ((~|wire19) && (^({{reg27},
                  reg29} >= reg30[(3'h4):(3'h4)])));
            end
          reg38 <= $unsigned(reg28[(4'h8):(3'h5)]);
          reg39 <= $unsigned(reg30[(1'h0):(1'h0)]);
        end
      else
        begin
          reg33 <= (~reg35[(4'hc):(3'h7)]);
          reg34 <= ($unsigned(wire22[(4'hc):(3'h6)]) * ($signed({(~|(8'ha0))}) ^~ (^($signed(reg38) ?
              wire26 : (!wire19)))));
          reg35 <= ($signed((+wire20[(4'hb):(4'ha)])) != $unsigned($signed((|$unsigned((8'ha8))))));
          reg36 <= ((&$unsigned((|$signed(wire18)))) ^~ ((8'ha2) << $unsigned(($signed(reg29) ?
              (^~reg28) : $signed(wire18)))));
          if ($signed($unsigned(wire25[(3'h5):(1'h1)])))
            begin
              reg37 <= reg39;
              reg38 <= $signed($signed($unsigned((~(^~reg36)))));
              reg39 <= (^$unsigned((~($unsigned(reg27) >= (!wire20)))));
            end
          else
            begin
              reg37 <= {(+(|({(8'hb0)} <= $signed(reg34)))),
                  ($signed(wire26[(3'h4):(2'h3)]) ?
                      $unsigned({$signed(reg27), wire20}) : {(|(+reg27)),
                          $unsigned((!reg27))})};
              reg38 <= wire21[(1'h0):(1'h0)];
              reg39 <= $unsigned({$signed(wire25[(4'hd):(4'h8)])});
              reg40 <= (8'h9d);
            end
        end
    end
  assign wire41 = (!reg33[(1'h1):(1'h1)]);
  assign wire42 = (($signed((~$signed(reg27))) >= (8'hb6)) + reg36);
  assign wire43 = wire26;
  assign wire44 = (wire20 ?
                      $unsigned({reg39}) : (({(~wire43),
                          wire20} && $unsigned({reg28,
                          wire43})) < $signed(((~^reg27) == wire26))));
  assign wire45 = reg28;
  assign wire46 = (7'h44);
  assign wire47 = $unsigned(((-$unsigned(reg40[(4'h9):(3'h6)])) ?
                      ($signed(((8'ha4) ? reg37 : reg30)) - {((7'h44) > wire43),
                          (!reg32)}) : (~|(&reg40))));
  assign wire48 = ((~^reg33) ~^ $unsigned(reg32[(1'h0):(1'h0)]));
  assign wire49 = (~|(({(reg33 < wire42)} & wire25[(2'h2):(2'h2)]) > wire25));
  assign wire50 = {wire24[(1'h1):(1'h1)],
                      {$unsigned($unsigned((reg27 ? (7'h41) : wire43))),
                          (~(wire22[(4'hb):(4'hb)] ?
                              (-reg36) : $unsigned((8'hbb))))}};
  assign wire51 = $unsigned($signed($unsigned($signed(reg37[(3'h6):(3'h5)]))));
  assign wire52 = reg28[(4'hc):(4'hb)];
  assign wire53 = $unsigned(($signed((reg38[(1'h1):(1'h1)] ^~ $signed(reg39))) & $signed($signed($unsigned(wire48)))));
  assign wire54 = $signed(({{{wire23, (8'hbd)}}} < (~|reg31[(3'h6):(2'h3)])));
  assign wire55 = (~&wire48);
  always
    @(posedge clk) begin
      reg56 <= $signed((~|$signed({reg29[(4'hb):(1'h1)], (^~reg32)})));
      reg57 <= wire51;
      reg58 <= {reg32[(4'ha):(2'h2)]};
    end
  assign wire59 = ((({(wire51 ? wire23 : wire49),
                          wire50[(3'h7):(2'h2)]} == $signed(((8'hb1) ?
                          (8'ha8) : (8'hbb)))) <= (!$signed($signed(wire23)))) ?
                      ((((-reg31) ?
                              (reg34 ? wire48 : wire41) : (wire21 ?
                                  wire43 : wire21)) ~^ $signed((reg38 ?
                              wire47 : wire43))) ?
                          (^~reg30) : (((&wire49) << $unsigned(wire47)) ?
                              (reg37[(3'h6):(2'h2)] | (reg30 || (8'h9f))) : (reg57 ?
                                  (7'h42) : ((8'haf) ?
                                      wire51 : wire54)))) : (+(&(~(8'haf)))));
  assign wire60 = $unsigned(wire47[(4'h8):(1'h1)]);
endmodule
