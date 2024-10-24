module top
#(parameter param162 = ((((((8'hbb) <= (8'hae)) && (~^(8'hae))) + (!((8'ha9) ^ (8'hbd)))) ^ {(((8'hbd) ? (8'ha2) : (8'hba)) >= {(8'haf), (7'h43)}), (((8'hb8) >>> (8'ha2)) >= (~^(8'ha6)))}) ? {(({(7'h40)} > ((7'h40) ? (8'hb8) : (8'hb5))) + (((7'h44) ? (8'hbc) : (8'hbc)) != (!(7'h44)))), (~|((^(8'ha9)) ? (~&(8'had)) : ((8'hba) >>> (8'hb6))))} : {{(8'ha9)}, (((~&(8'hb0)) <= ((8'hb0) ? (8'hba) : (8'h9c))) ? (((8'hbc) <= (8'hb9)) ? (8'hab) : ((8'ha1) ? (8'hb9) : (8'haa))) : (~&((8'hb3) ^ (7'h43))))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire [(4'h9):(1'h0)] wire0;
  wire signed [(4'hb):(1'h0)] wire160;
  wire signed [(5'h14):(1'h0)] wire15;
  wire [(5'h13):(1'h0)] wire14;
  wire [(3'h6):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire5;
  wire signed [(2'h3):(1'h0)] wire4;
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(4'hd):(1'h0)] reg8 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg9 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg10 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg11 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(4'h9):(1'h0)] reg13 = (1'h0);
  assign y = {wire160,
                 wire15,
                 wire14,
                 wire6,
                 wire5,
                 wire4,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 reg12,
                 reg13,
                 (1'h0)};
  assign wire4 = (($unsigned($unsigned(wire3[(1'h1):(1'h1)])) ?
                     (|wire0) : wire3[(2'h2):(1'h1)]) - wire3);
  assign wire5 = $signed(wire1);
  assign wire6 = $signed($unsigned((($unsigned(wire3) ?
                     wire1[(3'h4):(2'h2)] : ((8'hb5) & (8'ha2))) * wire2[(3'h5):(1'h0)])));
  always
    @(posedge clk) begin
      reg7 <= wire1;
      if ($signed(($unsigned((wire6[(2'h3):(2'h3)] ? (8'haf) : wire5)) ?
          {$unsigned($unsigned(wire1)), $unsigned($signed(reg7))} : ((((8'hae) ?
                  wire5 : wire3) && {reg7}) ?
              wire4[(1'h0):(1'h0)] : $unsigned(wire0[(1'h0):(1'h0)])))))
        begin
          reg8 <= wire2[(4'hc):(4'h8)];
        end
      else
        begin
          reg8 <= (~|wire5);
          if (wire0)
            begin
              reg9 <= $signed(($signed($unsigned((&wire0))) & $signed(wire4[(1'h0):(1'h0)])));
            end
          else
            begin
              reg9 <= reg7;
              reg10 <= $signed($signed({wire6}));
            end
          reg11 <= $unsigned(({{(wire5 * reg9)},
              reg9[(3'h7):(3'h5)]} * {(wire6[(1'h0):(1'h0)] ? reg9 : reg10),
              wire1}));
          reg12 <= ((8'ha2) ?
              (wire0[(4'h8):(3'h5)] ?
                  wire4[(2'h2):(1'h1)] : wire3[(1'h0):(1'h0)]) : ({$signed((wire1 ^ reg9))} ?
                  ((^~(wire6 ? wire2 : wire6)) ?
                      (~$unsigned(wire2)) : wire0) : {((8'hb9) <= wire6)}));
          reg13 <= ($unsigned({$signed((wire2 | reg11))}) + {(reg10[(4'h8):(1'h0)] ?
                  $unsigned((|wire5)) : (+$signed((8'hb8))))});
        end
    end
  assign wire14 = $signed(reg12[(4'h9):(3'h5)]);
  assign wire15 = wire5[(3'h4):(1'h0)];
  module16 #() modinst161 (wire160, clk, reg12, wire2, wire6, wire3, wire15);
endmodule

module module16
#(parameter param158 = (|(8'ha1)), 
parameter param159 = ((((8'hac) ? (param158 ? {param158, param158} : (!param158)) : (^param158)) ? ((!(7'h43)) ^~ ({param158, param158} >>> param158)) : (^~(^~((8'hbb) ? param158 : param158)))) != ((&(!(param158 ? param158 : param158))) ? (((~param158) & (param158 ^ param158)) ? {(param158 << (8'hba))} : ((!param158) ? (param158 ? param158 : param158) : param158)) : ((+(param158 ? param158 : param158)) ? {(&param158)} : ((8'hb9) ? param158 : param158)))))
(y, clk, wire17, wire18, wire19, wire20, wire21);
  output wire [(32'h2a0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire17;
  input wire [(4'hf):(1'h0)] wire18;
  input wire signed [(3'h6):(1'h0)] wire19;
  input wire signed [(5'h12):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire157;
  wire [(5'h10):(1'h0)] wire155;
  wire [(3'h7):(1'h0)] wire107;
  wire signed [(3'h6):(1'h0)] wire106;
  wire [(4'hf):(1'h0)] wire85;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire65;
  wire signed [(4'hd):(1'h0)] wire64;
  wire signed [(4'hf):(1'h0)] wire63;
  wire [(4'hd):(1'h0)] wire62;
  wire signed [(5'h15):(1'h0)] wire22;
  wire [(4'hd):(1'h0)] wire59;
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg24 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg [(4'hc):(1'h0)] reg61 = (1'h0);
  reg [(5'h11):(1'h0)] reg67 = (1'h0);
  reg [(4'hd):(1'h0)] reg68 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg71 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg72 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(4'hd):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(5'h14):(1'h0)] reg78 = (1'h0);
  reg [(2'h3):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg80 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg82 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg83 = (1'h0);
  reg [(4'ha):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg87 = (1'h0);
  reg [(4'hc):(1'h0)] reg88 = (1'h0);
  reg [(2'h3):(1'h0)] reg89 = (1'h0);
  reg [(2'h3):(1'h0)] reg90 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg91 = (1'h0);
  reg [(4'ha):(1'h0)] reg92 = (1'h0);
  reg [(4'h8):(1'h0)] reg93 = (1'h0);
  reg [(5'h10):(1'h0)] reg94 = (1'h0);
  reg [(3'h7):(1'h0)] reg95 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg96 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg97 = (1'h0);
  reg [(4'hc):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg99 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg100 = (1'h0);
  reg [(5'h11):(1'h0)] reg101 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg102 = (1'h0);
  reg [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg104 = (1'h0);
  reg [(4'hf):(1'h0)] reg105 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg108 = (1'h0);
  reg [(4'h8):(1'h0)] reg109 = (1'h0);
  assign y = {wire157,
                 wire155,
                 wire107,
                 wire106,
                 wire85,
                 wire84,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire22,
                 wire59,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg61,
                 reg67,
                 reg68,
                 reg69,
                 reg70,
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
                 reg83,
                 reg86,
                 reg87,
                 reg88,
                 reg89,
                 reg90,
                 reg91,
                 reg92,
                 reg93,
                 reg94,
                 reg95,
                 reg96,
                 reg97,
                 reg98,
                 reg99,
                 reg100,
                 reg101,
                 reg102,
                 reg103,
                 reg104,
                 reg105,
                 reg108,
                 reg109,
                 (1'h0)};
  assign wire22 = wire17;
  always
    @(posedge clk) begin
      if (((~^$unsigned($unsigned((wire20 || wire21)))) >= $unsigned($unsigned(wire22[(2'h3):(1'h0)]))))
        begin
          reg23 <= $signed($unsigned(wire18[(4'he):(4'hb)]));
        end
      else
        begin
          if ((wire21[(1'h1):(1'h1)] & wire18[(4'hc):(4'hc)]))
            begin
              reg23 <= wire22;
              reg24 <= $signed(wire22);
              reg25 <= (&{{$unsigned((wire21 ? reg23 : reg23)), wire17},
                  $unsigned($unsigned((wire20 ? (7'h40) : (8'hbe))))});
              reg26 <= wire21[(4'hb):(4'hb)];
            end
          else
            begin
              reg23 <= $signed((~^((wire22 + (reg23 == reg24)) ?
                  (wire21[(2'h2):(2'h2)] ?
                      (^~reg26) : $unsigned(wire17)) : $signed((~^wire22)))));
              reg24 <= (~^$signed((($signed(wire19) && (wire22 ?
                  wire20 : reg26)) & ((^wire17) ?
                  wire21[(4'h9):(2'h3)] : reg25))));
              reg25 <= wire21;
              reg26 <= {($unsigned(reg24) ?
                      wire18 : $unsigned((~|$signed(wire17)))),
                  ((((wire22 ? wire20 : wire22) ?
                          $signed(reg26) : $unsigned(wire18)) ~^ reg24[(4'h8):(4'h8)]) ?
                      $unsigned($signed($unsigned((8'ha7)))) : (wire17 ?
                          wire20 : reg25[(1'h1):(1'h1)]))};
              reg27 <= (wire18 ?
                  ({reg24[(4'h9):(3'h7)]} ^~ ($signed(reg23) ?
                      ((reg25 ? (8'h9c) : reg26) ?
                          $signed(wire22) : $unsigned(wire17)) : (8'ha9))) : ((~^(-wire20)) ?
                      (~&wire18[(2'h3):(2'h2)]) : {$signed((reg23 ?
                              (8'hbd) : wire21)),
                          wire22[(4'hd):(1'h1)]}));
            end
        end
    end
  module28 #() modinst60 (.wire29(wire19), .y(wire59), .wire31(reg25), .wire33(reg26), .clk(clk), .wire32(wire18), .wire30(wire22));
  always
    @(posedge clk) begin
      reg61 <= wire19[(3'h6):(1'h0)];
    end
  assign wire62 = reg24[(4'hf):(2'h3)];
  assign wire63 = $signed(reg25[(3'h7):(3'h6)]);
  assign wire64 = $unsigned((wire59[(3'h6):(1'h0)] ?
                      wire59[(3'h7):(2'h2)] : {$signed({wire19}),
                          ($signed(reg26) ?
                              $unsigned(wire19) : reg24[(1'h1):(1'h1)])}));
  assign wire65 = wire20[(4'h9):(3'h4)];
  assign wire66 = (^$unsigned((~&((8'hba) ^~ {wire59}))));
  always
    @(posedge clk) begin
      reg67 <= (^~$signed(($signed(wire65[(2'h3):(1'h0)]) > ((wire63 == (7'h44)) < ((8'haa) ?
          reg25 : wire65)))));
      reg68 <= reg27[(4'h8):(2'h2)];
      if (($signed($signed($signed($signed((8'ha4))))) ?
          $signed(reg24[(3'h6):(1'h1)]) : ($unsigned(wire20[(4'hd):(4'h8)]) > ((~^wire21) && ((~&(8'ha9)) ?
              $signed(wire59) : $unsigned(wire66))))))
        begin
          reg69 <= $signed(reg25[(1'h0):(1'h0)]);
          if ({($unsigned(((wire20 ? wire62 : wire19) ?
                  $unsigned(reg68) : $signed(reg24))) > (+(8'haa))),
              (~((7'h40) <<< wire17))})
            begin
              reg70 <= {(((|(reg26 ? reg27 : wire62)) ?
                          (-reg23) : (reg24 > (reg69 || wire20))) ?
                      (((wire21 < reg69) >> $signed((8'ha5))) ?
                          {$unsigned(reg67)} : wire17[(3'h4):(1'h0)]) : $unsigned($signed(wire21))),
                  (wire18 ?
                      $unsigned(wire20) : {(wire18 >>> (wire17 ?
                              (8'ha0) : reg25))})};
              reg71 <= (!reg70[(1'h1):(1'h0)]);
              reg72 <= {wire22[(1'h0):(1'h0)],
                  {$signed($signed((wire64 >= (7'h44))))}};
              reg73 <= $signed(wire17);
            end
          else
            begin
              reg70 <= reg73[(4'h9):(4'h8)];
              reg71 <= $signed((!(~&wire63)));
            end
        end
      else
        begin
          reg69 <= $signed($unsigned(reg27[(4'ha):(4'ha)]));
          if ($signed((~(|wire17))))
            begin
              reg70 <= (|($unsigned($signed($signed(wire20))) >> {(8'ha2),
                  wire20[(2'h2):(1'h0)]}));
              reg71 <= $signed(reg71[(3'h5):(1'h1)]);
              reg72 <= wire21;
              reg73 <= {{(^((reg61 >>> reg70) * ((8'hbb) - wire19))),
                      (-(~^(!reg69)))}};
              reg74 <= wire62;
            end
          else
            begin
              reg70 <= wire63;
            end
          if (reg24[(3'h5):(2'h2)])
            begin
              reg75 <= wire65;
              reg76 <= ((((~^reg24[(4'h9):(3'h7)]) != {reg23}) ?
                      ($unsigned((wire64 != (8'hb5))) & wire66[(5'h10):(3'h7)]) : (&wire20)) ?
                  $signed(wire63) : $signed(((|(+reg72)) ?
                      wire65 : ((reg68 ? wire21 : wire21) ?
                          reg75[(4'h9):(3'h5)] : ((8'ha1) >> wire63)))));
              reg77 <= {(($signed((+reg76)) ?
                          $unsigned($unsigned(wire66)) : wire66[(4'hb):(3'h7)]) ?
                      $unsigned((wire19[(2'h3):(1'h1)] ^ {(8'ha9)})) : reg23)};
              reg78 <= ({($signed($signed(reg70)) ?
                      $signed($unsigned(reg27)) : (-reg73[(4'h8):(3'h4)]))} - $unsigned(($unsigned((wire63 ?
                      reg26 : reg74)) ?
                  $signed($unsigned((8'had))) : reg27[(3'h5):(3'h4)])));
              reg79 <= $signed((wire18 ?
                  ({reg61} & $unsigned(reg77[(2'h2):(2'h2)])) : $signed((((8'h9d) ?
                          wire20 : wire17) ?
                      $unsigned(reg75) : $signed((7'h42))))));
            end
          else
            begin
              reg75 <= wire17[(4'hd):(4'hb)];
            end
          if ($signed(wire63[(2'h2):(1'h1)]))
            begin
              reg80 <= $unsigned(reg74);
              reg81 <= reg67;
              reg82 <= ($unsigned($unsigned($unsigned(((8'ha9) - reg77)))) >> ($signed(reg75) > ({(^~wire63)} && $unsigned((^(8'hbf))))));
            end
          else
            begin
              reg80 <= $unsigned($unsigned(($unsigned((~reg61)) ?
                  $unsigned(reg70) : ((~&(8'hac)) ?
                      reg80[(3'h4):(2'h2)] : $signed(reg70)))));
              reg81 <= (+((8'hb7) ?
                  ($signed({wire66}) ?
                      ($unsigned(reg24) ?
                          reg70[(2'h2):(1'h0)] : $signed(reg23)) : $signed(reg76)) : (reg24 >= reg26[(5'h10):(3'h5)])));
              reg82 <= ({$unsigned(wire64), {reg80}} ?
                  (+({(wire19 ? (8'h9d) : wire20)} ?
                      $signed($signed(reg75)) : reg23[(4'h9):(1'h0)])) : ((^~$unsigned(reg69)) ?
                      $unsigned(reg75) : $signed(wire19)));
              reg83 <= $signed($unsigned($signed((8'ha8))));
            end
        end
    end
  assign wire84 = (reg23 * $unsigned($unsigned((reg67[(3'h5):(3'h5)] ^~ $unsigned((8'had))))));
  assign wire85 = (8'ha4);
  always
    @(posedge clk) begin
      reg86 <= {$unsigned((($signed(reg67) ^~ reg26) - (((8'hb5) ?
                  reg82 : reg67) ?
              (wire62 ? reg74 : reg24) : $unsigned(reg70)))),
          {(^~$unsigned(reg67)),
              $signed(($signed(wire85) ?
                  ((8'h9f) ? (8'hbd) : (8'hb6)) : (wire64 || wire62)))}};
      if ($unsigned(wire85[(3'h4):(1'h0)]))
        begin
          reg87 <= wire19[(1'h0):(1'h0)];
          if ((!((wire20 ? {{reg83}} : {$signed(reg24)}) & (reg70 ?
              (7'h43) : ({reg26} ? (reg23 == reg69) : $signed(reg70))))))
            begin
              reg88 <= ($signed($unsigned($unsigned($signed(reg86)))) != $unsigned(($signed(((7'h41) && reg79)) ?
                  ((reg27 << reg72) > reg26) : reg71[(3'h7):(2'h2)])));
              reg89 <= (+(reg75 ?
                  (($unsigned(wire85) != $unsigned(wire18)) <= $signed($signed(reg68))) : (~^{(wire62 * reg75)})));
              reg90 <= wire63;
            end
          else
            begin
              reg88 <= ($unsigned(($unsigned((wire21 * reg26)) + (8'hba))) <= reg80[(2'h2):(1'h0)]);
              reg89 <= reg26;
              reg90 <= ((^~($unsigned((wire84 ^ reg88)) ?
                      $signed(reg23[(4'hd):(2'h3)]) : {$signed(reg61),
                          $unsigned(reg73)})) ?
                  $unsigned(reg72[(2'h2):(2'h2)]) : (($signed(reg67) ?
                      {(reg61 ?
                              wire64 : wire66)} : ({reg74} == reg83[(3'h5):(1'h0)])) ^~ $signed($unsigned({wire18,
                      (8'ha0)}))));
              reg91 <= wire85[(4'hc):(3'h7)];
              reg92 <= {(-((reg25[(1'h1):(1'h0)] <= ((8'haf) * (7'h42))) ?
                      (~((8'hb0) ? wire21 : wire59)) : $unsigned({reg26,
                          reg76}))),
                  wire59[(4'hb):(4'ha)]};
            end
        end
      else
        begin
          reg87 <= reg87;
          reg88 <= $signed(reg92[(3'h6):(1'h1)]);
        end
      reg93 <= wire18;
      if ({reg87})
        begin
          reg94 <= (^$signed($signed(((+reg76) * (reg69 && (8'hb5))))));
        end
      else
        begin
          if ((^~{(($unsigned(wire85) ^ reg88[(4'h8):(3'h6)]) & (8'hb3))}))
            begin
              reg94 <= wire64[(4'h8):(1'h1)];
              reg95 <= (wire21 ? reg27[(1'h0):(1'h0)] : reg24[(4'he):(2'h2)]);
              reg96 <= ((^~($unsigned(reg79) <<< (+$unsigned((8'h9d))))) ?
                  reg78[(5'h11):(5'h11)] : ({((!reg92) ?
                          reg73 : {reg79, reg92}),
                      $unsigned((reg73 ?
                          reg68 : reg81))} << $unsigned({reg87[(2'h2):(2'h2)]})));
              reg97 <= $signed(reg72[(4'ha):(4'ha)]);
            end
          else
            begin
              reg94 <= reg80;
              reg95 <= {((!reg70) ?
                      reg26 : (($unsigned(reg25) ?
                          reg80 : $signed(reg75)) << reg93)),
                  ((reg76[(1'h1):(1'h0)] ?
                          (&$unsigned(wire66)) : ($signed(wire63) && $unsigned(reg73))) ?
                      reg61[(1'h0):(1'h0)] : $unsigned(reg90[(2'h3):(2'h3)]))};
              reg96 <= ({reg73} ^~ $unsigned(reg88[(4'h8):(4'h8)]));
              reg97 <= reg71;
              reg98 <= reg92[(3'h5):(1'h0)];
            end
          reg99 <= reg93[(2'h2):(1'h0)];
          reg100 <= (reg25[(2'h2):(1'h1)] & $signed(reg96));
          reg101 <= $signed(($signed(wire64[(1'h0):(1'h0)]) ^~ $unsigned($signed((reg68 ?
              (8'hbe) : reg24)))));
          if (reg69[(1'h0):(1'h0)])
            begin
              reg102 <= {$unsigned({{(^wire22)}}),
                  (~&(~&((~reg82) ^~ (~|wire18))))};
              reg103 <= reg26;
              reg104 <= $unsigned($signed(reg102));
              reg105 <= $signed($unsigned((|$unsigned((8'h9f)))));
            end
          else
            begin
              reg102 <= ((((+{wire65, reg81}) & (^$unsigned(reg95))) && reg73) ?
                  $unsigned(($unsigned((^reg97)) ?
                      ($unsigned(reg89) | (wire21 + reg96)) : wire59[(1'h1):(1'h1)])) : reg92);
              reg103 <= ($signed($unsigned((|reg82[(4'hb):(2'h2)]))) ?
                  {$signed($signed((^~wire84)))} : reg80[(1'h0):(1'h0)]);
              reg104 <= reg97[(2'h2):(1'h1)];
              reg105 <= $signed($signed($unsigned(((~(8'ha1)) ?
                  $signed(wire59) : $signed(reg103)))));
            end
        end
    end
  assign wire106 = $unsigned(($signed($unsigned(reg103)) != reg89[(2'h3):(1'h1)]));
  assign wire107 = {(^reg92), reg78[(2'h2):(1'h0)]};
  always
    @(posedge clk) begin
      reg108 <= ((+wire22[(1'h1):(1'h1)]) < (wire107 ?
          $signed(reg77) : (((!(8'haa)) ?
                  $unsigned(reg72) : $unsigned(wire59)) ?
              (reg101[(3'h6):(2'h3)] ?
                  $unsigned(wire65) : (reg95 ?
                      (8'hbd) : reg75)) : $signed((-reg67)))));
      reg109 <= ((+{reg70[(1'h0):(1'h0)],
          ($signed(reg27) >= (reg88 < wire20))}) ^ ((^~reg24[(2'h3):(1'h0)]) ?
          $unsigned((~&reg61[(3'h4):(3'h4)])) : wire19));
    end
  module110 #() modinst156 (.wire113(reg100), .wire114(reg61), .clk(clk), .y(wire155), .wire115(reg76), .wire111(reg96), .wire112(reg99));
  assign wire157 = reg75[(4'h9):(3'h5)];
endmodule

module module110
#(parameter param154 = (8'hbe))
(y, clk, wire115, wire114, wire113, wire112, wire111);
  output wire [(32'h1cc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire115;
  input wire signed [(4'hc):(1'h0)] wire114;
  input wire [(5'h10):(1'h0)] wire113;
  input wire signed [(5'h14):(1'h0)] wire112;
  input wire [(4'h8):(1'h0)] wire111;
  wire [(5'h11):(1'h0)] wire153;
  wire [(4'ha):(1'h0)] wire152;
  wire [(4'hb):(1'h0)] wire136;
  wire [(5'h13):(1'h0)] wire134;
  wire signed [(2'h2):(1'h0)] wire133;
  wire signed [(5'h11):(1'h0)] wire130;
  wire signed [(2'h2):(1'h0)] wire129;
  wire signed [(5'h11):(1'h0)] wire128;
  wire [(5'h12):(1'h0)] wire127;
  wire signed [(3'h6):(1'h0)] wire126;
  wire signed [(4'h8):(1'h0)] wire117;
  wire [(4'h8):(1'h0)] wire116;
  reg [(5'h10):(1'h0)] reg151 = (1'h0);
  reg [(3'h5):(1'h0)] reg150 = (1'h0);
  reg [(4'hd):(1'h0)] reg149 = (1'h0);
  reg [(5'h11):(1'h0)] reg148 = (1'h0);
  reg [(4'h9):(1'h0)] reg147 = (1'h0);
  reg [(5'h10):(1'h0)] reg146 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg145 = (1'h0);
  reg [(4'he):(1'h0)] reg144 = (1'h0);
  reg [(4'he):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(4'h9):(1'h0)] reg140 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg139 = (1'h0);
  reg [(5'h11):(1'h0)] reg138 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(5'h15):(1'h0)] reg135 = (1'h0);
  reg [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg131 = (1'h0);
  reg [(5'h15):(1'h0)] reg125 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg124 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg123 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg122 = (1'h0);
  reg [(2'h3):(1'h0)] reg121 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg120 = (1'h0);
  reg [(4'hb):(1'h0)] reg119 = (1'h0);
  reg [(4'hc):(1'h0)] reg118 = (1'h0);
  assign y = {wire153,
                 wire152,
                 wire136,
                 wire134,
                 wire133,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 wire126,
                 wire117,
                 wire116,
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
                 reg135,
                 reg132,
                 reg131,
                 reg125,
                 reg124,
                 reg123,
                 reg122,
                 reg121,
                 reg120,
                 reg119,
                 reg118,
                 (1'h0)};
  assign wire116 = $unsigned(((((wire115 ? wire115 : wire113) ?
                           $unsigned(wire112) : (~&(8'hab))) >>> ({wire111,
                           wire112} >> wire114)) ?
                       (^$signed($unsigned(wire114))) : (($signed((8'ha7)) * (wire113 * wire111)) ?
                           wire112 : wire113)));
  assign wire117 = $signed((~^wire111[(1'h1):(1'h1)]));
  always
    @(posedge clk) begin
      reg118 <= {$signed(wire113[(4'he):(4'he)])};
      if ((((8'hbd) ?
          ($signed((reg118 <= reg118)) ?
              $unsigned((wire115 ?
                  (8'hb4) : wire117)) : ((~&(8'hae)) == (^~wire115))) : ((~^(wire115 ?
              wire116 : wire116)) >>> $signed(wire116))) && $unsigned(wire117)))
        begin
          reg119 <= (((wire112[(1'h1):(1'h0)] ?
                  wire116[(3'h6):(2'h3)] : $signed(wire114[(4'ha):(2'h2)])) ?
              (($signed(wire114) != (wire114 << (8'hbd))) >= $unsigned($signed(wire111))) : $signed({wire115,
                  (wire111 * wire113)})) - reg118[(3'h5):(3'h4)]);
          reg120 <= (($signed(wire115[(1'h1):(1'h0)]) ~^ $unsigned(wire115[(2'h2):(1'h1)])) ?
              $unsigned($signed((~&$unsigned(wire113)))) : ($unsigned(reg118) ?
                  {$signed(reg119[(4'h8):(3'h5)])} : $signed(wire115)));
          reg121 <= $unsigned((reg118 ?
              $unsigned(({(8'ha5),
                  wire116} ~^ $unsigned(wire116))) : (((~|wire116) <<< $signed((8'hb6))) + wire112)));
          reg122 <= {$unsigned($signed((~&(&wire111)))),
              ((((!wire113) < reg119) != (wire113[(4'he):(3'h5)] ?
                      {reg120} : ((8'h9f) ? wire113 : wire117))) ?
                  (^~({wire116} ?
                      $signed(reg118) : $signed(wire115))) : ((wire117[(1'h0):(1'h0)] << $unsigned(wire115)) <<< $unsigned(reg118)))};
          reg123 <= {$unsigned($signed(reg119))};
        end
      else
        begin
          if (reg118)
            begin
              reg119 <= $unsigned((($signed($unsigned(wire114)) || ((~wire113) ?
                  (~reg121) : wire113)) != (&{$signed(wire113)})));
              reg120 <= (!$unsigned($unsigned(({reg119} ?
                  $unsigned(wire112) : $unsigned((8'hbc))))));
              reg121 <= $signed(wire114[(3'h4):(1'h1)]);
              reg122 <= ($unsigned($signed((^wire116))) ?
                  (8'hb6) : ($unsigned($signed({wire117,
                      wire115})) <= wire115[(2'h2):(2'h2)]));
              reg123 <= {((~|(~(reg120 * wire115))) ?
                      reg118 : (~|(~&{wire117})))};
            end
          else
            begin
              reg119 <= (~^$signed($unsigned($unsigned((wire117 || wire117)))));
              reg120 <= {reg120};
              reg121 <= wire117[(1'h1):(1'h1)];
              reg122 <= (((-wire117[(1'h0):(1'h0)]) ?
                      wire117[(3'h5):(2'h3)] : (~&(7'h40))) ?
                  ($signed(wire115) ?
                      (-$signed(wire114[(3'h4):(2'h3)])) : (~|$signed(reg118))) : (^~reg123[(4'h8):(2'h2)]));
              reg123 <= $unsigned(((&reg121[(1'h0):(1'h0)]) << wire114));
            end
        end
      reg124 <= (~reg119[(1'h0):(1'h0)]);
      reg125 <= wire116;
    end
  assign wire126 = $unsigned({{reg122[(5'h14):(5'h12)], reg121[(1'h0):(1'h0)]},
                       (8'hb7)});
  assign wire127 = (^reg121);
  assign wire128 = ($unsigned($unsigned((wire112 ?
                       wire111 : wire126[(2'h2):(2'h2)]))) >> $unsigned($signed($signed(reg121))));
  assign wire129 = ((($unsigned((wire128 ? wire116 : (8'hb4))) >>> ({(8'hb2),
                       wire128} <<< (wire116 ?
                       reg125 : reg121))) & (wire113[(3'h6):(2'h2)] ?
                       wire127 : reg121[(2'h3):(2'h2)])) && wire117);
  assign wire130 = ({$unsigned(wire128[(4'hb):(3'h7)]),
                       reg120[(3'h5):(1'h0)]} || wire114[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg131 <= $unsigned(wire117);
      reg132 <= (($unsigned(wire111[(3'h4):(1'h1)]) <<< (wire128[(4'hd):(3'h7)] ?
          ({wire130} | (-(8'hb0))) : ($signed((8'ha2)) ?
              $unsigned((8'ha1)) : wire128))) <= (8'hbf));
    end
  assign wire133 = (8'hae);
  assign wire134 = ({(wire130[(3'h7):(1'h1)] ?
                               reg121 : $signed($unsigned(wire128)))} ?
                       (|reg119) : wire117[(3'h7):(3'h5)]);
  always
    @(posedge clk) begin
      reg135 <= $unsigned((($unsigned(reg120[(2'h2):(1'h0)]) + ((wire112 ?
              wire130 : wire126) | $unsigned(reg124))) ?
          wire130[(1'h1):(1'h1)] : $signed(reg125)));
    end
  assign wire136 = {({reg124} ^~ wire117)};
  always
    @(posedge clk) begin
      reg137 <= (wire128[(1'h0):(1'h0)] == ({reg121[(1'h0):(1'h0)],
              (wire126 && (|(8'ha5)))} ?
          (reg122 ? reg125[(3'h5):(2'h3)] : $signed({wire134})) : (-reg122)));
      reg138 <= (!reg123);
      reg139 <= wire114;
      if (((+(8'hbb)) <= $unsigned(((8'had) ?
          ($signed(wire116) & (^~reg139)) : (-wire116[(3'h7):(3'h7)])))))
        begin
          if ($unsigned(reg120[(4'h9):(3'h4)]))
            begin
              reg140 <= (wire112 ?
                  ((!$unsigned((&reg120))) ?
                      ((reg120[(1'h1):(1'h0)] ?
                          (reg123 >= (8'hba)) : $signed(reg139)) || reg135) : wire133) : reg139);
              reg141 <= ($signed($signed((~$signed(wire116)))) ?
                  $unsigned((($signed(reg138) ?
                      reg124 : $signed(reg140)) < (8'ha0))) : {wire128[(3'h7):(2'h2)]});
            end
          else
            begin
              reg140 <= (wire133[(1'h1):(1'h1)] ?
                  wire127[(4'hd):(4'hc)] : (^~(($unsigned(reg120) ?
                          reg118[(1'h0):(1'h0)] : (wire127 <<< (8'hac))) ?
                      ((^~(7'h40)) != reg141[(4'hb):(4'h8)]) : {$signed(reg123)})));
              reg141 <= ((|$unsigned(((|wire130) ?
                      (reg131 ? wire127 : wire128) : reg141[(5'h15):(2'h2)]))) ?
                  $signed($unsigned((~&(reg124 ?
                      (8'hae) : wire127)))) : $unsigned(wire117));
              reg142 <= ((wire128[(4'ha):(4'h9)] > wire114) ?
                  (+((~|(reg137 <= reg141)) ?
                      ((wire114 <= reg120) ?
                          (8'ha6) : (^~reg123)) : $signed($signed(reg135)))) : $unsigned({$signed((reg121 && reg119))}));
            end
        end
      else
        begin
          if ((~&$signed(reg121)))
            begin
              reg140 <= {(~&$unsigned(($unsigned(reg132) ?
                      wire114 : ((8'h9e) && wire113)))),
                  {(-reg123[(4'h8):(1'h0)])}};
              reg141 <= ($unsigned(reg121) >= ((wire130[(1'h1):(1'h1)] >> wire136) ?
                  $signed(reg121) : wire116[(1'h0):(1'h0)]));
              reg142 <= $signed(reg124);
              reg143 <= (-$signed(wire117));
            end
          else
            begin
              reg140 <= $signed($signed((({reg138} ?
                      (reg132 ^ wire130) : reg122[(4'h8):(3'h5)]) ?
                  $signed({wire136}) : ($unsigned(reg121) ^ (reg138 ?
                      reg124 : wire127)))));
              reg141 <= reg122[(2'h2):(1'h0)];
              reg142 <= wire112;
              reg143 <= {wire127};
            end
          reg144 <= ($unsigned($unsigned((~&(~^reg122)))) && {(+wire126),
              (~|(!$unsigned(wire127)))});
          reg145 <= ($signed($unsigned($unsigned((wire129 ~^ wire127)))) ?
              (~|(wire111[(3'h7):(3'h4)] ?
                  ((&reg144) ?
                      reg125 : wire134[(4'h9):(2'h2)]) : $unsigned($signed(wire127)))) : $unsigned($unsigned(({wire117} ?
                  $unsigned(wire136) : wire114[(2'h3):(2'h3)]))));
          reg146 <= wire128;
          if (reg120[(3'h6):(2'h3)])
            begin
              reg147 <= ((+$signed((^$unsigned(reg120)))) > $signed($unsigned(wire112)));
              reg148 <= $signed($signed({(~$signed(wire127))}));
              reg149 <= $signed(($signed(({reg121} ?
                  {reg123} : (8'h9c))) > ((|{reg131}) - ({(8'h9c),
                  (8'haf)} | $unsigned(wire128)))));
              reg150 <= ((~wire116) ^ {((^$unsigned((8'hb1))) ?
                      $unsigned($signed(wire114)) : $signed(reg132[(2'h2):(2'h2)])),
                  reg138[(4'hb):(3'h7)]});
            end
          else
            begin
              reg147 <= (($unsigned((wire111 ^~ $signed(reg135))) > (7'h40)) < $signed((!((wire130 ?
                  reg142 : (8'hb8)) | (~|wire126)))));
              reg148 <= {(^reg121), (reg118 ^ (-$signed(wire133)))};
              reg149 <= (((~^reg135[(3'h4):(3'h4)]) * ({(reg149 ^~ (8'hb1)),
                      (wire113 ? wire115 : wire134)} ?
                  wire133[(1'h1):(1'h1)] : ({wire127} * ((8'hb5) || reg140)))) <<< $unsigned(reg118[(1'h0):(1'h0)]));
              reg150 <= ($signed(wire128[(3'h6):(2'h3)]) ?
                  (reg124[(1'h0):(1'h0)] ?
                      $signed((reg137[(4'ha):(3'h5)] - $signed(wire114))) : (($unsigned((8'ha4)) ?
                              (reg142 < wire114) : (^~wire114)) ?
                          (~^$unsigned((8'hae))) : $unsigned((reg144 > (7'h42))))) : $signed($unsigned(reg123)));
            end
        end
      reg151 <= (8'ha3);
    end
  assign wire152 = (~&$signed((^~reg123[(1'h0):(1'h0)])));
  assign wire153 = {($signed({reg138, $unsigned(reg148)}) ?
                           {wire129} : wire136[(3'h6):(3'h4)]),
                       reg139};
endmodule

module module28
#(parameter param58 = {(((((8'ha5) > (8'hb1)) ? ((8'ha5) ? (8'hb4) : (8'hb5)) : ((8'ha0) ? (8'haf) : (8'ha7))) & (((8'h9c) ? (8'h9f) : (8'ha2)) ? ((8'ha9) ? (8'hab) : (8'h9f)) : {(8'hbf)})) ? (|(+{(8'hb0), (8'hb2)})) : (((8'hb9) ? (|(8'hbe)) : (~(8'hb0))) ? ((&(8'hba)) ? {(8'ha8)} : {(8'hb8), (8'ha1)}) : (((8'had) ? (8'haa) : (8'ha5)) + {(8'ha5)}))), (((((7'h40) >> (8'hb8)) ? (~(8'hae)) : ((8'hb4) - (7'h44))) <= (((8'ha5) - (8'had)) ? ((8'ha0) ~^ (8'ha0)) : ((8'hb8) ? (7'h42) : (8'hb6)))) && (((8'had) ^~ ((8'hb0) ? (8'hab) : (8'hb5))) > {{(8'hb1)}, (^~(8'hbe))}))})
(y, clk, wire33, wire32, wire31, wire30, wire29);
  output wire [(32'h147):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire33;
  input wire signed [(2'h3):(1'h0)] wire32;
  input wire [(3'h7):(1'h0)] wire31;
  input wire signed [(5'h15):(1'h0)] wire30;
  input wire signed [(3'h6):(1'h0)] wire29;
  wire signed [(5'h13):(1'h0)] wire57;
  wire signed [(3'h5):(1'h0)] wire56;
  wire signed [(4'ha):(1'h0)] wire55;
  wire [(5'h10):(1'h0)] wire54;
  wire [(5'h11):(1'h0)] wire53;
  wire signed [(5'h12):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire44;
  wire signed [(3'h5):(1'h0)] wire43;
  wire [(4'he):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire [(5'h12):(1'h0)] wire39;
  wire signed [(4'hd):(1'h0)] wire38;
  wire signed [(5'h10):(1'h0)] wire36;
  wire signed [(5'h13):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  reg signed [(2'h2):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  assign y = {wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire35,
                 wire34,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg37,
                 (1'h0)};
  assign wire34 = wire30[(2'h3):(1'h0)];
  assign wire35 = $signed(wire34);
  assign wire36 = $unsigned($unsigned(wire31));
  always
    @(posedge clk) begin
      reg37 <= $unsigned((({wire31,
          (wire34 & wire31)} < (~&$signed(wire30))) ~^ $signed($signed((wire34 & wire33)))));
    end
  assign wire38 = $unsigned(wire31);
  assign wire39 = (8'h9f);
  assign wire40 = (wire29 < $signed((^$unsigned($signed(wire36)))));
  assign wire41 = wire39[(4'hf):(3'h5)];
  assign wire42 = wire39[(3'h4):(1'h1)];
  assign wire43 = (((~$signed({reg37})) ?
                          reg37 : ($signed((wire32 ? wire35 : (8'ha3))) ?
                              $unsigned((-wire38)) : wire40)) ?
                      $signed($signed(wire32)) : (&$unsigned($signed((wire29 ?
                          wire35 : wire31)))));
  assign wire44 = $signed(($unsigned((-wire42[(2'h3):(1'h0)])) >= ((wire34 && (wire41 ?
                      wire34 : wire30)) != wire30)));
  always
    @(posedge clk) begin
      if ((~|({$unsigned({wire41, (8'hbc)})} ?
          ({$unsigned(wire40)} >>> $unsigned(wire38)) : wire41)))
        begin
          reg45 <= (^$signed(({(wire33 >>> wire30), wire31[(1'h0):(1'h0)]} ?
              $signed($unsigned((7'h42))) : (8'hbf))));
          reg46 <= ((7'h44) * ($unsigned(($signed(wire38) ?
              {(8'hb8)} : $unsigned(wire42))) - (|{(wire36 && wire33),
              $signed((8'h9e))})));
          if (($unsigned($unsigned($unsigned((wire38 ?
              reg45 : reg37)))) << wire44))
            begin
              reg47 <= $signed(($unsigned((((8'ha6) ?
                      (8'hbb) : reg37) <= $signed(wire41))) ?
                  ((&$signed(wire41)) || (~wire30[(3'h7):(1'h0)])) : $unsigned({wire40})));
              reg48 <= (wire38 & $signed($signed((wire35 ?
                  (wire31 ? wire44 : wire35) : wire42))));
            end
          else
            begin
              reg47 <= {wire35};
              reg48 <= wire41;
              reg49 <= $unsigned((~^(^~reg47[(1'h0):(1'h0)])));
              reg50 <= $unsigned(reg47);
              reg51 <= ((-$signed({(8'hb2), (wire39 < wire38)})) ?
                  wire36[(2'h3):(2'h2)] : wire31[(1'h1):(1'h1)]);
            end
        end
      else
        begin
          if ({$signed((!{((8'ha3) + wire39)})), $unsigned(wire29)})
            begin
              reg45 <= reg46;
              reg46 <= ($unsigned($signed($signed((reg37 + wire41)))) > $signed({((8'hb9) ?
                      (reg45 <= reg46) : wire32[(2'h2):(1'h0)]),
                  ({reg47, reg47} ?
                      (~&(8'hbe)) : ((8'ha5) ? reg50 : wire39))}));
              reg47 <= reg46;
            end
          else
            begin
              reg45 <= $signed($unsigned(($unsigned((^reg45)) <<< wire40)));
              reg46 <= $unsigned(reg46[(2'h3):(1'h1)]);
              reg47 <= $unsigned({(wire34 ~^ reg45), wire43[(2'h2):(2'h2)]});
              reg48 <= $unsigned(reg48[(5'h12):(4'hb)]);
            end
        end
    end
  assign wire52 = $signed(((~(~^(reg46 | wire39))) ?
                      wire40[(4'ha):(3'h6)] : (reg48[(3'h6):(3'h5)] ?
                          wire33 : ($unsigned(wire36) ?
                              wire30[(1'h1):(1'h1)] : $unsigned(wire38)))));
  assign wire53 = ({(-$unsigned({(8'hb2)})), wire36} - reg47[(4'ha):(4'ha)]);
  assign wire54 = (^$signed({({wire38} ? wire34 : $signed(reg49))}));
  assign wire55 = (^$unsigned($unsigned(reg50[(1'h1):(1'h0)])));
  assign wire56 = (!(~$unsigned(wire32)));
  assign wire57 = {$unsigned((^$signed($unsigned(wire35)))),
                      wire41[(4'hf):(2'h3)]};
endmodule
