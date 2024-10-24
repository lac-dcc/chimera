module top
#(parameter param95 = ((8'ha6) ? (8'ha4) : ((+{{(8'h9e), (8'h9d)}}) >>> (((!(8'had)) >> {(8'hbf)}) || (((8'hbb) ^ (8'ha3)) ? ((8'hbb) ? (8'hab) : (8'ha1)) : ((8'hbd) ? (8'ha7) : (8'haa)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h184):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire1;
  input wire signed [(5'h10):(1'h0)] wire0;
  wire signed [(2'h3):(1'h0)] wire19;
  wire [(5'h10):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire4;
  wire [(2'h2):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire22;
  wire [(5'h10):(1'h0)] wire23;
  wire signed [(3'h7):(1'h0)] wire24;
  wire signed [(4'h8):(1'h0)] wire25;
  wire signed [(4'h9):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire27;
  wire [(4'hc):(1'h0)] wire28;
  wire signed [(5'h14):(1'h0)] wire41;
  wire signed [(4'hd):(1'h0)] wire42;
  wire [(3'h4):(1'h0)] wire43;
  wire [(5'h10):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire93;
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg33 = (1'h0);
  reg [(2'h2):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg35 = (1'h0);
  reg [(5'h11):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg38 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg39 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg48 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg49 = (1'h0);
  reg signed [(4'he):(1'h0)] reg50 = (1'h0);
  assign y = {wire19,
                 wire5,
                 wire4,
                 wire21,
                 wire22,
                 wire23,
                 wire24,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire41,
                 wire42,
                 wire43,
                 wire44,
                 wire93,
                 reg29,
                 reg30,
                 reg31,
                 reg32,
                 reg33,
                 reg34,
                 reg35,
                 reg36,
                 reg37,
                 reg38,
                 reg39,
                 reg40,
                 reg45,
                 reg46,
                 reg47,
                 reg48,
                 reg49,
                 reg50,
                 (1'h0)};
  assign wire4 = (($unsigned(wire1[(4'h8):(3'h7)]) == wire3[(1'h0):(1'h0)]) ?
                     ($signed((+$unsigned(wire0))) ?
                         {(~|$unsigned((8'ha3))),
                             {$unsigned(wire2),
                                 (~wire1)}} : wire3) : $unsigned((8'hb4)));
  assign wire5 = (wire4 ^ $signed((wire0 + (~^((8'ha6) ? (8'hb7) : wire3)))));
  module6 #() modinst20 (wire19, clk, wire1, wire5, wire3, wire0, wire4);
  assign wire21 = ((wire0 ?
                          $unsigned({wire0[(2'h2):(2'h2)],
                              wire4[(4'hb):(4'hb)]}) : wire2[(1'h0):(1'h0)]) ?
                      $signed((((wire5 ^ (8'hb1)) ?
                              $unsigned(wire3) : wire0[(1'h0):(1'h0)]) ?
                          (~^$signed((8'hb4))) : $signed({wire1}))) : wire19);
  assign wire22 = ((!wire4) ?
                      (((+(wire1 ? wire0 : wire5)) ?
                              $signed($signed(wire19)) : wire3[(1'h0):(1'h0)]) ?
                          wire21[(1'h0):(1'h0)] : (+$signed((wire1 >>> wire4)))) : $signed($signed($unsigned(wire3[(1'h0):(1'h0)]))));
  assign wire23 = $unsigned((7'h41));
  assign wire24 = (~|$signed(wire5));
  assign wire25 = wire0;
  assign wire26 = ($unsigned(wire23[(4'hf):(2'h3)]) - (~|$unsigned(wire5[(2'h2):(2'h2)])));
  assign wire27 = (^(^~(((!wire25) != $unsigned(wire1)) >= wire21)));
  assign wire28 = $signed({({$unsigned(wire26)} ?
                          ($signed(wire3) - (wire25 << wire21)) : wire2),
                      $signed($unsigned(wire27))});
  always
    @(posedge clk) begin
      reg29 <= ($signed({$signed((wire0 ?
              wire0 : wire5))}) && (($unsigned((!wire1)) ?
          wire1 : $unsigned((wire23 > wire21))) * wire22[(4'he):(4'he)]));
      if ($signed((^(+(wire3 || $signed(wire22))))))
        begin
          reg30 <= ((+wire25[(3'h6):(3'h6)]) ?
              reg29 : $unsigned(((!(wire3 && (8'hae))) >>> $unsigned((~&wire3)))));
          reg31 <= wire27;
          reg32 <= ({(((wire24 ? wire23 : wire5) ?
                      $unsigned(wire19) : (wire3 ?
                          wire19 : wire23)) * (|$unsigned(reg31))),
                  wire5} ?
              $signed((^~wire19)) : (($unsigned(wire3) ?
                  wire21 : reg31) <<< (!(~^$signed(wire24)))));
        end
      else
        begin
          reg30 <= wire3[(1'h0):(1'h0)];
          reg31 <= $unsigned(({$signed($unsigned(wire4))} ^ $unsigned({(8'hbf)})));
          if ($signed($unsigned(wire1[(4'ha):(1'h1)])))
            begin
              reg32 <= (+(7'h41));
              reg33 <= {$signed(wire26), wire21};
            end
          else
            begin
              reg32 <= reg29[(4'hd):(1'h0)];
              reg33 <= $unsigned($signed((({(8'ha3)} ?
                      $signed(wire26) : reg31[(4'hc):(1'h1)]) ?
                  ((!wire22) ? wire3 : (wire23 << reg33)) : ((wire25 | wire25) ?
                      (wire27 + wire22) : ((8'ha2) >= (8'haf))))));
            end
          reg34 <= (^wire1[(3'h7):(3'h7)]);
          if ((8'haf))
            begin
              reg35 <= $unsigned($signed({(|(wire21 ? wire22 : (8'hbc)))}));
              reg36 <= wire5[(4'hd):(3'h6)];
              reg37 <= ((wire26[(1'h1):(1'h1)] ?
                  $unsigned(wire25) : (+wire22)) == $unsigned({reg36}));
              reg38 <= reg35[(3'h4):(1'h0)];
              reg39 <= $unsigned($unsigned(wire22[(2'h2):(1'h1)]));
            end
          else
            begin
              reg35 <= (wire1[(4'h8):(2'h3)] ?
                  ((~$unsigned((^wire21))) ?
                      $unsigned(wire5[(3'h4):(1'h1)]) : (+(((8'h9c) >= wire2) ?
                          ((8'had) > wire26) : wire23[(2'h3):(2'h2)]))) : $unsigned(((reg31 ?
                          (wire5 - wire28) : reg38) ?
                      wire27 : (&$signed(wire24)))));
            end
        end
      reg40 <= ((~^wire19) ?
          $unsigned({reg38[(4'hc):(4'h8)],
              ((wire2 ?
                  reg39 : wire26) < (wire22 + wire3))}) : $signed((({wire1,
                      wire3} ?
                  (wire21 >>> wire5) : $unsigned((8'ha4))) ?
              (+{(8'hbc), reg32}) : $unsigned((wire5 >>> (8'h9c))))));
    end
  assign wire41 = (^~(~|{$unsigned($unsigned(wire27)), reg31}));
  assign wire42 = reg32;
  assign wire43 = $unsigned(((reg32 ?
                      (~&(reg31 == wire26)) : $unsigned((|(8'hae)))) <= (~$unsigned((~wire24)))));
  assign wire44 = {$unsigned(($signed((^wire26)) & {(wire28 ? wire21 : wire41),
                          $unsigned(reg33)})),
                      reg29};
  always
    @(posedge clk) begin
      if ($signed(reg31[(3'h7):(3'h7)]))
        begin
          reg45 <= reg33[(3'h6):(3'h4)];
          reg46 <= wire24[(2'h3):(1'h0)];
          reg47 <= $signed($unsigned($signed(((reg31 ? wire23 : (8'hb1)) ?
              (^wire42) : $unsigned(wire5)))));
          reg48 <= (~&(+(&((~&reg40) ^~ (~&(8'ha4))))));
        end
      else
        begin
          if ($signed(({$unsigned((wire1 ?
                  wire27 : wire0))} < (^$signed($unsigned((8'hab)))))))
            begin
              reg45 <= (wire25 ~^ $unsigned(wire43));
            end
          else
            begin
              reg45 <= $signed(wire28[(2'h2):(1'h0)]);
              reg46 <= $signed(reg33[(2'h2):(2'h2)]);
              reg47 <= {wire26};
            end
        end
      reg49 <= (!wire24[(1'h1):(1'h0)]);
      reg50 <= ($unsigned(($signed(reg32) ^ $signed(reg45[(3'h5):(3'h4)]))) - (wire24[(3'h6):(1'h1)] ?
          ({wire0[(4'hc):(3'h6)], (wire5 ? wire1 : reg45)} ?
              ({reg49, wire0} || reg40) : (|(wire3 || wire3))) : ((|reg36) ?
              ($signed(wire5) ? (!wire43) : (~wire3)) : reg46[(3'h5):(1'h1)])));
    end
  module51 #() modinst94 (wire93, clk, wire28, reg50, wire25, wire24);
endmodule

module module51  (y, clk, wire52, wire53, wire54, wire55);
  output wire [(32'h64):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire52;
  input wire [(4'he):(1'h0)] wire53;
  input wire [(3'h4):(1'h0)] wire54;
  input wire [(3'h7):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire92;
  wire signed [(5'h14):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire56;
  wire signed [(5'h12):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire58;
  wire [(4'hf):(1'h0)] wire59;
  wire [(4'he):(1'h0)] wire89;
  assign y = {wire92, wire91, wire56, wire57, wire58, wire59, wire89, (1'h0)};
  assign wire56 = (wire54[(3'h4):(2'h2)] ?
                      (^~{$unsigned(wire52),
                          wire52[(1'h1):(1'h0)]}) : $signed($signed($signed((wire53 >>> (7'h44))))));
  assign wire57 = wire52[(1'h0):(1'h0)];
  assign wire58 = $signed($unsigned({wire53}));
  assign wire59 = wire57[(2'h3):(1'h0)];
  module60 #() modinst90 (wire89, clk, wire58, wire57, wire59, wire56, wire53);
  assign wire91 = $unsigned($signed(wire56[(1'h1):(1'h1)]));
  assign wire92 = ((({$signed((8'ha9)),
                          wire54[(2'h3):(1'h0)]} != $signed(wire56[(4'h9):(3'h5)])) ?
                      ($signed(wire58) >>> wire89[(4'h8):(3'h7)]) : ($signed((~|wire59)) ?
                          $signed($signed(wire54)) : wire91[(4'h8):(1'h0)])) <<< ({$signed((^(8'hab))),
                          $unsigned({wire91, (8'ha2)})} ?
                      $signed({(wire55 + (7'h43)),
                          $signed(wire55)}) : (((8'hbc) ?
                              wire57 : $signed(wire54)) ?
                          $signed((wire57 ?
                              (8'ha1) : (8'ha1))) : ($unsigned(wire56) ?
                              (wire91 - wire54) : (!wire59)))));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire11;
  input wire [(5'h10):(1'h0)] wire10;
  input wire [(3'h5):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h12):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire18;
  wire [(4'ha):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  reg signed [(4'hd):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg14 = (1'h0);
  assign y = {wire18, wire13, wire12, reg17, reg16, reg15, reg14, (1'h0)};
  assign wire12 = (wire11 > wire10);
  assign wire13 = $unsigned((($unsigned({wire9,
                          wire12}) > $unsigned((~wire11))) ?
                      wire11[(3'h4):(2'h3)] : $unsigned(wire12[(3'h4):(1'h1)])));
  always
    @(posedge clk) begin
      reg14 <= $unsigned(wire7[(5'h10):(4'h9)]);
      reg15 <= $unsigned(wire10);
      reg16 <= $signed(((wire8[(4'hd):(4'hd)] ?
          $unsigned((^wire12)) : wire7[(5'h10):(4'h9)]) > wire12));
      reg17 <= wire10[(4'hb):(3'h7)];
    end
  assign wire18 = {($signed(wire12) ^ $unsigned((reg16 + $signed(wire7)))),
                      $signed(wire13[(3'h5):(3'h5)])};
endmodule

module module60
#(parameter param87 = (&(~|((((8'hbe) ? (8'hb0) : (8'haf)) != (^(8'hba))) ? ({(8'h9f), (7'h44)} ? ((8'hae) ? (8'hb3) : (7'h44)) : (8'ha3)) : (8'hb5)))), 
parameter param88 = (~&param87))
(y, clk, wire65, wire64, wire63, wire62, wire61);
  output wire [(32'hf2):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire65;
  input wire signed [(5'h12):(1'h0)] wire64;
  input wire signed [(4'hf):(1'h0)] wire63;
  input wire [(4'hb):(1'h0)] wire62;
  input wire [(2'h3):(1'h0)] wire61;
  wire [(4'ha):(1'h0)] wire86;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire [(3'h4):(1'h0)] wire68;
  wire [(5'h14):(1'h0)] wire67;
  wire signed [(4'hb):(1'h0)] wire66;
  reg signed [(4'hd):(1'h0)] reg85 = (1'h0);
  reg [(4'hf):(1'h0)] reg84 = (1'h0);
  reg signed [(4'he):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg82 = (1'h0);
  reg [(4'ha):(1'h0)] reg81 = (1'h0);
  reg [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg79 = (1'h0);
  reg [(3'h4):(1'h0)] reg78 = (1'h0);
  reg [(5'h15):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg [(5'h12):(1'h0)] reg75 = (1'h0);
  reg [(4'hb):(1'h0)] reg74 = (1'h0);
  reg [(3'h6):(1'h0)] reg73 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg72 = (1'h0);
  reg [(3'h6):(1'h0)] reg71 = (1'h0);
  assign y = {wire86,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
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
                 reg73,
                 reg72,
                 reg71,
                 (1'h0)};
  assign wire66 = (~^$unsigned((((~wire63) ? wire63 : ((8'hba) <<< wire62)) ?
                      wire63[(3'h6):(2'h3)] : $unsigned($signed(wire63)))));
  assign wire67 = (+(+(((^~wire63) ?
                      (~&wire65) : $signed(wire63)) & ($signed(wire64) != {wire65}))));
  assign wire68 = (~&(|((8'hb0) != wire64[(4'h8):(3'h4)])));
  assign wire69 = wire65;
  assign wire70 = (&((-wire68) ?
                      $unsigned(wire66) : $unsigned(((wire61 << wire61) ~^ ((8'hb9) ?
                          (8'hb9) : wire66)))));
  always
    @(posedge clk) begin
      if (($unsigned((|wire64[(4'hc):(4'hc)])) >>> wire63))
        begin
          if ((8'hac))
            begin
              reg71 <= (+$signed(((~(wire66 ? wire63 : (8'ha6))) ?
                  wire65[(4'hb):(2'h2)] : (!(wire66 <<< wire65)))));
              reg72 <= $unsigned({((+(wire67 + wire61)) | wire61)});
              reg73 <= wire63;
              reg74 <= wire65;
              reg75 <= (reg72 | ($unsigned(wire67[(5'h10):(4'h9)]) | (+$unsigned(wire62[(4'h9):(1'h0)]))));
            end
          else
            begin
              reg71 <= (($unsigned($unsigned({wire69, wire61})) ?
                  $unsigned({$signed((8'h9f))}) : $unsigned($unsigned($signed(wire62)))) || reg72);
              reg72 <= $unsigned((|wire67[(3'h6):(1'h0)]));
            end
          reg76 <= (wire65 ?
              {wire61} : (($unsigned({wire61}) ?
                      wire63[(2'h2):(1'h1)] : $signed($signed(wire66))) ?
                  {{(reg73 >= wire68), (!(8'haf))},
                      wire68[(3'h4):(3'h4)]} : wire61[(2'h2):(2'h2)]));
          reg77 <= reg71[(1'h0):(1'h0)];
          if ((~^(8'haa)))
            begin
              reg78 <= (&wire64[(4'h9):(2'h2)]);
              reg79 <= ({wire70} | $signed($unsigned($signed($signed((8'ha9))))));
              reg80 <= (8'h9f);
            end
          else
            begin
              reg78 <= (^reg74[(3'h5):(3'h5)]);
              reg79 <= ($unsigned((8'hb7)) ? (!reg77) : reg74[(1'h0):(1'h0)]);
            end
          reg81 <= {wire67};
        end
      else
        begin
          reg71 <= ($unsigned(wire64) <= wire69);
          reg72 <= wire70[(1'h1):(1'h1)];
          reg73 <= (~|{wire69[(3'h6):(1'h0)], (~^reg71[(2'h3):(1'h1)])});
        end
      reg82 <= wire66;
      reg83 <= $signed($unsigned($signed(wire68[(2'h2):(1'h1)])));
      reg84 <= $unsigned((^~$unsigned((&wire64))));
      reg85 <= $unsigned($unsigned((8'hb4)));
    end
  assign wire86 = $signed(wire67);
endmodule
