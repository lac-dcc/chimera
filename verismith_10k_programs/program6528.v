module top
#(parameter param61 = ({(((!(8'ha5)) == {(8'ha2), (7'h40)}) ? (((7'h41) ? (8'haf) : (8'hbd)) * (|(8'hae))) : {(^(8'ha1)), (!(8'hb9))})} ^~ (7'h42)), 
parameter param62 = ((7'h43) - ((((param61 ^~ param61) ? (param61 - param61) : (^param61)) >= {((8'hb5) != param61)}) ? param61 : (~&(-param61)))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h4b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire0;
  input wire [(4'hf):(1'h0)] wire1;
  input wire [(4'hf):(1'h0)] wire2;
  input wire signed [(2'h3):(1'h0)] wire3;
  input wire signed [(5'h11):(1'h0)] wire4;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire signed [(3'h6):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire10;
  wire signed [(3'h7):(1'h0)] wire59;
  assign y = {wire5, wire6, wire7, wire8, wire9, wire10, wire59, (1'h0)};
  assign wire5 = $signed($unsigned((({wire3, wire4} ?
                         wire2 : wire0[(2'h2):(1'h1)]) ?
                     wire4[(2'h3):(2'h2)] : $signed(wire2))));
  assign wire6 = ((wire2 ? wire0 : wire0[(4'hb):(1'h0)]) ?
                     {(($unsigned(wire2) >= ((8'ha9) ?
                             wire0 : (8'hac))) >> {(wire4 < wire4)}),
                         (7'h43)} : ((wire2 != $signed((wire3 ?
                         wire1 : wire1))) == $unsigned(((+wire5) << $unsigned((8'hbb))))));
  assign wire7 = (wire1 ?
                     $unsigned($signed(wire6[(3'h6):(2'h2)])) : $signed(((!(wire4 ?
                             wire6 : wire3)) ?
                         ((+wire6) ^ $unsigned(wire6)) : (^~wire2))));
  assign wire8 = $signed($signed($signed({wire2[(4'ha):(2'h3)]})));
  assign wire9 = $unsigned((($unsigned((wire6 >= wire2)) ?
                     wire0[(1'h1):(1'h0)] : wire6) <<< {wire8, (-wire5)}));
  assign wire10 = wire1[(3'h7):(3'h5)];
  module11 #() modinst60 (.wire14(wire8), .y(wire59), .clk(clk), .wire13(wire5), .wire15(wire1), .wire16(wire4), .wire12(wire6));
endmodule

module module11
#(parameter param57 = (({{((8'hb0) ? (8'hb1) : (8'hb0)), (~|(8'ha1))}, ((~&(8'hb6)) >>> ((8'ha7) == (8'ha0)))} + ((^((8'hb5) ? (8'had) : (8'had))) - ((^~(8'h9c)) ? ((8'ha1) <<< (8'ha3)) : ((8'ha6) < (8'ha0))))) && {({((8'h9d) ? (8'hb3) : (8'hb0))} ? (((8'hb0) ? (8'ha8) : (8'had)) ? {(8'ha8), (8'hb0)} : (~^(8'hab))) : (~|(!(8'hae))))}), 
parameter param58 = param57)
(y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'h1f5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'ha):(1'h0)] wire16;
  input wire [(4'hf):(1'h0)] wire15;
  input wire signed [(4'hb):(1'h0)] wire14;
  input wire signed [(4'he):(1'h0)] wire13;
  input wire [(4'he):(1'h0)] wire12;
  wire signed [(4'h8):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(5'h12):(1'h0)] wire35;
  wire [(4'h9):(1'h0)] wire34;
  wire [(2'h3):(1'h0)] wire33;
  wire signed [(4'he):(1'h0)] wire32;
  wire signed [(3'h7):(1'h0)] wire31;
  wire [(4'hb):(1'h0)] wire30;
  wire signed [(4'hb):(1'h0)] wire29;
  wire signed [(3'h6):(1'h0)] wire28;
  wire [(4'h9):(1'h0)] wire27;
  wire [(5'h14):(1'h0)] wire20;
  wire signed [(5'h13):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(4'hc):(1'h0)] wire17;
  reg signed [(4'h9):(1'h0)] reg56 = (1'h0);
  reg [(4'h8):(1'h0)] reg55 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg [(4'hf):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg47 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg45 = (1'h0);
  reg [(3'h6):(1'h0)] reg44 = (1'h0);
  reg [(3'h7):(1'h0)] reg43 = (1'h0);
  reg signed [(4'he):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg [(3'h7):(1'h0)] reg36 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg26 = (1'h0);
  reg [(4'hc):(1'h0)] reg25 = (1'h0);
  reg [(4'he):(1'h0)] reg24 = (1'h0);
  reg [(4'hb):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg56,
                 reg55,
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
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire17 = ((8'h9d) + {wire14,
                      (wire13 ?
                          (wire14 ?
                              (wire12 == wire13) : wire15[(3'h4):(1'h0)]) : wire13[(1'h1):(1'h0)])});
  assign wire18 = wire16[(3'h6):(3'h5)];
  assign wire19 = ((wire16 == {wire12[(1'h1):(1'h1)]}) ?
                      (((~(wire17 ?
                          wire18 : wire16)) && wire14[(3'h6):(3'h4)]) == (!($unsigned(wire14) == $unsigned((8'hb9))))) : (wire12 ~^ (+wire12[(3'h6):(2'h2)])));
  assign wire20 = ($signed($signed((^~$signed(wire19)))) > $unsigned((-(|(wire16 >>> wire15)))));
  always
    @(posedge clk) begin
      reg21 <= (+($unsigned((&$signed(wire12))) ^~ ({wire17[(4'hb):(2'h3)],
              (+wire16)} ?
          ($signed(wire17) ?
              $signed(wire15) : (|wire14)) : wire13[(2'h3):(2'h3)])));
      reg22 <= ($signed(wire20[(5'h10):(4'hd)]) ?
          (~^{wire20}) : ($signed({(~^wire18)}) ?
              $signed((^$signed(wire12))) : ((~|wire12[(3'h5):(3'h5)]) ?
                  wire18[(1'h1):(1'h1)] : $signed($signed((8'hb7))))));
      reg23 <= ($signed(($signed($unsigned(wire19)) + $signed($signed(reg22)))) ?
          (!wire12[(4'ha):(2'h3)]) : $unsigned($signed($signed($signed(wire19)))));
      if (({$signed(wire18[(5'h10):(4'hb)]),
          $signed($signed($signed(reg23)))} != $signed($unsigned(wire15))))
        begin
          reg24 <= (~|$unsigned(wire19[(5'h13):(4'he)]));
        end
      else
        begin
          reg24 <= $signed((^~$unsigned($signed(reg21[(2'h3):(2'h2)]))));
          reg25 <= (wire16 ?
              ($unsigned(((^~wire14) ? {(8'ha0), wire18} : {wire13, wire20})) ?
                  ($signed((wire20 ? wire16 : wire15)) ?
                      wire14 : reg24[(3'h6):(1'h1)]) : (~^wire18[(1'h1):(1'h0)])) : $signed((($signed((8'hba)) > wire14) || (&wire17))));
        end
      reg26 <= (~(+(8'h9d)));
    end
  assign wire27 = ((|$unsigned(wire18)) && reg25);
  assign wire28 = ((wire15[(4'he):(4'hd)] ?
                          (!(~^wire14[(4'h8):(3'h7)])) : wire12) ?
                      ($unsigned($signed(reg22[(5'h10):(4'hb)])) ?
                          $unsigned($signed(reg21[(2'h3):(1'h0)])) : $unsigned(((~&reg24) ?
                              (~&wire14) : $unsigned(reg21)))) : wire27[(2'h3):(2'h2)]);
  assign wire29 = ((wire27 ?
                          (^(wire15[(4'ha):(3'h6)] ?
                              (8'hb9) : {wire27, wire27})) : ((reg22 ?
                              wire14 : wire13) < wire17)) ?
                      $unsigned(reg25[(1'h0):(1'h0)]) : (!{$unsigned(reg22)}));
  assign wire30 = $unsigned((8'hac));
  assign wire31 = ((^~$unsigned(reg22)) ?
                      $unsigned((!(~^wire28[(1'h0):(1'h0)]))) : reg22[(3'h5):(2'h2)]);
  assign wire32 = (wire14 ?
                      $unsigned(wire30[(2'h2):(1'h0)]) : reg26[(3'h4):(1'h1)]);
  assign wire33 = $unsigned((8'h9f));
  assign wire34 = (~^(8'haa));
  assign wire35 = wire31[(1'h0):(1'h0)];
  always
    @(posedge clk) begin
      if ($signed(($unsigned(($signed(wire17) == (wire30 ? (8'hba) : wire19))) ?
          reg25 : $signed(($unsigned(wire32) ? $signed(wire34) : wire17)))))
        begin
          reg36 <= $unsigned((((+(!reg26)) ?
                  $unsigned({(8'ha2), reg24}) : $unsigned((&wire18))) ?
              $unsigned(wire30[(3'h4):(1'h0)]) : $unsigned(reg26[(3'h6):(3'h4)])));
        end
      else
        begin
          reg36 <= (+reg21);
        end
      if (((!(~$unsigned(wire30[(3'h6):(2'h2)]))) ^~ ((^((wire29 <<< wire30) ^ (reg26 ?
          wire33 : wire28))) ^~ $unsigned(wire32[(3'h4):(2'h3)]))))
        begin
          reg37 <= $unsigned(wire29);
          if (wire28[(3'h5):(3'h5)])
            begin
              reg38 <= $unsigned(wire12[(3'h4):(2'h3)]);
            end
          else
            begin
              reg38 <= (!$signed($unsigned((wire29[(3'h7):(3'h6)] != reg23))));
              reg39 <= {(8'ha9), wire13};
              reg40 <= ({(((8'hb8) ?
                      $unsigned(reg23) : (wire35 ^~ (8'h9f))) >= ($unsigned(reg37) > $signed(wire29)))} <<< $unsigned((~^$signed(wire16[(3'h7):(2'h2)]))));
              reg41 <= $signed((-($signed((^reg24)) ?
                  wire34[(4'h8):(2'h3)] : wire19)));
            end
          reg42 <= $signed(wire33[(1'h0):(1'h0)]);
          if ({(+wire13[(3'h5):(2'h2)]), reg24})
            begin
              reg43 <= ({($signed(wire14) ?
                      (~(wire30 ^ (8'hb8))) : wire12)} ^~ (|reg21[(2'h2):(1'h0)]));
            end
          else
            begin
              reg43 <= $unsigned($unsigned(wire17));
              reg44 <= $unsigned((wire14 << $unsigned($unsigned($signed(reg24)))));
              reg45 <= $signed($unsigned(reg21[(1'h0):(1'h0)]));
              reg46 <= ($signed(reg21) >>> (reg41[(2'h3):(1'h0)] ?
                  wire12[(2'h2):(1'h0)] : $unsigned((wire34[(1'h0):(1'h0)] ?
                      ((8'hb3) + (8'hbd)) : reg42))));
            end
        end
      else
        begin
          reg37 <= {(wire29 ^~ $signed(wire31[(2'h2):(1'h0)]))};
          reg38 <= ((~|wire27[(3'h4):(2'h2)]) >>> ((({wire34} ?
                  wire31[(3'h5):(1'h1)] : reg42) ?
              $unsigned((wire30 ? reg25 : reg43)) : ({wire30,
                  reg46} * (+wire20))) >> wire19[(1'h1):(1'h1)]));
          reg39 <= (($unsigned({wire15[(3'h7):(3'h4)], (wire34 >= reg24)}) ?
                  $unsigned((8'haf)) : (((reg26 ? (8'hb9) : (8'hab)) ?
                      reg22[(5'h12):(5'h11)] : $unsigned(reg25)) | {(^~(8'hb6)),
                      (wire17 ? (7'h43) : reg21)})) ?
              $signed(((^~wire19[(3'h6):(3'h4)]) != $signed(reg42))) : $signed(wire30));
          reg40 <= (~$signed($signed($signed(reg24[(4'hb):(3'h6)]))));
        end
      if (((+($signed($unsigned(reg23)) ?
          (-$unsigned(wire12)) : ((reg39 ?
              reg37 : reg26) ^~ (^~wire12)))) ^ reg39))
        begin
          reg47 <= reg37;
          reg48 <= wire31;
          reg49 <= (^~(reg22 ?
              ({(wire14 ~^ wire12)} <<< ($unsigned(reg40) ?
                  (&(8'ha5)) : (wire17 & wire28))) : (!wire35[(4'he):(3'h4)])));
          reg50 <= $unsigned(wire12);
          reg51 <= reg43[(3'h6):(2'h2)];
        end
      else
        begin
          if ((~^((reg36 + reg42) <<< $signed({(~^wire29),
              (reg23 <<< (8'ha0))}))))
            begin
              reg47 <= (~|reg37);
              reg48 <= (reg48[(4'h9):(4'h9)] + $unsigned((wire32 - reg48)));
            end
          else
            begin
              reg47 <= (reg36 ?
                  reg41 : ((^$unsigned(wire20)) * $signed((+$signed(wire33)))));
            end
          reg49 <= ($unsigned((($unsigned(wire16) <<< $unsigned(reg43)) ?
                  (~&(+reg42)) : $signed((~&reg48)))) ?
              reg26[(4'h9):(2'h3)] : (wire31 ?
                  $unsigned($unsigned({wire17})) : ({$unsigned(wire30),
                      ((8'ha9) ? (8'hb4) : reg47)} ^~ reg21)));
          reg50 <= wire30[(3'h5):(2'h3)];
          reg51 <= reg45;
        end
    end
  assign wire52 = (+$signed({{wire33[(1'h1):(1'h0)], $signed(wire31)},
                      $signed(wire15[(4'he):(1'h1)])}));
  assign wire53 = (reg21[(3'h4):(2'h2)] != $unsigned($signed(reg22)));
  assign wire54 = $unsigned(reg25[(4'hc):(3'h7)]);
  always
    @(posedge clk) begin
      reg55 <= {(^~$unsigned(wire29)),
          (reg50 > (+{reg44[(3'h4):(2'h3)], (^wire18)}))};
      reg56 <= ({(~($unsigned((7'h43)) < {reg51, reg51})),
              $signed($signed((~reg21)))} ?
          $signed(($unsigned((&wire16)) ?
              $signed((wire32 << reg37)) : $unsigned(wire20[(5'h13):(4'h8)]))) : (wire30[(4'h9):(1'h0)] ?
              $unsigned(wire34) : ($unsigned($signed(wire20)) ?
                  (reg49[(4'ha):(4'h8)] ? $signed(reg41) : reg51) : {{reg26,
                          wire12},
                      ((8'had) << wire35)})));
    end
endmodule
