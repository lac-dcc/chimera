module top
#(parameter param303 = (({((7'h42) > {(8'h9c), (8'hb6)})} ? (((&(8'hac)) == ((7'h44) ? (8'hbf) : (7'h41))) == (~^((7'h43) > (8'haf)))) : (((|(8'ha5)) ? (8'ha9) : (&(8'h9d))) ? {{(8'ha7)}} : (((8'hac) ? (8'ha8) : (8'hb9)) <= (~^(8'haf))))) ? ((-({(7'h44)} ? ((8'hba) >>> (8'ha9)) : {(8'hb0)})) ? (-{(8'hbd)}) : (8'hb3)) : (((((8'ha8) & (8'hb2)) ? (^~(8'hb3)) : ((8'hb4) ? (8'hae) : (8'hbb))) ? ((^(8'haa)) ? ((8'hb9) << (8'hbd)) : (+(8'hb1))) : (((8'hb8) ? (8'h9d) : (8'h9e)) ? (-(8'haf)) : ((8'hb6) >= (8'haa)))) == (({(8'hb9)} ? (~(8'hbf)) : ((8'hbc) ? (8'ha7) : (8'hab))) ? ({(8'h9d), (8'hb1)} ? ((8'hb7) >= (8'hb3)) : {(8'hbd), (7'h44)}) : (((7'h42) >= (8'hb0)) ? ((7'h44) ? (8'h9c) : (8'hbf)) : ((7'h40) ? (8'hb9) : (8'ha3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h1e9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire289;
  wire signed [(5'h10):(1'h0)] wire288;
  wire signed [(4'he):(1'h0)] wire287;
  wire [(5'h12):(1'h0)] wire286;
  wire signed [(2'h3):(1'h0)] wire285;
  wire signed [(3'h4):(1'h0)] wire283;
  wire signed [(4'he):(1'h0)] wire27;
  wire [(4'h8):(1'h0)] wire14;
  wire [(4'he):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(3'h5):(1'h0)] wire11;
  wire signed [(4'hd):(1'h0)] wire10;
  wire signed [(4'he):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire4;
  reg signed [(5'h13):(1'h0)] reg302 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg301 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg300 = (1'h0);
  reg [(3'h7):(1'h0)] reg299 = (1'h0);
  reg [(4'h8):(1'h0)] reg298 = (1'h0);
  reg [(3'h5):(1'h0)] reg297 = (1'h0);
  reg [(2'h2):(1'h0)] reg296 = (1'h0);
  reg [(4'h8):(1'h0)] reg295 = (1'h0);
  reg [(4'h8):(1'h0)] reg294 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg293 = (1'h0);
  reg [(4'he):(1'h0)] reg292 = (1'h0);
  reg [(4'h9):(1'h0)] reg291 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg290 = (1'h0);
  reg [(4'h9):(1'h0)] reg5 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg6 = (1'h0);
  reg [(3'h4):(1'h0)] reg7 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg15 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg18 = (1'h0);
  reg [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(3'h4):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  assign y = {wire289,
                 wire288,
                 wire287,
                 wire286,
                 wire285,
                 wire283,
                 wire27,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire4,
                 reg302,
                 reg301,
                 reg300,
                 reg299,
                 reg298,
                 reg297,
                 reg296,
                 reg295,
                 reg294,
                 reg293,
                 reg292,
                 reg291,
                 reg290,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 (1'h0)};
  assign wire4 = (wire1 <= wire2[(1'h1):(1'h1)]);
  always
    @(posedge clk) begin
      reg5 <= wire2;
      reg6 <= ($unsigned((&$unsigned($signed(wire0)))) || $signed(wire2));
      reg7 <= (^~((^wire3) ?
          $unsigned($signed((reg6 + wire0))) : reg5[(3'h4):(1'h1)]));
      reg8 <= $signed(((+((wire2 << (8'haa)) * (&(8'h9d)))) ?
          (~{$signed((8'hb1))}) : ((reg5 * $signed(wire3)) || {(8'hb0),
              (wire3 <<< (8'h9d))})));
    end
  assign wire9 = wire2[(4'h9):(1'h0)];
  assign wire10 = ((wire1[(4'hb):(4'ha)] ?
                      $signed(($signed(wire1) + $signed(wire0))) : wire9[(2'h2):(1'h0)]) < $signed(($signed($signed(wire4)) ?
                      reg5 : $unsigned(reg7))));
  assign wire11 = reg5;
  assign wire12 = $unsigned({$signed((~{wire1})),
                      (~^($signed(reg8) == (~&reg7)))});
  assign wire13 = (^(reg5[(2'h2):(2'h2)] >>> ({((8'ha0) + wire10),
                          $unsigned(reg6)} ?
                      {{(8'hb8)}, (8'hba)} : wire11[(2'h3):(1'h0)])));
  assign wire14 = (wire13 <= (~&(-wire10)));
  always
    @(posedge clk) begin
      if (($unsigned(({{wire12, wire2}} + ((reg6 << wire3) ?
          $signed(wire13) : reg5[(1'h0):(1'h0)]))) <= {((8'hac) ?
              wire9[(1'h0):(1'h0)] : $unsigned(wire0[(3'h5):(2'h2)])),
          wire2[(1'h0):(1'h0)]}))
        begin
          reg15 <= $signed((reg7 ? (&$unsigned(wire4)) : wire11));
          reg16 <= ({$signed(reg6[(3'h5):(1'h0)])} ?
              $unsigned(($signed($unsigned(reg6)) == $signed({(8'ha4),
                  wire14}))) : reg15);
          reg17 <= ((!(+(^~(8'hbd)))) ? $signed(wire12) : wire3);
          reg18 <= (wire11[(1'h1):(1'h0)] ?
              $unsigned(wire3[(1'h1):(1'h0)]) : $signed(reg8));
          if (({wire4,
              ((~&(reg18 ? wire12 : wire14)) == ((!reg15) ?
                  (reg15 <= (8'ha8)) : {reg15}))} & ($signed(((reg8 & wire4) ?
              $unsigned(wire13) : {wire3, reg16})) > wire1[(2'h3):(1'h0)])))
            begin
              reg19 <= (~($signed(((reg16 ? wire14 : reg16) ?
                      {wire14} : (wire2 >= (7'h40)))) ?
                  ($signed((wire9 == wire1)) ?
                      (wire1 | reg15[(3'h7):(3'h7)]) : $signed(wire0)) : {(reg5 ?
                          (wire3 >= wire13) : {wire12}),
                      (~|$signed((8'hba)))}));
              reg20 <= $signed($signed(reg18[(3'h6):(1'h0)]));
              reg21 <= $signed((|wire4[(1'h1):(1'h0)]));
              reg22 <= reg15[(4'h9):(2'h2)];
            end
          else
            begin
              reg19 <= (wire13 * $signed(({$unsigned(wire13)} <<< (((7'h43) ?
                      wire4 : wire9) ?
                  reg18 : ((8'hbb) <<< (8'hb5))))));
              reg20 <= (|reg22);
              reg21 <= (!$unsigned(reg6));
              reg22 <= wire3[(1'h0):(1'h0)];
              reg23 <= wire1;
            end
        end
      else
        begin
          reg15 <= $unsigned(((&{$signed(reg17)}) ?
              ({wire3[(1'h0):(1'h0)], $signed(reg22)} ?
                  (reg17[(2'h3):(1'h1)] ?
                      wire12[(1'h0):(1'h0)] : $signed(wire13)) : {wire9[(2'h2):(1'h1)],
                      $unsigned(wire13)}) : {reg17, (-{reg7, wire0})}));
          reg16 <= reg21;
          reg17 <= {reg6[(3'h7):(2'h3)]};
          reg18 <= ($unsigned($signed({reg18, ((8'hb1) ? reg19 : reg23)})) ?
              {(((+reg19) >> (^wire10)) ?
                      $unsigned({wire12}) : (^~((8'h9d) ?
                          reg6 : wire4)))} : (!reg21));
        end
      reg24 <= (+(reg22[(3'h5):(3'h4)] ?
          reg16 : $unsigned(reg21[(4'hd):(1'h0)])));
      reg25 <= reg15[(3'h6):(1'h0)];
      reg26 <= reg19[(4'hf):(4'h8)];
    end
  assign wire27 = (wire1[(3'h5):(1'h1)] < $signed(reg20[(1'h0):(1'h0)]));
  module28 #() modinst284 (.y(wire283), .wire32(wire2), .clk(clk), .wire30(wire0), .wire33(wire13), .wire29(reg26), .wire31(wire9));
  assign wire285 = $unsigned(reg25);
  assign wire286 = ((~&reg24[(2'h3):(2'h2)]) + $signed((wire11 - {{reg26},
                       $unsigned(wire13)})));
  assign wire287 = ($unsigned((-((7'h43) ?
                       wire10[(2'h3):(1'h1)] : $signed(wire10)))) & wire9[(3'h7):(1'h1)]);
  assign wire288 = wire27;
  assign wire289 = $signed((!(((~|wire3) >> $unsigned(wire13)) ?
                       $unsigned($signed(wire13)) : $unsigned($signed(reg8)))));
  always
    @(posedge clk) begin
      if ((reg25 ? $signed(reg17[(2'h3):(2'h2)]) : reg8))
        begin
          reg290 <= wire9;
          reg291 <= (&$signed(wire0[(4'hb):(1'h0)]));
          if (($signed((8'ha5)) ?
              $signed($unsigned((+((8'ha6) - wire4)))) : (&$signed((reg17 ?
                  (wire4 ? (8'hae) : reg5) : wire283[(1'h0):(1'h0)])))))
            begin
              reg292 <= (wire285[(1'h0):(1'h0)] ^~ wire3[(1'h0):(1'h0)]);
              reg293 <= (~^reg5);
            end
          else
            begin
              reg292 <= $signed({$signed(((reg26 != reg18) ?
                      $signed((8'h9f)) : wire288))});
              reg293 <= ($signed((~^(^reg6))) >>> $unsigned(($signed((^wire3)) ^ reg291[(3'h7):(3'h5)])));
              reg294 <= reg292;
            end
          reg295 <= wire3[(1'h1):(1'h0)];
          reg296 <= $signed(((($unsigned(wire286) ? reg25 : reg26) ?
                  wire286 : (((8'ha8) ? reg18 : wire14) ?
                      (wire9 ~^ wire10) : $unsigned(wire9))) ?
              wire11 : $unsigned(reg292)));
        end
      else
        begin
          if ($signed($unsigned(($unsigned($unsigned(wire12)) ?
              (|wire0) : wire3))))
            begin
              reg290 <= (!$signed(reg15));
              reg291 <= (~&($signed(reg290[(4'hd):(4'hb)]) ?
                  reg21[(4'h9):(4'h9)] : (reg15 ? wire1 : (~$signed(reg7)))));
            end
          else
            begin
              reg290 <= {$signed(($signed({wire1}) ?
                      wire2 : {{(8'hab), wire13}})),
                  reg16[(5'h11):(4'hd)]};
            end
        end
      reg297 <= reg22;
    end
  always
    @(posedge clk) begin
      reg298 <= ($unsigned(($signed(reg18[(2'h2):(1'h1)]) ?
          (wire4[(1'h0):(1'h0)] ?
              wire11[(2'h2):(1'h0)] : (&(7'h42))) : wire1)) * $unsigned((&reg294)));
      reg299 <= (~&$signed(reg294));
      reg300 <= ($unsigned($unsigned((8'hb1))) ?
          ({((reg295 && reg16) ? (wire13 && reg24) : {(8'h9f), reg18}),
                  $signed(reg298)} ?
              reg15 : reg290) : reg23[(5'h13):(4'hb)]);
      reg301 <= $signed(reg297);
      reg302 <= $signed((-reg291[(3'h6):(3'h5)]));
    end
endmodule

module module28
#(parameter param281 = {((8'haa) || ((8'h9f) & (((8'ha8) ? (8'had) : (8'ha3)) ? ((8'hb8) ? (8'hb6) : (8'hb4)) : ((8'hbe) + (8'ha6))))), {(|((~^(8'hbb)) || ((7'h43) && (8'h9d)))), (~(-((8'hb5) ? (8'ha9) : (8'hbe))))}}, 
parameter param282 = (param281 <<< (~^((+(param281 ? param281 : param281)) ? (8'hb9) : (param281 && (^~param281))))))
(y, clk, wire29, wire30, wire31, wire32, wire33);
  output wire [(32'h197):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire29;
  input wire [(4'hf):(1'h0)] wire30;
  input wire signed [(4'he):(1'h0)] wire31;
  input wire signed [(4'h9):(1'h0)] wire32;
  input wire [(4'he):(1'h0)] wire33;
  wire [(3'h5):(1'h0)] wire279;
  wire signed [(4'hc):(1'h0)] wire208;
  wire signed [(3'h5):(1'h0)] wire207;
  wire [(4'h8):(1'h0)] wire101;
  wire [(5'h14):(1'h0)] wire34;
  wire signed [(5'h12):(1'h0)] wire87;
  wire signed [(3'h5):(1'h0)] wire103;
  wire signed [(5'h13):(1'h0)] wire141;
  wire [(4'ha):(1'h0)] wire143;
  wire [(5'h11):(1'h0)] wire144;
  wire signed [(4'hf):(1'h0)] wire205;
  reg signed [(4'ha):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(5'h14):(1'h0)] reg145 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg148 = (1'h0);
  reg [(3'h7):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg150 = (1'h0);
  reg signed [(4'he):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg152 = (1'h0);
  reg [(3'h5):(1'h0)] reg153 = (1'h0);
  reg [(4'hb):(1'h0)] reg154 = (1'h0);
  reg [(3'h7):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg [(4'h9):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(3'h4):(1'h0)] reg159 = (1'h0);
  reg [(2'h3):(1'h0)] reg160 = (1'h0);
  reg [(3'h6):(1'h0)] reg161 = (1'h0);
  reg [(5'h13):(1'h0)] reg162 = (1'h0);
  reg [(5'h14):(1'h0)] reg163 = (1'h0);
  reg [(4'he):(1'h0)] reg164 = (1'h0);
  reg [(4'h9):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  assign y = {wire279,
                 wire208,
                 wire207,
                 wire101,
                 wire34,
                 wire87,
                 wire103,
                 wire141,
                 wire143,
                 wire144,
                 wire205,
                 reg35,
                 reg36,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg161,
                 reg162,
                 reg163,
                 reg164,
                 reg165,
                 reg166,
                 (1'h0)};
  assign wire34 = $unsigned((~|wire30[(3'h4):(2'h3)]));
  always
    @(posedge clk) begin
      reg35 <= wire32;
      reg36 <= $signed((wire34 == wire32));
    end
  module37 #() modinst88 (wire87, clk, wire30, wire34, wire33, reg35);
  module89 #() modinst102 (.wire94(wire33), .y(wire101), .wire90(wire34), .wire93(wire30), .wire92(wire87), .clk(clk), .wire91(wire29));
  assign wire103 = $unsigned((((^(-reg36)) ?
                           wire33 : $signed((reg35 | wire87))) ?
                       (wire87 && (^$signed(wire29))) : $signed($unsigned(((8'hb7) <= wire30)))));
  module104 #() modinst142 (.y(wire141), .clk(clk), .wire105(wire103), .wire108(wire34), .wire107(wire30), .wire106(wire32), .wire109(reg35));
  assign wire143 = (~&($unsigned(reg35) + wire141[(4'h9):(1'h0)]));
  assign wire144 = $unsigned(($unsigned($unsigned((8'ha4))) && wire101[(4'h8):(2'h3)]));
  always
    @(posedge clk) begin
      reg145 <= ((~^((7'h43) > $signed((wire87 >= wire33)))) > wire31);
      reg146 <= (^~wire33);
      reg147 <= wire29;
      if ({wire34})
        begin
          reg148 <= ((!{$signed((reg145 ? (7'h44) : wire33)),
              (+wire31[(3'h5):(1'h1)])}) >= ($unsigned(($signed(reg35) >> $signed(wire29))) && $unsigned($signed(wire33))));
          if ($unsigned($signed($unsigned((^~(|(8'hbe)))))))
            begin
              reg149 <= {(wire87[(4'he):(1'h1)] * ($signed((^~reg148)) ?
                      ((~reg35) ?
                          (reg145 ? wire141 : (8'hb1)) : (~reg146)) : {(wire30 ?
                              wire34 : (8'h9f)),
                          (wire103 ? (8'hbc) : wire29)}))};
              reg150 <= ($unsigned((~^$unsigned((wire103 <<< wire101)))) <<< $unsigned($signed(((8'ha2) + (reg145 <= (8'haf))))));
              reg151 <= $signed((((wire143 == (^~wire31)) ?
                  $unsigned($unsigned(reg145)) : ($signed((7'h44)) ?
                      wire30 : $unsigned(reg148))) && (&$signed((wire103 ?
                  wire33 : (8'hb5))))));
              reg152 <= reg35;
            end
          else
            begin
              reg149 <= $unsigned($unsigned((wire144 <<< {wire30[(4'h8):(3'h4)]})));
              reg150 <= wire34[(2'h2):(1'h1)];
            end
        end
      else
        begin
          if ($signed({{$unsigned((+wire34))}, wire143[(1'h0):(1'h0)]}))
            begin
              reg148 <= wire34;
              reg149 <= wire101[(3'h5):(3'h4)];
            end
          else
            begin
              reg148 <= (^((8'hb1) ?
                  (wire144[(3'h5):(1'h1)] || $unsigned(reg152[(3'h7):(1'h1)])) : wire32));
            end
        end
      reg153 <= (!$signed((~({reg151} ? (+reg147) : $signed(reg36)))));
    end
  always
    @(posedge clk) begin
      reg154 <= $unsigned(($unsigned((~^wire31)) <<< (8'had)));
      if ($unsigned($signed(wire103)))
        begin
          reg155 <= $unsigned(((^~wire34) ? $unsigned(wire144) : {wire103}));
        end
      else
        begin
          reg155 <= wire30;
        end
      if ((wire143[(4'ha):(1'h0)] ? wire87 : wire101))
        begin
          reg156 <= (8'ha5);
          reg157 <= (wire32[(4'h9):(3'h4)] == (reg149 ?
              wire87 : (((reg145 ? wire141 : reg152) ?
                  (wire32 ? wire31 : reg146) : ((8'ha5) ?
                      wire32 : wire33)) <= wire29)));
          reg158 <= (reg147 ?
              ((~($signed(reg35) ? $signed(wire30) : {reg147})) ?
                  $signed(reg148[(1'h0):(1'h0)]) : wire29[(4'h8):(4'h8)]) : {(8'hb4),
                  ({$signed(reg157),
                      (wire141 ?
                          wire87 : (8'h9d))} ~^ ((reg36 <= wire29) == (|reg148)))});
        end
      else
        begin
          reg156 <= reg150[(4'he):(4'h9)];
        end
      if (({$unsigned($signed({reg146}))} ~^ $signed(reg150[(4'h8):(3'h5)])))
        begin
          if ((~reg157))
            begin
              reg159 <= $unsigned(($signed(($unsigned(reg148) ?
                      $unsigned((8'ha9)) : (8'hbc))) ?
                  reg150 : reg145));
              reg160 <= $unsigned($signed(reg148[(1'h1):(1'h0)]));
              reg161 <= (8'ha6);
            end
          else
            begin
              reg159 <= $signed((&(((~&reg153) ~^ (reg161 ?
                      (8'hb3) : wire103)) ?
                  reg148[(1'h0):(1'h0)] : (8'ha2))));
              reg160 <= (wire141[(3'h6):(1'h1)] ?
                  (^{$unsigned(reg145),
                      $signed($signed(wire143))}) : $signed($signed(((reg151 < wire143) ?
                      reg146[(3'h6):(1'h0)] : ((8'hb5) || (8'had))))));
            end
          if ($signed(reg155[(2'h2):(2'h2)]))
            begin
              reg162 <= {$unsigned(((^reg155) ?
                      (^~reg149) : $unsigned((~|reg147)))),
                  $signed($unsigned((~^$signed(wire32))))};
              reg163 <= wire141[(3'h7):(2'h2)];
              reg164 <= $unsigned($unsigned(reg148));
              reg165 <= ((^~($signed((~reg151)) & reg164[(1'h0):(1'h0)])) ?
                  $unsigned(({{wire30,
                          reg157}} ^ reg154)) : reg150[(2'h2):(1'h0)]);
            end
          else
            begin
              reg162 <= $unsigned(wire32);
              reg163 <= reg157[(4'h9):(4'h9)];
            end
        end
      else
        begin
          reg159 <= (+(reg157[(4'h8):(2'h2)] ?
              (($unsigned(wire33) ?
                      ((8'hb3) ? wire30 : reg146) : (wire141 ^ wire30)) ?
                  $unsigned($unsigned((7'h43))) : $signed(reg162)) : $unsigned(($signed(wire103) << reg156[(2'h2):(2'h2)]))));
        end
      reg166 <= (reg153 ^~ $signed((reg153 ?
          {(^reg148)} : (reg146 ^~ reg154))));
    end
  module167 #() modinst206 (.y(wire205), .wire171(wire141), .wire172(wire29), .wire170(reg163), .clk(clk), .wire168(reg158), .wire169(wire30));
  assign wire207 = (wire31 > (wire33 ?
                       {(^(wire141 || (8'hb1))),
                           $unsigned((wire144 ?
                               reg166 : wire31))} : ((wire87 >> $signed((8'ha9))) ^ {{(8'h9f)},
                           reg155})));
  assign wire208 = reg165[(3'h7):(3'h6)];
  module209 #() modinst280 (wire279, clk, reg158, wire33, wire141, reg151, reg145);
endmodule

module module209
#(parameter param277 = ({((7'h42) ? {((8'hae) * (8'ha1)), {(8'ha9)}} : (((8'hbf) ? (8'h9f) : (8'hb2)) - (^(8'hab)))), ({(^~(8'hb4))} > ({(8'hb1)} ? {(8'hb0)} : ((8'hb2) ? (8'ha5) : (8'hb7))))} ? (8'ha6) : (~((~|((8'hb4) + (7'h42))) ? (((8'hbc) != (8'hb7)) ? ((8'h9e) ? (8'ha9) : (8'hb4)) : (~|(8'hbe))) : ({(8'h9e)} > {(8'haa)})))), 
parameter param278 = (((((param277 >= param277) || param277) < (param277 ? (^param277) : (param277 << param277))) ^~ param277) ? (((~|{param277}) != param277) >>> (((param277 == param277) <= (8'hac)) <= ((~^param277) ? param277 : ((8'hb7) + param277)))) : ((^~param277) ? (((param277 >= param277) << (param277 ? (8'ha7) : (8'ha3))) ? param277 : ((param277 ? param277 : (8'hb0)) ^ param277)) : (((!param277) ? {param277, param277} : (param277 ^ param277)) <= ({(8'hb6)} >>> {(8'hac), param277})))))
(y, clk, wire214, wire213, wire212, wire211, wire210);
  output wire [(32'h30b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire214;
  input wire signed [(4'hd):(1'h0)] wire213;
  input wire [(4'ha):(1'h0)] wire212;
  input wire signed [(4'hd):(1'h0)] wire211;
  input wire [(5'h11):(1'h0)] wire210;
  wire signed [(5'h13):(1'h0)] wire276;
  wire signed [(3'h4):(1'h0)] wire275;
  wire [(4'hc):(1'h0)] wire274;
  wire [(5'h10):(1'h0)] wire273;
  wire [(5'h15):(1'h0)] wire272;
  wire signed [(4'hb):(1'h0)] wire271;
  wire [(5'h13):(1'h0)] wire267;
  wire [(4'h8):(1'h0)] wire266;
  wire signed [(5'h13):(1'h0)] wire265;
  wire signed [(4'hc):(1'h0)] wire264;
  wire [(4'he):(1'h0)] wire263;
  wire signed [(5'h15):(1'h0)] wire262;
  wire signed [(5'h13):(1'h0)] wire261;
  wire [(4'h8):(1'h0)] wire260;
  wire signed [(5'h11):(1'h0)] wire259;
  reg signed [(4'hd):(1'h0)] reg270 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg269 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg268 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg258 = (1'h0);
  reg [(5'h11):(1'h0)] reg257 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg256 = (1'h0);
  reg [(4'h8):(1'h0)] reg255 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg254 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg253 = (1'h0);
  reg [(5'h14):(1'h0)] reg252 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg251 = (1'h0);
  reg [(5'h11):(1'h0)] reg250 = (1'h0);
  reg [(3'h7):(1'h0)] reg249 = (1'h0);
  reg [(4'hb):(1'h0)] reg248 = (1'h0);
  reg [(4'he):(1'h0)] reg247 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg246 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg245 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg244 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg243 = (1'h0);
  reg [(3'h6):(1'h0)] reg242 = (1'h0);
  reg [(4'hf):(1'h0)] reg241 = (1'h0);
  reg [(3'h6):(1'h0)] reg240 = (1'h0);
  reg signed [(4'he):(1'h0)] reg239 = (1'h0);
  reg [(2'h3):(1'h0)] reg238 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg237 = (1'h0);
  reg [(5'h13):(1'h0)] reg236 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg235 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg234 = (1'h0);
  reg [(3'h6):(1'h0)] reg233 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg232 = (1'h0);
  reg [(5'h14):(1'h0)] reg231 = (1'h0);
  reg [(3'h7):(1'h0)] reg230 = (1'h0);
  reg [(4'hd):(1'h0)] reg229 = (1'h0);
  reg [(4'hf):(1'h0)] reg228 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg227 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg226 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg225 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg224 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg223 = (1'h0);
  reg [(5'h13):(1'h0)] reg222 = (1'h0);
  reg [(4'h8):(1'h0)] reg221 = (1'h0);
  reg [(4'ha):(1'h0)] reg220 = (1'h0);
  reg [(4'ha):(1'h0)] reg219 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg218 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg217 = (1'h0);
  reg [(4'hf):(1'h0)] reg216 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg215 = (1'h0);
  assign y = {wire276,
                 wire275,
                 wire274,
                 wire273,
                 wire272,
                 wire271,
                 wire267,
                 wire266,
                 wire265,
                 wire264,
                 wire263,
                 wire262,
                 wire261,
                 wire260,
                 wire259,
                 reg270,
                 reg269,
                 reg268,
                 reg258,
                 reg257,
                 reg256,
                 reg255,
                 reg254,
                 reg253,
                 reg252,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg245,
                 reg244,
                 reg243,
                 reg242,
                 reg241,
                 reg240,
                 reg239,
                 reg238,
                 reg237,
                 reg236,
                 reg235,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 reg221,
                 reg220,
                 reg219,
                 reg218,
                 reg217,
                 reg216,
                 reg215,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg215 <= (&(wire211[(3'h5):(2'h2)] << (-{(wire214 << (8'hb7))})));
      reg216 <= $unsigned((8'haa));
      if (wire210[(4'ha):(3'h6)])
        begin
          reg217 <= wire214[(1'h1):(1'h1)];
          if (wire211[(2'h3):(2'h2)])
            begin
              reg218 <= {$unsigned($unsigned(((reg217 >= wire213) ?
                      wire214 : (reg217 <= reg217)))),
                  ((wire211 ?
                          {reg216[(1'h1):(1'h1)],
                              $signed(wire210)} : $unsigned({wire214})) ?
                      ($signed((wire214 >= (8'hb4))) ?
                          $signed((wire214 <= reg217)) : ($signed(wire214) ?
                              $signed(wire210) : (wire214 + wire210))) : ($signed($signed(reg217)) != ($unsigned(wire210) ?
                          $signed(reg217) : reg217[(3'h6):(3'h5)])))};
            end
          else
            begin
              reg218 <= $unsigned({(~|{reg218})});
              reg219 <= reg215[(2'h3):(2'h3)];
              reg220 <= wire213[(4'h9):(4'h8)];
            end
        end
      else
        begin
          if (wire214[(1'h1):(1'h1)])
            begin
              reg217 <= (!$signed((^~(&(reg217 ^ wire211)))));
              reg218 <= $signed($signed((({reg216} >= (8'ha6)) ?
                  (^~$signed((8'ha6))) : reg218)));
              reg219 <= reg219;
              reg220 <= reg218;
              reg221 <= (+(^(7'h43)));
            end
          else
            begin
              reg217 <= reg221[(2'h2):(1'h0)];
              reg218 <= $unsigned(({reg218} > {($unsigned(reg215) >> (8'hb9)),
                  (((7'h43) > wire211) | (!wire211))}));
            end
          reg222 <= ((~^$signed(($signed(wire213) != (~^wire213)))) ?
              $unsigned((+({reg219, reg217} ?
                  {reg217, reg218} : (reg219 ? reg219 : reg218)))) : reg215);
          reg223 <= reg216;
        end
      if ((reg222[(4'h9):(4'h8)] | reg222))
        begin
          if (reg220[(3'h5):(2'h2)])
            begin
              reg224 <= ((($signed($signed(reg218)) << wire211) <= reg218[(2'h2):(2'h2)]) <<< ((reg221 | $unsigned($unsigned(reg217))) ?
                  reg223 : {((wire213 <= wire212) - (wire212 ?
                          reg220 : wire213))}));
            end
          else
            begin
              reg224 <= {reg220[(3'h7):(3'h5)]};
              reg225 <= reg223;
              reg226 <= $signed((reg218 ?
                  $unsigned((^~(wire210 ?
                      wire214 : wire211))) : ((((8'hbb) * (8'hb4)) - {(8'hb9),
                      reg224}) >>> ({reg224} <<< {wire214}))));
              reg227 <= ($signed(reg220[(3'h4):(1'h0)]) << $unsigned((~&{$unsigned(reg226),
                  reg215})));
            end
          if (reg223[(4'h8):(1'h0)])
            begin
              reg228 <= $signed(reg221);
              reg229 <= $unsigned(reg223);
              reg230 <= (~|$signed(reg223));
              reg231 <= $unsigned(($unsigned(reg216[(4'hf):(4'hf)]) ?
                  $unsigned(({wire212,
                      reg217} ~^ (~^wire214))) : ($unsigned((reg227 > reg230)) > $unsigned({reg228}))));
              reg232 <= reg222;
            end
          else
            begin
              reg228 <= ($unsigned((8'hb0)) ?
                  (wire212 ?
                      $unsigned(($signed(reg217) ?
                          (wire210 <<< reg231) : $unsigned(reg219))) : $unsigned((8'hbe))) : (!$signed(wire211)));
              reg229 <= ((&(^~$unsigned((!reg227)))) ?
                  (reg227 ?
                      {$unsigned({reg221}),
                          (|(~wire213))} : (reg220[(1'h0):(1'h0)] ?
                          $unsigned((reg230 << (8'ha8))) : reg220)) : (reg225 ?
                      {reg228} : {(~$signed(wire211)), reg226[(3'h5):(1'h1)]}));
              reg230 <= (~$signed(($unsigned(wire210[(2'h2):(1'h0)]) >> ($unsigned(reg221) ?
                  (reg223 - reg230) : $unsigned(reg228)))));
            end
          reg233 <= {((8'hb7) ?
                  ({(reg224 ? reg232 : wire210)} ?
                      $unsigned((wire213 ?
                          reg227 : reg218)) : wire214[(3'h4):(2'h2)]) : reg215[(2'h3):(1'h0)]),
              $signed($unsigned($signed({reg219, reg215})))};
          reg234 <= (8'hbf);
        end
      else
        begin
          reg224 <= (+$signed($unsigned({(8'hbc)})));
        end
      reg235 <= reg234;
    end
  always
    @(posedge clk) begin
      if ($unsigned($signed((((reg226 ? reg215 : reg217) ?
          $unsigned(reg225) : (wire213 ? wire214 : (8'ha6))) - ((reg233 ?
          reg222 : reg218) >>> ((8'hb9) ? (8'ha3) : reg221))))))
        begin
          if (($unsigned(reg216) + reg223))
            begin
              reg236 <= {reg216, $unsigned(wire213[(4'hc):(3'h5)])};
              reg237 <= $signed(reg235);
            end
          else
            begin
              reg236 <= (reg235 | (~^reg225));
              reg237 <= (8'ha8);
              reg238 <= ($unsigned($signed($signed((reg223 * wire213)))) ?
                  reg225 : ($signed(reg230) ^~ $signed($signed($unsigned(wire212)))));
              reg239 <= $unsigned((&reg236));
            end
          if ((|$signed((($signed(reg227) | reg219[(3'h6):(3'h5)]) ?
              $signed((8'hb6)) : {(!reg224), reg238}))))
            begin
              reg240 <= ($signed(reg230[(1'h1):(1'h1)]) - ((~^wire211) <= (((reg235 ?
                      reg233 : reg223) ?
                  $unsigned(reg223) : reg237) - ((reg228 ? reg220 : reg239) ?
                  $unsigned(reg238) : (reg228 > reg235)))));
              reg241 <= $unsigned((($signed(reg240) << $signed((wire211 > reg231))) > (~&$signed((+reg229)))));
              reg242 <= $signed(reg234);
              reg243 <= $signed(reg237);
            end
          else
            begin
              reg240 <= {reg223, ({$signed(((8'hbb) ~^ reg225))} | reg226)};
              reg241 <= $signed((|$signed(reg241[(4'he):(4'ha)])));
              reg242 <= (wire211 * $unsigned($unsigned(((reg222 ?
                  reg241 : reg219) << (8'ha0)))));
            end
          if (wire210[(3'h5):(1'h0)])
            begin
              reg244 <= (|$unsigned($unsigned(reg233)));
              reg245 <= $signed(wire211);
            end
          else
            begin
              reg244 <= (wire212[(3'h7):(3'h6)] < reg243[(4'h8):(1'h0)]);
              reg245 <= {reg229[(2'h2):(2'h2)],
                  (reg237 ?
                      $unsigned(({reg226,
                          reg220} ^~ {reg238})) : reg242[(1'h1):(1'h0)])};
              reg246 <= ((reg221 ?
                  ($signed(((7'h41) >> reg216)) << (^{(8'hbf)})) : ($unsigned((reg217 <= reg243)) ?
                      (^~$unsigned(reg228)) : ($signed(reg220) ~^ $unsigned(reg243)))) >= (&reg224));
              reg247 <= $signed(reg236);
            end
          if ($signed((reg242[(2'h2):(2'h2)] ~^ (8'hb4))))
            begin
              reg248 <= {reg229, (^~(!$unsigned((reg247 ^~ reg225))))};
              reg249 <= $signed(reg220);
              reg250 <= {(~reg232)};
            end
          else
            begin
              reg248 <= (($signed(((^reg227) ? reg247 : $unsigned(reg243))) ?
                      reg228[(3'h7):(3'h7)] : $signed($signed((reg236 ?
                          reg237 : reg234)))) ?
                  {(reg219 >>> reg227[(1'h1):(1'h1)])} : $unsigned(wire211[(4'ha):(1'h0)]));
            end
          if ($signed(reg229[(2'h2):(1'h1)]))
            begin
              reg251 <= $signed((^~reg249));
              reg252 <= $signed(((-reg248) >>> (reg216[(2'h2):(2'h2)] >> (((8'h9e) ?
                      wire212 : reg224) ?
                  (reg242 * reg242) : (reg215 & reg230)))));
            end
          else
            begin
              reg251 <= reg244[(3'h5):(2'h2)];
              reg252 <= {$unsigned($signed(reg243[(3'h4):(2'h2)])),
                  (((reg242[(3'h4):(2'h3)] ?
                      (~|wire212) : (reg230 || reg223)) >= reg247[(4'ha):(3'h7)]) + reg218)};
              reg253 <= $unsigned(reg246);
              reg254 <= $signed((reg247[(4'he):(4'hb)] ?
                  (^~reg235) : (+reg242)));
            end
        end
      else
        begin
          reg236 <= wire212[(4'h9):(1'h1)];
          reg237 <= $signed($unsigned($signed(($unsigned(wire213) != $unsigned(reg229)))));
          reg238 <= (reg232[(3'h7):(3'h7)] && $signed((|wire212[(1'h1):(1'h1)])));
        end
      reg255 <= ($signed((~|$unsigned($unsigned((8'hba))))) ^~ (reg232[(4'ha):(4'h9)] ^~ reg243));
      reg256 <= (reg241 <= $signed(wire211));
      reg257 <= (((~reg218) ?
          $signed((8'ha9)) : $unsigned(reg246[(2'h2):(2'h2)])) ^~ {(!($unsigned(reg248) ?
              $signed(reg255) : (^reg227)))});
      reg258 <= reg224;
    end
  assign wire259 = reg252[(2'h3):(2'h2)];
  assign wire260 = (~&(($signed($unsigned(reg238)) && {(reg236 <<< reg215),
                           {reg251, reg225}}) ?
                       $unsigned($unsigned(reg249[(3'h5):(2'h2)])) : reg228));
  assign wire261 = $unsigned($unsigned(({(reg246 ? reg253 : reg257),
                           (reg237 ? (8'hbf) : (8'hb6))} ?
                       ((reg253 || reg231) || $signed(reg252)) : {$unsigned(reg255)})));
  assign wire262 = $signed((~^(^~$unsigned($unsigned(reg256)))));
  assign wire263 = $signed((reg216 ?
                       (reg258 | (~&(reg258 + reg238))) : (^($unsigned((8'haa)) <<< (&reg215)))));
  assign wire264 = $unsigned($signed(((((8'hbb) ?
                       (8'ha7) : reg241) << (reg254 || reg256)) | $unsigned((reg243 ?
                       reg240 : wire262)))));
  assign wire265 = ({(reg252[(4'h9):(3'h6)] ?
                               ((reg254 - reg236) >> (reg240 & (8'hb8))) : $unsigned($unsigned(reg255)))} ?
                       reg228 : $signed((&(|$unsigned(reg220)))));
  assign wire266 = $signed(reg224[(1'h0):(1'h0)]);
  assign wire267 = reg233;
  always
    @(posedge clk) begin
      reg268 <= wire211[(2'h2):(1'h0)];
      reg269 <= $signed((reg257[(3'h6):(2'h3)] <= wire211[(1'h0):(1'h0)]));
      reg270 <= $unsigned((~&(((^reg235) ? ((8'ha7) & reg252) : reg249) ?
          wire259[(3'h5):(1'h0)] : reg237)));
    end
  assign wire271 = (reg217 ?
                       wire214 : {$signed(reg216[(4'hd):(4'hc)]),
                           $signed(reg230[(2'h2):(2'h2)])});
  assign wire272 = $unsigned($signed({$signed((~&reg215))}));
  assign wire273 = $signed(reg234);
  assign wire274 = ($unsigned(reg270[(2'h2):(1'h1)]) <<< reg248);
  assign wire275 = wire211;
  assign wire276 = $unsigned($unsigned((~((reg252 && wire275) - wire273[(1'h0):(1'h0)]))));
endmodule

module module167
#(parameter param204 = ((&(((~(8'ha7)) ? ((7'h42) ? (8'hbf) : (8'ha1)) : ((8'ha3) ? (8'ha6) : (7'h44))) ? {(+(8'ha6))} : (((7'h42) ? (8'hb1) : (8'h9c)) ? {(8'ha3)} : ((8'ha8) ? (8'haf) : (8'h9f))))) - {(!(((8'hac) ? (8'haa) : (8'hbe)) < ((8'hb4) * (7'h40))))}))
(y, clk, wire172, wire171, wire170, wire169, wire168);
  output wire [(32'h171):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire172;
  input wire [(5'h13):(1'h0)] wire171;
  input wire [(5'h10):(1'h0)] wire170;
  input wire signed [(3'h4):(1'h0)] wire169;
  input wire [(4'ha):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire201;
  wire signed [(5'h12):(1'h0)] wire200;
  wire [(3'h5):(1'h0)] wire199;
  wire signed [(4'hf):(1'h0)] wire198;
  wire signed [(4'hd):(1'h0)] wire192;
  wire signed [(5'h12):(1'h0)] wire191;
  wire signed [(5'h11):(1'h0)] wire190;
  wire [(2'h3):(1'h0)] wire189;
  wire [(4'hb):(1'h0)] wire188;
  wire [(5'h13):(1'h0)] wire187;
  wire [(5'h11):(1'h0)] wire186;
  wire [(5'h12):(1'h0)] wire185;
  wire [(2'h2):(1'h0)] wire184;
  wire signed [(3'h6):(1'h0)] wire178;
  wire [(5'h11):(1'h0)] wire177;
  wire signed [(4'hc):(1'h0)] wire176;
  wire signed [(5'h12):(1'h0)] wire175;
  wire signed [(4'hb):(1'h0)] wire174;
  wire [(4'h9):(1'h0)] wire173;
  reg signed [(4'hc):(1'h0)] reg203 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg202 = (1'h0);
  reg [(5'h14):(1'h0)] reg197 = (1'h0);
  reg [(3'h5):(1'h0)] reg196 = (1'h0);
  reg signed [(4'he):(1'h0)] reg195 = (1'h0);
  reg [(4'ha):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg [(4'hd):(1'h0)] reg183 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg182 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg181 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg180 = (1'h0);
  reg [(4'ha):(1'h0)] reg179 = (1'h0);
  assign y = {wire201,
                 wire200,
                 wire199,
                 wire198,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire188,
                 wire187,
                 wire186,
                 wire185,
                 wire184,
                 wire178,
                 wire177,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 reg203,
                 reg202,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 (1'h0)};
  assign wire173 = (~^(^~(~(~$signed(wire170)))));
  assign wire174 = wire170[(4'ha):(2'h3)];
  assign wire175 = $signed($unsigned($signed(wire174[(3'h5):(2'h3)])));
  assign wire176 = $signed({wire172});
  assign wire177 = (!(+wire173));
  assign wire178 = $signed((~|$signed({$signed((8'hbb))})));
  always
    @(posedge clk) begin
      if ((8'hba))
        begin
          reg179 <= ((~|(^~$signed(wire177[(1'h1):(1'h0)]))) >= ((&$unsigned(wire175[(3'h5):(3'h5)])) ?
              $signed(wire177) : wire175));
          reg180 <= (8'ha4);
          reg181 <= {((^({reg179} ?
                  $signed((8'hab)) : ((8'h9c) ?
                      reg179 : wire169))) >> $unsigned((wire171[(3'h7):(1'h0)] ?
                  wire175[(3'h5):(2'h3)] : ((8'hae) ? wire176 : wire170))))};
        end
      else
        begin
          if ({(~&({wire174} >>> (!$signed(wire169)))),
              (~^(wire170 + {$unsigned(wire177), wire177[(4'he):(3'h4)]}))})
            begin
              reg179 <= {reg179,
                  ($unsigned((wire173 ?
                          wire175[(5'h10):(4'he)] : (reg180 ?
                              wire169 : wire171))) ?
                      (|wire176) : $signed(((&wire174) ?
                          $unsigned((8'hbc)) : (wire170 ?
                              (8'hbd) : wire173))))};
              reg180 <= (-$signed(wire178[(3'h6):(2'h3)]));
            end
          else
            begin
              reg179 <= wire175;
              reg180 <= (wire178[(3'h4):(3'h4)] == ({$unsigned(wire174[(4'ha):(4'ha)]),
                  ((wire173 ? reg180 : wire172) >>> {wire178,
                      wire178})} == ({(wire175 ? (8'hbb) : wire175)} ?
                  reg180 : (8'ha6))));
              reg181 <= $signed(wire174);
              reg182 <= (8'hae);
            end
        end
      reg183 <= wire172;
    end
  assign wire184 = (((^($unsigned(wire169) ?
                       ((8'hae) ~^ wire174) : wire172[(4'h9):(2'h2)])) & (wire176[(3'h6):(2'h2)] ^ $signed((^~reg179)))) ^ ({(^~{wire173,
                               reg180}),
                           wire168} ?
                       ($signed(wire178[(1'h1):(1'h0)]) ?
                           reg182 : (-(wire173 ?
                               wire178 : reg180))) : wire177));
  assign wire185 = (+((($signed((8'ha5)) ?
                       {(8'hbc),
                           wire170} : reg179[(3'h7):(2'h3)]) >>> $signed({reg183,
                       wire170})) != (reg183 <<< wire184)));
  assign wire186 = wire178[(3'h5):(2'h3)];
  assign wire187 = (|$signed(($signed($signed(wire184)) && (~^(|reg183)))));
  assign wire188 = {$signed({(wire174[(3'h6):(1'h0)] < (wire174 ?
                               wire169 : (8'ha2))),
                           $signed((^~wire174))}),
                       wire175};
  assign wire189 = {(($unsigned((~^reg183)) >= wire177[(5'h10):(3'h4)]) ?
                           ({((8'hb0) || wire185)} | (7'h40)) : $unsigned(wire169)),
                       reg179[(4'h9):(3'h5)]};
  assign wire190 = $signed(wire186[(3'h7):(3'h5)]);
  assign wire191 = (~|$signed(({{wire184, wire186},
                       (reg182 ?
                           (8'hb6) : wire173)} <= ((wire177 != wire189) < {wire188,
                       (8'hac)}))));
  assign wire192 = (wire191[(5'h11):(1'h0)] ^~ wire169[(2'h2):(1'h0)]);
  always
    @(posedge clk) begin
      reg193 <= (8'hb0);
      reg194 <= (wire188 >> {$signed($signed($unsigned(wire186))), wire191});
      reg195 <= (8'hb3);
      reg196 <= {$signed($unsigned($signed(reg181[(3'h5):(1'h1)])))};
      reg197 <= $signed((wire178 ?
          (+(8'hba)) : (+((reg179 >= wire192) >>> wire186[(3'h4):(2'h2)]))));
    end
  assign wire198 = reg193[(3'h4):(1'h0)];
  assign wire199 = wire173[(1'h0):(1'h0)];
  assign wire200 = (reg196[(1'h0):(1'h0)] ?
                       $unsigned(reg195[(4'h8):(3'h6)]) : wire174);
  assign wire201 = (8'ha1);
  always
    @(posedge clk) begin
      reg202 <= $signed($unsigned(reg193));
      reg203 <= (|reg193);
    end
endmodule

module module104  (y, clk, wire109, wire108, wire107, wire106, wire105);
  output wire [(32'h15d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire109;
  input wire [(4'hb):(1'h0)] wire108;
  input wire signed [(4'hf):(1'h0)] wire107;
  input wire signed [(4'h9):(1'h0)] wire106;
  input wire signed [(2'h3):(1'h0)] wire105;
  wire [(3'h4):(1'h0)] wire122;
  wire [(5'h11):(1'h0)] wire121;
  wire [(4'ha):(1'h0)] wire120;
  wire [(3'h4):(1'h0)] wire119;
  wire [(5'h10):(1'h0)] wire118;
  wire signed [(4'h8):(1'h0)] wire117;
  wire [(3'h6):(1'h0)] wire116;
  wire [(4'ha):(1'h0)] wire114;
  wire signed [(5'h13):(1'h0)] wire113;
  wire [(5'h13):(1'h0)] wire112;
  wire [(5'h15):(1'h0)] wire111;
  wire [(4'h9):(1'h0)] wire110;
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg139 = (1'h0);
  reg [(5'h14):(1'h0)] reg138 = (1'h0);
  reg [(4'h8):(1'h0)] reg137 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg136 = (1'h0);
  reg [(5'h13):(1'h0)] reg135 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg134 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg133 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg132 = (1'h0);
  reg [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(5'h12):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg128 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg127 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg126 = (1'h0);
  reg [(4'hf):(1'h0)] reg125 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(3'h4):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg115 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 reg136,
                 reg135,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 reg126,
                 reg125,
                 reg124,
                 reg123,
                 reg115,
                 (1'h0)};
  assign wire110 = $signed(wire105);
  assign wire111 = $signed({(-wire106)});
  assign wire112 = ((((~^{wire108, wire105}) ?
                       wire106 : wire109[(2'h2):(1'h0)]) ^ (8'haa)) * (^~$signed(wire107[(2'h3):(1'h1)])));
  assign wire113 = wire108[(3'h4):(1'h0)];
  assign wire114 = (&wire107[(3'h7):(1'h1)]);
  always
    @(posedge clk) begin
      reg115 <= wire105[(1'h1):(1'h1)];
    end
  assign wire116 = wire106;
  assign wire117 = wire110[(2'h3):(2'h2)];
  assign wire118 = $signed(((^{(-wire114)}) <<< $unsigned(wire114[(1'h1):(1'h1)])));
  assign wire119 = wire113;
  assign wire120 = {($signed((wire111[(4'hc):(4'h9)] * reg115)) ?
                           wire112 : (($signed(wire109) && wire118) ?
                               $unsigned($signed((8'hbe))) : wire107[(2'h2):(2'h2)]))};
  assign wire121 = {(~&($signed((wire105 | wire111)) && $signed($signed(wire120))))};
  assign wire122 = ((~&(-wire117[(1'h0):(1'h0)])) ? (~wire109) : wire107);
  always
    @(posedge clk) begin
      if (($signed(({((7'h40) ? reg115 : wire117), wire108} ?
              $unsigned(((8'hb6) * reg115)) : $signed({wire109, wire122}))) ?
          (7'h41) : wire113[(4'hd):(3'h5)]))
        begin
          reg123 <= wire112[(4'he):(2'h2)];
          reg124 <= wire113;
          reg125 <= (~(wire121 ?
              (wire107 ? (~&$signed(wire117)) : (8'hbe)) : (-{$signed(wire108),
                  $signed(wire119)})));
        end
      else
        begin
          reg123 <= reg115;
          reg124 <= (|($unsigned({wire107[(1'h0):(1'h0)], $signed(wire106)}) ?
              (+{(wire107 * wire117)}) : $unsigned((8'hb0))));
          reg125 <= wire110;
          if (({(+reg123[(3'h4):(1'h1)])} || (-wire105)))
            begin
              reg126 <= wire108[(4'h8):(1'h0)];
            end
          else
            begin
              reg126 <= $unsigned($signed((+(^{(8'haf)}))));
              reg127 <= wire112;
              reg128 <= ({wire117} ?
                  {$unsigned($unsigned((+wire121)))} : $unsigned((&((^~(8'hb4)) ?
                      $unsigned(wire108) : (reg126 > wire106)))));
              reg129 <= wire118[(4'h8):(1'h1)];
              reg130 <= $unsigned((8'ha7));
            end
        end
      reg131 <= (~^(~|$unsigned(((wire106 > wire118) ?
          (wire112 ? (8'hba) : wire106) : (!wire110)))));
      reg132 <= (|$unsigned(wire119));
    end
  always
    @(posedge clk) begin
      reg133 <= wire121;
      reg134 <= ($unsigned((((wire120 ^ wire111) < (reg125 ?
              wire111 : reg124)) >>> (&(reg133 != reg129)))) ?
          $unsigned({((wire117 ?
                  (8'hab) : wire112) <<< reg124)}) : reg129[(4'ha):(4'h8)]);
      if ((($unsigned(reg131) >= wire122) == $unsigned(wire119)))
        begin
          if ($signed({$unsigned($signed(wire109[(3'h4):(3'h4)])), reg125}))
            begin
              reg135 <= $signed((8'haa));
              reg136 <= $signed(reg128);
              reg137 <= reg136;
            end
          else
            begin
              reg135 <= wire114[(1'h1):(1'h0)];
            end
          reg138 <= (reg128 ? reg135 : wire109);
          reg139 <= wire105[(1'h1):(1'h1)];
        end
      else
        begin
          reg135 <= $unsigned(((8'ha0) ?
              wire119[(1'h0):(1'h0)] : $signed(((-wire116) ?
                  $unsigned(wire117) : wire114))));
          reg136 <= ((~$signed((wire116[(2'h3):(2'h3)] ?
                  ((8'h9f) && (8'hbb)) : (~|reg138)))) ?
              (8'ha3) : $signed(((~(reg130 && reg131)) ?
                  (~wire117[(2'h2):(1'h0)]) : (wire111 ?
                      wire109 : (+(8'ha2))))));
        end
      reg140 <= (8'ha8);
    end
endmodule

module module89
#(parameter param99 = (~^(~|((((8'hb0) ? (8'h9e) : (8'hae)) ? {(8'hae)} : ((8'ha6) ? (8'had) : (8'ha3))) ? (~((8'hbe) - (8'hb8))) : ({(8'ha9), (8'hb7)} || ((7'h42) << (8'hb4)))))), 
parameter param100 = param99)
(y, clk, wire94, wire93, wire92, wire91, wire90);
  output wire [(32'h1d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire94;
  input wire [(3'h6):(1'h0)] wire93;
  input wire signed [(5'h12):(1'h0)] wire92;
  input wire [(2'h3):(1'h0)] wire91;
  input wire [(5'h14):(1'h0)] wire90;
  wire signed [(4'hd):(1'h0)] wire98;
  wire signed [(3'h6):(1'h0)] wire97;
  wire signed [(3'h6):(1'h0)] wire96;
  wire [(2'h3):(1'h0)] wire95;
  assign y = {wire98, wire97, wire96, wire95, (1'h0)};
  assign wire95 = (-((~&wire94) ?
                      ((8'hae) * $signed(wire94)) : $unsigned($signed(wire91))));
  assign wire96 = (((($unsigned(wire90) * $signed(wire95)) ?
                      $unsigned(wire93) : $unsigned(wire92[(3'h5):(3'h4)])) == ($unsigned(((8'h9e) || wire93)) ?
                      $signed($signed(wire93)) : wire93[(3'h5):(1'h1)])) && wire94);
  assign wire97 = $unsigned((wire94 ?
                      wire93 : (~(!((8'ha9) ? wire90 : wire93)))));
  assign wire98 = $unsigned($signed((wire92 ?
                      wire90[(4'ha):(3'h4)] : $unsigned((8'hb3)))));
endmodule

module module37  (y, clk, wire41, wire40, wire39, wire38);
  output wire [(32'h207):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hd):(1'h0)] wire41;
  input wire [(2'h3):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  input wire signed [(4'ha):(1'h0)] wire38;
  wire signed [(4'hd):(1'h0)] wire86;
  wire [(4'hb):(1'h0)] wire83;
  wire [(3'h6):(1'h0)] wire82;
  wire [(4'ha):(1'h0)] wire53;
  wire [(4'hc):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire47;
  wire [(5'h12):(1'h0)] wire46;
  wire [(4'he):(1'h0)] wire45;
  wire [(3'h7):(1'h0)] wire44;
  wire [(5'h10):(1'h0)] wire43;
  wire [(3'h5):(1'h0)] wire42;
  reg [(3'h7):(1'h0)] reg85 = (1'h0);
  reg [(3'h7):(1'h0)] reg84 = (1'h0);
  reg [(4'hb):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg77 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg76 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg74 = (1'h0);
  reg [(5'h13):(1'h0)] reg73 = (1'h0);
  reg [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg69 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(3'h4):(1'h0)] reg65 = (1'h0);
  reg [(5'h10):(1'h0)] reg64 = (1'h0);
  reg [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h10):(1'h0)] reg62 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg58 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg57 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg56 = (1'h0);
  reg [(4'hc):(1'h0)] reg55 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg52 = (1'h0);
  reg [(5'h10):(1'h0)] reg51 = (1'h0);
  reg [(4'h8):(1'h0)] reg50 = (1'h0);
  assign y = {wire86,
                 wire83,
                 wire82,
                 wire53,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 reg85,
                 reg84,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
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
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire42 = wire38;
  assign wire43 = {$unsigned(wire42[(2'h3):(2'h3)]),
                      ($signed(($unsigned(wire39) >> wire39[(3'h7):(3'h6)])) > wire40)};
  assign wire44 = (($unsigned((+wire43[(4'hd):(4'h8)])) <<< (wire40[(1'h0):(1'h0)] == {$signed((8'ha2)),
                          (wire42 + wire41)})) ?
                      (wire40[(1'h0):(1'h0)] | (($unsigned(wire40) ~^ {wire43}) ?
                          wire40[(2'h2):(2'h2)] : (&(wire42 <= wire41)))) : (wire38 ?
                          (wire38[(3'h7):(3'h6)] < ((~|wire39) >= (wire41 ?
                              wire40 : wire43))) : $unsigned((~&wire43))));
  assign wire45 = $unsigned(wire41);
  assign wire46 = wire44;
  assign wire47 = wire39;
  assign wire48 = wire38[(3'h5):(2'h2)];
  assign wire49 = (+wire43);
  always
    @(posedge clk) begin
      reg50 <= wire43[(5'h10):(1'h0)];
      reg51 <= ($signed(($unsigned((wire40 ?
          wire39 : wire45)) != $unsigned($signed(wire44)))) > (-wire48[(1'h1):(1'h0)]));
      reg52 <= ((&(~&$unsigned(wire40[(1'h1):(1'h1)]))) ?
          $unsigned((+(+((8'hb0) ? wire44 : wire47)))) : wire49[(3'h4):(1'h1)]);
    end
  assign wire53 = wire47[(3'h4):(2'h3)];
  always
    @(posedge clk) begin
      if ((($signed((~wire45)) ?
              {wire48[(2'h2):(1'h1)]} : $signed((~&reg50[(3'h6):(2'h3)]))) ?
          ((-wire49) ? wire48 : wire43[(3'h6):(3'h5)]) : wire41[(1'h1):(1'h0)]))
        begin
          reg54 <= $unsigned(wire46);
          if (($signed($unsigned(reg52)) <<< wire45))
            begin
              reg55 <= wire38;
              reg56 <= $unsigned($signed(wire46));
            end
          else
            begin
              reg55 <= $unsigned(reg55[(4'h9):(1'h0)]);
              reg56 <= $unsigned({{(&wire40), wire48[(2'h2):(2'h2)]}});
              reg57 <= wire47;
              reg58 <= reg55;
              reg59 <= ((8'h9d) ?
                  (8'hb3) : (wire42 | ((&((8'ha8) ?
                      wire53 : wire46)) <<< $unsigned(reg52[(2'h3):(2'h3)]))));
            end
        end
      else
        begin
          reg54 <= ((+(((wire38 ?
              reg59 : reg54) >>> wire43[(1'h1):(1'h0)]) <= (((7'h43) > reg51) ?
              wire49[(4'ha):(4'h8)] : reg56))) | wire42[(1'h1):(1'h0)]);
          if ((~^$unsigned((&(~^wire44[(1'h1):(1'h1)])))))
            begin
              reg55 <= ($signed(($unsigned({wire47, wire48}) - ((!wire47) ?
                      (^~reg55) : (wire38 >> wire42)))) ?
                  $signed(wire44) : (~|$signed((!{wire53}))));
            end
          else
            begin
              reg55 <= ({$unsigned({$signed(wire44),
                      wire41})} ^~ (~&($signed((wire39 <<< wire43)) <<< reg51[(2'h3):(1'h1)])));
            end
          reg56 <= wire44[(3'h6):(3'h6)];
          reg57 <= (-$unsigned(({wire46, {reg52, reg51}} ?
              ({wire39, reg56} == reg58[(4'hd):(3'h6)]) : {$signed(wire46),
                  reg57})));
        end
      if ({($signed((~&$unsigned(reg51))) ?
              {wire39} : (~|wire41[(4'hd):(1'h1)]))})
        begin
          reg60 <= {($signed($signed(wire41[(3'h7):(3'h7)])) >= $signed($unsigned($unsigned((8'ha9))))),
              ($unsigned(wire41) >>> {{$unsigned(reg54)}})};
          reg61 <= (^~wire46);
          reg62 <= (~&$unsigned($unsigned(wire40[(1'h1):(1'h1)])));
        end
      else
        begin
          reg60 <= $signed(wire42);
          reg61 <= reg61[(5'h10):(1'h1)];
        end
      reg63 <= wire46[(3'h5):(3'h4)];
      reg64 <= wire45[(1'h0):(1'h0)];
      if ({((^$unsigned(wire48)) ?
              (|reg51[(4'ha):(3'h5)]) : $unsigned(((7'h44) >> $signed((8'hbf)))))})
        begin
          reg65 <= ({$signed($signed((~&wire53)))} ^~ {$signed(wire44),
              $unsigned($signed(wire40))});
        end
      else
        begin
          reg65 <= wire41;
          reg66 <= (~^(&wire46));
          if (($unsigned((~$signed((7'h40)))) == ((&{wire48[(1'h0):(1'h0)],
                  wire53[(3'h7):(3'h5)]}) ?
              ((~&$unsigned(wire47)) || wire49) : {((&reg63) ?
                      (wire38 * wire48) : $signed(wire40))})))
            begin
              reg67 <= wire43;
              reg68 <= (~|$unsigned($unsigned(((^(8'hb3)) ^ wire38[(3'h7):(3'h4)]))));
              reg69 <= $signed((($signed(wire40) != $signed(reg58[(3'h6):(2'h3)])) ?
                  (8'hae) : (^~reg58[(3'h5):(3'h5)])));
            end
          else
            begin
              reg67 <= (wire40[(1'h1):(1'h0)] * {((^~$signed(wire44)) <<< (~wire45))});
            end
          reg70 <= (~$unsigned((wire41 | {(wire49 ? wire48 : reg52),
              $signed(reg57)})));
        end
    end
  always
    @(posedge clk) begin
      reg71 <= (&$signed(reg68[(4'hb):(3'h6)]));
      reg72 <= (wire41[(3'h6):(3'h6)] ? (^~$unsigned(wire47)) : wire42);
      if ($signed((~&$signed($signed(((8'h9d) + reg64))))))
        begin
          reg73 <= reg65;
        end
      else
        begin
          reg73 <= $signed($unsigned({($signed(wire42) ?
                  reg63[(3'h4):(2'h3)] : $unsigned(reg52)),
              ((wire46 == wire49) ? $unsigned(reg71) : $unsigned(reg69))}));
        end
      if ($unsigned((~|wire53)))
        begin
          reg74 <= (~|((|(-$signed(wire42))) ?
              reg70[(2'h3):(1'h1)] : ($signed((~|reg69)) ?
                  $signed({wire46, (8'h9f)}) : wire43[(1'h0):(1'h0)])));
          reg75 <= ($signed(reg61[(4'ha):(4'ha)]) ?
              (~$signed(wire45)) : {(~|wire40), (7'h40)});
          if ((&(($unsigned(reg67) ?
                  $unsigned($unsigned(reg66)) : $signed(reg57)) ?
              ((~&reg63[(3'h6):(2'h3)]) ?
                  ((+reg52) ^~ $signed(reg58)) : $signed($unsigned(wire38))) : ($unsigned((wire39 <<< reg52)) ?
                  (^~(reg62 < reg70)) : $signed(reg51)))))
            begin
              reg76 <= ($unsigned((-$signed(reg66[(4'hb):(1'h0)]))) ?
                  ($unsigned(((reg74 < wire39) ? (8'hb7) : reg75)) ?
                      reg59[(2'h3):(2'h2)] : wire53[(3'h5):(1'h1)]) : (reg62[(2'h3):(1'h0)] ?
                      reg65[(3'h4):(2'h2)] : (reg52[(3'h5):(2'h2)] | {reg74[(3'h4):(2'h2)]})));
              reg77 <= $signed($signed((({reg56, reg67} ?
                  (^(8'ha6)) : reg55) < (-wire39))));
            end
          else
            begin
              reg76 <= $unsigned(reg56);
              reg77 <= reg73;
              reg78 <= {{{$signed({(8'hbb), reg57})}},
                  (|{reg57[(1'h0):(1'h0)],
                      ($signed(reg63) <= (reg52 * reg54))})};
              reg79 <= (reg64[(3'h7):(3'h4)] ?
                  wire53[(4'ha):(4'h9)] : (wire38 ?
                      {(reg70[(4'hf):(4'hd)] ^ (!wire46))} : wire53));
            end
          reg80 <= reg50;
        end
      else
        begin
          reg74 <= $signed($unsigned(($unsigned($unsigned((8'haf))) && {reg72,
              {reg62}})));
          if (reg71[(4'hd):(2'h2)])
            begin
              reg75 <= ($signed(((~^reg55) ? $unsigned(reg52) : (~|reg76))) ?
                  ({(wire44 ? reg64 : $signed(reg76))} ?
                      ({{wire41, reg51},
                          (wire53 ?
                              reg50 : reg77)} >> wire53) : ((&(wire46 == wire43)) ?
                          ($signed(reg64) ?
                              $unsigned(reg67) : (~^reg73)) : ((wire53 ?
                                  reg72 : reg67) ?
                              reg71 : wire53))) : $unsigned(wire38[(4'h9):(2'h2)]));
            end
          else
            begin
              reg75 <= (~|$signed($signed(reg58[(5'h10):(3'h6)])));
            end
          reg76 <= (reg79 ^ $unsigned((({wire38, reg51} + (reg52 != (8'hb7))) ?
              $signed($signed(reg63)) : (!$signed(wire49)))));
        end
      reg81 <= $unsigned(($signed(reg80[(4'hb):(1'h0)]) >>> (~&((reg78 ?
              (8'hb5) : reg51) ?
          (reg60 <<< reg61) : (~|reg75)))));
    end
  assign wire82 = ($unsigned({reg70[(4'hf):(4'hd)], $signed(reg60)}) ?
                      $signed($signed($unsigned($unsigned((8'ha2))))) : $signed((8'hb8)));
  assign wire83 = (reg78 ~^ (($unsigned((-reg74)) ?
                          wire41 : ((^~reg81) + (reg54 ? reg55 : reg70))) ?
                      $unsigned($unsigned(reg75[(4'hf):(4'hd)])) : (~|(^~reg75))));
  always
    @(posedge clk) begin
      reg84 <= ((^(wire82 ?
          (8'hb0) : (~&(wire45 ? (8'ha5) : (7'h43))))) & {(((wire40 ?
                  wire46 : reg68) >> {reg69, reg62}) ?
              ($signed(wire46) ?
                  $unsigned(reg81) : {(8'ha2),
                      reg77}) : ($unsigned(reg64) <<< ((8'hb0) || (8'hae))))});
      reg85 <= {((^~($unsigned(reg69) ? (wire49 & reg54) : reg59)) | reg79)};
    end
  assign wire86 = (8'haf);
endmodule
