module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h50):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire [(5'h15):(1'h0)] wire6;
  wire [(5'h10):(1'h0)] wire9;
  wire [(2'h2):(1'h0)] wire166;
  reg [(4'ha):(1'h0)] reg10 = (1'h0);
  reg [(3'h7):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg7 = (1'h0);
  assign y = {wire5, wire6, wire9, wire166, reg10, reg8, reg7, (1'h0)};
  assign wire5 = (wire2[(3'h5):(2'h3)] ?
                     wire4[(2'h3):(2'h2)] : ({wire1[(3'h4):(2'h3)],
                             $signed($signed(wire4))} ?
                         (!wire1) : wire1));
  assign wire6 = ((-$signed($unsigned((~|(8'hb8))))) ?
                     (wire2 > (!{(wire3 ^ (8'ha2)), (8'hac)})) : (8'haa));
  always
    @(posedge clk) begin
      reg7 <= ({({(+wire2)} ?
              ((~wire5) ?
                  $signed(wire5) : (wire4 ?
                      wire3 : wire0)) : ((wire1 & wire5) <<< {wire6})),
          $unsigned(wire3)} & (~^(-(((8'ha7) * wire4) * (wire5 ?
          (8'h9d) : wire4)))));
      reg8 <= $signed(((8'ha3) - (^(+{wire5, wire2}))));
    end
  assign wire9 = ((($signed({wire2}) >>> (reg8 ? (8'haf) : $signed(wire4))) ?
                     {((~^wire4) ? (~|reg8) : (wire5 <<< wire2)),
                         wire1[(2'h2):(1'h0)]} : wire2[(1'h0):(1'h0)]) >>> (|(+({(7'h44)} <<< (reg7 ?
                     wire1 : reg7)))));
  always
    @(posedge clk) begin
      reg10 <= (wire2[(4'ha):(1'h0)] ?
          reg7[(2'h3):(1'h1)] : $signed({($signed((8'hae)) ?
                  reg7[(2'h3):(2'h3)] : (8'hb5))}));
    end
  module11 #() modinst167 (wire166, clk, wire0, wire5, wire9, wire6, wire2);
endmodule

module module11
#(parameter param164 = (|(~(8'ha2))), 
parameter param165 = (((param164 && {(param164 ? param164 : param164), (~^param164)}) >>> ((+(param164 ^~ param164)) <= param164)) ? (|((param164 ? param164 : (~&param164)) ? ((param164 ? (8'hb3) : param164) != (param164 >>> param164)) : {param164})) : (!(-param164))))
(y, clk, wire12, wire13, wire14, wire15, wire16);
  output wire [(32'h247):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h4):(1'h0)] wire12;
  input wire signed [(5'h13):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(3'h7):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire157;
  wire signed [(3'h5):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire57;
  wire [(4'hf):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire59;
  wire [(5'h15):(1'h0)] wire60;
  wire [(3'h5):(1'h0)] wire73;
  wire signed [(5'h10):(1'h0)] wire120;
  wire [(4'hd):(1'h0)] wire137;
  wire [(4'ha):(1'h0)] wire138;
  wire [(5'h10):(1'h0)] wire139;
  wire signed [(5'h10):(1'h0)] wire140;
  wire signed [(3'h5):(1'h0)] wire141;
  wire [(2'h2):(1'h0)] wire155;
  reg signed [(5'h11):(1'h0)] reg163 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg161 = (1'h0);
  reg [(4'h8):(1'h0)] reg160 = (1'h0);
  reg [(3'h5):(1'h0)] reg159 = (1'h0);
  reg [(3'h5):(1'h0)] reg158 = (1'h0);
  reg [(3'h5):(1'h0)] reg136 = (1'h0);
  reg [(4'hd):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg [(3'h5):(1'h0)] reg133 = (1'h0);
  reg [(5'h12):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg131 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg130 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg129 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg128 = (1'h0);
  reg [(3'h7):(1'h0)] reg127 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg125 = (1'h0);
  reg [(4'hb):(1'h0)] reg124 = (1'h0);
  reg [(5'h15):(1'h0)] reg123 = (1'h0);
  reg [(2'h2):(1'h0)] reg122 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg72 = (1'h0);
  reg [(5'h11):(1'h0)] reg71 = (1'h0);
  reg [(4'hf):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hf):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg63 = (1'h0);
  reg [(5'h14):(1'h0)] reg62 = (1'h0);
  reg [(4'hd):(1'h0)] reg61 = (1'h0);
  assign y = {wire157,
                 wire17,
                 wire18,
                 wire19,
                 wire55,
                 wire57,
                 wire58,
                 wire59,
                 wire60,
                 wire73,
                 wire120,
                 wire137,
                 wire138,
                 wire139,
                 wire140,
                 wire141,
                 wire155,
                 reg163,
                 reg162,
                 reg161,
                 reg160,
                 reg159,
                 reg158,
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
                 reg122,
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
                 (1'h0)};
  assign wire17 = $unsigned(wire16[(3'h7):(1'h1)]);
  assign wire18 = (wire16[(3'h4):(1'h1)] << $unsigned($signed((~wire17))));
  assign wire19 = (^$unsigned(($signed($unsigned(wire16)) ?
                      (&((8'ha4) ? wire17 : wire16)) : wire16)));
  module20 #() modinst56 (wire55, clk, wire13, wire15, wire18, wire19);
  assign wire57 = ($unsigned({wire12}) ? (8'ha9) : wire16[(3'h7):(2'h2)]);
  assign wire58 = $signed(($signed(wire18) >> $signed((~&(~^(8'hbb))))));
  assign wire59 = (wire57 ^ (|{wire14[(4'he):(2'h2)]}));
  assign wire60 = (wire15[(2'h3):(2'h2)] ?
                      ($unsigned((+$signed(wire13))) ?
                          $signed({(~wire58),
                              (^~wire59)}) : $unsigned((wire58 != (wire58 >= (7'h42))))) : wire58[(4'hb):(3'h7)]);
  always
    @(posedge clk) begin
      reg61 <= $unsigned(wire18[(2'h2):(2'h2)]);
      if ((~$signed($signed($signed(wire59)))))
        begin
          reg62 <= wire18[(3'h6):(2'h3)];
        end
      else
        begin
          if ({(((~^wire12) ? $unsigned($signed((8'hbf))) : wire17) ?
                  (wire13[(5'h11):(5'h10)] < ((~&reg61) | (wire58 ?
                      (8'ha1) : wire17))) : wire12)})
            begin
              reg62 <= $unsigned(wire19[(3'h6):(1'h1)]);
              reg63 <= ({(8'hbd)} ~^ wire15);
              reg64 <= (^(wire16[(1'h0):(1'h0)] << (wire13 >> reg62)));
              reg65 <= $unsigned(reg61);
              reg66 <= reg63;
            end
          else
            begin
              reg62 <= wire57[(2'h2):(1'h1)];
              reg63 <= ({$signed(($signed(wire59) << {wire18, wire59}))} ?
                  $signed({$unsigned(wire58), wire14}) : wire58[(4'hf):(3'h5)]);
              reg64 <= (({$unsigned($unsigned(wire16)),
                      reg65} ^ {($signed(reg61) + $unsigned((7'h43)))}) ?
                  ($unsigned(((8'hb8) ?
                      (-(8'h9d)) : wire13[(4'ha):(4'ha)])) && reg66[(1'h0):(1'h0)]) : (~^(~&wire13[(4'hb):(3'h6)])));
              reg65 <= (^~wire18[(4'h8):(3'h4)]);
            end
          if ((!$signed(reg63[(1'h0):(1'h0)])))
            begin
              reg67 <= (~&$signed(wire58[(4'he):(3'h5)]));
              reg68 <= ($unsigned(wire15[(5'h14):(4'hc)]) < (~|$signed(wire16[(3'h7):(1'h1)])));
              reg69 <= reg67[(3'h5):(2'h3)];
              reg70 <= (^(8'hba));
              reg71 <= (reg62 ?
                  $signed(($signed($signed(reg66)) != reg66[(1'h1):(1'h0)])) : (|reg61));
            end
          else
            begin
              reg67 <= $signed($signed($signed((~^$signed(wire19)))));
              reg68 <= reg63;
              reg69 <= ((wire16 ?
                  (reg67 ?
                      ((|reg65) ?
                          reg68 : {reg69,
                              wire12}) : wire59[(1'h1):(1'h1)]) : reg64) >= reg69);
              reg70 <= $unsigned((^~$unsigned((+reg69))));
            end
        end
      reg72 <= (((reg71[(1'h0):(1'h0)] ^~ (~|(~|(8'hbe)))) ?
          wire13 : (-$signed(reg71))) << (wire55[(4'h9):(1'h0)] | ($signed((~^wire13)) * {(!reg62),
          {wire18, wire12}})));
    end
  assign wire73 = reg72[(1'h0):(1'h0)];
  module74 #() modinst121 (wire120, clk, reg69, wire18, wire15, reg62);
  always
    @(posedge clk) begin
      reg122 <= $signed((-(((wire58 ? (8'hb9) : wire73) ?
          (reg63 || wire57) : (~&reg72)) << reg64[(2'h3):(2'h3)])));
      reg123 <= ((^~reg71[(3'h4):(2'h3)]) ?
          ($signed($signed($signed(wire55))) <<< (wire73[(3'h4):(1'h1)] ?
              $signed($signed((8'h9f))) : wire58[(4'hf):(3'h7)])) : $unsigned(((8'hb5) ^ (~^$unsigned(reg72)))));
      reg124 <= wire18[(1'h1):(1'h1)];
    end
  always
    @(posedge clk) begin
      reg125 <= wire14[(4'hf):(3'h4)];
      if (($unsigned($signed(reg123[(5'h13):(4'ha)])) ^~ (wire17[(2'h2):(1'h1)] | $unsigned((~|(~wire60))))))
        begin
          if (reg68)
            begin
              reg126 <= (8'hbf);
            end
          else
            begin
              reg126 <= (reg70[(3'h6):(3'h5)] != (($signed({wire73}) ^ $unsigned(((8'h9d) <<< wire18))) >= $signed(reg61[(1'h1):(1'h0)])));
              reg127 <= wire57;
              reg128 <= ($unsigned(wire17[(2'h2):(1'h0)]) > wire13[(3'h7):(2'h2)]);
              reg129 <= reg128[(3'h4):(1'h0)];
              reg130 <= $unsigned($signed(((~&{wire19}) ?
                  ((reg124 > wire14) ?
                      $signed(reg72) : $unsigned(reg122)) : $signed((reg126 ?
                      wire19 : (7'h42))))));
            end
          reg131 <= (({((wire55 ^ reg64) >= reg67), {$unsigned(wire19)}} ?
                  $unsigned(((&reg64) ?
                      $unsigned(reg62) : reg70)) : $unsigned($unsigned((|reg124)))) ?
              $unsigned(reg65) : wire59);
          reg132 <= (&$unsigned(((~|$signed(reg71)) > {(reg125 ?
                  reg124 : wire19)})));
          if ((+wire57))
            begin
              reg133 <= wire18[(3'h7):(3'h4)];
              reg134 <= {(^~($unsigned(wire18[(4'hb):(4'hb)]) >>> $unsigned($unsigned((8'ha3)))))};
            end
          else
            begin
              reg133 <= reg130[(3'h4):(2'h2)];
              reg134 <= reg129;
              reg135 <= wire12[(3'h4):(1'h1)];
              reg136 <= wire15[(4'h9):(3'h6)];
            end
        end
      else
        begin
          reg126 <= ({wire120[(4'h9):(3'h6)]} < ($signed($signed($unsigned(reg72))) > reg126[(4'h8):(1'h1)]));
          reg127 <= reg132[(1'h1):(1'h1)];
          if ($signed(reg131))
            begin
              reg128 <= wire18[(4'hb):(2'h3)];
              reg129 <= ({reg125[(4'h9):(1'h1)]} ?
                  (&(((7'h43) >> (-reg136)) ?
                      ((-reg136) & $signed(reg132)) : ({reg134,
                          reg68} & {reg70}))) : $signed(($unsigned((^~reg124)) <= ($unsigned(reg131) != (reg126 ?
                      reg68 : reg67)))));
              reg130 <= reg133[(2'h3):(1'h1)];
              reg131 <= reg126[(3'h4):(2'h3)];
            end
          else
            begin
              reg128 <= reg130[(2'h3):(2'h3)];
            end
        end
    end
  assign wire137 = $signed(reg125);
  assign wire138 = (~^$unsigned(reg64));
  assign wire139 = $unsigned(reg129[(3'h4):(2'h2)]);
  assign wire140 = {(!(^~$unsigned((reg62 - reg64)))), wire60[(5'h13):(2'h2)]};
  assign wire141 = ($signed((reg136[(1'h1):(1'h1)] ?
                       reg131 : reg127)) >>> (-$unsigned({$signed(reg136)})));
  module142 #() modinst156 (.wire143(reg124), .wire146(wire17), .wire147(reg132), .y(wire155), .clk(clk), .wire145(reg71), .wire144(reg125));
  assign wire157 = ((~^$unsigned(wire138)) | {($unsigned($unsigned(reg72)) && $unsigned(reg131[(3'h5):(2'h2)])),
                       reg124[(3'h5):(3'h4)]});
  always
    @(posedge clk) begin
      if ($unsigned((&$unsigned((reg134[(2'h3):(2'h3)] > (reg135 ?
          wire137 : reg136))))))
        begin
          reg158 <= $unsigned(reg136[(1'h0):(1'h0)]);
          reg159 <= ((($unsigned((wire155 | reg126)) == wire58) ?
                  ($signed((8'haa)) ?
                      (~|$unsigned((8'ha7))) : wire138[(3'h4):(1'h1)]) : wire120) ?
              reg133[(2'h2):(2'h2)] : reg65[(3'h4):(2'h3)]);
          if ((+$unsigned($unsigned(($signed(wire58) ?
              (reg132 ? wire58 : wire120) : $signed((8'ha4)))))))
            begin
              reg160 <= ($signed(($unsigned($signed(reg132)) ^~ (-reg64[(3'h5):(1'h1)]))) ?
                  wire15[(5'h13):(5'h10)] : $signed({((wire137 ?
                              (8'hb4) : reg64) ?
                          $signed(reg72) : ((7'h40) < reg135)),
                      (reg66[(1'h0):(1'h0)] ?
                          (wire12 ? reg66 : reg71) : {wire58})}));
              reg161 <= (~wire59[(2'h2):(1'h1)]);
              reg162 <= (($unsigned((^~$signed(reg133))) - (+(reg62[(2'h3):(1'h0)] ?
                      $signed(reg130) : {(8'hbf)}))) ?
                  $signed(reg132) : wire141[(2'h3):(1'h0)]);
              reg163 <= $signed((&(|$unsigned($signed(reg63)))));
            end
          else
            begin
              reg160 <= $signed($signed($signed((8'ha4))));
              reg161 <= $signed((reg126[(4'hc):(3'h7)] - wire137));
              reg162 <= wire73[(2'h2):(1'h1)];
            end
        end
      else
        begin
          reg158 <= (wire15 ?
              ((8'hac) <= (~|(~^reg128))) : {reg61[(3'h6):(3'h4)],
                  (((wire155 ~^ reg122) << reg128) ?
                      $signed($unsigned(reg65)) : (((8'hba) << reg126) >>> $signed(reg124)))});
          reg159 <= reg70;
          if ((wire138 ?
              {reg128[(3'h6):(1'h0)],
                  $unsigned(reg72[(3'h6):(3'h5)])} : reg130))
            begin
              reg160 <= $unsigned(($signed((^((7'h40) ? (7'h43) : (8'h9f)))) ?
                  (8'hb7) : ($unsigned((8'h9e)) ?
                      $unsigned((wire138 ?
                          wire141 : reg124)) : $unsigned(reg129))));
              reg161 <= (($signed((wire17[(2'h3):(1'h0)] ?
                      $signed((8'ha3)) : wire18[(4'h8):(2'h3)])) >>> (((reg71 ?
                          reg67 : reg126) & $signed(reg135)) ?
                      $unsigned((wire14 ~^ reg130)) : ($signed(wire15) ~^ {wire16,
                          reg159}))) ?
                  wire19[(4'he):(2'h2)] : (~|reg130));
              reg162 <= ($unsigned((((wire58 + wire140) ?
                      (reg68 + wire19) : wire120) ?
                  $unsigned(wire58) : wire12)) <= wire18);
            end
          else
            begin
              reg160 <= (reg65[(1'h1):(1'h1)] << reg131);
            end
          reg163 <= (!$unsigned((~|$signed((+reg64)))));
        end
    end
endmodule

module module142
#(parameter param154 = ((((-((8'ha4) ? (8'hbb) : (8'haf))) ? (~^{(8'h9f), (8'hb6)}) : (&(~^(8'ha3)))) | ((|((8'haa) ? (8'ha1) : (7'h42))) * (((8'hbe) ? (8'ha9) : (8'hae)) ? (|(8'hbd)) : ((8'ha1) ? (8'ha8) : (8'ha0))))) != (!(((8'hb1) ? (~&(8'hac)) : (^~(8'hbb))) ? (((8'hb5) ? (8'ha9) : (8'hac)) ? ((8'hbf) > (8'hb2)) : (^(8'hb8))) : (~((8'hbf) <<< (8'ha0)))))))
(y, clk, wire147, wire146, wire145, wire144, wire143);
  output wire [(32'h4a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire147;
  input wire [(3'h5):(1'h0)] wire146;
  input wire [(3'h4):(1'h0)] wire145;
  input wire [(5'h15):(1'h0)] wire144;
  input wire signed [(4'hb):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire153;
  wire signed [(5'h13):(1'h0)] wire152;
  wire [(3'h7):(1'h0)] wire151;
  wire [(5'h12):(1'h0)] wire150;
  wire [(3'h4):(1'h0)] wire149;
  wire [(4'h9):(1'h0)] wire148;
  assign y = {wire153, wire152, wire151, wire150, wire149, wire148, (1'h0)};
  assign wire148 = (|{wire147[(2'h2):(2'h2)]});
  assign wire149 = $unsigned((wire146 - (8'ha5)));
  assign wire150 = (~^wire146[(1'h0):(1'h0)]);
  assign wire151 = ($signed(wire144) ?
                       $unsigned(($unsigned(wire150[(3'h4):(1'h0)]) <= wire148[(4'h9):(3'h6)])) : ((($signed(wire147) ?
                                   {wire143, wire150} : wire143) ?
                               (~|wire150[(3'h5):(1'h0)]) : $unsigned((wire149 < (8'hbd)))) ?
                           ($unsigned($signed(wire148)) ?
                               $signed(wire143[(3'h7):(2'h3)]) : wire147[(4'hd):(1'h1)]) : (wire149 ?
                               {$unsigned(wire147)} : (~|wire148))));
  assign wire152 = (-(^$unsigned({$signed((8'hb2))})));
  assign wire153 = $unsigned((!({((7'h40) ? wire148 : wire150)} ?
                       $unsigned((wire150 == wire151)) : {wire150,
                           (wire143 << wire152)})));
endmodule

module module74  (y, clk, wire78, wire77, wire76, wire75);
  output wire [(32'h1af):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire78;
  input wire signed [(4'hf):(1'h0)] wire77;
  input wire signed [(4'hd):(1'h0)] wire76;
  input wire [(5'h14):(1'h0)] wire75;
  wire signed [(3'h6):(1'h0)] wire119;
  wire signed [(4'h8):(1'h0)] wire118;
  wire signed [(3'h6):(1'h0)] wire117;
  wire signed [(4'he):(1'h0)] wire116;
  wire signed [(5'h12):(1'h0)] wire115;
  wire signed [(2'h3):(1'h0)] wire114;
  wire [(4'hb):(1'h0)] wire113;
  wire signed [(4'hb):(1'h0)] wire112;
  wire signed [(4'h9):(1'h0)] wire111;
  wire [(5'h15):(1'h0)] wire94;
  wire [(5'h15):(1'h0)] wire80;
  wire signed [(3'h4):(1'h0)] wire79;
  reg signed [(4'hc):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg106 = (1'h0);
  reg [(4'h9):(1'h0)] reg105 = (1'h0);
  reg [(5'h13):(1'h0)] reg104 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg103 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg102 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg101 = (1'h0);
  reg [(2'h3):(1'h0)] reg100 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(4'ha):(1'h0)] reg98 = (1'h0);
  reg [(3'h7):(1'h0)] reg97 = (1'h0);
  reg [(4'hf):(1'h0)] reg96 = (1'h0);
  reg [(5'h15):(1'h0)] reg95 = (1'h0);
  reg [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg92 = (1'h0);
  reg [(4'h9):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'hf):(1'h0)] reg89 = (1'h0);
  reg [(3'h6):(1'h0)] reg88 = (1'h0);
  reg [(5'h11):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg86 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg85 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg82 = (1'h0);
  reg [(3'h7):(1'h0)] reg81 = (1'h0);
  assign y = {wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire94,
                 wire80,
                 wire79,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg105,
                 reg104,
                 reg103,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg95,
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
                 (1'h0)};
  assign wire79 = (-wire76);
  assign wire80 = $unsigned($unsigned(wire76));
  always
    @(posedge clk) begin
      if ((-wire77))
        begin
          reg81 <= wire75[(5'h12):(5'h11)];
          if ($signed(wire78[(2'h3):(2'h2)]))
            begin
              reg82 <= wire80[(4'hb):(4'hb)];
              reg83 <= $signed(((8'haa) ?
                  (!({wire77} == (wire75 ?
                      wire76 : wire76))) : ($signed((wire77 ?
                      reg81 : (7'h40))) == $unsigned(wire80))));
              reg84 <= ((^~reg81) ?
                  (+(((8'haf) + (+wire77)) ?
                      ((-wire78) ^~ (8'hb1)) : ((wire78 >> wire79) ?
                          (wire79 ? wire79 : (8'ha3)) : (wire77 ?
                              reg81 : wire79)))) : (8'ha7));
            end
          else
            begin
              reg82 <= {$unsigned((~|wire78[(3'h5):(3'h4)]))};
              reg83 <= reg84[(4'ha):(2'h3)];
              reg84 <= reg82;
            end
        end
      else
        begin
          reg81 <= (((((wire77 ? wire76 : wire77) ?
                      wire78[(1'h0):(1'h0)] : {(8'ha2), wire78}) ?
                  wire78 : $signed(((8'ha3) ? wire79 : wire76))) ?
              $unsigned($unsigned((~&wire75))) : {($unsigned(wire79) & $signed(wire79))}) || $unsigned(wire76));
        end
      if (((wire78 ?
          wire80[(4'h9):(3'h4)] : (!{{reg81, reg84}})) != reg83[(1'h0):(1'h0)]))
        begin
          if ($unsigned((wire77[(2'h3):(2'h3)] ?
              (((wire75 ? reg81 : reg81) ?
                      ((8'hbe) ? reg84 : reg81) : wire79[(3'h4):(1'h1)]) ?
                  {(wire78 & reg84),
                      (reg84 ?
                          reg81 : wire77)} : wire76[(3'h4):(2'h2)]) : ($signed($signed(wire75)) ?
                  {(8'ha3)} : {$unsigned((8'hb6))}))))
            begin
              reg85 <= {$signed(wire76),
                  $unsigned(($signed((reg84 ? wire77 : wire77)) ?
                      ($signed(wire78) >= (wire76 != wire79)) : reg81[(1'h0):(1'h0)]))};
              reg86 <= (^wire80[(4'h8):(2'h3)]);
              reg87 <= {wire76[(4'hb):(4'h8)],
                  (wire79 && $unsigned($unsigned({wire78, wire77})))};
              reg88 <= ((reg84 ?
                  ($unsigned((wire80 == reg86)) & (~$signed(wire78))) : ($signed({wire78}) ?
                      wire78 : reg85)) ^~ $signed($signed($signed({reg84}))));
              reg89 <= reg82[(1'h1):(1'h0)];
            end
          else
            begin
              reg85 <= (^~wire75);
              reg86 <= reg81;
              reg87 <= (reg84 ~^ $unsigned($signed(((wire76 ^ (8'ha5)) ?
                  $signed(reg83) : {wire80, wire77}))));
              reg88 <= $unsigned(wire79[(2'h2):(1'h1)]);
              reg89 <= $unsigned($unsigned((8'hb5)));
            end
          reg90 <= (|$unsigned((wire75 && ($unsigned(reg81) >= $signed(wire79)))));
          reg91 <= $signed(((&(wire76 ? (reg90 ? reg90 : reg83) : (+(8'hae)))) ?
              $unsigned((!(~reg88))) : reg90));
          reg92 <= reg81;
        end
      else
        begin
          reg85 <= $unsigned($signed($unsigned((+reg88))));
          reg86 <= $signed($unsigned(reg86));
        end
      reg93 <= reg90[(3'h7):(3'h5)];
    end
  assign wire94 = wire77[(3'h4):(2'h2)];
  always
    @(posedge clk) begin
      if ($unsigned((&wire79[(1'h1):(1'h0)])))
        begin
          reg95 <= $signed($unsigned((wire80 ?
              reg85[(4'he):(4'hc)] : reg85[(4'hd):(2'h3)])));
          reg96 <= ($signed((&{$unsigned(reg85), reg81})) ?
              (-{((^(8'haf)) ? $unsigned(reg90) : (wire94 & reg84))}) : reg95);
          reg97 <= reg86;
          if ((7'h40))
            begin
              reg98 <= $unsigned((^~reg90[(1'h1):(1'h1)]));
              reg99 <= reg82;
              reg100 <= (|((((reg96 >>> reg96) ? $signed((8'hb6)) : (^reg97)) ?
                      $unsigned({wire76,
                          reg93}) : $unsigned(wire76[(4'hb):(2'h3)])) ?
                  (($unsigned(wire76) ? wire78 : (wire75 ? reg99 : reg82)) ?
                      ((wire76 ? reg89 : reg83) ?
                          {reg98} : $signed(reg93)) : reg81) : (~^reg93)));
              reg101 <= $signed((reg91 ?
                  (reg93 ?
                      $signed(reg86[(3'h5):(2'h3)]) : (~^{reg100,
                          reg95})) : (8'ha4)));
              reg102 <= $unsigned(reg83[(3'h7):(3'h7)]);
            end
          else
            begin
              reg98 <= $unsigned({reg93[(3'h5):(2'h3)], reg101});
              reg99 <= $signed(($unsigned(((-(8'hb1)) ?
                      (wire78 < reg95) : $unsigned(wire77))) ?
                  reg101 : (reg90[(4'hf):(4'h9)] || $signed({reg96}))));
              reg100 <= ((({reg83[(3'h7):(1'h0)]} ?
                      {(8'hbb), $signed(reg85)} : ({reg87, (8'ha7)} ?
                          (reg102 ? reg81 : (8'ha5)) : reg89)) ^ reg90) ?
                  (wire75[(4'he):(4'he)] ~^ (~&reg91[(2'h2):(1'h0)])) : (reg91 >> (-(~|{reg86,
                      wire77}))));
              reg101 <= wire94[(4'hc):(4'hb)];
              reg102 <= wire80;
            end
        end
      else
        begin
          reg95 <= $unsigned(reg97);
        end
      reg103 <= ((reg102[(1'h0):(1'h0)] ?
              $unsigned({reg82}) : reg88[(1'h0):(1'h0)]) ?
          (wire75 != (reg99 ?
              (!reg91[(2'h3):(1'h0)]) : $unsigned((8'ha8)))) : (~reg81[(3'h6):(3'h5)]));
      if (reg88[(2'h3):(2'h3)])
        begin
          reg104 <= $signed((-reg89));
          reg105 <= ({reg99,
              $signed(wire79)} < $unsigned($signed(($unsigned(reg100) ?
              {wire78, (8'hba)} : {reg87, reg86}))));
          if (wire80)
            begin
              reg106 <= reg86;
              reg107 <= $signed((~&(reg103 ? reg95 : reg89)));
            end
          else
            begin
              reg106 <= $unsigned($signed((~&(wire78 > (wire75 ?
                  wire76 : reg91)))));
            end
        end
      else
        begin
          reg104 <= (^~(~^($signed($signed(reg98)) ?
              ($signed(reg107) ?
                  (reg98 ?
                      reg104 : reg102) : $signed(reg92)) : (wire94 >= (~&wire77)))));
          reg105 <= {(reg95 << {$signed((reg83 ? wire79 : (8'had))),
                  {wire79, $signed(wire79)}})};
          if (reg107[(2'h2):(2'h2)])
            begin
              reg106 <= reg91[(3'h5):(3'h4)];
            end
          else
            begin
              reg106 <= $signed($signed((~$signed((^~reg98)))));
              reg107 <= (~&reg84);
              reg108 <= $unsigned((reg88[(2'h3):(2'h2)] ?
                  $unsigned(wire94) : reg96[(3'h7):(2'h2)]));
              reg109 <= $unsigned($signed(reg89));
            end
          reg110 <= (((({reg96,
                      reg104} >>> $unsigned(wire78)) | reg88[(2'h3):(1'h1)]) ?
                  $unsigned(reg91[(3'h7):(1'h1)]) : reg84[(4'h9):(4'h8)]) ?
              reg81[(3'h7):(2'h2)] : {(reg108[(2'h2):(2'h2)] >= $unsigned(reg95)),
                  (|($unsigned(reg99) * $signed((8'haf))))});
        end
    end
  assign wire111 = (reg110 < (reg83 ?
                       {$signed((|reg109)),
                           $unsigned($unsigned(reg100))} : $signed(reg107)));
  assign wire112 = ($unsigned((+{((8'hbf) ? wire80 : reg103)})) ?
                       ($signed((wire76[(3'h7):(3'h7)] ~^ wire94)) && $unsigned($unsigned((wire76 ?
                           (8'ha1) : wire79)))) : reg82);
  assign wire113 = (reg91[(3'h4):(2'h2)] ?
                       (reg110 >> $signed(($signed(reg99) <= reg101[(4'h8):(2'h3)]))) : $signed($signed((!(reg92 >= reg106)))));
  assign wire114 = $signed((&{((reg103 ? wire112 : reg83) ?
                           ((8'h9d) || (8'ha8)) : (reg110 <= wire76))}));
  assign wire115 = (({$unsigned((reg108 ? reg97 : wire113))} ?
                           $signed(((wire114 | reg101) ?
                               (wire113 - reg99) : wire112)) : reg91[(4'h9):(3'h5)]) ?
                       {reg91,
                           wire94} : ($unsigned((+reg106)) <= ({$signed(reg86),
                           $unsigned((8'hbf))} <<< $unsigned($signed((8'haa))))));
  assign wire116 = {reg93,
                       $unsigned(({$unsigned(wire75)} ?
                           reg89 : $signed((~|wire75))))};
  assign wire117 = $signed(reg91[(3'h6):(1'h1)]);
  assign wire118 = reg88;
  assign wire119 = {reg92};
endmodule

module module20  (y, clk, wire24, wire23, wire22, wire21);
  output wire [(32'h14f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire24;
  input wire signed [(5'h15):(1'h0)] wire23;
  input wire [(3'h5):(1'h0)] wire22;
  input wire signed [(5'h11):(1'h0)] wire21;
  wire [(3'h7):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire41;
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg52 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg51 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg50 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg49 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg48 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg44 = (1'h0);
  reg [(3'h4):(1'h0)] reg43 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg40 = (1'h0);
  reg [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg38 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'h9):(1'h0)] reg36 = (1'h0);
  reg [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h13):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(3'h7):(1'h0)] reg32 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg31 = (1'h0);
  reg [(3'h7):(1'h0)] reg30 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg29 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg28 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  assign y = {wire54,
                 wire41,
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
                 (1'h0)};
  always
    @(posedge clk) begin
      if (wire21[(4'h8):(3'h5)])
        begin
          reg25 <= $signed((+($signed((|wire21)) ?
              ((wire21 ? wire23 : wire24) - {(8'h9c),
                  wire22}) : (-$unsigned((8'h9f))))));
          reg26 <= $signed(wire22);
          reg27 <= {(wire24[(4'hc):(2'h3)] >= wire21)};
        end
      else
        begin
          reg25 <= {$signed((8'hb4)), (~(8'h9f))};
        end
      if (wire21)
        begin
          if ($signed($signed($signed(wire23[(5'h10):(3'h6)]))))
            begin
              reg28 <= ($unsigned((|$signed(reg27[(1'h1):(1'h1)]))) & (reg27[(1'h0):(1'h0)] ?
                  {$unsigned(((8'hb0) ? (8'h9f) : reg27)),
                      (~(&wire23))} : ($signed(wire22) ?
                      wire24 : (reg27 ~^ (wire23 && wire21)))));
              reg29 <= (~($signed((|(^~reg25))) ?
                  $unsigned($unsigned((wire22 ? reg27 : reg27))) : reg28));
              reg30 <= (reg27 < ((($signed(wire22) ?
                  wire24 : (wire23 ? wire21 : reg28)) > ($unsigned(reg26) ?
                  {reg25, wire23} : reg26)) & (reg26 ?
                  ({wire22} != $signed(reg27)) : (~&(^wire24)))));
              reg31 <= reg25[(3'h7):(3'h7)];
              reg32 <= reg31[(1'h0):(1'h0)];
            end
          else
            begin
              reg28 <= wire24[(4'h9):(3'h7)];
              reg29 <= $unsigned(({((reg32 ?
                          wire21 : reg25) > (reg28 != wire22))} ?
                  (7'h43) : reg29[(1'h1):(1'h0)]));
            end
          if ((8'ha5))
            begin
              reg33 <= (8'h9f);
              reg34 <= ((+wire22) | ($signed(reg26[(2'h2):(1'h1)]) | $unsigned(($signed(reg26) ?
                  (&reg31) : reg32))));
              reg35 <= wire21[(4'hd):(4'h8)];
            end
          else
            begin
              reg33 <= $signed(reg32[(3'h6):(3'h4)]);
              reg34 <= (^~$unsigned((-(reg31[(3'h4):(1'h0)] ?
                  (~reg32) : $unsigned(reg33)))));
            end
          reg36 <= ($signed((8'hbe)) ?
              (((reg34 ?
                      $signed(wire23) : (wire22 ?
                          reg32 : reg27)) << $unsigned({reg31, reg34})) ?
                  (-(^$unsigned(reg35))) : reg33[(5'h13):(5'h13)]) : $signed(($signed($unsigned(reg33)) ?
                  $unsigned(reg32[(1'h0):(1'h0)]) : ({reg31} ?
                      (wire23 ~^ reg28) : (wire21 ? wire23 : reg33)))));
          reg37 <= (^~$unsigned($signed(reg29)));
          if (((~($signed($signed(reg32)) == (reg35[(1'h1):(1'h0)] ?
              reg31[(1'h1):(1'h1)] : (wire22 ? reg34 : (8'ha6))))) ~^ (8'hb6)))
            begin
              reg38 <= reg29;
              reg39 <= ((~^{((reg27 * reg33) | reg29),
                      (reg30 * (reg27 ? reg38 : reg36))}) ?
                  $signed(reg30[(3'h6):(3'h5)]) : (^~$unsigned((wire24 ?
                      (wire22 ? (8'h9d) : reg25) : reg34[(4'hb):(4'ha)]))));
            end
          else
            begin
              reg38 <= $signed((reg35[(3'h4):(1'h1)] < $unsigned(($unsigned((8'ha7)) ?
                  $unsigned(wire22) : {reg25}))));
              reg39 <= ({$signed($signed((~|reg39)))} ?
                  reg37[(1'h0):(1'h0)] : (reg28 ?
                      $unsigned({((8'ha3) >> reg25)}) : ((reg29[(3'h7):(2'h3)] ^ wire23[(5'h15):(4'h8)]) ?
                          reg35[(3'h4):(2'h3)] : $unsigned({reg27, reg39}))));
              reg40 <= reg34;
            end
        end
      else
        begin
          if ((((($unsigned((8'hab)) != wire21[(4'hf):(1'h1)]) ?
                  reg40 : reg31) ?
              reg32[(3'h5):(1'h1)] : {(!$signed(reg35)), reg26}) <= {reg32}))
            begin
              reg28 <= $unsigned(reg28[(2'h2):(2'h2)]);
              reg29 <= $signed((~^$unsigned($unsigned((reg36 ?
                  reg40 : reg26)))));
              reg30 <= $unsigned($unsigned($signed((&$signed(reg36)))));
            end
          else
            begin
              reg28 <= (reg34[(3'h5):(2'h3)] ?
                  {({reg29[(2'h3):(1'h0)]} ?
                          wire21[(3'h4):(1'h1)] : $unsigned(reg28)),
                      reg27} : reg25[(2'h3):(1'h0)]);
            end
          if (wire23[(4'h9):(3'h6)])
            begin
              reg31 <= $unsigned(reg34[(3'h5):(3'h5)]);
            end
          else
            begin
              reg31 <= $signed({($signed($unsigned(wire21)) ^~ (^~wire22)),
                  reg35[(2'h2):(1'h1)]});
              reg32 <= ((($unsigned((wire24 | reg36)) < $signed((reg38 >>> reg29))) ?
                      ((~$unsigned(reg37)) ?
                          $signed(wire21) : ((~|reg40) ?
                              ((8'h9c) ~^ reg30) : (reg29 ?
                                  reg40 : (8'ha2)))) : reg30) ?
                  $unsigned($signed(reg32[(3'h4):(3'h4)])) : reg31);
              reg33 <= {(8'h9e),
                  ((((reg38 >>> wire23) ? reg40 : $unsigned(wire23)) ?
                      $unsigned((reg26 ?
                          reg31 : wire21)) : $unsigned(reg27[(3'h7):(3'h6)])) >>> $signed($unsigned(reg25)))};
            end
          reg34 <= ((($signed((reg30 >= (8'hb6))) ?
              ((wire24 ? wire21 : reg29) ?
                  $signed((8'hab)) : reg37) : $signed(((8'hbd) ?
                  reg34 : reg29))) || $unsigned(reg27)) == (reg34[(3'h5):(1'h0)] ?
              ((reg39[(2'h3):(2'h2)] <= (~^reg28)) ?
                  reg30 : (-$unsigned((8'hab)))) : $unsigned(wire21[(4'h9):(2'h3)])));
          reg35 <= $unsigned($signed(reg37[(3'h4):(2'h3)]));
        end
    end
  assign wire41 = $unsigned((+(8'hbf)));
  always
    @(posedge clk) begin
      reg42 <= $unsigned($unsigned((($unsigned((8'ha5)) <= $signed(reg33)) || (^(reg39 ?
          reg29 : (8'hbb))))));
      if (reg26)
        begin
          reg43 <= reg31[(2'h3):(2'h2)];
          reg44 <= $signed($signed($unsigned((^(reg29 ? reg29 : reg28)))));
          if (reg33)
            begin
              reg45 <= $signed((((7'h43) ?
                      reg34[(4'he):(3'h7)] : $unsigned(wire23[(5'h14):(2'h2)])) ?
                  (reg43[(2'h3):(2'h2)] & ({(8'hae), wire21} ?
                      (reg40 | reg32) : (reg34 > reg27))) : (reg27 >= ((wire24 * wire21) <= {(8'hbd)}))));
            end
          else
            begin
              reg45 <= (~(wire21[(2'h2):(1'h0)] != (~|$signed((8'hae)))));
              reg46 <= (reg37[(3'h4):(2'h3)] >= {$unsigned($unsigned($unsigned(reg45))),
                  $signed((^$signed((8'hb3))))});
              reg47 <= $signed({$unsigned(((reg38 ?
                      reg40 : reg26) >>> reg36[(3'h7):(2'h3)]))});
              reg48 <= reg39[(4'h9):(4'h8)];
              reg49 <= $unsigned(((!(reg31 ^ (8'ha6))) ?
                  $unsigned($unsigned((reg34 != reg43))) : {($signed(reg48) ?
                          (wire23 ? reg42 : reg25) : $signed(reg47))}));
            end
          if (reg48)
            begin
              reg50 <= (~|reg26);
              reg51 <= (&wire23);
            end
          else
            begin
              reg50 <= (^~{(reg37 >> $unsigned((wire24 ? reg46 : reg31)))});
              reg51 <= $signed((~(reg26 ?
                  ($unsigned(reg35) ?
                      (reg37 || wire22) : $signed(reg50)) : (&((7'h40) ?
                      reg40 : (7'h42))))));
              reg52 <= (wire23[(1'h1):(1'h0)] >>> $signed(($signed(reg51[(3'h7):(3'h6)]) <= $signed((reg46 << reg25)))));
              reg53 <= ((~^($signed((reg52 ?
                  reg43 : reg37)) ^~ reg25[(3'h7):(1'h0)])) | (~|$signed(($unsigned(reg28) & ((8'hb4) >>> wire22)))));
            end
        end
      else
        begin
          reg43 <= (((($signed(reg39) ^~ (reg42 ?
                  reg45 : reg31)) > reg27[(3'h6):(2'h3)]) ^ (((reg32 ?
                      reg49 : (8'hb6)) != (wire23 * reg25)) ?
                  reg34 : ((reg37 ? wire24 : reg44) << (reg53 ?
                      wire41 : (8'hb3))))) ?
              reg53 : ($signed((|(wire23 & reg50))) <<< ((wire22 || $signed(reg36)) ?
                  reg47 : reg49)));
          reg44 <= reg29;
        end
    end
  assign wire54 = ({$signed($unsigned($unsigned((8'hb0))))} ?
                      (8'h9e) : (((((8'ha3) ? reg27 : reg38) ?
                          $signed(wire41) : (reg37 ?
                              (8'hbc) : reg35)) >> ($signed(reg49) ?
                          ((8'hbe) ?
                              reg26 : reg26) : {(8'haf)})) < reg53[(1'h0):(1'h0)]));
endmodule
