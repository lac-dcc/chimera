module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h1f2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire0;
  input wire [(3'h5):(1'h0)] wire1;
  input wire signed [(5'h11):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(3'h7):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire93;
  wire signed [(4'he):(1'h0)] wire92;
  wire signed [(3'h7):(1'h0)] wire91;
  wire [(4'h9):(1'h0)] wire90;
  wire signed [(4'ha):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire signed [(4'hd):(1'h0)] wire78;
  wire [(3'h7):(1'h0)] wire77;
  wire [(5'h14):(1'h0)] wire57;
  wire [(5'h15):(1'h0)] wire5;
  wire [(5'h12):(1'h0)] wire6;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(5'h13):(1'h0)] wire55;
  reg signed [(5'h11):(1'h0)] reg89 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(3'h7):(1'h0)] reg87 = (1'h0);
  reg [(4'hb):(1'h0)] reg86 = (1'h0);
  reg [(4'hc):(1'h0)] reg85 = (1'h0);
  reg [(5'h13):(1'h0)] reg84 = (1'h0);
  reg [(3'h6):(1'h0)] reg83 = (1'h0);
  reg signed [(4'he):(1'h0)] reg82 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg81 = (1'h0);
  reg [(5'h15):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg73 = (1'h0);
  reg [(3'h4):(1'h0)] reg72 = (1'h0);
  reg [(2'h2):(1'h0)] reg71 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg70 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg67 = (1'h0);
  reg [(5'h14):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg65 = (1'h0);
  reg [(4'hc):(1'h0)] reg64 = (1'h0);
  reg [(5'h11):(1'h0)] reg63 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg62 = (1'h0);
  reg [(4'hb):(1'h0)] reg61 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg60 = (1'h0);
  reg signed [(4'he):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire57,
                 wire5,
                 wire6,
                 wire7,
                 wire55,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg72,
                 reg71,
                 reg70,
                 reg69,
                 reg68,
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
                 (1'h0)};
  assign wire5 = ((wire4 ?
                         $signed(((wire4 && (8'hae)) >= $unsigned(wire3))) : {wire2[(3'h4):(2'h3)]}) ?
                     wire0 : ((|({wire2, wire2} <= (wire4 ? wire0 : wire0))) ?
                         wire2 : (~&($unsigned((8'ha0)) ^~ ((8'hb9) ?
                             wire3 : wire1)))));
  assign wire6 = (|($unsigned((+wire1[(3'h4):(2'h2)])) && (((+(8'hb3)) - (|wire3)) ?
                     ($signed(wire5) != $unsigned(wire1)) : wire0)));
  assign wire7 = {{(wire2[(1'h0):(1'h0)] ?
                             wire1[(2'h3):(1'h1)] : {wire6[(4'hd):(4'hc)]})}};
  module8 #() modinst56 (wire55, clk, wire2, wire3, wire7, wire4, wire5);
  assign wire57 = $unsigned(wire1);
  always
    @(posedge clk) begin
      reg58 <= (wire0 << ((($unsigned(wire6) <= $signed(wire1)) != wire5[(4'hf):(4'hd)]) ?
          ($unsigned((wire2 || wire7)) + {$signed(wire7)}) : (~&$unsigned((7'h42)))));
      if ((!$signed($unsigned(($unsigned((8'ha1)) | {wire7})))))
        begin
          reg59 <= $signed(wire57);
          reg60 <= $signed(wire4);
          reg61 <= wire6;
          if (wire6[(3'h4):(2'h2)])
            begin
              reg62 <= (-(((~&wire0) ~^ (7'h44)) != $unsigned((&wire7))));
            end
          else
            begin
              reg62 <= $unsigned(($signed(wire0) ^~ reg62));
              reg63 <= (!wire4[(2'h3):(2'h3)]);
              reg64 <= ({wire1[(1'h0):(1'h0)], reg58} ?
                  (^($signed((&wire4)) ?
                      {(reg59 ? (8'hbb) : (8'ha1))} : (+{wire1,
                          reg61}))) : wire7);
              reg65 <= (((((wire4 ?
                      wire3 : wire1) && $unsigned((8'hb7))) >= (wire3[(4'h8):(3'h5)] ?
                      (wire57 || wire3) : {reg62})) ?
                  (reg61[(4'h8):(3'h4)] ?
                      (^~reg60) : wire5) : $unsigned($unsigned($signed(reg59)))) ^ reg59);
            end
          if (wire57)
            begin
              reg66 <= {$unsigned(wire2)};
            end
          else
            begin
              reg66 <= (^~$signed($unsigned((~&$signed(reg64)))));
              reg67 <= (!(^(reg65 || wire55)));
              reg68 <= $unsigned($unsigned(($signed($unsigned(reg59)) + ($unsigned(wire7) ?
                  {wire0} : wire5[(5'h11):(2'h2)]))));
              reg69 <= (&((wire5 ? $unsigned($unsigned(reg64)) : wire1) ?
                  (|$signed({(8'ha8)})) : $unsigned(wire6)));
            end
        end
      else
        begin
          reg59 <= (($signed(wire57) != $unsigned(wire6[(3'h4):(1'h0)])) ?
              reg61[(4'h9):(4'h8)] : ($signed((&{wire5,
                  (8'ha6)})) || (reg59[(3'h4):(2'h2)] ?
                  reg67[(1'h1):(1'h0)] : $signed($signed(reg67)))));
        end
      if ((((reg68[(4'hf):(4'he)] ?
              $unsigned($signed(wire0)) : wire6) && (((&reg69) ?
              reg65 : (wire55 ? wire4 : (7'h41))) ~^ ((wire0 >> reg65) ?
              (-reg58) : $signed(reg66)))) ?
          ((reg63[(2'h3):(1'h0)] + wire6) >= ((wire0[(3'h6):(1'h0)] <<< (~&wire6)) ^~ (~&wire1[(3'h4):(1'h0)]))) : $signed(reg64)))
        begin
          reg70 <= $unsigned(reg63[(5'h10):(4'ha)]);
          reg71 <= $signed($signed(wire1));
          if ((8'hb4))
            begin
              reg72 <= (7'h41);
              reg73 <= ((reg66 ? $unsigned(reg59) : reg58[(3'h5):(3'h4)]) ?
                  $signed((8'ha6)) : reg60);
              reg74 <= $signed($signed(wire55));
              reg75 <= wire5;
            end
          else
            begin
              reg72 <= ((($unsigned($signed(reg65)) ?
                  wire7 : {(wire57 ? reg71 : reg75),
                      $unsigned(reg71)}) < ($signed($unsigned(wire55)) == reg73[(3'h4):(1'h0)])) & wire4);
              reg73 <= (|{{$signed({reg69})},
                  (($signed((8'hbf)) ? wire0 : (^~(8'hb0))) ?
                      (-reg71[(2'h2):(1'h0)]) : (~^{wire4}))});
            end
        end
      else
        begin
          reg70 <= $signed(wire2[(4'hd):(3'h4)]);
          reg71 <= wire4;
        end
      reg76 <= ((-reg67[(2'h3):(1'h1)]) & reg72[(1'h1):(1'h1)]);
    end
  assign wire77 = {reg58[(3'h7):(2'h3)]};
  assign wire78 = $unsigned(wire3[(3'h5):(3'h5)]);
  assign wire79 = wire55;
  assign wire80 = ($unsigned($signed((((8'ha8) ?
                          reg64 : reg75) >= (wire79 << reg59)))) ?
                      ((~|($signed(wire79) < $unsigned(reg61))) & wire78[(4'hd):(3'h5)]) : (reg62[(2'h2):(2'h2)] ?
                          (($signed(wire2) ? (8'ha2) : $signed(wire55)) ?
                              reg58[(4'ha):(4'h8)] : (~|reg62[(2'h3):(1'h1)])) : (8'haf)));
  always
    @(posedge clk) begin
      reg81 <= $signed(reg71);
      reg82 <= {$signed(wire7[(5'h14):(5'h10)])};
      if ($unsigned((7'h40)))
        begin
          reg83 <= (reg75 << wire78);
          if (reg67)
            begin
              reg84 <= wire2[(4'hb):(1'h0)];
              reg85 <= (~&(reg68 >= $signed(((wire79 - wire0) ?
                  $signed(reg58) : wire77[(1'h1):(1'h1)]))));
              reg86 <= (|wire55[(3'h6):(3'h6)]);
              reg87 <= (reg85 <<< (~&$signed(reg84[(3'h7):(2'h2)])));
            end
          else
            begin
              reg84 <= (-(reg75[(2'h3):(1'h1)] <<< (reg74 ?
                  $unsigned((reg66 ?
                      wire0 : reg71)) : ($signed(reg84) <= (wire4 + wire0)))));
              reg85 <= (reg59 ? wire2 : $unsigned(reg67[(2'h2):(1'h1)]));
            end
        end
      else
        begin
          reg83 <= (|($signed($signed($signed(reg72))) ?
              (reg65 ?
                  {((8'h9f) >> reg69),
                      $unsigned(reg60)} : reg69[(2'h2):(2'h2)]) : $unsigned(((wire0 ?
                  reg72 : reg75) + (~|wire79)))));
          if (wire79)
            begin
              reg84 <= (((reg69 ?
                  (-reg59) : reg68[(5'h12):(4'hd)]) ^ wire78[(4'hd):(4'h8)]) != $signed((|wire0[(2'h2):(1'h1)])));
              reg85 <= $signed((({{(8'hb4),
                          (7'h41)}} ^ $signed(reg64[(3'h5):(1'h1)])) ?
                  $signed($signed($unsigned((8'hb1)))) : reg58[(4'hc):(3'h7)]));
            end
          else
            begin
              reg84 <= ((!$signed($unsigned($unsigned((7'h44))))) >> $unsigned($signed(wire80)));
              reg85 <= reg75[(4'h9):(1'h0)];
              reg86 <= ((8'hae) >>> reg68);
            end
        end
      reg88 <= reg62[(3'h5):(2'h3)];
      reg89 <= (((reg88[(4'hc):(4'hb)] ~^ $signed($unsigned(wire77))) <= ($unsigned(((7'h42) <<< wire55)) ?
              (reg66[(3'h4):(2'h3)] || $signed((8'ha7))) : (wire4 >> (wire3 ?
                  (8'ha8) : wire4)))) ?
          reg70 : (~^(reg72[(1'h0):(1'h0)] ?
              reg83[(1'h1):(1'h1)] : (reg65[(4'h8):(3'h7)] <<< $signed(reg71)))));
    end
  assign wire90 = wire0[(3'h7):(3'h7)];
  assign wire91 = ($signed({reg72[(2'h3):(2'h2)],
                      {$signed(reg68),
                          $signed(reg61)}}) - $signed($unsigned($unsigned(reg87))));
  assign wire92 = (+(($unsigned($unsigned(reg84)) ?
                      wire7 : $signed((wire91 ?
                          reg62 : (8'ha6)))) + $signed($unsigned((^wire2)))));
  assign wire93 = $unsigned(reg88[(1'h0):(1'h0)]);
endmodule

module module8  (y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'h32):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire13;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire [(5'h15):(1'h0)] wire11;
  input wire signed [(3'h7):(1'h0)] wire10;
  input wire [(4'hf):(1'h0)] wire9;
  wire signed [(4'h9):(1'h0)] wire53;
  wire signed [(2'h3):(1'h0)] wire16;
  wire [(5'h14):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire14;
  assign y = {wire53, wire16, wire15, wire14, (1'h0)};
  assign wire14 = wire11[(1'h1):(1'h0)];
  assign wire15 = wire10[(3'h7):(1'h0)];
  assign wire16 = wire14;
  module17 #() modinst54 (.wire20(wire12), .clk(clk), .wire21(wire9), .wire18(wire14), .wire19(wire11), .y(wire53));
endmodule

module module17
#(parameter param51 = {({((|(7'h43)) ? {(8'hb5), (8'hb4)} : (|(8'hac)))} * (~|((&(8'ha3)) + ((8'ha9) != (8'hb2))))), ((~|(^~((8'ha1) ? (8'hab) : (8'hbf)))) >= {(-(!(7'h43)))})}, 
parameter param52 = (param51 ? param51 : {(~^(8'had))}))
(y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h145):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire21;
  input wire [(3'h7):(1'h0)] wire20;
  input wire signed [(5'h11):(1'h0)] wire19;
  input wire [(3'h7):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire50;
  wire [(5'h11):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire [(3'h7):(1'h0)] wire47;
  wire signed [(4'h8):(1'h0)] wire46;
  wire [(5'h10):(1'h0)] wire45;
  wire [(4'hc):(1'h0)] wire44;
  wire [(4'hd):(1'h0)] wire22;
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg42 = (1'h0);
  reg [(3'h6):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg40 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg39 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg37 = (1'h0);
  reg [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg34 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg33 = (1'h0);
  reg [(4'hf):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg30 = (1'h0);
  reg [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg25 = (1'h0);
  reg [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  assign y = {wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire22,
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
                 reg25,
                 reg24,
                 reg23,
                 (1'h0)};
  assign wire22 = (8'hb3);
  always
    @(posedge clk) begin
      if ((-wire22[(4'h8):(1'h1)]))
        begin
          if ((((8'hae) * (^{$unsigned(wire22), wire21[(4'hb):(1'h0)]})) ?
              wire19 : $signed((+$signed(((8'hb9) < wire22))))))
            begin
              reg23 <= wire22[(2'h2):(2'h2)];
              reg24 <= (+$signed(((!(~&wire22)) + ({wire21} ?
                  $unsigned(wire20) : wire22[(1'h1):(1'h0)]))));
              reg25 <= $signed(wire19[(4'hc):(3'h4)]);
              reg26 <= {($unsigned(((8'hb8) ?
                          $signed(wire22) : wire22[(1'h0):(1'h0)])) ?
                      $unsigned($unsigned($unsigned((8'haa)))) : {({wire18} ?
                              $unsigned(wire22) : (wire19 <<< wire21))}),
                  ($unsigned((7'h42)) ?
                      $unsigned(wire22) : ({{wire18}, (-wire22)} ?
                          $unsigned((8'hb6)) : ($unsigned((8'ha5)) >>> $unsigned(reg25))))};
              reg27 <= ({wire20[(3'h6):(1'h1)]} ^~ ((^$unsigned(reg26)) | (reg25 ?
                  ($signed(wire20) < $unsigned(reg25)) : {wire19[(3'h5):(3'h5)],
                      reg26})));
            end
          else
            begin
              reg23 <= $unsigned(($unsigned({$signed(wire21),
                      {wire19, (7'h43)}}) ?
                  $signed($unsigned($signed(wire21))) : ($unsigned((~|wire22)) << wire20)));
              reg24 <= $unsigned(({$unsigned($unsigned(reg27)),
                      (+$unsigned(wire18))} ?
                  (-wire20) : ($signed($unsigned(wire20)) ?
                      $unsigned($signed((8'haf))) : $unsigned($signed(wire20)))));
            end
          reg28 <= $unsigned((wire18 ?
              wire18[(3'h7):(3'h4)] : ($unsigned((8'ha8)) ?
                  $unsigned(reg26) : ({reg24} >>> (reg26 ? wire21 : reg26)))));
          reg29 <= ((|(^~((~wire22) >> (reg26 ? wire18 : wire20)))) ?
              reg28 : $unsigned(({{(8'hb5)},
                  wire19[(5'h10):(4'h9)]} >> reg28[(3'h5):(1'h0)])));
        end
      else
        begin
          reg23 <= $unsigned({$signed((((8'hbe) ^ reg25) ?
                  $unsigned(reg27) : ((8'hbc) ? reg27 : reg29)))});
          if (wire20)
            begin
              reg24 <= ($signed({reg28}) ?
                  reg23[(3'h4):(2'h2)] : reg24[(2'h3):(2'h3)]);
              reg25 <= $unsigned((wire22 ?
                  ($unsigned((~|wire19)) ^~ ((+wire20) ?
                      (wire18 + (8'ha2)) : $unsigned(reg23))) : reg27[(3'h5):(2'h2)]));
              reg26 <= (&(8'hb6));
            end
          else
            begin
              reg24 <= (!($unsigned(($unsigned(wire20) ?
                  (^wire19) : wire20)) >= reg26));
              reg25 <= reg27;
              reg26 <= ((8'hb0) != (-(wire18[(3'h4):(3'h4)] > {wire18[(3'h6):(1'h0)],
                  $signed(wire18)})));
              reg27 <= (wire19 != ((wire20[(2'h2):(1'h0)] > (|reg24)) ?
                  reg24 : (-(^~$unsigned(reg26)))));
            end
        end
      if (reg24[(3'h4):(1'h1)])
        begin
          reg30 <= $unsigned($unsigned({wire20[(3'h6):(3'h4)],
              ($unsigned(reg28) ?
                  wire19[(1'h0):(1'h0)] : reg28[(3'h4):(2'h3)])}));
          reg31 <= (reg30 ?
              ((~^((reg24 ? wire19 : reg24) ?
                  $unsigned(reg30) : reg24[(3'h7):(3'h4)])) | (((8'ha2) > (wire21 && wire20)) > ({reg24} - reg23))) : ({reg27[(1'h1):(1'h0)],
                      ({reg24} ? $signed(wire20) : (reg27 > (8'ha9)))} ?
                  wire18[(3'h6):(1'h0)] : (((8'hb4) ?
                          $unsigned((8'ha9)) : (!(8'hb0))) ?
                      ($signed((7'h44)) ?
                          wire21 : (reg30 <<< wire19)) : wire18[(3'h5):(2'h3)])));
          if (reg29[(1'h0):(1'h0)])
            begin
              reg32 <= $signed((~^$signed(reg23)));
              reg33 <= $unsigned(wire18[(3'h7):(3'h6)]);
            end
          else
            begin
              reg32 <= (&{$unsigned($signed((reg30 ? reg24 : reg29)))});
            end
          if ($signed((wire19 ?
              $signed((((8'ha1) * reg25) >> $signed(reg26))) : wire20[(3'h5):(1'h0)])))
            begin
              reg34 <= $signed((-$unsigned((~|(reg33 | (8'ha4))))));
            end
          else
            begin
              reg34 <= (~^($signed(((~|reg24) & reg33)) ^~ $signed(wire20[(3'h5):(3'h5)])));
              reg35 <= ({reg30,
                  (~&reg34[(3'h5):(3'h4)])} * ((wire18[(3'h4):(3'h4)] != {(reg27 && reg32),
                  $signed((8'ha6))}) == {($signed(reg26) ^~ $signed(reg29)),
                  (-(reg24 ? reg33 : reg34))}));
            end
        end
      else
        begin
          reg30 <= (($unsigned((~&{reg29})) ?
                  ($signed($unsigned(reg25)) && {$unsigned(wire19)}) : reg23) ?
              ((~|$unsigned($unsigned(wire19))) ?
                  $unsigned(reg33[(3'h7):(3'h5)]) : $signed($unsigned($signed(reg34)))) : ((reg35[(5'h11):(4'hf)] & $signed((+reg32))) ?
                  (~&reg30) : $signed((~^$signed(wire21)))));
          reg31 <= reg27[(3'h5):(2'h3)];
          reg32 <= ((~((8'h9f) ?
                  ({reg27, reg29} ?
                      reg32[(3'h7):(3'h6)] : (!reg28)) : $signed(wire19))) ?
              wire21[(1'h1):(1'h1)] : wire19);
          if ((!(+$signed(reg32[(3'h4):(1'h1)]))))
            begin
              reg33 <= $unsigned((-$signed((!$unsigned(reg33)))));
              reg34 <= (~&(8'ha5));
            end
          else
            begin
              reg33 <= ((reg26[(3'h7):(3'h4)] <<< (reg30 ?
                  ($signed(reg33) < $signed(wire22)) : reg31[(3'h5):(1'h0)])) <= {(^$unsigned($signed(reg35)))});
              reg34 <= reg23[(2'h3):(2'h2)];
              reg35 <= reg25;
              reg36 <= reg24;
              reg37 <= $unsigned(reg30);
            end
          reg38 <= $unsigned((wire19 - (!$signed((+reg32)))));
        end
      if ((8'ha1))
        begin
          reg39 <= (reg35[(5'h11):(3'h5)] - reg23);
          if (reg33)
            begin
              reg40 <= $unsigned(({((^~reg25) & $signed(reg27)),
                  $signed($unsigned((8'hb2)))} == reg27[(1'h1):(1'h0)]));
              reg41 <= $unsigned((wire22[(4'ha):(4'h8)] ?
                  (-$unsigned(wire21)) : (reg37 && ((reg28 >= (7'h44)) ?
                      wire20[(3'h6):(1'h1)] : (|reg32)))));
            end
          else
            begin
              reg40 <= $unsigned((($signed(reg32) ?
                      ($signed(reg38) <= wire20[(3'h4):(2'h2)]) : (~(wire20 == reg25))) ?
                  {reg41[(1'h1):(1'h0)]} : ((reg37 >>> (8'ha6)) >= (~^(~(8'ha4))))));
              reg41 <= (+(8'hb2));
            end
          reg42 <= (+{(reg38 ? $signed((wire19 <= reg23)) : (~&reg24))});
        end
      else
        begin
          reg39 <= $unsigned(reg28);
          reg40 <= $signed(reg40);
        end
      reg43 <= $signed(reg38);
    end
  assign wire44 = reg41[(3'h6):(3'h4)];
  assign wire45 = $unsigned((~(^~reg40[(1'h0):(1'h0)])));
  assign wire46 = ({{((8'ha5) ? reg32 : reg31[(2'h3):(2'h2)])}} ?
                      {(reg24 | $unsigned((reg24 || reg24)))} : $signed((-$unsigned((+reg34)))));
  assign wire47 = $unsigned((~(((wire19 + wire44) ?
                      (-reg24) : $signed(reg43)) > (8'ha0))));
  assign wire48 = wire44;
  assign wire49 = (((7'h42) ?
                      wire20 : ((~^(reg28 ?
                          reg36 : reg38)) == $unsigned((8'hbf)))) >= $signed(({$unsigned(reg30)} >= wire18[(3'h5):(1'h1)])));
  assign wire50 = (reg38 ^~ ((~&$unsigned($unsigned(wire46))) ?
                      (wire48 - (~&{reg35})) : ($unsigned((+reg28)) ?
                          (reg23 ~^ $unsigned(reg23)) : (-wire48[(2'h2):(2'h2)]))));
endmodule
