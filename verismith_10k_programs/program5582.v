module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h165):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire0;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire2;
  input wire signed [(4'hf):(1'h0)] wire3;
  wire [(4'hd):(1'h0)] wire189;
  wire [(4'h8):(1'h0)] wire83;
  wire signed [(5'h11):(1'h0)] wire70;
  wire [(5'h13):(1'h0)] wire69;
  wire signed [(4'h8):(1'h0)] wire68;
  wire signed [(5'h15):(1'h0)] wire67;
  wire [(5'h12):(1'h0)] wire4;
  wire signed [(5'h12):(1'h0)] wire5;
  wire signed [(3'h5):(1'h0)] wire65;
  reg [(5'h14):(1'h0)] reg6 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg [(5'h13):(1'h0)] reg8 = (1'h0);
  reg [(4'hb):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg10 = (1'h0);
  reg [(4'hc):(1'h0)] reg71 = (1'h0);
  reg [(5'h15):(1'h0)] reg72 = (1'h0);
  reg [(3'h5):(1'h0)] reg73 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg74 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg77 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg78 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg80 = (1'h0);
  reg [(4'hf):(1'h0)] reg81 = (1'h0);
  reg [(4'hb):(1'h0)] reg82 = (1'h0);
  assign y = {wire189,
                 wire83,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire4,
                 wire5,
                 wire65,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg71,
                 reg72,
                 reg73,
                 reg74,
                 reg75,
                 reg76,
                 reg77,
                 reg78,
                 reg79,
                 reg80,
                 reg81,
                 reg82,
                 (1'h0)};
  assign wire4 = ((~|$unsigned($unsigned(wire1[(3'h7):(1'h1)]))) ^ wire2[(2'h2):(1'h1)]);
  assign wire5 = wire1;
  always
    @(posedge clk) begin
      reg6 <= $signed($signed($unsigned(wire0)));
      reg7 <= wire2;
      if (reg7)
        begin
          reg8 <= wire4[(4'hc):(4'ha)];
          reg9 <= reg7[(3'h6):(1'h1)];
          reg10 <= wire2;
        end
      else
        begin
          reg8 <= {reg9, $signed($unsigned((!$unsigned(wire1))))};
          reg9 <= {reg7[(2'h3):(2'h2)]};
          reg10 <= (+$unsigned(((8'hb0) > ({wire5,
              (8'had)} != $signed(reg10)))));
        end
    end
  module11 #() modinst66 (wire65, clk, reg9, wire5, wire3, reg8, wire1);
  assign wire67 = $unsigned((reg6 ?
                      ((wire2 == reg9[(4'hb):(4'h9)]) ?
                          ((reg8 ?
                              (8'had) : wire5) <<< (wire4 * wire65)) : $unsigned((-wire65))) : $signed(((wire1 && (8'hb0)) ?
                          $signed((8'haf)) : wire5))));
  assign wire68 = ((((~&(reg10 ? wire5 : wire5)) ?
                      $unsigned((!reg6)) : ({wire5, reg6} ?
                          (wire2 ~^ reg10) : (wire1 ~^ reg9))) <= $unsigned({(!wire0),
                      (-wire5)})) ^~ ((($unsigned(wire5) <= reg7) ?
                      ($signed(reg10) ^ (reg8 ?
                          (7'h42) : wire67)) : wire67[(4'h8):(3'h5)]) <<< $unsigned((-wire67))));
  assign wire69 = wire68[(1'h1):(1'h1)];
  assign wire70 = $signed({{(^$signed(wire5))},
                      (wire5 ?
                          ({wire4} ?
                              wire2 : {reg6,
                                  wire69}) : wire65[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      if ($signed(($unsigned(wire69[(4'hd):(4'hd)]) ?
          reg6[(4'hb):(4'ha)] : wire65)))
        begin
          reg71 <= ((~&(wire68[(2'h3):(1'h0)] ?
                  $unsigned({wire5, wire65}) : $signed((wire65 & wire4)))) ?
              (wire4[(4'hc):(1'h1)] >> $signed({wire65,
                  (wire5 ? wire68 : wire69)})) : $unsigned({wire0}));
          reg72 <= (^reg7);
          reg73 <= ($signed($unsigned($signed({reg10}))) ^ wire5);
          reg74 <= reg8[(4'hd):(4'hc)];
          reg75 <= {wire69[(5'h12):(1'h0)]};
        end
      else
        begin
          reg71 <= wire0;
          reg72 <= wire5[(4'hd):(4'ha)];
          if ($unsigned((+$signed(((|reg6) ?
              (|reg71) : ((8'hbb) ? (8'hae) : (7'h44)))))))
            begin
              reg73 <= wire67;
              reg74 <= reg75;
              reg75 <= wire68[(3'h7):(1'h1)];
            end
          else
            begin
              reg73 <= (^wire3);
              reg74 <= ((((^reg71) ^ ($signed(wire65) ?
                      reg8 : $unsigned(reg72))) | reg73[(1'h0):(1'h0)]) ?
                  wire1 : (~&(~|reg74[(2'h2):(1'h0)])));
              reg75 <= (((~^wire69[(4'h9):(3'h6)]) ?
                      (wire0[(1'h0):(1'h0)] ?
                          (^(wire69 ? (8'hb8) : wire3)) : ((reg71 ?
                                  wire4 : reg7) ?
                              {wire2,
                                  wire65} : reg10)) : wire1[(5'h12):(5'h11)]) ?
                  $signed((({reg71} * {reg10}) != ($signed((8'h9e)) ?
                      (!wire0) : (wire2 ? (8'hbe) : wire1)))) : (8'ha8));
              reg76 <= $unsigned(($signed($unsigned(reg74)) ?
                  ($unsigned($signed(reg7)) >= {wire69,
                      (+wire3)}) : {({reg73} > wire2),
                      $signed(reg7[(3'h6):(2'h2)])}));
            end
          reg77 <= $signed(((+wire5) || (8'hb5)));
        end
      if ($signed((wire68[(4'h8):(3'h6)] ? wire2 : $signed($signed({reg73})))))
        begin
          if ((((|(~&$signed(reg75))) ?
              wire5[(1'h1):(1'h1)] : reg72) >>> wire5))
            begin
              reg78 <= {reg72};
              reg79 <= ((((reg10[(3'h6):(1'h0)] << $signed(wire0)) ^ reg75[(4'ha):(4'h8)]) << ($unsigned(wire69[(3'h4):(2'h2)]) ?
                  $signed((reg10 & wire69)) : wire0)) | (-$unsigned(wire69[(3'h4):(2'h2)])));
            end
          else
            begin
              reg78 <= (({{wire4}} - ($unsigned((~&reg75)) ?
                      $signed((wire3 - reg9)) : (-$unsigned((8'hb0))))) ?
                  (({reg78} >> $signed((wire3 ~^ wire2))) >>> wire2[(5'h12):(2'h2)]) : (^($unsigned($signed(wire69)) ?
                      wire69 : wire68)));
            end
        end
      else
        begin
          reg78 <= $signed($unsigned(((reg8 ? (^~reg71) : reg77) ?
              (^~(~|reg79)) : (!(reg71 ? wire5 : wire65)))));
          reg79 <= reg7[(4'ha):(3'h4)];
          reg80 <= wire3[(2'h3):(2'h2)];
        end
      reg81 <= $unsigned(reg77);
      reg82 <= wire1[(1'h0):(1'h0)];
    end
  assign wire83 = (wire3[(1'h0):(1'h0)] ?
                      (8'hb4) : ((reg78 ?
                          {(~(7'h42))} : $signed(((8'hb6) ^ reg71))) >>> {(wire0[(2'h2):(1'h1)] ?
                              (reg75 ^ wire69) : (~^reg79))}));
  module84 #() modinst190 (.wire87(reg10), .wire88(reg7), .wire85(reg8), .y(wire189), .clk(clk), .wire89(wire4), .wire86(wire0));
endmodule

module module84
#(parameter param188 = (~&(((((7'h40) < (8'ha8)) != ((8'ha2) ? (8'ha9) : (8'hb8))) * ((~&(8'hb3)) ? ((7'h42) ? (8'hb7) : (8'ha0)) : ((8'ha1) ? (8'hbc) : (8'hba)))) < {(((8'ha0) >> (8'hb6)) ? (&(8'hac)) : ((8'hb7) << (8'ha4)))})))
(y, clk, wire85, wire86, wire87, wire88, wire89);
  output wire [(32'h128):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire85;
  input wire [(2'h3):(1'h0)] wire86;
  input wire [(4'he):(1'h0)] wire87;
  input wire [(5'h15):(1'h0)] wire88;
  input wire signed [(5'h12):(1'h0)] wire89;
  wire [(5'h12):(1'h0)] wire186;
  wire signed [(2'h2):(1'h0)] wire125;
  wire [(3'h6):(1'h0)] wire124;
  wire signed [(4'hc):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire signed [(5'h13):(1'h0)] wire90;
  wire [(3'h7):(1'h0)] wire91;
  wire [(5'h13):(1'h0)] wire92;
  wire [(3'h5):(1'h0)] wire94;
  wire signed [(3'h4):(1'h0)] wire95;
  wire signed [(5'h14):(1'h0)] wire96;
  wire signed [(4'hf):(1'h0)] wire97;
  wire [(5'h10):(1'h0)] wire98;
  wire signed [(3'h7):(1'h0)] wire99;
  wire signed [(5'h11):(1'h0)] wire108;
  wire signed [(2'h3):(1'h0)] wire120;
  reg [(5'h12):(1'h0)] reg107 = (1'h0);
  reg [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg105 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg104 = (1'h0);
  reg [(3'h6):(1'h0)] reg103 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg102 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg [(3'h6):(1'h0)] reg93 = (1'h0);
  assign y = {wire186,
                 wire125,
                 wire124,
                 wire123,
                 wire122,
                 wire90,
                 wire91,
                 wire92,
                 wire94,
                 wire95,
                 wire96,
                 wire97,
                 wire98,
                 wire99,
                 wire108,
                 wire120,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg93,
                 (1'h0)};
  assign wire90 = ($unsigned($signed({(wire89 ?
                          wire86 : wire87)})) == (wire87[(4'ha):(2'h3)] && $unsigned($unsigned($unsigned(wire87)))));
  assign wire91 = {$signed((~&((wire88 ? wire90 : wire90) >>> (wire86 ?
                          wire86 : wire88))))};
  assign wire92 = wire85[(3'h7):(3'h6)];
  always
    @(posedge clk) begin
      reg93 <= wire88[(1'h0):(1'h0)];
    end
  assign wire94 = ((wire92[(1'h0):(1'h0)] ?
                      {((!reg93) ~^ wire88[(5'h11):(5'h10)]),
                          ($signed((8'hbf)) ~^ reg93)} : $signed((wire90 ~^ $unsigned(wire86)))) >> {($unsigned(wire85) ?
                          ((~wire88) > $unsigned(wire91)) : wire91)});
  assign wire95 = (!wire87[(4'hc):(1'h0)]);
  assign wire96 = (($signed($unsigned($signed(wire89))) <= (wire86[(2'h3):(1'h1)] & $unsigned($signed(wire95)))) ?
                      wire95[(1'h1):(1'h1)] : wire89[(3'h5):(2'h3)]);
  assign wire97 = wire85[(5'h12):(4'h9)];
  assign wire98 = wire90;
  assign wire99 = (^~(~|(((~^wire85) ?
                      wire97[(2'h3):(2'h3)] : wire90) > (8'had))));
  always
    @(posedge clk) begin
      reg100 <= wire89[(4'he):(4'h9)];
      reg101 <= (wire92[(2'h2):(1'h0)] || $signed(((^~(wire85 ?
          wire94 : wire91)) | wire97[(4'h9):(1'h0)])));
      reg102 <= wire96[(5'h14):(4'h8)];
      reg103 <= (-$unsigned({{wire92}}));
      if ((8'h9d))
        begin
          reg104 <= wire99;
          reg105 <= (|(!wire85));
        end
      else
        begin
          reg104 <= $signed((wire92 ?
              $unsigned((&(+wire86))) : ((wire88[(5'h10):(4'h8)] > {wire88,
                  reg105}) <= $unsigned((|wire85)))));
          reg105 <= (!({((+reg103) - (reg101 - (8'ha7))), $signed(wire98)} ?
              (~^wire85) : reg102[(4'hd):(3'h4)]));
          if ((((8'ha2) ?
                  ($unsigned(reg93[(2'h2):(1'h0)]) ?
                      $unsigned({(8'ha1),
                          wire98}) : $unsigned(reg105)) : reg105[(1'h0):(1'h0)]) ?
              ({(8'hbe)} - {wire96[(5'h13):(2'h3)], wire98}) : $signed(wire89)))
            begin
              reg106 <= wire95[(2'h3):(1'h0)];
              reg107 <= $signed({(reg104[(1'h1):(1'h0)] | ((wire96 ?
                          (8'hb4) : wire98) ?
                      $signed((7'h42)) : $signed(wire97))),
                  ($signed(wire88) << reg101[(5'h15):(1'h0)])});
            end
          else
            begin
              reg106 <= reg104[(1'h0):(1'h0)];
              reg107 <= (wire94[(1'h0):(1'h0)] ?
                  (~$signed(wire88[(1'h1):(1'h0)])) : (wire88 ?
                      ($unsigned(wire95) ?
                          $unsigned(wire90) : (+{(8'haf),
                              wire86})) : $signed(reg107)));
            end
        end
    end
  assign wire108 = (wire99 - reg101);
  module109 #() modinst121 (.wire114(reg103), .wire110(wire92), .wire112(wire108), .wire111(wire87), .y(wire120), .clk(clk), .wire113(reg104));
  assign wire122 = (8'hb4);
  assign wire123 = (|(wire87 ~^ (&((~|wire122) ?
                       {wire98, wire120} : $unsigned(wire92)))));
  assign wire124 = (reg102 ?
                       wire94 : ((8'ha9) ?
                           (&$signed((-reg93))) : (-(wire87 ?
                               (~&wire95) : reg105))));
  assign wire125 = wire124[(1'h1):(1'h1)];
  module126 #() modinst187 (wire186, clk, reg102, wire90, reg105, wire99);
endmodule

module module11  (y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h1b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire12;
  input wire [(5'h12):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire14;
  input wire [(4'he):(1'h0)] wire15;
  input wire [(5'h13):(1'h0)] wire16;
  wire [(5'h13):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(4'h9):(1'h0)] wire19;
  wire [(5'h12):(1'h0)] wire31;
  reg [(5'h12):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg63 = (1'h0);
  reg [(4'hf):(1'h0)] reg62 = (1'h0);
  reg [(5'h10):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg59 = (1'h0);
  reg [(4'ha):(1'h0)] reg58 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg56 = (1'h0);
  reg [(5'h14):(1'h0)] reg55 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg53 = (1'h0);
  reg [(5'h14):(1'h0)] reg52 = (1'h0);
  reg [(5'h11):(1'h0)] reg51 = (1'h0);
  reg [(4'h9):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg48 = (1'h0);
  reg [(4'h9):(1'h0)] reg47 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg46 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg44 = (1'h0);
  reg [(2'h3):(1'h0)] reg43 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg [(4'h8):(1'h0)] reg41 = (1'h0);
  reg [(4'ha):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg38 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  assign y = {wire17,
                 wire18,
                 wire19,
                 wire31,
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
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire17 = wire16;
  assign wire18 = $signed(wire17);
  assign wire19 = wire15[(3'h7):(3'h5)];
  module20 #() modinst32 (.wire22(wire17), .wire23(wire12), .wire25(wire18), .wire21(wire14), .wire24(wire13), .clk(clk), .y(wire31));
  always
    @(posedge clk) begin
      reg33 <= (7'h44);
      if (($signed(reg33) ?
          (((8'h9c) > (^(^~(8'hb2)))) ?
              $signed((|$signed(reg33))) : ((((8'ha4) && wire18) ~^ wire31[(1'h1):(1'h1)]) != $signed($unsigned(wire14)))) : wire14[(4'h9):(4'h8)]))
        begin
          reg34 <= $unsigned({reg33[(5'h14):(1'h1)]});
          reg35 <= (((~$signed(wire14)) << wire19) == $unsigned((((wire14 ~^ wire14) + (~|wire14)) ~^ {(-wire13)})));
          if (wire16)
            begin
              reg36 <= (-($signed(wire13) == ({wire31,
                  (wire15 ? wire16 : wire14)} && wire13[(4'hc):(4'h8)])));
              reg37 <= (wire12 ?
                  ((reg33[(4'he):(1'h1)] <= $signed($signed(wire14))) >>> $signed({(reg35 ?
                          (8'ha8) : (8'hb2))})) : ($signed(((reg34 ?
                          reg33 : wire13) ?
                      (^wire12) : {reg36, reg34})) >>> wire14[(4'hc):(1'h1)]));
              reg38 <= $unsigned($signed(wire13));
              reg39 <= {$signed({(^$unsigned((8'hb2)))}),
                  (wire14[(2'h3):(1'h1)] || $unsigned(((wire31 >> (8'hbe)) & wire12[(4'h9):(3'h6)])))};
              reg40 <= (&(!((-$unsigned(wire19)) ?
                  $unsigned(((8'hab) ?
                      wire16 : reg38)) : wire17[(4'h9):(3'h4)])));
            end
          else
            begin
              reg36 <= (($unsigned((^wire31[(1'h1):(1'h1)])) ?
                      (~^((^reg40) ?
                          $unsigned(wire18) : $signed(wire31))) : $unsigned((-((8'hba) ?
                          reg39 : wire12)))) ?
                  $unsigned($signed($signed((+reg36)))) : ({($unsigned(wire18) >> {wire12})} ?
                      $unsigned(wire19[(1'h0):(1'h0)]) : $signed(((wire14 && reg38) | (reg40 > wire19)))));
              reg37 <= reg38[(3'h4):(2'h2)];
              reg38 <= $signed(((($unsigned((8'ha2)) ?
                  wire13 : {reg39}) == $unsigned($unsigned(wire18))) + {{$unsigned(reg37)}}));
              reg39 <= {$unsigned(($unsigned($unsigned(reg33)) <<< {reg35,
                      wire19})),
                  (+$unsigned($signed((8'hb2))))};
            end
        end
      else
        begin
          reg34 <= reg33[(5'h12):(3'h6)];
          reg35 <= (reg33 ?
              $signed(wire15) : (wire19[(3'h5):(2'h2)] ?
                  {$unsigned(reg34[(4'hb):(1'h1)])} : {({(8'ha6), reg40} ?
                          {wire19} : wire15[(4'h8):(3'h7)]),
                      $unsigned((wire12 ~^ (8'haa)))}));
          reg36 <= (|reg40[(2'h3):(2'h2)]);
        end
      if (($unsigned(($unsigned(reg40[(4'h9):(3'h6)]) ?
              $signed($signed(reg34)) : ((reg37 == reg37) ?
                  (~^reg39) : $signed(wire14)))) ?
          ({(reg33 ~^ ((8'h9f) ? reg38 : (8'had))),
              ((!(8'h9c)) ?
                  (~|reg33) : (reg37 ?
                      (7'h44) : reg34))} < (($unsigned(wire17) >> $signed(wire17)) ?
              (~((8'ha6) + reg39)) : $signed($unsigned((8'ha2))))) : reg37[(3'h7):(3'h5)]))
        begin
          if ($signed($signed($signed($signed(wire31)))))
            begin
              reg41 <= (|$signed(($unsigned(((7'h40) < wire31)) > reg37)));
              reg42 <= $signed((-(|reg38)));
              reg43 <= reg33;
              reg44 <= (^reg34[(2'h3):(2'h2)]);
              reg45 <= (^((~^wire14[(4'hc):(2'h2)]) ?
                  wire13[(4'h9):(1'h1)] : ($signed($signed(reg41)) != {(reg33 ?
                          reg36 : reg35)})));
            end
          else
            begin
              reg41 <= ($unsigned(wire16[(3'h6):(3'h4)]) ?
                  $signed((reg34[(3'h4):(3'h4)] ?
                      $signed($unsigned(reg35)) : wire17)) : wire31[(4'ha):(1'h1)]);
              reg42 <= $unsigned({$signed(($signed(wire14) < {wire31, reg39})),
                  (($unsigned((8'hbb)) ^~ reg39) ?
                      wire16 : (|((8'hb7) * reg42)))});
            end
          reg46 <= ($signed(($signed($unsigned(reg33)) & (reg45 * wire14[(4'h9):(1'h0)]))) ?
              reg44 : (^~reg40));
          reg47 <= $unsigned(wire31[(5'h10):(5'h10)]);
          if (reg33)
            begin
              reg48 <= reg44[(1'h0):(1'h0)];
            end
          else
            begin
              reg48 <= (wire18 != reg38[(3'h6):(1'h1)]);
              reg49 <= ((8'hbd) ?
                  {(7'h41),
                      ($unsigned((reg35 * reg33)) ?
                          (reg39[(5'h11):(3'h7)] ?
                              $signed(reg42) : $unsigned(wire15)) : $unsigned($signed(reg43)))} : wire17[(5'h10):(3'h5)]);
              reg50 <= $unsigned({($signed((wire19 - reg45)) != ((~^wire12) ?
                      (reg48 ? (8'hba) : reg38) : ((8'h9d) + reg47))),
                  reg38[(1'h0):(1'h0)]});
            end
          reg51 <= ((~reg44[(1'h1):(1'h1)]) ^~ (($signed($unsigned(reg38)) ?
              $unsigned(reg40) : reg43[(1'h0):(1'h0)]) >> $signed($unsigned($signed(reg47)))));
        end
      else
        begin
          reg41 <= $unsigned((~^$signed($signed((reg50 * (7'h41))))));
          reg42 <= (reg39[(5'h10):(4'he)] ?
              $signed(reg39[(5'h11):(5'h11)]) : wire15[(3'h6):(3'h5)]);
          reg43 <= $signed(reg46[(1'h1):(1'h1)]);
          reg44 <= reg47;
        end
      if ((8'hbc))
        begin
          reg52 <= $unsigned(reg50[(3'h7):(2'h2)]);
          if ($signed((~&(&$signed((|reg33))))))
            begin
              reg53 <= (reg39[(2'h2):(1'h0)] ?
                  ($signed((((8'h9d) == (8'hb3)) >>> reg42[(3'h7):(3'h7)])) >> $unsigned($unsigned((wire12 << reg48)))) : ((&({reg41,
                              (8'had)} ?
                          $signed(wire16) : $unsigned(reg51))) ?
                      (-$signed(((7'h41) | (8'ha7)))) : $signed($signed($signed(reg49)))));
              reg54 <= $unsigned((+$signed(reg51)));
              reg55 <= {((reg49 >> $unsigned($unsigned(reg33))) | ((reg43[(1'h0):(1'h0)] + (^wire31)) ?
                      $signed((reg36 >> (8'had))) : {{reg39}}))};
              reg56 <= ((~^{($signed(wire16) - $signed((8'hb1))),
                  $signed(((8'ha8) ?
                      reg52 : (8'ha6)))}) ^~ $signed($unsigned(reg37[(1'h1):(1'h1)])));
              reg57 <= $unsigned(reg54[(1'h1):(1'h0)]);
            end
          else
            begin
              reg53 <= (((($signed(reg33) >> {reg52,
                      reg44}) - $signed(wire19[(1'h1):(1'h0)])) ?
                  ($unsigned(reg46) && ($unsigned((8'hbe)) ?
                      (reg38 >>> wire14) : $signed(wire31))) : $unsigned((wire15[(1'h0):(1'h0)] + (reg55 ?
                      reg38 : wire13)))) > $signed($unsigned((^~$signed(reg49)))));
              reg54 <= (8'hb9);
              reg55 <= $unsigned(wire18[(3'h7):(3'h5)]);
              reg56 <= $unsigned(reg37);
            end
          reg58 <= (wire13[(4'hc):(3'h6)] && (+(!reg56[(3'h5):(3'h4)])));
          if ($unsigned((+((~reg58) ^~ (reg35 ^~ (&wire12))))))
            begin
              reg59 <= {reg39};
              reg60 <= (reg38[(1'h0):(1'h0)] <<< reg57[(4'hf):(4'hf)]);
              reg61 <= (($signed($signed(reg36)) >>> (!($signed((8'h9f)) ?
                  (reg36 ?
                      (7'h41) : reg59) : (~&reg46)))) > (!(|reg48[(4'ha):(2'h2)])));
              reg62 <= reg35;
              reg63 <= {(~^$signed($signed((reg43 <= (8'hbb)))))};
            end
          else
            begin
              reg59 <= ((~reg60) + (^~(|reg50)));
              reg60 <= $signed($signed((reg41 == reg52[(4'ha):(4'ha)])));
              reg61 <= $signed((-$signed({(8'hbb), (+wire13)})));
              reg62 <= ((~^$unsigned(reg40[(3'h6):(2'h3)])) & (wire13[(3'h7):(3'h5)] <= (reg53 == (reg52 <= $unsigned(reg63)))));
            end
          reg64 <= (!reg56[(1'h1):(1'h1)]);
        end
      else
        begin
          if (((reg57[(4'ha):(3'h6)] >> (&$signed({(8'hac)}))) ?
              ({reg52[(1'h1):(1'h1)], ((reg36 != wire16) >> wire15)} ?
                  wire13[(2'h3):(2'h3)] : {(~$unsigned((8'h9c))),
                      {((7'h44) <<< reg47),
                          (&reg49)}}) : (((!(wire18 ~^ (8'hbd))) != $signed((|wire14))) ?
                  wire15[(4'h9):(4'h8)] : (reg34 ?
                      $signed((reg57 ~^ reg56)) : {(&(8'ha7))}))))
            begin
              reg52 <= $unsigned($unsigned(reg53));
              reg53 <= ($unsigned({reg54}) ?
                  (wire19 * ((((8'hbd) ? reg43 : reg37) < (reg59 ?
                          wire14 : reg59)) ?
                      wire18 : (~$unsigned((7'h41))))) : ({reg49[(4'hd):(1'h0)]} ?
                      reg46 : ((~{wire16}) ?
                          {(reg41 - reg34),
                              $unsigned(reg57)} : $unsigned(((8'hb4) ?
                              wire15 : reg64)))));
              reg54 <= $unsigned((wire15[(4'hd):(4'ha)] >= reg43));
              reg55 <= reg43[(2'h3):(1'h1)];
              reg56 <= (reg35[(3'h5):(2'h3)] < ((~^$signed($unsigned(reg64))) ?
                  $signed(reg47[(2'h3):(2'h2)]) : wire15));
            end
          else
            begin
              reg52 <= (((((reg36 ? (8'hb9) : (8'ha9)) ?
                      $unsigned(reg47) : $unsigned(reg49)) & reg53[(2'h2):(2'h2)]) <<< {reg41,
                      ((8'h9c) == (&reg36))}) ?
                  reg40 : ((|$unsigned(reg42[(4'ha):(2'h2)])) ?
                      (~&wire17) : $unsigned($unsigned($signed((8'hbe))))));
            end
          reg57 <= wire15;
          reg58 <= {((((reg52 ? (8'hb7) : reg33) ?
                  (^wire19) : reg40) ^~ $unsigned(reg47[(3'h5):(1'h1)])) & (reg33[(5'h13):(4'hd)] - reg36[(2'h2):(2'h2)]))};
        end
    end
endmodule

module module20  (y, clk, wire25, wire24, wire23, wire22, wire21);
  output wire [(32'h43):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire25;
  input wire signed [(3'h7):(1'h0)] wire24;
  input wire signed [(3'h4):(1'h0)] wire23;
  input wire signed [(5'h13):(1'h0)] wire22;
  input wire [(4'he):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire30;
  wire [(4'h8):(1'h0)] wire29;
  wire [(4'hf):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'he):(1'h0)] wire26;
  assign y = {wire30, wire29, wire28, wire27, wire26, (1'h0)};
  assign wire26 = wire24;
  assign wire27 = wire25;
  assign wire28 = $unsigned((wire27[(1'h0):(1'h0)] ?
                      wire22[(1'h1):(1'h1)] : (($signed(wire27) ?
                              ((8'ha4) <<< wire23) : (|wire24)) ?
                          (!wire23) : wire21)));
  assign wire29 = (!(8'hbb));
  assign wire30 = $signed(($signed(wire24[(3'h4):(1'h1)]) || wire24));
endmodule

module module126
#(parameter param184 = (|(({((8'h9f) >= (8'h9f)), (8'hbf)} > (((8'hae) >>> (7'h41)) >= ((8'hb8) ? (8'had) : (8'hbc)))) <<< (~|(((8'ha7) ~^ (8'ha9)) & ((8'hb2) ? (8'hbc) : (8'hb5)))))), 
parameter param185 = (((8'ha1) ? {(|(param184 ? param184 : param184)), (~&(+param184))} : param184) < (param184 || param184)))
(y, clk, wire130, wire129, wire128, wire127);
  output wire [(32'h211):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire130;
  input wire [(5'h13):(1'h0)] wire129;
  input wire signed [(5'h13):(1'h0)] wire128;
  input wire signed [(2'h3):(1'h0)] wire127;
  wire signed [(4'h8):(1'h0)] wire183;
  wire signed [(3'h7):(1'h0)] wire182;
  wire [(2'h3):(1'h0)] wire181;
  wire [(5'h11):(1'h0)] wire180;
  wire signed [(3'h6):(1'h0)] wire176;
  wire signed [(4'hb):(1'h0)] wire175;
  wire [(4'hf):(1'h0)] wire174;
  wire signed [(2'h3):(1'h0)] wire173;
  wire signed [(3'h5):(1'h0)] wire172;
  wire [(5'h11):(1'h0)] wire171;
  wire [(4'h9):(1'h0)] wire170;
  wire [(2'h2):(1'h0)] wire136;
  wire [(4'hd):(1'h0)] wire135;
  wire signed [(5'h13):(1'h0)] wire134;
  wire [(3'h6):(1'h0)] wire133;
  wire signed [(5'h15):(1'h0)] wire132;
  wire [(3'h4):(1'h0)] wire131;
  reg signed [(3'h5):(1'h0)] reg179 = (1'h0);
  reg [(3'h7):(1'h0)] reg178 = (1'h0);
  reg [(4'hf):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg169 = (1'h0);
  reg [(4'ha):(1'h0)] reg168 = (1'h0);
  reg [(4'hc):(1'h0)] reg167 = (1'h0);
  reg [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(4'he):(1'h0)] reg165 = (1'h0);
  reg [(4'hf):(1'h0)] reg164 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg161 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg160 = (1'h0);
  reg [(4'hd):(1'h0)] reg159 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg158 = (1'h0);
  reg [(5'h10):(1'h0)] reg157 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg156 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg155 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg [(4'hb):(1'h0)] reg153 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg152 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg151 = (1'h0);
  reg [(4'ha):(1'h0)] reg150 = (1'h0);
  reg [(3'h6):(1'h0)] reg149 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg148 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg147 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg146 = (1'h0);
  reg [(2'h3):(1'h0)] reg145 = (1'h0);
  reg [(4'hf):(1'h0)] reg144 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg142 = (1'h0);
  reg [(3'h5):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(2'h3):(1'h0)] reg139 = (1'h0);
  reg [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(2'h2):(1'h0)] reg137 = (1'h0);
  assign y = {wire183,
                 wire182,
                 wire181,
                 wire180,
                 wire176,
                 wire175,
                 wire174,
                 wire173,
                 wire172,
                 wire171,
                 wire170,
                 wire136,
                 wire135,
                 wire134,
                 wire133,
                 wire132,
                 wire131,
                 reg179,
                 reg178,
                 reg177,
                 reg169,
                 reg168,
                 reg167,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
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
                 reg141,
                 reg140,
                 reg139,
                 reg138,
                 reg137,
                 (1'h0)};
  assign wire131 = wire128[(4'hf):(4'hf)];
  assign wire132 = $unsigned(($signed($unsigned((|wire130))) && wire130));
  assign wire133 = wire129;
  assign wire134 = ($unsigned(wire129[(3'h5):(2'h3)]) == $signed((8'ha1)));
  assign wire135 = ((wire134 >> $signed(wire133[(3'h4):(2'h2)])) >> (wire129[(4'he):(4'ha)] ?
                       ($unsigned(wire130[(3'h6):(3'h4)]) ?
                           ((wire133 - wire127) ?
                               {(7'h40),
                                   wire130} : ((8'had) || (8'ha6))) : {{(8'hbc),
                                   (8'ha5)},
                               $unsigned(wire130)}) : $unsigned((~|$unsigned((8'hb8))))));
  assign wire136 = (((8'hab) >= (+$signed((^wire129)))) ?
                       ($unsigned({$signed(wire128),
                           (+(8'hb2))}) && $unsigned(($unsigned(wire134) >> (wire132 ?
                           wire130 : wire127)))) : {(($unsigned(wire135) ?
                                   (wire130 > (8'hb3)) : wire134[(4'h9):(1'h1)]) ?
                               $unsigned((!wire130)) : wire131[(1'h0):(1'h0)])});
  always
    @(posedge clk) begin
      reg137 <= $unsigned(wire136);
      reg138 <= (wire136[(1'h0):(1'h0)] <<< $signed(wire133));
      if ((8'ha1))
        begin
          if (((^$unsigned((8'hbd))) ?
              wire136[(2'h2):(2'h2)] : $unsigned($signed((^{wire136})))))
            begin
              reg139 <= (wire128[(4'h8):(3'h4)] != wire127[(1'h1):(1'h0)]);
            end
          else
            begin
              reg139 <= wire136[(2'h2):(1'h0)];
              reg140 <= (wire127 ?
                  (~&(~|wire134)) : (+{$signed(reg137),
                      $signed((wire129 ^ wire132))}));
              reg141 <= wire128[(3'h6):(3'h5)];
              reg142 <= wire128[(3'h7):(3'h5)];
              reg143 <= $signed(reg140);
            end
          reg144 <= reg141;
          reg145 <= $signed($signed($unsigned($unsigned((wire133 ?
              (8'ha8) : reg143)))));
          reg146 <= (wire130[(4'hb):(3'h6)] > (($unsigned((&wire128)) ?
              ($signed(wire135) ~^ wire130[(3'h6):(2'h2)]) : wire127) <= (reg139 * (|(reg145 ?
              reg139 : (8'hae))))));
          reg147 <= wire134[(3'h4):(2'h3)];
        end
      else
        begin
          reg139 <= reg140[(4'ha):(3'h7)];
          reg140 <= $unsigned((~|$unsigned(reg139[(1'h1):(1'h0)])));
          if (reg147[(3'h7):(3'h4)])
            begin
              reg141 <= reg147[(3'h5):(2'h3)];
              reg142 <= {(|wire130[(4'hb):(1'h0)]),
                  $signed(($signed((wire127 > reg146)) ?
                      $signed($signed((8'hb0))) : ((wire128 ?
                          (8'h9f) : (8'hb1)) ^ $signed(reg138))))};
              reg143 <= $signed(reg146);
              reg144 <= $unsigned((!($signed($signed(wire129)) ?
                  ($signed(wire128) * wire127[(1'h0):(1'h0)]) : ($unsigned(wire135) ?
                      (wire134 ? reg145 : wire128) : (^wire127)))));
            end
          else
            begin
              reg141 <= ((|(|(^(reg137 < (7'h44))))) - {$signed(({reg147} <= $signed(reg139)))});
              reg142 <= $unsigned(wire136[(1'h0):(1'h0)]);
              reg143 <= {(^~($unsigned((wire133 ?
                      reg139 : (8'hb3))) ~^ reg141)),
                  wire135};
              reg144 <= wire136;
            end
        end
      reg148 <= {wire133[(1'h0):(1'h0)]};
      if ((^wire131))
        begin
          reg149 <= $signed((^~wire129[(4'hb):(3'h4)]));
          reg150 <= $signed($signed((($signed((8'h9d)) ~^ (&reg139)) ?
              (~&(reg147 ? wire129 : (8'hb0))) : $unsigned($signed(reg140)))));
          reg151 <= reg139;
          reg152 <= $signed(($signed(($unsigned(wire129) >= wire129)) ?
              (~|((wire134 ? wire128 : (8'hb0)) << (reg141 ?
                  wire129 : wire129))) : {(&$unsigned(reg143)),
                  $signed($signed(reg140))}));
          reg153 <= $unsigned($signed(reg147));
        end
      else
        begin
          reg149 <= {reg138};
          reg150 <= $signed($unsigned($unsigned((+(reg142 ?
              (8'ha4) : (7'h43))))));
          if ((((!$unsigned((^wire128))) ?
              (+(8'ha8)) : (($unsigned((8'ha7)) ?
                      $signed(reg139) : $unsigned(reg152)) ?
                  $signed(((7'h42) ?
                      reg140 : wire132)) : wire127[(2'h3):(2'h3)])) << $unsigned((~$signed(reg139[(2'h2):(2'h2)])))))
            begin
              reg151 <= ($unsigned(wire129) | ((8'h9f) == $signed(($signed(wire135) ?
                  wire136[(1'h1):(1'h1)] : (reg141 ^~ wire128)))));
              reg152 <= ($unsigned($signed(reg147)) ?
                  ((+$unsigned((reg150 ?
                      wire136 : wire136))) <<< (+reg142[(2'h3):(2'h2)])) : $signed(wire130));
              reg153 <= (reg142[(2'h2):(1'h1)] ?
                  $unsigned($unsigned($unsigned(reg143))) : wire127);
              reg154 <= (^~{reg146[(1'h1):(1'h0)]});
            end
          else
            begin
              reg151 <= $unsigned(reg144[(4'hc):(2'h3)]);
              reg152 <= $unsigned((wire132[(3'h6):(3'h4)] ?
                  {(+$unsigned(wire135))} : (reg140 ? reg138 : reg138)));
              reg153 <= reg146[(3'h4):(2'h3)];
              reg154 <= ($unsigned({(wire129 >= $signed(wire133)),
                  {$signed(wire132)}}) & $signed($unsigned($unsigned((wire132 == reg152)))));
            end
          reg155 <= (($unsigned((-reg147)) >>> $signed((^~(|reg139)))) ?
              $signed(reg139) : $unsigned($signed(reg142)));
        end
    end
  always
    @(posedge clk) begin
      reg156 <= ((~&$signed($signed((+wire128)))) ? reg141 : wire128);
      reg157 <= reg140[(4'hb):(4'hb)];
      reg158 <= reg148;
      reg159 <= $signed($signed((wire131[(3'h4):(3'h4)] ?
          $unsigned($unsigned(reg142)) : reg150[(2'h2):(1'h0)])));
    end
  always
    @(posedge clk) begin
      if ($signed($unsigned((8'hab))))
        begin
          reg160 <= (~|reg150);
        end
      else
        begin
          reg160 <= ((reg141 <= {$unsigned((wire130 ? wire128 : (8'hb9)))}) ?
              (|{$signed((-wire127)),
                  ((~&reg139) ^ (reg144 ?
                      wire132 : reg150))}) : $signed({wire129[(4'ha):(2'h2)]}));
          reg161 <= reg150;
          reg162 <= (!$signed($signed($signed((reg145 <= reg149)))));
        end
      reg163 <= (reg140 && reg140[(4'he):(3'h6)]);
      if ($signed(reg148[(1'h1):(1'h1)]))
        begin
          reg164 <= $unsigned((((^~(reg150 ? reg159 : (8'hbb))) ?
              $unsigned(reg150) : wire136) >= {$signed(reg142)}));
          reg165 <= reg163;
        end
      else
        begin
          if ((reg137 ?
              (8'ha9) : ((reg149[(2'h2):(1'h1)] - reg139) <<< (8'hbe))))
            begin
              reg164 <= wire128[(4'h9):(2'h2)];
            end
          else
            begin
              reg164 <= ((reg164 ?
                  reg140 : {wire130,
                      (~|(reg145 ?
                          reg159 : reg138))}) >> $unsigned((reg163[(1'h0):(1'h0)] ?
                  $signed((reg157 * (8'ha7))) : reg159[(3'h4):(3'h4)])));
            end
          reg165 <= ($signed((^~(wire136[(1'h0):(1'h0)] & (~reg161)))) * $signed($unsigned($unsigned((8'hab)))));
          if ($signed(reg161))
            begin
              reg166 <= (($unsigned($unsigned(reg140[(4'he):(3'h5)])) | $unsigned({reg139,
                  {wire128, wire128}})) <<< (~^$signed((reg152 ?
                  $signed((8'hbb)) : wire127[(2'h2):(1'h0)]))));
              reg167 <= $unsigned(reg160);
            end
          else
            begin
              reg166 <= ((~(reg156[(2'h2):(1'h0)] ?
                  wire131[(3'h4):(2'h2)] : (|reg166))) + ((reg150 ?
                      reg157[(3'h7):(1'h0)] : (reg145 & (~^reg146))) ?
                  reg159 : (((reg155 ? reg141 : reg158) ?
                      (wire128 > (8'ha3)) : ((8'hb0) & reg154)) - reg141)));
              reg167 <= $signed(((&$signed($unsigned(reg153))) <<< reg161));
              reg168 <= $unsigned((&{{reg154, (reg137 ^ wire128)}}));
              reg169 <= (~|($signed(reg159) ?
                  $signed((((8'hb0) ? wire129 : wire130) ?
                      $unsigned(reg155) : $unsigned(reg152))) : (-(wire135[(3'h6):(1'h0)] + (8'ha2)))));
            end
        end
    end
  assign wire170 = $signed({(~|$signed({wire134, reg154})),
                       reg151[(2'h3):(2'h2)]});
  assign wire171 = wire128[(1'h0):(1'h0)];
  assign wire172 = reg137[(1'h0):(1'h0)];
  assign wire173 = (^reg167[(4'ha):(1'h0)]);
  assign wire174 = $unsigned({((wire173[(1'h1):(1'h0)] ?
                           $unsigned(reg139) : reg145) & reg146)});
  assign wire175 = $unsigned(reg163);
  assign wire176 = $unsigned(reg157[(4'h9):(2'h3)]);
  always
    @(posedge clk) begin
      reg177 <= $signed($unsigned(({$signed(reg140)} ^ $signed(wire132[(5'h15):(4'h9)]))));
      reg178 <= reg144;
      reg179 <= wire128[(5'h13):(4'hb)];
    end
  assign wire180 = {$unsigned(reg149[(3'h6):(1'h1)])};
  assign wire181 = reg137[(1'h0):(1'h0)];
  assign wire182 = (-{reg161});
  assign wire183 = {(&reg165[(4'h8):(2'h2)]), reg168};
endmodule

module module109
#(parameter param119 = ({{(^~((8'hbc) ? (8'hb1) : (7'h41)))}} ? (((((8'hb2) << (8'ha3)) ? ((8'hac) ? (8'hbb) : (8'hb7)) : ((8'ha5) ? (7'h41) : (8'hb6))) ? (&((8'ha1) == (8'hb2))) : (((8'ha3) ? (8'hb9) : (8'ha9)) ^ (^(8'ha4)))) ? (8'had) : ((((8'hae) < (8'ha8)) <<< (~^(8'hbb))) ? ((~|(8'ha5)) ? ((8'ha5) & (8'had)) : {(8'ha4)}) : ((8'h9c) ? ((8'h9f) > (8'ha2)) : ((8'ha2) ? (8'ha3) : (8'hbf))))) : ((((|(7'h43)) ? ((7'h42) ? (8'hac) : (8'h9d)) : (!(8'hb4))) ? (-((8'ha4) - (8'hb0))) : (~((8'hb9) ? (7'h44) : (8'hbb)))) ? {(~^((8'hbd) ? (8'hb5) : (8'ha2))), ((^~(7'h41)) <<< ((8'hb0) << (8'ha8)))} : ({((8'ha6) ? (8'hb6) : (8'h9e)), ((7'h41) ? (8'hbb) : (8'hb2))} ? (^((8'haa) || (8'hae))) : {((8'hbb) | (8'hb6)), ((7'h43) ? (8'haa) : (8'hac))}))))
(y, clk, wire114, wire113, wire112, wire111, wire110);
  output wire [(32'h2a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire114;
  input wire [(5'h11):(1'h0)] wire113;
  input wire signed [(5'h11):(1'h0)] wire112;
  input wire signed [(4'hb):(1'h0)] wire111;
  input wire [(5'h13):(1'h0)] wire110;
  wire signed [(4'ha):(1'h0)] wire118;
  wire [(4'ha):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire signed [(3'h7):(1'h0)] wire115;
  assign y = {wire118, wire117, wire116, wire115, (1'h0)};
  assign wire115 = ({wire110[(4'hd):(3'h7)],
                       ((|(8'hb4)) == ((wire113 ?
                           wire111 : wire110) | $signed(wire114)))} < (^~wire113[(4'hb):(4'hb)]));
  assign wire116 = wire110;
  assign wire117 = (-$signed($signed($signed((wire114 ? wire110 : (8'h9f))))));
  assign wire118 = wire115;
endmodule
