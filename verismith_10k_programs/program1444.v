module top
#(parameter param97 = (~^((({(7'h42), (8'ha8)} ? ((8'hb1) ? (8'h9e) : (8'ha4)) : ((8'ha4) ^~ (7'h42))) + (~|((8'hb3) || (8'ha0)))) ? (((^(8'hb6)) ? {(8'ha4), (8'ha7)} : ((8'ha4) ? (7'h44) : (8'hae))) >>> {(&(8'hba)), ((8'ha8) | (8'hb7))}) : (({(8'ha1)} ? {(8'haf), (8'had)} : {(8'hb9)}) ? (~^((8'ha2) ? (7'h42) : (8'hb2))) : {((8'hb6) >> (8'ha4))}))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(3'h6):(1'h0)] wire6;
  wire [(4'hf):(1'h0)] wire7;
  wire signed [(5'h15):(1'h0)] wire95;
  assign y = {wire5, wire6, wire7, wire95, (1'h0)};
  assign wire5 = ($signed($unsigned((!$unsigned((8'hbb))))) ?
                     (~^(^~$unsigned((wire3 ?
                         wire4 : wire4)))) : $unsigned((((8'ha7) >= $signed(wire4)) ?
                         $unsigned(wire1) : wire3[(4'hc):(4'h8)])));
  assign wire6 = $signed($unsigned(({(wire2 ~^ (7'h40))} & (wire1[(1'h1):(1'h1)] ?
                     wire2 : wire1[(1'h0):(1'h0)]))));
  assign wire7 = (($unsigned(wire6) > $signed((!(wire2 ? wire1 : wire2)))) ?
                     (((~(8'hbe)) ?
                             ((-wire2) ?
                                 $unsigned((8'hb5)) : wire5[(3'h4):(3'h4)]) : $signed($signed(wire0))) ?
                         $signed({wire0}) : ((~|wire4[(4'h9):(3'h7)]) ?
                             $signed($unsigned((8'hb5))) : $unsigned((~^(8'ha3))))) : ((wire2 ?
                         {$unsigned(wire1),
                             $unsigned(wire5)} : (~|((8'hb8) != (8'hae)))) <<< $unsigned(((wire1 ?
                         wire3 : wire2) * $unsigned(wire0)))));
  module8 #() modinst96 (.y(wire95), .wire12(wire0), .wire9(wire5), .wire10(wire4), .wire13(wire1), .clk(clk), .wire11(wire3));
endmodule

module module8
#(parameter param94 = (((|{(~&(8'hb5))}) > ({((8'hba) + (8'h9c))} ? (((8'h9d) ? (8'had) : (8'ha5)) & (~&(8'h9c))) : {(~^(7'h40))})) ? ((~|(-{(8'haa), (8'hb3)})) ? (~(+{(7'h42), (8'ha7)})) : (({(8'hb5), (8'ha7)} >>> (+(8'ha0))) << ((&(8'hbf)) ? (~(8'h9d)) : ((8'hbf) ? (8'hb4) : (7'h41))))) : (~^((-(-(8'hb5))) ? {((8'ha5) ~^ (8'ha9)), {(8'hab)}} : ((^~(8'hb1)) == ((8'had) >>> (8'ha1)))))))
(y, clk, wire9, wire10, wire11, wire12, wire13);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire9;
  input wire [(4'he):(1'h0)] wire10;
  input wire signed [(5'h12):(1'h0)] wire11;
  input wire [(4'hc):(1'h0)] wire12;
  input wire [(5'h11):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire93;
  wire [(4'hc):(1'h0)] wire92;
  wire signed [(5'h11):(1'h0)] wire91;
  wire signed [(5'h13):(1'h0)] wire90;
  wire signed [(5'h11):(1'h0)] wire89;
  wire signed [(4'hc):(1'h0)] wire88;
  wire signed [(3'h4):(1'h0)] wire87;
  wire [(4'hb):(1'h0)] wire86;
  wire signed [(5'h14):(1'h0)] wire85;
  wire [(4'h9):(1'h0)] wire84;
  wire signed [(5'h13):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire71;
  reg [(4'h8):(1'h0)] reg82 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg81 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg80 = (1'h0);
  reg [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg78 = (1'h0);
  reg [(3'h6):(1'h0)] reg77 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg74 = (1'h0);
  reg [(5'h15):(1'h0)] reg73 = (1'h0);
  reg [(4'hb):(1'h0)] reg14 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(4'he):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg18 = (1'h0);
  assign y = {wire93,
                 wire92,
                 wire91,
                 wire90,
                 wire89,
                 wire88,
                 wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire71,
                 reg82,
                 reg81,
                 reg80,
                 reg79,
                 reg78,
                 reg77,
                 reg76,
                 reg75,
                 reg74,
                 reg73,
                 reg14,
                 reg15,
                 reg16,
                 reg17,
                 reg18,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg14 <= (~|(~^($signed((wire10 ? wire10 : wire11)) ?
          $signed((wire10 != wire12)) : wire13)));
      reg15 <= {(~$unsigned($unsigned((wire10 ^ wire9))))};
      reg16 <= $unsigned($signed(wire11[(4'ha):(2'h2)]));
      reg17 <= (|(~&$unsigned((8'h9e))));
      reg18 <= $signed((^{reg15}));
    end
  module19 #() modinst72 (.wire21(reg16), .y(wire71), .clk(clk), .wire23(reg14), .wire20(reg15), .wire22(wire13));
  always
    @(posedge clk) begin
      reg73 <= $unsigned((~&{reg14[(4'ha):(2'h2)],
          ((8'hab) >>> $signed((8'hb7)))}));
      if (($signed(wire71[(4'hf):(3'h6)]) + wire71[(3'h4):(2'h2)]))
        begin
          reg74 <= {wire71[(4'hf):(2'h3)],
              ($unsigned($signed((reg16 >>> wire13))) ^~ reg14[(4'hb):(4'h8)])};
          if ((reg73[(5'h14):(4'ha)] ?
              wire71 : {{reg18}, (^(wire12 + {reg73, reg73}))}))
            begin
              reg75 <= wire11;
              reg76 <= (wire12[(2'h3):(1'h0)] ?
                  $unsigned((&$signed((reg75 ? reg15 : reg18)))) : reg14);
              reg77 <= ((reg74 ?
                      {$signed($unsigned(wire12))} : ((^$signed(reg15)) ?
                          (reg76 ^~ (wire13 ? reg18 : wire13)) : ((+reg74) ?
                              wire9[(4'ha):(4'ha)] : $unsigned((8'h9e))))) ?
                  reg17[(4'hd):(4'hb)] : reg16);
              reg78 <= wire71[(3'h6):(1'h0)];
              reg79 <= $unsigned(reg78[(2'h2):(1'h1)]);
            end
          else
            begin
              reg75 <= {{$unsigned(reg18[(4'hd):(4'h8)])}};
              reg76 <= ((~reg14[(3'h5):(1'h0)]) ?
                  (!wire11[(3'h7):(3'h7)]) : (reg77 ?
                      reg17 : {$unsigned(reg78), reg15}));
              reg77 <= reg77[(3'h4):(3'h4)];
              reg78 <= ((reg18[(2'h3):(2'h2)] < {(+wire71)}) + ((((reg15 >>> wire11) >> $unsigned((8'haf))) ?
                  {reg17[(4'h9):(3'h7)]} : reg17[(3'h6):(2'h3)]) && {reg76[(4'hb):(4'ha)]}));
            end
          reg80 <= (wire10[(3'h4):(2'h3)] ?
              {(($unsigned(reg14) ?
                          (reg74 ? reg78 : wire9) : (wire71 ?
                              (8'ha4) : reg77)) ?
                      (reg78[(1'h0):(1'h0)] ?
                          $signed(reg75) : wire13) : {(wire10 ~^ reg78)})} : reg18[(4'hb):(3'h7)]);
        end
      else
        begin
          reg74 <= ($signed($signed($signed({reg17,
              (7'h44)}))) || $unsigned((({wire9} ?
              {wire11, reg79} : (reg75 ? reg16 : (8'hac))) > (8'hac))));
        end
      reg81 <= (8'hb8);
      reg82 <= ($unsigned(wire71[(1'h1):(1'h1)]) ?
          (^reg76[(2'h3):(2'h2)]) : reg15);
    end
  assign wire83 = {$signed({$signed(wire12), {{(8'ha8)}}}), (8'h9c)};
  assign wire84 = ($unsigned(($unsigned((reg75 ?
                      (8'ha7) : reg18)) && (~$unsigned(reg73)))) < (8'ha3));
  assign wire85 = (-($signed(reg17) | (^(~|{wire13, reg16}))));
  assign wire86 = reg81;
  assign wire87 = $signed((((~|((8'hb6) ? wire12 : reg80)) ?
                      (!{reg14,
                          reg81}) : (~$signed((7'h44)))) < $signed((-(wire10 ?
                      (7'h42) : wire84)))));
  assign wire88 = (+reg77[(3'h4):(1'h0)]);
  assign wire89 = (~reg77[(2'h2):(1'h0)]);
  assign wire90 = (~&$signed(wire10[(3'h5):(3'h4)]));
  assign wire91 = $signed(($unsigned(((&wire84) >> reg73[(5'h13):(5'h10)])) ?
                      ($unsigned(wire90) <<< $unsigned(wire71[(3'h6):(3'h4)])) : ({reg82,
                          reg18[(3'h5):(1'h1)]} || {((8'hbf) ? reg14 : wire83),
                          (-reg82)})));
  assign wire92 = ({wire9[(3'h6):(2'h2)]} ~^ $unsigned((wire85[(3'h7):(3'h7)] + (^(wire88 ?
                      wire12 : (8'hba))))));
  assign wire93 = $signed($signed($unsigned($signed(wire10))));
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h21a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire23;
  input wire signed [(3'h5):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire [(3'h5):(1'h0)] wire20;
  wire signed [(4'hd):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire63;
  wire signed [(5'h15):(1'h0)] wire62;
  wire signed [(3'h6):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire55;
  wire signed [(5'h13):(1'h0)] wire40;
  wire signed [(3'h6):(1'h0)] wire39;
  wire [(3'h4):(1'h0)] wire37;
  wire [(2'h3):(1'h0)] wire26;
  wire signed [(5'h13):(1'h0)] wire25;
  wire [(4'hf):(1'h0)] wire24;
  reg [(3'h4):(1'h0)] reg69 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg68 = (1'h0);
  reg [(4'h9):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg66 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg65 = (1'h0);
  reg [(4'hd):(1'h0)] reg60 = (1'h0);
  reg [(4'hf):(1'h0)] reg59 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg50 = (1'h0);
  reg [(3'h5):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg43 = (1'h0);
  reg [(4'he):(1'h0)] reg42 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(2'h3):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg34 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg32 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg [(5'h10):(1'h0)] reg29 = (1'h0);
  reg signed [(4'he):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg27 = (1'h0);
  assign y = {wire70,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire55,
                 wire40,
                 wire39,
                 wire37,
                 wire26,
                 wire25,
                 wire24,
                 reg69,
                 reg68,
                 reg67,
                 reg66,
                 reg65,
                 reg60,
                 reg59,
                 reg58,
                 reg57,
                 reg56,
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
                 reg41,
                 reg38,
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
  assign wire24 = (wire23 ?
                      (wire23[(1'h1):(1'h0)] ?
                          ((wire20 <<< (wire20 ? wire21 : wire21)) ?
                              wire22[(3'h5):(2'h3)] : wire23[(3'h5):(2'h3)]) : (~((wire23 ?
                              (8'hb0) : (8'hac)) >> wire23[(3'h5):(3'h5)]))) : ({$unsigned((~|(8'hb8))),
                              wire20[(1'h1):(1'h0)]} ?
                          ((((8'h9d) ? wire20 : wire22) ? (~wire20) : wire20) ?
                              wire23 : {(wire21 ? wire21 : wire21)}) : wire22));
  assign wire25 = wire23;
  assign wire26 = wire20[(2'h2):(1'h1)];
  always
    @(posedge clk) begin
      if (((((((8'hac) - wire24) ? (wire20 ^~ wire25) : wire23) ?
          wire26[(1'h1):(1'h0)] : ({(8'h9e)} ?
              wire22 : wire22)) >>> $unsigned(wire24[(4'hb):(3'h5)])) <= {(^$signed($signed(wire26))),
          $unsigned(wire23)}))
        begin
          reg27 <= wire23[(1'h0):(1'h0)];
          reg28 <= ($signed($signed((&reg27))) ?
              $unsigned($unsigned($unsigned(((8'hb4) * reg27)))) : $unsigned((reg27[(3'h4):(1'h0)] <<< $signed((^~wire25)))));
          reg29 <= wire24[(4'hf):(1'h1)];
          reg30 <= (^({reg27, (&wire24)} ?
              wire24[(1'h1):(1'h1)] : (|wire23[(3'h5):(2'h3)])));
          reg31 <= (~|wire26);
        end
      else
        begin
          if (((reg31 ?
                  wire24[(4'h9):(1'h0)] : {wire20,
                      ($unsigned(wire22) >>> (wire21 >> (8'ha3)))}) ?
              wire25 : wire23[(1'h0):(1'h0)]))
            begin
              reg27 <= (wire20 || (|wire24[(3'h7):(1'h1)]));
              reg28 <= ($unsigned($signed(((8'ha0) ~^ ((8'ha3) ~^ wire21)))) >> ($signed(wire21[(3'h6):(3'h6)]) || $signed((!$unsigned(reg27)))));
              reg29 <= (^wire25[(4'hd):(4'hb)]);
              reg30 <= (reg27 < (wire25[(4'hc):(4'h9)] ?
                  $signed((~&wire24)) : (-$signed(reg30))));
            end
          else
            begin
              reg27 <= wire22[(3'h4):(1'h0)];
              reg28 <= wire21;
              reg29 <= $signed(((&($unsigned(wire25) != (reg27 ?
                  (8'ha3) : wire24))) >>> wire25[(4'h8):(4'h8)]));
              reg30 <= ((~|$signed(reg28[(3'h5):(1'h0)])) && $signed((!reg29[(4'hf):(4'hc)])));
              reg31 <= (|($signed(reg29) ^~ $signed(reg30[(3'h5):(1'h0)])));
            end
          reg32 <= ((wire23[(3'h4):(3'h4)] != (|($unsigned(wire23) ?
                  ((8'hbd) != wire21) : (&wire20)))) ?
              (-$unsigned({(8'hac), (&reg27)})) : $signed($unsigned(((wire20 ?
                      reg28 : wire24) ?
                  (wire20 && (8'hbc)) : (8'ha0)))));
          reg33 <= (($signed((7'h41)) ?
              (reg28[(3'h5):(3'h5)] ?
                  reg27[(2'h3):(2'h3)] : (8'hbf)) : $unsigned(wire23)) > (~{((~|wire22) & wire22)}));
          reg34 <= {reg30[(3'h5):(2'h2)]};
          reg35 <= $signed(reg33[(2'h3):(1'h0)]);
        end
      reg36 <= reg33;
    end
  assign wire37 = {$signed({$signed(((8'hb6) - (8'hb3)))}),
                      reg28[(1'h1):(1'h1)]};
  always
    @(posedge clk) begin
      reg38 <= ((($signed(((8'ha5) ?
              (7'h40) : reg33)) != wire22[(3'h4):(1'h0)]) ?
          reg31 : reg35) + (8'hb8));
    end
  assign wire39 = $signed(reg36[(2'h2):(1'h1)]);
  assign wire40 = $unsigned(({{(-(8'hb4))},
                      ((reg31 & wire20) && reg28[(4'hb):(3'h6)])} <= $signed(reg38[(2'h3):(1'h0)])));
  always
    @(posedge clk) begin
      if (((~($unsigned((reg32 ? (8'ha7) : wire23)) ^ (!reg31))) - (8'h9c)))
        begin
          reg41 <= $signed((~((reg30 ?
              (reg35 & reg33) : (^~wire39)) ^~ (^~(reg36 | wire26)))));
          reg42 <= wire20[(3'h4):(3'h4)];
          reg43 <= reg32;
          reg44 <= {$signed({$signed(reg42)}),
              (~($unsigned(reg34[(4'h9):(3'h6)]) | $signed(reg35[(1'h1):(1'h0)])))};
        end
      else
        begin
          reg41 <= reg38;
          if ($unsigned(wire40[(1'h0):(1'h0)]))
            begin
              reg42 <= (+{$signed((reg32 && reg38[(2'h2):(1'h1)])),
                  (&(reg36[(2'h2):(1'h0)] & (wire25 == wire22)))});
              reg43 <= $signed(reg31);
              reg44 <= ($signed(($signed((!reg41)) <= ((wire21 ?
                  wire21 : reg43) + (reg32 & reg42)))) > $unsigned({{reg35[(3'h5):(3'h4)]}}));
              reg45 <= (!(($signed($unsigned(reg33)) ?
                  $signed((~|reg42)) : ($unsigned(reg36) < $unsigned(reg27))) >>> reg27[(3'h4):(1'h1)]));
            end
          else
            begin
              reg42 <= $unsigned(reg31);
              reg43 <= ($signed((reg41 ?
                      ((8'had) >>> (~&(7'h40))) : ((wire24 ? reg34 : (8'h9e)) ?
                          $signed(reg28) : wire25[(4'hf):(3'h7)]))) ?
                  ($unsigned($unsigned(reg43)) || ((reg41 ~^ reg38) ^ wire24)) : {($unsigned(reg32[(5'h13):(3'h6)]) ?
                          reg31 : ($signed((7'h41)) <<< (reg38 & reg45))),
                      $signed((8'ha0))});
              reg44 <= {(reg30[(3'h5):(3'h5)] >= wire39[(3'h5):(1'h1)]),
                  wire25[(5'h10):(4'h8)]};
              reg45 <= (((!($unsigned((8'h9d)) ?
                  $signed(reg29) : wire26[(1'h1):(1'h0)])) * (^~$unsigned(reg44))) == $unsigned({$unsigned($unsigned(reg28))}));
              reg46 <= (reg35[(3'h4):(2'h3)] ? reg28 : reg38[(2'h3):(2'h2)]);
            end
          reg47 <= (reg29 >= (reg30[(3'h6):(3'h6)] ?
              $unsigned($unsigned((reg28 ? reg34 : reg35))) : (&(8'hb4))));
        end
      reg48 <= wire25[(4'hf):(3'h4)];
      if ((~&({(8'had), $signed($unsigned((8'h9d)))} ?
          (|$signed(reg36)) : (reg36 ? wire24 : reg29))))
        begin
          reg49 <= $unsigned(wire40);
          if (($unsigned({$signed(((7'h41) ? reg41 : reg33)), reg46}) ?
              reg42 : (8'hb3)))
            begin
              reg50 <= $unsigned($signed((&((reg46 >> wire26) ^ reg47))));
            end
          else
            begin
              reg50 <= (wire22 ?
                  $signed((reg41[(2'h2):(2'h2)] ^~ reg50)) : (+(^~$signed((reg38 ^ reg44)))));
              reg51 <= reg32[(4'h9):(4'h9)];
              reg52 <= ($signed($unsigned($unsigned(reg47[(3'h4):(2'h3)]))) ?
                  (~&$unsigned(((8'ha6) >= reg49[(3'h4):(3'h4)]))) : {{(8'hbd)}});
            end
        end
      else
        begin
          reg49 <= ($unsigned($signed((^(|(8'hbd))))) ^~ $unsigned((~&($unsigned(reg50) + $unsigned((7'h43))))));
          reg50 <= $signed($signed($signed(($unsigned(reg46) & {reg52,
              wire24}))));
        end
      reg53 <= ($signed($signed((~&$unsigned(reg46)))) > $unsigned(reg47[(4'h9):(2'h2)]));
      reg54 <= $signed((|($signed((^wire20)) ? (-reg44) : reg43)));
    end
  assign wire55 = reg52;
  always
    @(posedge clk) begin
      reg56 <= $unsigned($signed($signed((!(~wire24)))));
      reg57 <= $signed(($unsigned(reg28[(3'h6):(2'h3)]) ?
          (({reg45, reg44} ? (wire21 + reg53) : {reg38}) ?
              reg32 : $unsigned($signed(reg28))) : ($unsigned((~^(8'ha8))) ~^ wire40[(3'h7):(1'h0)])));
      reg58 <= (reg30 >= wire40);
      reg59 <= reg41[(2'h2):(2'h2)];
      reg60 <= (!{$signed((8'had))});
    end
  assign wire61 = $unsigned(($unsigned({$unsigned(reg42), (&reg56)}) ?
                      reg34 : reg30));
  assign wire62 = (-($unsigned(reg46) ?
                      ($unsigned($signed(reg47)) ?
                          wire22 : ({reg29} < $signed(reg42))) : $signed(wire25)));
  assign wire63 = (reg43 ?
                      ((reg56 && wire24) != $signed(reg31[(4'h9):(2'h3)])) : reg43[(3'h6):(3'h4)]);
  assign wire64 = (reg59 ?
                      ((reg48 ?
                          $signed(reg45[(2'h3):(1'h0)]) : reg34) >= $signed(($unsigned(wire63) && (^reg53)))) : (&$unsigned($signed((|reg30)))));
  always
    @(posedge clk) begin
      reg65 <= ((^~($signed(reg42[(2'h2):(1'h1)]) ?
          (~|(reg51 ?
              wire22 : wire39)) : (!(reg45 >> (8'ha4))))) > (-(+(reg56[(4'he):(4'h9)] ?
          (wire26 >>> wire20) : (reg28 ? reg42 : (8'hb3))))));
      reg66 <= $unsigned(($signed($unsigned(reg33)) ?
          reg33 : $signed(((reg34 ?
              (8'ha2) : (8'h9d)) <<< (reg58 << (8'hb4))))));
      reg67 <= (reg50[(5'h11):(4'h8)] ^~ reg52);
      reg68 <= reg67[(1'h0):(1'h0)];
      reg69 <= ($signed($signed($unsigned($unsigned(reg36)))) ?
          (reg36[(1'h0):(1'h0)] != (reg42 * reg28[(2'h2):(1'h0)])) : $unsigned($unsigned({(reg60 ?
                  reg52 : (8'hb8)),
              {(8'hb1)}})));
    end
  assign wire70 = ({(-$unsigned(reg68[(1'h0):(1'h0)])),
                          (^$signed((reg53 ? (8'hb6) : wire37)))} ?
                      {reg46[(1'h0):(1'h0)],
                          $unsigned((reg33[(3'h5):(1'h1)] >> (wire63 ?
                              reg47 : reg60)))} : $unsigned((~((reg57 ^ reg51) ?
                          {wire25} : (reg50 - reg49)))));
endmodule
