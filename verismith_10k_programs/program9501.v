module top
#(parameter param165 = (((~(((8'haa) ^~ (8'ha8)) ? ((8'hab) ~^ (8'haa)) : ((8'h9c) < (8'hb3)))) > (~(&((8'ha5) * (8'h9f))))) ? (!(((^(8'hb3)) ? (8'hbd) : ((7'h44) ? (7'h44) : (7'h42))) ? {((8'hbb) ? (8'hb7) : (8'ha1)), (!(8'ha0))} : ({(8'ha4)} ? {(7'h42), (8'hae)} : {(8'hac), (7'h42)}))) : (7'h40)))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire0;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(3'h7):(1'h0)] wire164;
  wire [(5'h10):(1'h0)] wire5;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire7;
  wire [(4'hf):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire9;
  wire [(4'hf):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire12;
  wire [(5'h15):(1'h0)] wire13;
  wire signed [(5'h15):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire57;
  wire signed [(4'ha):(1'h0)] wire58;
  wire signed [(2'h3):(1'h0)] wire59;
  wire [(2'h2):(1'h0)] wire60;
  wire signed [(4'hc):(1'h0)] wire162;
  reg signed [(4'h8):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg55 = (1'h0);
  reg [(4'hf):(1'h0)] reg54 = (1'h0);
  reg [(3'h7):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(3'h4):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire164,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire47,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire162,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 reg49,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((wire1[(3'h5):(2'h3)] - (({wire0} ^ {wire3}) & (wire1[(4'hf):(3'h5)] ?
              (wire0 ^ wire0) : (wire3 == (7'h44))))) ?
          wire3[(1'h0):(1'h0)] : wire0);
    end
  assign wire5 = (~^(reg4 != (($unsigned(wire0) || (wire2 ?
                     reg4 : wire1)) - {$signed(wire0)})));
  assign wire6 = {$unsigned((!$unsigned(wire5))),
                     ((8'ha5) ?
                         $unsigned(((wire1 ^~ wire0) && (^~(7'h42)))) : (~(wire0[(4'h8):(2'h3)] != $unsigned(reg4))))};
  assign wire7 = wire2;
  assign wire8 = {(+((-(-wire2)) ? $unsigned(wire2) : wire0)),
                     $unsigned($unsigned($unsigned($unsigned(wire1))))};
  assign wire9 = $unsigned(wire2);
  assign wire10 = (((~&($unsigned(wire2) >>> (wire0 ? wire2 : (8'hb7)))) ?
                          (wire8[(4'ha):(3'h6)] ?
                              wire3[(1'h1):(1'h0)] : wire8[(4'hd):(4'hb)]) : wire8[(1'h0):(1'h0)]) ?
                      $signed(reg4) : $signed((($unsigned(wire3) ?
                          {wire8} : ((8'hba) ^ reg4)) - wire1)));
  assign wire11 = ((wire0 == ($unsigned(wire7[(2'h3):(2'h2)]) && wire9[(4'hb):(3'h6)])) ?
                      ((+((wire5 ? wire10 : wire2) ?
                          (wire1 ~^ reg4) : $signed(wire2))) == $signed({(reg4 ?
                              wire3 : wire10)})) : wire9);
  assign wire12 = wire0[(3'h5):(3'h5)];
  assign wire13 = ($unsigned($signed($signed(wire6))) + (!$signed($unsigned({wire7}))));
  module14 #() modinst48 (wire47, clk, wire6, wire8, wire0, wire5);
  always
    @(posedge clk) begin
      reg49 <= (^~$unsigned(($signed((wire9 ? reg4 : wire12)) >>> wire0)));
      if (wire8)
        begin
          reg50 <= (wire2[(4'hd):(3'h5)] << (+{(~|(wire8 ? wire12 : wire5))}));
          if ((wire0 ? reg49[(3'h4):(3'h4)] : wire5[(4'h9):(2'h2)]))
            begin
              reg51 <= ({$unsigned(wire9[(4'ha):(4'ha)]),
                      (wire8[(2'h3):(2'h3)] << wire1)} ?
                  (^~wire3) : (($unsigned({wire10,
                      wire12}) >= (8'haa)) ^ wire1[(3'h7):(1'h1)]));
              reg52 <= (8'hab);
              reg53 <= wire7[(4'h9):(1'h1)];
            end
          else
            begin
              reg51 <= reg50[(2'h2):(1'h0)];
              reg52 <= (8'hbc);
              reg53 <= ($signed(wire0[(2'h3):(2'h3)]) ?
                  $signed((((wire6 ? wire0 : wire2) > (wire5 ? wire1 : reg51)) ?
                      wire11[(1'h1):(1'h0)] : {(wire8 ?
                              wire6 : wire1)})) : wire8);
              reg54 <= wire47;
            end
        end
      else
        begin
          reg50 <= wire5[(4'ha):(4'h9)];
          reg51 <= wire1[(2'h3):(2'h2)];
        end
      reg55 <= ($unsigned(($signed((-(8'ha8))) ^ $unsigned(wire6))) <<< $signed(({{wire10,
                  wire0},
              $unsigned(wire12)} ?
          wire5[(3'h5):(1'h0)] : wire1)));
      reg56 <= ({($unsigned(wire8[(4'hd):(3'h7)]) ?
                  ($signed(wire11) ?
                      reg54[(3'h4):(2'h2)] : (wire8 * reg4)) : $unsigned(wire8[(4'hb):(1'h0)]))} ?
          reg55[(1'h1):(1'h1)] : ({wire5[(4'hd):(4'hc)],
                  {(^reg54), $signed(wire6)}} ?
              (!(^~$signed((7'h41)))) : (reg53 >> ((wire47 ~^ wire7) ?
                  (reg4 ? reg49 : reg53) : (reg54 ? wire13 : wire5)))));
    end
  assign wire57 = ($unsigned({$signed($signed(wire12))}) ?
                      $unsigned($unsigned((wire47[(3'h5):(3'h5)] ?
                          (wire3 && reg50) : (8'h9c)))) : reg51);
  assign wire58 = ($unsigned((wire3 * (~$unsigned(wire9)))) ?
                      $unsigned({$unsigned((wire5 > wire12))}) : ((&wire7[(3'h5):(3'h4)]) >= reg49[(3'h6):(2'h3)]));
  assign wire59 = {(reg50[(2'h2):(1'h0)] ?
                          wire3[(4'hf):(4'hd)] : (reg51[(4'hf):(2'h3)] ?
                              $signed($unsigned(wire57)) : $signed({reg53})))};
  assign wire60 = wire3;
  module61 #() modinst163 (.wire63(reg49), .wire62(wire13), .clk(clk), .wire66(wire0), .y(wire162), .wire65(wire47), .wire64(reg51));
  assign wire164 = (wire12 * wire7[(2'h3):(1'h0)]);
endmodule

module module61
#(parameter param161 = (|(&(({(8'hb2)} <<< ((7'h40) >= (8'haf))) ? ({(8'haa), (8'hb4)} ? ((8'hb1) >= (8'hbc)) : ((8'hb6) ? (8'hac) : (8'hbc))) : (((8'had) ~^ (8'hba)) == ((8'h9c) ? (7'h44) : (8'ha0)))))))
(y, clk, wire62, wire63, wire64, wire65, wire66);
  output wire [(32'h149):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire62;
  input wire [(4'he):(1'h0)] wire63;
  input wire signed [(5'h13):(1'h0)] wire64;
  input wire [(5'h15):(1'h0)] wire65;
  input wire signed [(4'he):(1'h0)] wire66;
  wire signed [(5'h15):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire137;
  wire signed [(4'h8):(1'h0)] wire104;
  wire signed [(4'hf):(1'h0)] wire103;
  wire signed [(5'h11):(1'h0)] wire102;
  wire signed [(4'h8):(1'h0)] wire100;
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  reg [(5'h14):(1'h0)] reg159 = (1'h0);
  reg [(3'h4):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg156 = (1'h0);
  reg [(3'h5):(1'h0)] reg155 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg154 = (1'h0);
  reg [(4'he):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg152 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg signed [(4'he):(1'h0)] reg150 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg146 = (1'h0);
  reg [(5'h12):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg142 = (1'h0);
  reg [(5'h13):(1'h0)] reg140 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg139 = (1'h0);
  assign y = {wire141,
                 wire137,
                 wire104,
                 wire103,
                 wire102,
                 wire100,
                 reg160,
                 reg159,
                 reg158,
                 reg157,
                 reg156,
                 reg155,
                 reg154,
                 reg153,
                 reg152,
                 reg151,
                 reg150,
                 reg149,
                 reg148,
                 reg147,
                 reg146,
                 reg145,
                 reg144,
                 reg143,
                 reg142,
                 reg140,
                 reg139,
                 (1'h0)};
  module67 #() modinst101 (.wire70(wire66), .y(wire100), .wire71(wire62), .clk(clk), .wire69(wire63), .wire68(wire64), .wire72(wire65));
  assign wire102 = wire65;
  assign wire103 = ((wire64 ?
                       $unsigned($unsigned(wire64)) : wire62) != $unsigned(wire100));
  assign wire104 = ((8'ha1) ?
                       wire62[(5'h14):(5'h10)] : (wire100 ?
                           $signed(($unsigned(wire63) - wire63)) : (~wire62[(3'h4):(2'h2)])));
  module105 #() modinst138 (wire137, clk, wire63, wire62, wire100, wire66);
  always
    @(posedge clk) begin
      reg139 <= ((8'ha9) ?
          $signed((wire137[(3'h5):(1'h1)] ?
              ($unsigned(wire137) ?
                  {wire137, wire66} : (wire137 ?
                      (8'ha6) : (7'h40))) : $signed($unsigned(wire100)))) : ({($unsigned(wire65) ?
                      $signed(wire65) : (wire66 <<< wire137))} ?
              wire100[(1'h0):(1'h0)] : ($unsigned($signed(wire63)) ?
                  $signed((wire65 >> wire63)) : wire102[(3'h7):(3'h5)])));
      reg140 <= ($signed($unsigned($signed($signed(reg139)))) != (wire104[(3'h4):(1'h1)] | ({wire62,
              reg139} ?
          (-(-wire66)) : (7'h41))));
    end
  assign wire141 = wire100;
  always
    @(posedge clk) begin
      reg142 <= {wire104};
      reg143 <= reg140[(4'he):(3'h4)];
      if ((^~(8'hbe)))
        begin
          if (wire100)
            begin
              reg144 <= wire66[(4'he):(4'h9)];
              reg145 <= $signed((8'hb1));
            end
          else
            begin
              reg144 <= ((+$unsigned($unsigned($unsigned(reg145)))) >> $unsigned($unsigned((|$signed((8'h9e))))));
              reg145 <= wire65[(3'h7):(2'h2)];
              reg146 <= {wire66};
            end
        end
      else
        begin
          reg144 <= $signed(((($signed(reg139) > $signed(wire102)) ?
              wire102[(3'h5):(1'h0)] : (~|$unsigned(wire104))) <<< $unsigned(($unsigned(wire104) & (wire100 ?
              (8'hb8) : (8'hb0))))));
          if ((wire137[(4'hb):(3'h7)] ?
              $unsigned(((+$unsigned(reg144)) >>> (~^(wire103 >>> reg144)))) : ((-$signed($unsigned(reg145))) ^~ {(reg143[(1'h1):(1'h0)] << wire141)})))
            begin
              reg145 <= (wire102 <<< wire102[(4'h8):(1'h1)]);
              reg146 <= $signed(($unsigned(((reg139 ?
                  reg139 : wire102) != $signed(wire103))) | wire104));
              reg147 <= $signed($signed(wire66[(3'h7):(3'h6)]));
              reg148 <= reg143[(3'h6):(1'h0)];
              reg149 <= (~{reg143[(4'he):(3'h4)]});
            end
          else
            begin
              reg145 <= reg148[(4'ha):(3'h6)];
              reg146 <= reg142;
              reg147 <= ($unsigned((!(wire103 - $unsigned(wire65)))) ?
                  {reg140,
                      $unsigned((reg147[(2'h2):(1'h0)] & $signed(wire65)))} : ((((reg142 || wire103) ?
                      (reg148 ?
                          reg146 : (8'hbd)) : wire103[(2'h3):(1'h0)]) ^ $unsigned((!reg144))) >>> $signed($unsigned((wire62 >= wire66)))));
              reg148 <= wire141[(5'h11):(3'h5)];
            end
        end
      if (((~^$unsigned(reg145[(1'h0):(1'h0)])) == reg144[(2'h2):(2'h2)]))
        begin
          reg150 <= $signed((&reg148[(4'ha):(3'h5)]));
          if ($signed((reg148 >>> {reg148[(4'h8):(3'h6)]})))
            begin
              reg151 <= $signed($unsigned({$unsigned($unsigned(reg146))}));
              reg152 <= $unsigned($unsigned(($unsigned(wire65) >>> (8'hb6))));
              reg153 <= $unsigned($signed($signed(($signed(reg148) && reg143))));
              reg154 <= ($signed((+((7'h41) || $unsigned(wire141)))) ?
                  ((8'hb6) ?
                      ($unsigned({wire103}) >>> reg145[(4'hc):(4'h8)]) : reg143[(3'h6):(1'h0)]) : ($signed((wire62[(4'hc):(1'h0)] * (wire65 && reg149))) + {((^reg142) ?
                          (+reg153) : (wire102 != wire103)),
                      $signed($unsigned(wire102))}));
            end
          else
            begin
              reg151 <= $unsigned({(((reg143 * reg142) * $unsigned(wire63)) >> $signed(reg143[(4'hc):(4'ha)]))});
              reg152 <= $signed(reg144);
            end
          reg155 <= $unsigned(wire141[(4'h9):(3'h6)]);
          if (reg154[(3'h6):(3'h4)])
            begin
              reg156 <= $signed((+(~&($signed(reg155) != (wire100 ?
                  reg147 : reg150)))));
              reg157 <= ($signed(reg150[(1'h0):(1'h0)]) << $unsigned({$unsigned(reg142[(1'h1):(1'h1)])}));
              reg158 <= ((~(reg145[(4'hf):(3'h5)] ?
                      (wire64 ?
                          ((7'h42) ?
                              wire65 : reg139) : ((8'hba) && (8'ha0))) : ((-(8'hae)) ?
                          (^(8'hbd)) : (reg151 ? wire63 : reg156)))) ?
                  $signed(wire137[(3'h6):(2'h2)]) : ($unsigned((~&wire64[(4'hf):(4'he)])) == wire102));
              reg159 <= (^~($signed($unsigned(wire103[(3'h4):(1'h1)])) ?
                  $unsigned(($signed(wire141) + (reg153 ?
                      reg143 : reg155))) : $signed((wire63[(4'he):(4'hc)] || $signed(reg151)))));
              reg160 <= (-(wire62 & $unsigned($unsigned(wire141))));
            end
          else
            begin
              reg156 <= reg160;
              reg157 <= $unsigned($signed($signed((((8'had) ?
                  reg158 : reg153) ^ reg154))));
              reg158 <= {(&$signed((reg147 ?
                      wire137[(3'h4):(2'h3)] : reg148[(5'h13):(4'hf)])))};
              reg159 <= reg155;
            end
        end
      else
        begin
          reg150 <= (~|reg147[(2'h3):(2'h3)]);
          reg151 <= (((reg146[(4'h8):(4'h8)] ?
              {(reg142 && wire63),
                  reg153} : reg145) ^~ (wire103[(4'hd):(1'h0)] - $unsigned({wire66,
              wire64}))) >= {{(~&(reg146 + (8'hbf))),
                  $signed((wire62 ? reg149 : (8'hae)))},
              ((wire103 ?
                  (~|reg156) : (reg158 != wire65)) ^ wire64[(3'h4):(2'h2)])});
          reg152 <= $unsigned($unsigned($unsigned(wire63)));
          reg153 <= (wire102 ^ $unsigned((~|(!reg152))));
        end
    end
endmodule

module module14  (y, clk, wire18, wire17, wire16, wire15);
  output wire [(32'h14a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire18;
  input wire signed [(4'hf):(1'h0)] wire17;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire [(5'h10):(1'h0)] wire15;
  wire [(5'h11):(1'h0)] wire44;
  wire [(5'h14):(1'h0)] wire43;
  wire signed [(4'hc):(1'h0)] wire42;
  wire [(2'h2):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire23;
  wire [(4'he):(1'h0)] wire22;
  wire signed [(4'hd):(1'h0)] wire21;
  wire signed [(4'h9):(1'h0)] wire20;
  wire signed [(3'h5):(1'h0)] wire19;
  reg [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg [(3'h4):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg36 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg [(5'h13):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg [(4'hd):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg26 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg24 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 reg46,
                 reg45,
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
                 (1'h0)};
  assign wire19 = {{(~^$unsigned(wire15))}};
  assign wire20 = wire15[(3'h7):(1'h1)];
  assign wire21 = wire15[(4'hf):(4'h8)];
  assign wire22 = ({(~&(^~(~(8'hba))))} ?
                      wire15[(4'h9):(3'h7)] : ($signed(wire15[(4'hf):(2'h2)]) ?
                          $unsigned(($signed(wire16) != (wire21 - (8'hb3)))) : ($signed(wire19[(3'h5):(1'h0)]) > {(~|wire20)})));
  assign wire23 = (~(8'ha6));
  always
    @(posedge clk) begin
      if (wire23[(3'h7):(1'h0)])
        begin
          if ((wire18[(1'h0):(1'h0)] ?
              wire22[(4'hb):(4'h9)] : $unsigned((((wire21 ?
                  wire17 : wire22) > (wire19 ? wire18 : wire21)) >> wire20))))
            begin
              reg24 <= (~wire22[(4'hb):(1'h0)]);
              reg25 <= (wire15[(2'h3):(2'h3)] ?
                  reg24[(2'h2):(1'h1)] : $signed({(|(wire19 | wire22))}));
            end
          else
            begin
              reg24 <= reg25;
            end
          reg26 <= (~&((|$signed((^wire17))) ?
              $unsigned($signed($signed(wire16))) : ((8'hb5) ?
                  ((wire17 >= reg24) ?
                      $signed(wire19) : $signed(wire17)) : wire15)));
          reg27 <= $unsigned($unsigned((reg25 ?
              ((wire23 ? wire19 : reg26) < $signed((8'ha3))) : wire17)));
          reg28 <= reg26;
          reg29 <= $unsigned({{wire22[(4'hd):(4'ha)]},
              $signed(reg28[(3'h7):(1'h1)])});
        end
      else
        begin
          if ((^~wire20[(2'h2):(1'h1)]))
            begin
              reg24 <= ($signed($unsigned(wire19)) ~^ ($signed(((^wire23) ?
                  (wire23 && wire18) : (reg27 - (8'ha7)))) ^ wire18));
              reg25 <= $signed(wire21[(3'h4):(1'h0)]);
              reg26 <= ((!$unsigned(reg27[(4'h8):(4'h8)])) + wire19[(1'h1):(1'h1)]);
              reg27 <= {$unsigned((|wire19)),
                  ((({reg27, wire21} ?
                          wire15 : reg28) * wire17[(2'h2):(1'h1)]) ?
                      reg24[(3'h7):(1'h1)] : (|$unsigned(wire21[(3'h7):(3'h7)])))};
            end
          else
            begin
              reg24 <= $unsigned($signed($signed((-{(7'h44), reg26}))));
              reg25 <= wire18;
            end
          reg28 <= $signed($unsigned($signed(reg27)));
          reg29 <= wire20[(4'h9):(4'h8)];
        end
      if ((!((7'h44) && wire17)))
        begin
          reg30 <= wire23[(3'h7):(1'h0)];
          reg31 <= (wire16[(1'h1):(1'h1)] >= wire23);
          reg32 <= ((~&$unsigned((~reg27[(4'h8):(4'h8)]))) ?
              (reg25 ?
                  wire22[(2'h2):(1'h1)] : reg30[(1'h0):(1'h0)]) : (reg27[(3'h7):(3'h5)] ?
                  reg27 : $signed($unsigned((^~wire18)))));
          reg33 <= reg32[(1'h1):(1'h1)];
        end
      else
        begin
          reg30 <= $signed(wire22);
          if ($signed($unsigned($signed(($signed(wire23) ?
              $unsigned(wire22) : reg26[(1'h0):(1'h0)])))))
            begin
              reg31 <= {(|(~&($unsigned(wire17) >> reg32))),
                  (wire21[(4'ha):(4'h8)] << reg28[(3'h5):(1'h0)])};
              reg32 <= $unsigned(reg33);
              reg33 <= reg26;
              reg34 <= reg26[(4'hb):(3'h7)];
              reg35 <= {$unsigned(($signed(((8'h9e) ? wire18 : (8'ha0))) ?
                      $unsigned(wire20[(1'h0):(1'h0)]) : wire18[(1'h0):(1'h0)])),
                  $unsigned(reg34[(4'hf):(3'h6)])};
            end
          else
            begin
              reg31 <= wire19[(1'h0):(1'h0)];
              reg32 <= $unsigned($signed((((wire16 ^~ wire21) && reg24[(3'h4):(1'h0)]) <<< (|(wire18 + (8'ha1))))));
            end
          reg36 <= $signed((~|(($signed(reg28) ?
                  $signed(reg28) : wire19[(2'h3):(1'h0)]) ?
              (-{reg24}) : {(^reg32), $unsigned(wire16)})));
          reg37 <= (({((wire20 ?
                      reg24 : reg34) < $unsigned(wire20))} && $signed(((reg26 > reg25) ?
                  reg32 : $signed((7'h40))))) ?
              $unsigned(reg25) : $signed($unsigned(wire23)));
          reg38 <= reg28;
        end
      reg39 <= (!{reg36[(3'h4):(2'h2)], wire23[(3'h4):(1'h0)]});
    end
  assign wire40 = $signed(wire19);
  assign wire41 = $unsigned((8'ha9));
  assign wire42 = (^~reg34[(3'h6):(3'h6)]);
  assign wire43 = $signed({wire18[(1'h1):(1'h1)],
                      $unsigned((((8'ha3) > reg32) != reg28))});
  assign wire44 = {{$unsigned($unsigned($unsigned(reg26)))},
                      (+(^wire43[(4'h9):(1'h1)]))};
  always
    @(posedge clk) begin
      reg45 <= (8'hb1);
      reg46 <= (~^(reg37 || wire18[(1'h0):(1'h0)]));
    end
endmodule

module module105
#(parameter param135 = (~|((8'hbd) < (!{((7'h44) ? (8'ha2) : (8'hab)), ((7'h41) ? (8'ha5) : (8'had))}))), 
parameter param136 = (8'hb0))
(y, clk, wire109, wire108, wire107, wire106);
  output wire [(32'hdf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire109;
  input wire [(3'h4):(1'h0)] wire108;
  input wire [(4'h8):(1'h0)] wire107;
  input wire signed [(4'he):(1'h0)] wire106;
  wire signed [(3'h7):(1'h0)] wire134;
  wire signed [(3'h7):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire132;
  wire signed [(3'h6):(1'h0)] wire131;
  wire [(2'h2):(1'h0)] wire130;
  wire [(4'ha):(1'h0)] wire129;
  wire [(3'h4):(1'h0)] wire128;
  wire signed [(4'h9):(1'h0)] wire127;
  wire signed [(4'hc):(1'h0)] wire110;
  reg [(3'h6):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg125 = (1'h0);
  reg [(4'hc):(1'h0)] reg124 = (1'h0);
  reg [(5'h13):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg121 = (1'h0);
  reg [(2'h2):(1'h0)] reg120 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg118 = (1'h0);
  reg [(4'hb):(1'h0)] reg117 = (1'h0);
  reg [(2'h2):(1'h0)] reg116 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg115 = (1'h0);
  reg [(2'h3):(1'h0)] reg114 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg112 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg111 = (1'h0);
  assign y = {wire134,
                 wire133,
                 wire132,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire110,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 reg117,
                 reg116,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 (1'h0)};
  assign wire110 = $unsigned((^~(wire108[(3'h4):(1'h0)] - ((wire108 ?
                       wire107 : (8'hbc)) & (~|(8'ha8))))));
  always
    @(posedge clk) begin
      if ((^wire107[(3'h7):(2'h3)]))
        begin
          if ({((((&(8'hb7)) == (wire106 << wire108)) ?
                      $signed(((8'ha1) ? (8'hb8) : wire107)) : (&wire107)) ?
                  $signed($signed((8'h9d))) : $signed(wire107)),
              ($signed(wire108) ?
                  (wire106[(4'he):(2'h3)] + (8'hab)) : wire106[(1'h1):(1'h0)])})
            begin
              reg111 <= wire106[(3'h6):(1'h1)];
            end
          else
            begin
              reg111 <= $signed(wire109[(4'ha):(3'h5)]);
            end
          reg112 <= {(~(reg111[(4'h8):(3'h6)] * $unsigned(wire106[(2'h2):(2'h2)])))};
        end
      else
        begin
          if ((~|$unsigned({{$unsigned((8'hbf))},
              ((8'had) ? $unsigned(wire109) : wire107[(2'h2):(1'h1)])})))
            begin
              reg111 <= {{{wire107[(2'h2):(1'h1)], $unsigned(wire108)},
                      (^~wire109)},
                  (wire106[(4'hb):(3'h6)] ?
                      (-$unsigned((!wire106))) : wire109[(4'ha):(4'h8)])};
              reg112 <= $unsigned((reg112[(3'h6):(1'h1)] == $signed($signed(wire109[(1'h0):(1'h0)]))));
              reg113 <= ((8'hac) ? wire106[(4'h8):(1'h0)] : reg112);
            end
          else
            begin
              reg111 <= reg111;
              reg112 <= ({(((wire106 ?
                          wire108 : wire108) + wire108[(3'h4):(2'h2)]) + $unsigned((reg112 ?
                          wire109 : wire107))),
                      (!((wire108 ? wire109 : wire107) ?
                          reg113 : {wire110, wire108}))} ?
                  ({reg112} ?
                      (wire107[(3'h5):(1'h0)] ^~ reg113) : reg111) : ((($signed(wire108) <<< (~^wire110)) ?
                      reg112 : wire107[(4'h8):(1'h0)]) > (reg111[(3'h4):(1'h0)] >= {(-reg112),
                      (&wire110)})));
              reg113 <= $unsigned((($signed(reg113[(2'h3):(2'h2)]) ?
                  (~^$unsigned(wire108)) : (wire108[(2'h2):(1'h0)] ?
                      {wire110} : (-wire106))) + (reg113 ?
                  $signed((|reg113)) : wire110[(4'ha):(3'h4)])));
              reg114 <= $signed((!(|$unsigned($signed(wire108)))));
            end
          if (wire106[(4'hc):(3'h4)])
            begin
              reg115 <= (^~wire109);
              reg116 <= (~&(8'h9f));
            end
          else
            begin
              reg115 <= (~|reg113);
              reg116 <= ((((!{wire110}) ^~ $unsigned((wire110 || reg114))) >>> reg113) * $unsigned(((reg112 ?
                      {wire107, reg112} : wire107[(1'h1):(1'h1)]) ?
                  $signed(reg115[(3'h6):(1'h0)]) : $signed(reg115[(3'h4):(2'h2)]))));
              reg117 <= (((~reg111) && (~((wire106 >>> reg112) & (8'ha8)))) ?
                  (($signed((~wire106)) ?
                      $signed(wire107) : {wire107[(2'h3):(2'h3)],
                          $signed(reg112)}) > $signed({$signed(reg114)})) : ($signed($unsigned((wire106 ?
                          wire107 : reg112))) ?
                      (((!reg111) ? $signed(wire106) : (wire108 >> reg116)) ?
                          wire107[(1'h0):(1'h0)] : $signed($signed(reg116))) : ($signed((~&reg112)) ?
                          ($signed((8'ha4)) ?
                              reg111[(1'h0):(1'h0)] : reg116[(2'h2):(1'h1)]) : reg111)));
              reg118 <= ({{$signed((wire110 <= wire106)),
                          reg117[(4'ha):(2'h3)]}} ?
                  $unsigned(reg114) : ({$unsigned($unsigned(reg114))} ?
                      (($unsigned(wire110) >> reg116) * (reg117[(3'h7):(3'h4)] ?
                          reg117[(1'h1):(1'h1)] : {(8'hae),
                              reg115})) : $signed(($unsigned(reg117) ?
                          $unsigned(reg116) : reg116[(2'h2):(1'h0)]))));
            end
          reg119 <= ((^~$unsigned({reg115[(4'hd):(4'h9)]})) - {wire109});
          if (((reg112 * reg117) ?
              reg114 : $unsigned(((~^(reg112 ? (8'ha2) : wire107)) ?
                  ((wire110 ? (8'ha5) : reg114) ^~ (reg115 ?
                      reg115 : (8'hbb))) : reg114))))
            begin
              reg120 <= ($signed($signed(($unsigned((8'hbe)) ?
                  $unsigned(wire108) : (reg111 <<< wire109)))) >>> $signed(($unsigned({reg115,
                  (8'ha0)}) == (^$signed(wire106)))));
              reg121 <= {(reg119[(2'h2):(1'h1)] ?
                      (~reg116[(2'h2):(1'h0)]) : reg111)};
              reg122 <= wire106;
            end
          else
            begin
              reg120 <= reg116[(2'h2):(1'h1)];
              reg121 <= (&{$signed((~$signed(reg122)))});
              reg122 <= reg114;
              reg123 <= reg111;
              reg124 <= $unsigned({$unsigned(($unsigned(reg120) ^ (reg117 ?
                      reg115 : (7'h41)))),
                  (((wire107 ? reg119 : (8'h9c)) <<< (reg120 ?
                      reg114 : reg121)) >> {reg117[(3'h5):(1'h1)]})});
            end
          reg125 <= (~|(^~({(reg123 < wire108)} - reg115)));
        end
      reg126 <= reg117[(3'h5):(3'h5)];
    end
  assign wire127 = {$unsigned(reg121),
                       $signed({(reg115 ?
                               (~wire108) : ((8'h9f) ? reg118 : reg114)),
                           (&reg119)})};
  assign wire128 = reg114;
  assign wire129 = $unsigned(((8'ha0) ?
                       $signed(((reg121 < reg124) ?
                           (wire110 != reg113) : (wire109 & reg114))) : ((&$signed(wire108)) ^ {(reg112 ?
                               reg112 : reg113),
                           (wire127 ^~ (8'hb1))})));
  assign wire130 = {(|{{(reg124 & reg114), (^reg117)},
                           ({wire107, reg115} || reg125[(3'h4):(2'h3)])}),
                       ($signed($signed((|reg119))) || $signed($unsigned((wire127 ?
                           reg115 : reg114))))};
  assign wire131 = ((reg122 ?
                           (^($signed(reg122) && (wire128 >> reg118))) : {wire127[(3'h4):(3'h4)],
                               $signed((wire130 | (8'ha1)))}) ?
                       $unsigned(reg126[(3'h4):(3'h4)]) : reg119[(2'h2):(1'h0)]);
  assign wire132 = (reg113[(1'h0):(1'h0)] ?
                       $signed($unsigned($signed({(8'ha1)}))) : $signed((-({reg120,
                               wire129} ?
                           {wire127, (8'hb7)} : $signed(reg125)))));
  assign wire133 = $signed(reg114);
  assign wire134 = {({(~^(^reg116))} >>> (wire109 ?
                           wire132 : wire132[(5'h12):(4'he)]))};
endmodule

module module67
#(parameter param98 = (({{(7'h41)}} ? ((((8'hb2) >= (8'hbe)) ? ((8'hab) ? (8'hac) : (8'hbd)) : ((8'ha5) * (8'hbb))) ? {((8'hb7) ? (8'ha9) : (8'h9d))} : (((7'h43) ? (8'hb4) : (8'ha8)) ^ (~^(8'hbe)))) : (8'hbb)) == ((~((~|(8'ha3)) ? ((8'ha7) && (8'haa)) : (~|(8'hb8)))) ? ((((8'ha2) != (8'hb5)) <<< (^~(8'hbc))) ? ({(8'ha0)} >>> ((8'ha3) & (8'hbf))) : (~^(|(8'hb8)))) : (~&(((8'hb9) ? (7'h40) : (8'ha1)) ? (~(8'h9e)) : ((8'hbb) & (8'ha4)))))), 
parameter param99 = {((({param98} ? (param98 ? param98 : (8'had)) : {param98, (8'hb4)}) ~^ {(param98 ^~ param98)}) >>> param98), (+(8'ha3))})
(y, clk, wire72, wire71, wire70, wire69, wire68);
  output wire [(32'h130):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h7):(1'h0)] wire72;
  input wire [(4'hf):(1'h0)] wire71;
  input wire signed [(4'ha):(1'h0)] wire70;
  input wire [(3'h7):(1'h0)] wire69;
  input wire [(5'h11):(1'h0)] wire68;
  wire [(4'hd):(1'h0)] wire97;
  wire [(3'h5):(1'h0)] wire96;
  wire [(5'h14):(1'h0)] wire95;
  wire signed [(3'h7):(1'h0)] wire94;
  wire signed [(4'h8):(1'h0)] wire73;
  reg signed [(3'h5):(1'h0)] reg93 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg92 = (1'h0);
  reg [(5'h13):(1'h0)] reg91 = (1'h0);
  reg [(3'h5):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg89 = (1'h0);
  reg [(5'h15):(1'h0)] reg88 = (1'h0);
  reg [(3'h4):(1'h0)] reg87 = (1'h0);
  reg [(4'hf):(1'h0)] reg86 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg85 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg84 = (1'h0);
  reg [(3'h4):(1'h0)] reg83 = (1'h0);
  reg [(2'h3):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg78 = (1'h0);
  reg [(5'h14):(1'h0)] reg77 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg76 = (1'h0);
  reg signed [(4'he):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg74 = (1'h0);
  assign y = {wire97,
                 wire96,
                 wire95,
                 wire94,
                 wire73,
                 reg93,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
                 reg88,
                 reg87,
                 reg86,
                 reg85,
                 reg84,
                 reg83,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 (1'h0)};
  assign wire73 = ($signed((+((wire72 <<< wire71) ?
                          (!wire72) : (wire68 ~^ wire68)))) ?
                      wire71[(4'h9):(2'h3)] : {$signed((8'hb0)),
                          ($unsigned(((8'hbf) >>> (8'hb3))) ?
                              $signed(wire71) : wire72)});
  always
    @(posedge clk) begin
      if ({($unsigned((wire73[(1'h1):(1'h1)] >>> $signed(wire70))) * {($signed(wire73) && (wire70 ?
                  wire68 : wire70)),
              wire71[(4'hb):(3'h6)]})})
        begin
          reg74 <= (~(|$signed(wire70[(4'h8):(3'h7)])));
          if ((wire71 + reg74))
            begin
              reg75 <= ($signed($signed(wire72)) || {wire72[(3'h6):(3'h4)]});
              reg76 <= $signed((8'hbe));
            end
          else
            begin
              reg75 <= ((reg76 && reg75) > (wire70[(3'h7):(1'h1)] * $unsigned($unsigned($signed((8'hac))))));
              reg76 <= wire73[(3'h4):(2'h2)];
              reg77 <= ({$signed((~$signed(wire71)))} ^ (&(-($signed(wire72) ?
                  $unsigned(reg75) : {(8'hb8)}))));
            end
          reg78 <= ((8'haf) ?
              $unsigned((wire68[(5'h11):(3'h4)] + wire68)) : $signed(((wire68[(4'h8):(1'h1)] ?
                      (^~wire70) : (wire68 << reg77)) ?
                  (^(reg75 ? wire71 : (8'hac))) : (~^$signed(reg74)))));
        end
      else
        begin
          reg74 <= ($signed((!$signed($unsigned(reg77)))) ?
              (-(+$unsigned((wire70 ?
                  wire71 : wire72)))) : (reg74[(4'hd):(4'hd)] ^ wire68[(4'ha):(3'h6)]));
          if (reg78[(2'h2):(1'h0)])
            begin
              reg75 <= $unsigned(reg77);
              reg76 <= ($unsigned(($signed($signed(reg77)) == reg76[(3'h4):(2'h3)])) & $unsigned($signed(((&wire71) >= $signed(wire71)))));
            end
          else
            begin
              reg75 <= {(^~wire72),
                  {$unsigned($signed(((8'ha7) ? reg75 : reg77)))}};
              reg76 <= ($unsigned(((&(wire72 | wire70)) ^ {(wire73 > wire73)})) ?
                  {wire68[(5'h11):(3'h5)],
                      ((wire68 ?
                              (wire68 ? (8'h9f) : wire72) : (wire68 | reg77)) ?
                          {$signed(reg75), (~^reg75)} : $unsigned({(8'ha0),
                              wire71}))} : $unsigned(wire72));
              reg77 <= (wire69[(3'h5):(1'h0)] ?
                  (8'hb3) : (reg77 * $unsigned(reg77[(4'hb):(4'h8)])));
              reg78 <= wire69[(3'h5):(1'h0)];
            end
          reg79 <= reg74;
          if ($signed($signed((8'ha9))))
            begin
              reg80 <= (~^(^(-$signed(reg79))));
              reg81 <= (^(^($unsigned({wire70, reg78}) << wire73)));
              reg82 <= ((~|{{{reg78, (8'hbb)}, reg76}}) ?
                  wire70 : $unsigned(wire72));
              reg83 <= (~wire73[(2'h3):(2'h3)]);
              reg84 <= (~^$signed({wire70, $unsigned(reg76[(5'h13):(3'h7)])}));
            end
          else
            begin
              reg80 <= {((reg79[(2'h2):(2'h2)] ?
                      ($unsigned(reg84) ?
                          $unsigned((8'h9d)) : $unsigned((8'hb6))) : {((8'hb3) >> reg84),
                          wire73}) >= $signed(reg76[(3'h6):(2'h3)]))};
              reg81 <= (~&$unsigned(reg77));
              reg82 <= (|(((~|$signed(reg84)) << ($signed(reg84) || wire68)) && wire69[(2'h2):(2'h2)]));
            end
          if ({$unsigned(reg79[(1'h0):(1'h0)]),
              (~^$signed((~reg84[(5'h13):(5'h11)])))})
            begin
              reg85 <= (wire68[(3'h5):(3'h5)] || $unsigned(reg74));
              reg86 <= reg81;
              reg87 <= ((reg82 ~^ $signed(reg74)) | {{$unsigned((reg76 >>> reg83)),
                      reg80[(4'hc):(4'h8)]}});
            end
          else
            begin
              reg85 <= {{$unsigned($signed(reg75[(4'hd):(4'ha)])),
                      reg77[(5'h12):(4'h8)]}};
              reg86 <= wire68[(2'h2):(2'h2)];
              reg87 <= {(reg82 ? (8'hb3) : reg77)};
            end
        end
      if (wire70[(1'h1):(1'h1)])
        begin
          reg88 <= {($signed((reg79[(3'h7):(3'h7)] ?
                  (!wire72) : {reg74, reg86})) << (~($unsigned(reg81) ?
                  $unsigned(reg82) : (^wire71)))),
              reg86[(3'h4):(2'h2)]};
          reg89 <= ($signed((|$unsigned(reg87[(2'h2):(1'h0)]))) ?
              (reg86[(4'hc):(2'h2)] - $unsigned(reg81[(4'h9):(1'h0)])) : wire69);
        end
      else
        begin
          reg88 <= $signed($signed($signed($unsigned($unsigned(reg77)))));
        end
      if ((({((7'h44) ?
              $unsigned(wire68) : (wire68 ?
                  (8'ha1) : wire68))} >>> wire70) ^ wire71[(4'hf):(1'h0)]))
        begin
          reg90 <= $signed($signed($unsigned((!(reg80 ? wire70 : reg86)))));
          reg91 <= $unsigned(reg87[(1'h0):(1'h0)]);
          reg92 <= $unsigned($unsigned(reg82));
        end
      else
        begin
          reg90 <= $unsigned((|(reg77 ?
              $unsigned((!reg85)) : $signed({reg82}))));
        end
      reg93 <= $signed($signed(reg89));
    end
  assign wire94 = ((-$unsigned(($signed(reg84) ?
                      (reg91 ?
                          reg82 : reg78) : reg83))) < ($unsigned($signed((|reg93))) ?
                      (reg90[(1'h1):(1'h1)] >= $signed((wire73 ^~ reg75))) : reg78));
  assign wire95 = ((-reg87) < {$signed((8'hb0)), reg80[(2'h2):(1'h0)]});
  assign wire96 = (~^((~&reg84) ?
                      $unsigned((!wire72[(1'h0):(1'h0)])) : (|reg77[(4'hb):(4'ha)])));
  assign wire97 = reg90[(1'h0):(1'h0)];
endmodule
