module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h74):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire4;
  input wire signed [(2'h2):(1'h0)] wire3;
  input wire [(4'h8):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'h9):(1'h0)] wire0;
  wire [(5'h13):(1'h0)] wire92;
  wire signed [(5'h13):(1'h0)] wire12;
  wire signed [(4'h9):(1'h0)] wire11;
  wire signed [(2'h2):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(5'h10):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(4'h9):(1'h0)] wire5;
  assign y = {wire92,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 (1'h0)};
  assign wire5 = (($signed($signed((+wire0))) & $signed(wire1[(1'h0):(1'h0)])) > wire0[(3'h5):(1'h1)]);
  assign wire6 = wire3;
  assign wire7 = wire5;
  assign wire8 = wire6;
  assign wire9 = $unsigned((-(8'hae)));
  assign wire10 = (^~wire5[(4'h8):(1'h0)]);
  assign wire11 = (({wire3} == {wire7[(4'hd):(3'h6)], wire0[(3'h5):(1'h0)]}) ?
                      (+($unsigned({wire2}) ?
                          $unsigned(wire4[(2'h3):(1'h0)]) : $unsigned($unsigned(wire9)))) : (wire8[(2'h2):(1'h0)] ?
                          ((~&$unsigned((8'ha0))) ?
                              (&wire6) : $unsigned($signed(wire6))) : $unsigned({wire3[(1'h0):(1'h0)]})));
  assign wire12 = $unsigned((wire10[(1'h0):(1'h0)] ?
                      (($unsigned(wire2) >> (8'hbc)) ^ ((wire8 ?
                          wire4 : (8'hab)) != (wire11 ?
                          wire7 : (8'hbc)))) : (8'ha2)));
  module13 #() modinst93 (.y(wire92), .wire16(wire6), .wire17(wire1), .clk(clk), .wire14(wire9), .wire15(wire7));
endmodule

module module13
#(parameter param90 = ((!((((8'hbb) | (8'hae)) > ((7'h43) ^~ (8'hb4))) * {(~&(8'ha1))})) ? (((((8'hbc) ? (8'haf) : (8'ha4)) ? ((8'ha8) ~^ (8'ha1)) : ((8'ha4) ? (8'hb0) : (7'h44))) ? (((8'h9e) ? (8'hb7) : (8'hae)) ? ((8'hb5) <= (8'hb8)) : (^~(8'haa))) : (!((8'hb5) ? (7'h40) : (8'ha8)))) ~^ {(~&(&(8'h9e)))}) : (((-((8'hb1) != (8'hba))) ? (((8'hb6) ? (8'ha9) : (8'hb3)) ? (^(8'h9d)) : {(8'hbb)}) : {((8'ha8) ? (7'h42) : (7'h42))}) <= (((~(8'hb8)) + ((8'hbd) == (8'hb9))) ? ({(8'ha1), (7'h44)} ^ (!(7'h44))) : {((8'hb4) ? (8'hb9) : (8'hb2)), {(8'ha5), (8'hb0)}}))), 
parameter param91 = (8'ha2))
(y, clk, wire17, wire16, wire15, wire14);
  output wire [(32'h210):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h2):(1'h0)] wire17;
  input wire signed [(2'h2):(1'h0)] wire16;
  input wire [(3'h6):(1'h0)] wire15;
  input wire signed [(4'ha):(1'h0)] wire14;
  wire [(3'h4):(1'h0)] wire89;
  wire [(4'hf):(1'h0)] wire88;
  wire signed [(5'h10):(1'h0)] wire84;
  wire [(4'h9):(1'h0)] wire82;
  wire signed [(5'h14):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire [(5'h11):(1'h0)] wire39;
  wire [(5'h13):(1'h0)] wire38;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(3'h4):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire35;
  wire signed [(4'hc):(1'h0)] wire34;
  wire [(4'he):(1'h0)] wire24;
  wire signed [(4'hf):(1'h0)] wire23;
  wire [(4'hd):(1'h0)] wire22;
  wire [(5'h11):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(3'h7):(1'h0)] wire18;
  reg [(3'h5):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg86 = (1'h0);
  reg [(4'he):(1'h0)] reg85 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg54 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg [(4'hd):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg [(4'h9):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg46 = (1'h0);
  reg [(4'h8):(1'h0)] reg45 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(5'h10):(1'h0)] reg43 = (1'h0);
  reg [(3'h6):(1'h0)] reg42 = (1'h0);
  reg [(4'hc):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg26 = (1'h0);
  reg signed [(4'he):(1'h0)] reg25 = (1'h0);
  assign y = {wire89,
                 wire88,
                 wire84,
                 wire82,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 reg87,
                 reg86,
                 reg85,
                 reg54,
                 reg53,
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
                 reg33,
                 reg32,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 (1'h0)};
  assign wire18 = (wire15 != $unsigned($unsigned($unsigned({wire14, wire14}))));
  assign wire19 = ((($signed((wire17 * (8'hb9))) ?
                              wire14 : (wire15 ? (!wire17) : (8'hb6))) ?
                          ((8'ha6) ?
                              {$unsigned(wire14),
                                  wire17} : $signed((wire17 * wire18))) : ((~$unsigned(wire18)) ?
                              $unsigned(wire17) : $unsigned((wire16 == wire16)))) ?
                      wire14 : ({$signed((wire18 && wire15)),
                              $unsigned($unsigned(wire14))} ?
                          ((~&wire17[(1'h1):(1'h1)]) ^ $signed((wire16 ?
                              wire14 : wire15))) : $signed($unsigned($signed(wire16)))));
  assign wire20 = (~|(~^(($signed(wire16) ? wire17 : wire18[(2'h2):(2'h2)]) ?
                      {(~|wire16)} : (wire16 ?
                          (^(8'ha8)) : (wire14 >> wire15)))));
  assign wire21 = ((wire15[(1'h0):(1'h0)] > ((^$signed(wire17)) ?
                      wire15 : (&{wire18}))) >>> wire20);
  assign wire22 = (~wire20);
  assign wire23 = {$signed(($unsigned({wire18, wire20}) ?
                          (wire16 >> wire22) : $unsigned((wire19 ?
                              wire17 : wire21)))),
                      {wire19[(3'h7):(3'h5)]}};
  assign wire24 = ({wire15[(1'h0):(1'h0)],
                      (+wire19)} > ($signed((((8'hb8) ^ wire19) ?
                          wire23 : $unsigned((8'hbf)))) ?
                      wire20 : ($unsigned($unsigned(wire17)) ?
                          wire17 : {$signed(wire19), ((8'hb4) >= wire16)})));
  always
    @(posedge clk) begin
      reg25 <= (8'ha4);
      reg26 <= $signed(($signed((8'hb7)) << (~^((~^(8'hb3)) ?
          (wire16 ? (8'ha3) : (8'hac)) : wire20[(4'hd):(3'h4)]))));
      reg27 <= (wire16[(1'h1):(1'h0)] ?
          $unsigned({{$signed(reg26)}}) : (wire19 ?
              ((^{wire17, wire18}) & wire16) : $unsigned($signed(reg26))));
    end
  always
    @(posedge clk) begin
      reg28 <= ((^~$unsigned($signed((reg27 >> reg27)))) ?
          (wire17 ?
              $unsigned(wire14[(3'h4):(2'h2)]) : $unsigned(wire20[(4'h8):(2'h3)])) : $signed($signed(wire18)));
      reg29 <= $signed(reg25[(4'ha):(3'h6)]);
      if ($signed($unsigned(($signed((+(8'hbb))) ?
          $signed($unsigned(wire21)) : ($unsigned(wire23) <= reg27[(2'h3):(2'h2)])))))
        begin
          reg30 <= (+reg25[(4'hb):(3'h4)]);
          reg31 <= ($unsigned(wire16) ?
              ((!(-wire15[(1'h0):(1'h0)])) ?
                  ($signed((8'haf)) >> $signed($unsigned(wire18))) : (~|(wire17[(2'h2):(1'h0)] ?
                      $unsigned(wire21) : wire19[(1'h0):(1'h0)]))) : (+((~&wire21[(4'h9):(3'h6)]) ?
                  $unsigned(reg28[(3'h4):(1'h0)]) : (^~wire23[(2'h3):(2'h2)]))));
          reg32 <= {(reg28[(4'he):(3'h7)] - (!(+(|wire18))))};
          reg33 <= wire16;
        end
      else
        begin
          reg30 <= reg26;
          reg31 <= (&($signed((wire22[(3'h6):(3'h5)] >= (&wire15))) == (^reg30[(1'h1):(1'h0)])));
          if (reg30[(3'h5):(2'h2)])
            begin
              reg32 <= wire16[(1'h1):(1'h1)];
            end
          else
            begin
              reg32 <= wire24[(4'ha):(1'h0)];
            end
        end
    end
  assign wire34 = $signed(($unsigned((+(wire14 & reg31))) ?
                      (&((wire23 ?
                          wire21 : wire14) >= (wire24 || reg33))) : ($unsigned($signed(wire18)) >>> ($unsigned(wire24) | (wire22 < reg27)))));
  assign wire35 = (($signed($signed((wire22 ~^ (7'h40)))) - wire14[(3'h7):(2'h2)]) < (wire19[(3'h4):(1'h1)] ^ (((!wire18) < reg27[(1'h1):(1'h1)]) & reg32[(1'h1):(1'h1)])));
  assign wire36 = (^~wire15[(3'h6):(2'h2)]);
  assign wire37 = $unsigned(wire18[(3'h7):(1'h0)]);
  assign wire38 = wire21[(3'h6):(3'h5)];
  assign wire39 = ((7'h44) < reg25);
  assign wire40 = reg30;
  assign wire41 = ($unsigned((wire15[(1'h1):(1'h0)] == (wire38[(4'hc):(4'ha)] < reg26))) ?
                      reg32[(2'h3):(1'h0)] : $unsigned(wire19));
  always
    @(posedge clk) begin
      reg42 <= wire34;
      if (reg27)
        begin
          reg43 <= (|((^{(wire16 ? wire38 : (8'hb0)), (-reg29)}) ?
              (-wire24) : ((~wire39[(5'h11):(4'hb)]) <<< reg26)));
          if (($unsigned((((-wire16) ^ (wire38 ? wire34 : reg43)) ?
              $unsigned((wire17 ?
                  reg43 : wire20)) : (reg25[(1'h0):(1'h0)] ^~ $unsigned(wire39)))) >> ($signed(wire38[(3'h5):(3'h4)]) ^~ ($signed((reg27 ?
                  reg28 : wire14)) ?
              $signed((wire36 + reg30)) : {(reg26 ? (8'hae) : wire41),
                  (reg30 ? reg27 : (8'hab))}))))
            begin
              reg44 <= (8'ha7);
            end
          else
            begin
              reg44 <= {{$signed(wire19[(3'h5):(1'h1)]), reg43[(3'h5):(1'h1)]},
                  wire41};
              reg45 <= reg30;
              reg46 <= (+wire22);
              reg47 <= (^($unsigned((~|reg29[(4'h8):(3'h7)])) ?
                  (~^(&{(8'ha1)})) : ({$signed(reg45)} & $unsigned(reg42))));
              reg48 <= $signed((&$unsigned(reg44[(3'h7):(3'h6)])));
            end
          reg49 <= $unsigned(((~|wire37[(1'h0):(1'h0)]) ?
              ($unsigned(wire20[(2'h2):(1'h1)]) >>> (((8'hb3) + wire24) ^~ wire37)) : (~&(wire39[(4'ha):(3'h4)] ~^ ((8'ha5) <<< reg42)))));
          reg50 <= $signed($signed((reg32[(2'h2):(2'h2)] >>> {((8'hb8) < reg46),
              ((8'ha3) || wire23)})));
        end
      else
        begin
          if ({reg30, (!reg32[(2'h3):(2'h3)])})
            begin
              reg43 <= reg43[(1'h0):(1'h0)];
              reg44 <= $signed((8'hb9));
              reg45 <= $unsigned($unsigned((~|((reg27 >> wire41) >= $signed(reg44)))));
            end
          else
            begin
              reg43 <= $unsigned($unsigned((((wire15 ?
                      reg47 : reg44) >>> (reg48 ? wire14 : reg48)) ?
                  (~&wire23[(4'he):(4'hd)]) : ((8'hba) - (wire35 ?
                      wire34 : wire17)))));
              reg44 <= ($signed((reg48[(3'h5):(2'h2)] ~^ (reg46 ^ reg27))) ?
                  ($signed({reg26[(4'he):(4'hd)],
                      reg28[(4'hf):(2'h2)]}) + reg31[(3'h5):(1'h0)]) : $unsigned($unsigned(reg27[(1'h1):(1'h0)])));
              reg45 <= $unsigned(reg43);
            end
          reg46 <= {$unsigned((reg27 > {$signed(reg27), wire40}))};
          if ($unsigned(wire36))
            begin
              reg47 <= (reg28 == $signed(wire24));
              reg48 <= $unsigned(wire17[(2'h2):(1'h0)]);
            end
          else
            begin
              reg47 <= {{wire14}};
              reg48 <= $signed($signed(wire36));
              reg49 <= (reg25[(3'h7):(3'h7)] != ($signed((reg28 & reg46[(1'h0):(1'h0)])) >>> (!(~|$signed(wire19)))));
              reg50 <= reg28;
              reg51 <= $unsigned({wire20, {reg31}});
            end
          reg52 <= reg31;
          reg53 <= (wire24[(3'h4):(3'h4)] ?
              reg26[(3'h6):(2'h2)] : (reg25[(4'hb):(3'h6)] ?
                  wire35 : $unsigned(wire39[(1'h0):(1'h0)])));
        end
      reg54 <= $unsigned($unsigned(({(!reg43)} < $unsigned((reg52 ~^ wire14)))));
    end
  module55 #() modinst83 (.y(wire82), .wire59(wire14), .clk(clk), .wire57(reg32), .wire56(wire24), .wire58(reg48));
  assign wire84 = ($unsigned((8'h9d)) ?
                      (reg52[(2'h2):(1'h0)] << (reg29[(3'h7):(3'h4)] ?
                          $unsigned((wire19 ? wire41 : wire23)) : (wire41 ?
                              ((8'hae) <<< reg27) : $signed(reg48)))) : ((((reg43 > wire37) ?
                                  $unsigned((8'hb8)) : {reg47}) ?
                              ($unsigned(reg28) ?
                                  reg45[(4'h8):(2'h3)] : $signed(reg31)) : wire40[(4'h9):(1'h0)]) ?
                          (($signed(wire34) != {(8'ha9), reg32}) ?
                              (~^$signed(reg26)) : wire20) : (reg46 >> {{reg26}})));
  always
    @(posedge clk) begin
      if ((~^$signed($signed((wire14[(1'h0):(1'h0)] != reg52)))))
        begin
          reg85 <= (&((~$signed($signed(reg27))) ?
              ({$signed(reg33)} > wire41[(4'hf):(3'h5)]) : ((+(^~reg44)) >= reg52[(4'h9):(3'h7)])));
          reg86 <= (($unsigned((wire38 <<< (reg42 && wire23))) || {(wire20[(4'ha):(3'h5)] ?
                      reg48[(4'h9):(4'h9)] : $unsigned((8'ha5)))}) ?
              reg50 : wire84[(2'h3):(2'h2)]);
        end
      else
        begin
          reg85 <= reg30[(4'hb):(1'h1)];
        end
      reg87 <= {reg48[(3'h4):(2'h3)]};
    end
  assign wire88 = (((8'h9d) ~^ reg31[(1'h0):(1'h0)]) >>> (~&(wire19[(4'h8):(3'h4)] ^ (wire14[(3'h6):(2'h3)] ?
                      (wire16 <= (8'ha6)) : wire19))));
  assign wire89 = wire36;
endmodule

module module55
#(parameter param80 = (8'ha4), 
parameter param81 = (~^{({(8'hbb)} ? (8'hbd) : ((param80 ? param80 : param80) != param80))}))
(y, clk, wire59, wire58, wire57, wire56);
  output wire [(32'hf8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire59;
  input wire signed [(4'hd):(1'h0)] wire58;
  input wire [(4'hd):(1'h0)] wire57;
  input wire [(4'h8):(1'h0)] wire56;
  wire [(4'h9):(1'h0)] wire79;
  wire signed [(3'h6):(1'h0)] wire77;
  wire signed [(4'hb):(1'h0)] wire76;
  wire signed [(4'hc):(1'h0)] wire72;
  wire [(4'hf):(1'h0)] wire71;
  wire [(5'h11):(1'h0)] wire70;
  wire signed [(5'h14):(1'h0)] wire69;
  wire signed [(5'h11):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(3'h4):(1'h0)] wire66;
  wire signed [(4'h8):(1'h0)] wire61;
  wire [(3'h4):(1'h0)] wire60;
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg75 = (1'h0);
  reg [(4'hf):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg65 = (1'h0);
  reg [(4'ha):(1'h0)] reg64 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg63 = (1'h0);
  reg [(4'he):(1'h0)] reg62 = (1'h0);
  assign y = {wire79,
                 wire77,
                 wire76,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire61,
                 wire60,
                 reg78,
                 reg75,
                 reg74,
                 reg73,
                 reg65,
                 reg64,
                 reg63,
                 reg62,
                 (1'h0)};
  assign wire60 = (wire57[(3'h7):(1'h0)] ?
                      (8'ha2) : (!$signed(($signed(wire57) ?
                          wire57 : (8'h9e)))));
  assign wire61 = $signed(wire60[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg62 <= (~$signed($unsigned(wire58[(3'h5):(2'h3)])));
      reg63 <= {(wire59 ?
              ($signed((reg62 != wire61)) ?
                  (wire57[(4'ha):(1'h0)] ?
                      (wire57 >= wire61) : (wire60 ?
                          wire59 : wire57)) : wire60) : ($signed(wire58) ?
                  reg62[(2'h3):(1'h0)] : wire56[(3'h4):(1'h1)]))};
      reg64 <= {$signed(((wire58 << $signed(wire57)) ^ wire60[(2'h2):(1'h0)]))};
      reg65 <= ($unsigned($unsigned(wire56[(3'h7):(2'h2)])) ?
          $unsigned(wire61) : {(^~$signed((wire57 ? wire57 : wire59)))});
    end
  assign wire66 = (-reg65);
  assign wire67 = $unsigned(((^~reg62[(1'h0):(1'h0)]) ?
                      ((~wire58[(2'h2):(1'h1)]) << wire61) : $signed(reg62)));
  assign wire68 = ((~$unsigned($signed({reg63, wire60}))) ?
                      (-(wire58[(3'h5):(1'h0)] ?
                          wire58 : $signed(wire61))) : $signed(wire60[(2'h2):(2'h2)]));
  assign wire69 = (((($signed(wire58) ?
                          $unsigned(wire60) : (~|wire57)) > ((wire57 ~^ (8'ha8)) ?
                          wire57[(4'hb):(4'h9)] : (wire60 && (8'haa)))) ?
                      wire66 : wire67[(3'h6):(3'h6)]) >>> (($signed(reg65[(1'h1):(1'h1)]) ?
                          (^(wire56 ? (7'h40) : (8'haa))) : wire58) ?
                      reg62 : ($unsigned((wire61 ?
                          wire58 : wire66)) && reg65)));
  assign wire70 = reg63[(4'hf):(4'he)];
  assign wire71 = wire58[(4'hb):(4'h8)];
  assign wire72 = $unsigned({(-($unsigned(wire71) ?
                          ((8'hb5) * wire56) : (^~wire61)))});
  always
    @(posedge clk) begin
      reg73 <= (&(wire61 ?
          $unsigned(wire72) : {(~&{wire57, wire70}),
              $signed($unsigned(wire69))}));
      reg74 <= wire69;
      reg75 <= (reg64 == (wire56 ?
          $signed((-{(8'h9e), wire70})) : $unsigned({(wire56 ?
                  wire56 : (8'hb4))})));
    end
  assign wire76 = reg64[(3'h4):(2'h2)];
  assign wire77 = {$unsigned($unsigned(((^~reg63) <= (reg64 ?
                          (8'ha9) : (8'ha3)))))};
  always
    @(posedge clk) begin
      reg78 <= $unsigned(((8'hb9) < $unsigned((&(8'hbb)))));
    end
  assign wire79 = $signed((8'ha2));
endmodule
