module top
#(parameter param154 = {((+(((8'haf) ? (8'h9d) : (8'hb5)) ? {(8'hb2), (8'haf)} : (8'hb8))) ? (~&{((8'hac) + (7'h40)), (~(8'hb2))}) : ({((8'ha9) ? (8'hbf) : (8'h9c)), ((8'hae) || (8'hb6))} ? (((8'ha8) << (8'h9e)) + (^(8'ha6))) : (&{(8'h9f)}))), ((~^(7'h40)) != ((|((8'hb4) ? (8'h9d) : (8'hba))) ^ {(~|(8'hae)), ((8'hab) <= (7'h44))}))})
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h13e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(4'h8):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire4;
  wire signed [(2'h3):(1'h0)] wire153;
  wire signed [(2'h2):(1'h0)] wire136;
  wire [(4'he):(1'h0)] wire135;
  wire signed [(4'hb):(1'h0)] wire5;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(4'hd):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire11;
  wire [(3'h4):(1'h0)] wire133;
  reg signed [(5'h14):(1'h0)] reg152 = (1'h0);
  reg [(3'h6):(1'h0)] reg151 = (1'h0);
  reg [(4'h9):(1'h0)] reg150 = (1'h0);
  reg [(4'ha):(1'h0)] reg149 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg148 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg147 = (1'h0);
  reg [(5'h15):(1'h0)] reg146 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg145 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg144 = (1'h0);
  reg [(4'hf):(1'h0)] reg143 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg141 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg140 = (1'h0);
  reg [(4'hd):(1'h0)] reg139 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg138 = (1'h0);
  reg [(5'h14):(1'h0)] reg137 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg6 = (1'h0);
  assign y = {wire153,
                 wire136,
                 wire135,
                 wire5,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire11,
                 wire133,
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
                 reg6,
                 (1'h0)};
  assign wire5 = (~|(~^wire4));
  always
    @(posedge clk) begin
      reg6 <= wire2;
    end
  assign wire7 = wire2;
  assign wire8 = (|$unsigned(wire7));
  assign wire9 = (wire3[(3'h6):(1'h0)] ^~ $unsigned((^$signed(wire3))));
  assign wire10 = wire8[(3'h4):(2'h3)];
  assign wire11 = wire10[(2'h2):(1'h0)];
  module12 #() modinst134 (wire133, clk, wire4, wire0, wire11, reg6);
  assign wire135 = reg6[(3'h4):(1'h0)];
  assign wire136 = ((!wire10[(3'h4):(3'h4)]) << reg6[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      reg137 <= wire133;
      reg138 <= (wire135[(4'he):(4'h8)] != $signed($unsigned($unsigned((8'had)))));
    end
  always
    @(posedge clk) begin
      reg139 <= ((~^$signed(((wire136 ? wire11 : wire8) >> $signed((8'hb4))))) ?
          reg138[(2'h3):(1'h1)] : (!wire10));
      reg140 <= $signed(reg139);
      if ($signed($unsigned((($unsigned((8'ha6)) | (8'hbe)) ^ $unsigned((8'haf))))))
        begin
          reg141 <= {(^~$signed($signed($unsigned(wire3))))};
        end
      else
        begin
          reg141 <= ((wire2 << reg6[(1'h0):(1'h0)]) ?
              wire1 : (reg139 == wire10));
        end
      reg142 <= (^~wire136[(1'h0):(1'h0)]);
    end
  always
    @(posedge clk) begin
      reg143 <= $signed($signed(reg6));
      reg144 <= (reg137[(3'h4):(2'h2)] ?
          ((!reg137) >> (~reg141[(4'hb):(4'h8)])) : wire0);
      if (wire9)
        begin
          reg145 <= (!(~|$signed((reg6 ? wire5 : (~|wire2)))));
          reg146 <= reg137[(3'h5):(2'h3)];
        end
      else
        begin
          reg145 <= $unsigned($unsigned($unsigned($signed(wire8))));
        end
      reg147 <= (~^($signed(($signed(reg139) ?
              $signed(wire1) : reg137[(4'hd):(3'h5)])) ?
          (-$unsigned((reg142 ?
              wire8 : wire10))) : ((~|$signed(wire136)) >= $signed((wire3 >>> reg139)))));
      if ((reg6 >>> wire11))
        begin
          reg148 <= wire135;
          if ((wire11[(3'h6):(3'h5)] ?
              $signed((($signed(wire5) ?
                  $unsigned(reg148) : $unsigned(wire5)) == $signed({wire135,
                  reg141}))) : $signed(wire3[(3'h6):(3'h4)])))
            begin
              reg149 <= wire9;
              reg150 <= $signed($signed((^(^$signed(wire2)))));
            end
          else
            begin
              reg149 <= wire11;
              reg150 <= {({({wire135, (8'hbf)} ? (~^wire5) : reg149),
                          $unsigned($unsigned((8'hbf)))} ?
                      wire8 : ((8'h9e) ?
                          {$signed(wire3)} : ($unsigned(reg6) >= reg141[(4'h8):(2'h3)]))),
                  reg147};
              reg151 <= wire3;
            end
          reg152 <= $unsigned($signed($signed($unsigned((reg150 ?
              wire136 : reg150)))));
        end
      else
        begin
          if (({$unsigned(wire10[(4'hb):(3'h6)])} ?
              $signed((((8'hba) ?
                  (reg150 <<< (8'hab)) : $unsigned(wire5)) ~^ ($signed((8'ha4)) >= $unsigned((8'ha8))))) : (((((7'h40) ?
                          (8'hab) : reg151) ?
                      wire10[(3'h7):(1'h1)] : (!reg143)) ?
                  (|(wire2 | reg146)) : $signed(reg148[(1'h1):(1'h0)])) ~^ (((wire10 ?
                  reg6 : reg140) <= (|(8'hba))) || {$signed(reg147),
                  (^~reg138)}))))
            begin
              reg148 <= $signed((+($unsigned(reg143[(4'hb):(2'h2)]) << (~$signed((8'hac))))));
              reg149 <= {wire11[(5'h14):(4'hf)]};
            end
          else
            begin
              reg148 <= ($signed((($unsigned(reg143) << reg151[(3'h4):(3'h4)]) ?
                  {reg137,
                      $signed(wire2)} : $signed(wire135))) ^ ((((8'hba) | wire135) >> {$unsigned(reg145),
                  $signed(reg149)}) + (~|((reg142 + (8'h9d)) ?
                  (~^wire10) : $unsigned(reg140)))));
              reg149 <= reg139[(4'h9):(2'h2)];
              reg150 <= $unsigned($signed($unsigned((~^$signed(wire9)))));
              reg151 <= (^~wire10);
            end
          reg152 <= ({reg140} == reg149[(3'h5):(1'h1)]);
        end
    end
  assign wire153 = (((($unsigned(wire1) * (~wire10)) != reg150) ?
                           (|(reg140 & reg139[(2'h2):(1'h0)])) : ({wire9[(2'h2):(2'h2)]} && $unsigned((|wire7)))) ?
                       $signed(reg140) : (&{reg151[(3'h5):(1'h1)]}));
endmodule

module module12  (y, clk, wire13, wire14, wire15, wire16);
  output wire [(32'h1bb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire15;
  input wire signed [(2'h3):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire132;
  wire [(5'h11):(1'h0)] wire131;
  wire [(3'h4):(1'h0)] wire130;
  wire signed [(4'h9):(1'h0)] wire17;
  wire signed [(4'hb):(1'h0)] wire30;
  wire signed [(3'h7):(1'h0)] wire32;
  wire [(2'h3):(1'h0)] wire35;
  wire signed [(3'h7):(1'h0)] wire36;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire38;
  wire [(4'hd):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire95;
  wire [(2'h2):(1'h0)] wire97;
  wire [(5'h15):(1'h0)] wire98;
  wire [(4'h9):(1'h0)] wire99;
  wire [(3'h4):(1'h0)] wire128;
  reg [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg19 = (1'h0);
  reg [(4'hd):(1'h0)] reg20 = (1'h0);
  reg [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'h9):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'hd):(1'h0)] reg26 = (1'h0);
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg28 = (1'h0);
  reg [(2'h3):(1'h0)] reg29 = (1'h0);
  reg [(2'h2):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg33 = (1'h0);
  reg [(4'h8):(1'h0)] reg34 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg39 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg40 = (1'h0);
  reg signed [(4'he):(1'h0)] reg41 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg42 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg44 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg46 = (1'h0);
  assign y = {wire132,
                 wire131,
                 wire130,
                 wire17,
                 wire30,
                 wire32,
                 wire35,
                 wire36,
                 wire37,
                 wire38,
                 wire47,
                 wire95,
                 wire97,
                 wire98,
                 wire99,
                 wire128,
                 reg18,
                 reg19,
                 reg20,
                 reg21,
                 reg22,
                 reg23,
                 reg24,
                 reg25,
                 reg26,
                 reg27,
                 reg28,
                 reg29,
                 reg31,
                 reg33,
                 reg34,
                 reg39,
                 reg40,
                 reg41,
                 reg42,
                 reg43,
                 reg44,
                 reg45,
                 reg46,
                 (1'h0)};
  assign wire17 = $signed(((~^($signed(wire13) ?
                          $unsigned(wire15) : wire16[(2'h3):(1'h0)])) ?
                      (~|wire16[(1'h1):(1'h0)]) : $unsigned(((+(8'ha0)) >= (wire16 ?
                          wire16 : wire13)))));
  always
    @(posedge clk) begin
      reg18 <= wire13[(4'ha):(4'h9)];
      reg19 <= $signed((-$signed((wire17 ? wire17 : wire14))));
      reg20 <= wire17;
    end
  always
    @(posedge clk) begin
      if ($signed(($unsigned(reg19) < (^$unsigned({wire13})))))
        begin
          reg21 <= $unsigned(((!$unsigned({wire13})) ?
              ((&((8'hb5) - wire17)) > wire15[(4'hb):(3'h4)]) : {$signed({(8'hac)})}));
          reg22 <= reg18;
          reg23 <= reg21[(3'h4):(2'h3)];
        end
      else
        begin
          if ({(($unsigned((wire15 ? reg20 : reg20)) ?
                      {$unsigned(reg22)} : (~reg19[(3'h5):(2'h3)])) ?
                  reg23 : (((^wire16) ?
                          $unsigned(wire16) : reg21[(4'hd):(3'h7)]) ?
                      ($unsigned(reg19) ?
                          (reg20 ? reg19 : reg23) : (wire16 ?
                              (8'hb7) : reg20)) : wire13))})
            begin
              reg21 <= $signed(wire13[(2'h2):(1'h1)]);
              reg22 <= (~|(((+((8'ha1) ?
                  wire14 : reg20)) > $signed((wire16 ~^ wire13))) * reg20[(2'h3):(1'h0)]));
              reg23 <= ($unsigned((($unsigned(reg22) ?
                          (reg23 ? wire14 : reg22) : wire14[(4'hb):(2'h3)]) ?
                      wire15 : (((7'h40) ~^ wire15) ? reg23 : (-(8'hb1))))) ?
                  wire16 : wire17[(4'h9):(3'h4)]);
              reg24 <= reg19;
              reg25 <= {((8'hb6) != ((reg24[(2'h2):(2'h2)] ?
                      (~^reg19) : (wire14 + (8'hab))) >> (wire15 > (reg18 || reg18))))};
            end
          else
            begin
              reg21 <= $unsigned({$signed($signed(reg24))});
              reg22 <= ($signed(reg20[(3'h4):(3'h4)]) >> reg24);
              reg23 <= (!(8'hb4));
              reg24 <= ((+(!((!reg24) ?
                  wire13 : (reg18 << wire13)))) > $signed($signed(((reg22 > wire16) != {reg20}))));
            end
          reg26 <= reg20;
        end
      reg27 <= reg26;
      reg28 <= (&(^wire16[(1'h1):(1'h1)]));
      reg29 <= reg23;
    end
  assign wire30 = (8'ha2);
  always
    @(posedge clk) begin
      reg31 <= reg19[(1'h1):(1'h1)];
    end
  assign wire32 = (!(~^$unsigned((wire30 ? reg25 : $signed(reg26)))));
  always
    @(posedge clk) begin
      reg33 <= (((($signed(reg31) && $unsigned(reg19)) ?
              reg20[(4'ha):(3'h7)] : {reg26[(2'h2):(2'h2)]}) << (reg26[(4'ha):(1'h1)] ?
              (reg25 <= {reg29, reg21}) : {$unsigned(reg22)})) ?
          (+(^~$unsigned((reg26 && wire32)))) : reg28);
      reg34 <= ((~&$unsigned($unsigned((reg21 ~^ (8'hb5))))) ?
          ($unsigned((reg21[(4'hc):(4'h9)] & reg19)) ^ (~&reg20)) : $signed((-(8'hba))));
    end
  assign wire35 = (8'ha7);
  assign wire36 = reg26;
  assign wire37 = reg23;
  assign wire38 = {(+$signed(({(8'ha8)} == (reg23 ^ reg23)))),
                      $unsigned((7'h40))};
  always
    @(posedge clk) begin
      reg39 <= reg29[(2'h3):(2'h2)];
      reg40 <= $signed((reg23 == (+reg28[(1'h1):(1'h0)])));
      reg41 <= reg27;
      reg42 <= $unsigned(((~&{(wire30 || reg33), $signed(wire15)}) ?
          $signed(wire36[(2'h2):(1'h1)]) : ((+$unsigned(reg31)) <<< (|$unsigned(reg27)))));
      if (reg29[(2'h3):(2'h2)])
        begin
          if (reg22[(4'h9):(1'h0)])
            begin
              reg43 <= reg25;
            end
          else
            begin
              reg43 <= $signed(reg21);
              reg44 <= wire35;
              reg45 <= reg31[(1'h1):(1'h0)];
            end
        end
      else
        begin
          reg43 <= $signed(($signed((((8'haa) ? reg42 : reg26) ?
                  (reg44 ^~ (8'ha0)) : $unsigned(reg26))) ?
              reg45 : $signed($signed(reg24))));
          reg44 <= reg25;
          reg45 <= $signed(wire37);
          reg46 <= reg25;
        end
    end
  assign wire47 = (wire14 <<< (-{($signed((8'ha7)) ^~ $signed(reg19))}));
  module48 #() modinst96 (.wire51(reg19), .clk(clk), .wire49(wire14), .wire52(wire37), .y(wire95), .wire50(reg46));
  assign wire97 = (~&(wire17 >> $signed(reg31)));
  assign wire98 = {(&reg24),
                      $unsigned($unsigned(($signed(reg39) ?
                          reg25 : (|reg42))))};
  assign wire99 = $unsigned({(reg20[(3'h4):(2'h3)] ?
                          (7'h44) : $unsigned($unsigned(wire30))),
                      (+$signed(wire47))});
  module100 #() modinst129 (.wire101(wire32), .wire103(reg23), .wire104(wire37), .clk(clk), .wire102(wire99), .y(wire128));
  assign wire130 = reg46;
  assign wire131 = (+reg27[(1'h1):(1'h0)]);
  assign wire132 = {$unsigned(reg20)};
endmodule

module module100
#(parameter param126 = (((({(8'had)} <<< ((8'ha5) >= (8'hba))) ? {((8'ha2) ^ (8'hb3))} : {(~&(8'hb5)), (^~(8'hbf))}) ^ (~&{((8'hb4) >>> (8'ha4))})) * (8'hba)), 
parameter param127 = {(&((param126 ? (param126 <<< param126) : param126) != ((param126 ? param126 : param126) ? param126 : {param126}))), (^(|((8'hb9) & ((7'h44) ? param126 : (8'hbe)))))})
(y, clk, wire104, wire103, wire102, wire101);
  output wire [(32'h102):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire104;
  input wire [(5'h13):(1'h0)] wire103;
  input wire [(3'h5):(1'h0)] wire102;
  input wire [(2'h3):(1'h0)] wire101;
  wire [(4'hd):(1'h0)] wire114;
  wire [(4'h9):(1'h0)] wire113;
  wire signed [(4'h9):(1'h0)] wire112;
  wire signed [(4'hf):(1'h0)] wire111;
  wire [(4'hf):(1'h0)] wire110;
  wire [(3'h4):(1'h0)] wire109;
  wire signed [(3'h5):(1'h0)] wire108;
  wire signed [(4'he):(1'h0)] wire107;
  wire signed [(4'h9):(1'h0)] wire106;
  wire [(5'h10):(1'h0)] wire105;
  reg signed [(4'hf):(1'h0)] reg125 = (1'h0);
  reg [(4'he):(1'h0)] reg124 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg123 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg120 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg119 = (1'h0);
  reg [(5'h14):(1'h0)] reg118 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg117 = (1'h0);
  reg [(2'h3):(1'h0)] reg116 = (1'h0);
  reg [(5'h14):(1'h0)] reg115 = (1'h0);
  assign y = {wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
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
                 (1'h0)};
  assign wire105 = $unsigned($unsigned(wire104));
  assign wire106 = $unsigned($signed(wire103[(4'hd):(4'h9)]));
  assign wire107 = (8'haf);
  assign wire108 = wire104[(4'hc):(1'h0)];
  assign wire109 = $signed(($unsigned(wire108) - $unsigned(wire102[(1'h0):(1'h0)])));
  assign wire110 = (~$unsigned((~&(wire105[(3'h6):(2'h2)] && $unsigned(wire104)))));
  assign wire111 = $signed(wire107[(4'ha):(3'h4)]);
  assign wire112 = wire109[(2'h3):(2'h3)];
  assign wire113 = (((+wire101) ?
                           $unsigned(wire110) : ((8'ha5) > ({(8'ha3), wire112} ?
                               wire108 : (wire111 ? (8'hab) : wire106)))) ?
                       $unsigned($unsigned(wire107[(4'h9):(1'h1)])) : ((wire108[(2'h2):(2'h2)] + (+{wire109,
                               wire102})) ?
                           (~^(~^(wire108 + wire107))) : $signed(wire101)));
  assign wire114 = $signed(wire104);
  always
    @(posedge clk) begin
      reg115 <= ($signed(wire102) ?
          $signed(wire113) : ($signed(wire104[(4'hd):(4'h9)]) ?
              wire103 : (^~((!wire108) ^~ (wire113 | wire112)))));
      reg116 <= $signed($signed($unsigned(reg115[(1'h0):(1'h0)])));
      reg117 <= (wire104[(3'h4):(1'h0)] == wire111);
      if ((reg116 ?
          (wire112 ?
              {(reg117[(4'ha):(3'h5)] ? {(8'hbf)} : wire109),
                  reg117} : (wire106[(3'h6):(2'h3)] ?
                  ((|wire101) ?
                      $unsigned(wire104) : $unsigned((8'ha0))) : $signed((wire104 ?
                      wire108 : (8'h9c))))) : (!($signed((+wire105)) & (!wire106)))))
        begin
          reg118 <= $signed($signed(wire105));
          reg119 <= $signed($unsigned(wire105));
        end
      else
        begin
          if (((reg118[(5'h13):(5'h11)] == (8'hb0)) ~^ ($signed(wire108[(1'h1):(1'h1)]) ?
              $unsigned(($signed(wire111) >> (+wire109))) : reg118[(4'h9):(3'h5)])))
            begin
              reg118 <= wire108;
              reg119 <= ($unsigned($signed(({wire101, reg116} ?
                  {(8'haf),
                      wire108} : ((8'hae) <<< (8'ha2))))) >>> wire112[(3'h6):(2'h2)]);
              reg120 <= reg116;
              reg121 <= $signed((~^wire107[(3'h6):(1'h0)]));
            end
          else
            begin
              reg118 <= wire103;
              reg119 <= {(($unsigned((~|wire101)) < wire113) ?
                      wire106[(2'h2):(1'h0)] : (8'h9c)),
                  $signed(((8'ha2) > ($signed(wire102) ?
                      (-reg121) : (wire111 || wire105))))};
              reg120 <= wire113[(3'h7):(2'h3)];
            end
          reg122 <= $unsigned(reg119);
          reg123 <= $signed(reg119[(4'h9):(1'h1)]);
          reg124 <= $unsigned($signed((wire112 ?
              $unsigned((reg118 ? wire114 : wire106)) : wire101)));
          reg125 <= wire112;
        end
    end
endmodule

module module48
#(parameter param94 = (^~(!(-{((8'hbd) * (8'hb7)), (^(8'haa))}))))
(y, clk, wire52, wire51, wire50, wire49);
  output wire [(32'h1f9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire52;
  input wire signed [(5'h10):(1'h0)] wire51;
  input wire signed [(3'h5):(1'h0)] wire50;
  input wire [(5'h13):(1'h0)] wire49;
  wire signed [(2'h2):(1'h0)] wire93;
  wire signed [(4'ha):(1'h0)] wire88;
  wire signed [(5'h15):(1'h0)] wire87;
  wire signed [(5'h14):(1'h0)] wire86;
  wire [(3'h5):(1'h0)] wire67;
  wire signed [(4'hc):(1'h0)] wire66;
  wire signed [(3'h6):(1'h0)] wire65;
  wire signed [(5'h12):(1'h0)] wire64;
  wire signed [(4'h9):(1'h0)] wire63;
  wire signed [(3'h6):(1'h0)] wire62;
  wire signed [(4'hf):(1'h0)] wire61;
  wire signed [(4'he):(1'h0)] wire60;
  wire [(4'h9):(1'h0)] wire59;
  wire signed [(4'h8):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire signed [(5'h13):(1'h0)] wire56;
  wire [(5'h11):(1'h0)] wire55;
  wire [(5'h11):(1'h0)] wire54;
  wire signed [(3'h7):(1'h0)] wire53;
  reg signed [(5'h10):(1'h0)] reg92 = (1'h0);
  reg [(2'h3):(1'h0)] reg91 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg90 = (1'h0);
  reg [(4'he):(1'h0)] reg89 = (1'h0);
  reg signed [(4'he):(1'h0)] reg85 = (1'h0);
  reg [(3'h5):(1'h0)] reg84 = (1'h0);
  reg [(4'h9):(1'h0)] reg83 = (1'h0);
  reg [(4'hd):(1'h0)] reg82 = (1'h0);
  reg [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg80 = (1'h0);
  reg [(3'h7):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg78 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg77 = (1'h0);
  reg signed [(4'he):(1'h0)] reg76 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg75 = (1'h0);
  reg [(5'h12):(1'h0)] reg74 = (1'h0);
  reg [(4'hd):(1'h0)] reg73 = (1'h0);
  reg [(5'h10):(1'h0)] reg72 = (1'h0);
  reg [(5'h14):(1'h0)] reg71 = (1'h0);
  reg [(5'h14):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg69 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg68 = (1'h0);
  assign y = {wire93,
                 wire88,
                 wire87,
                 wire86,
                 wire67,
                 wire66,
                 wire65,
                 wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire53,
                 reg92,
                 reg91,
                 reg90,
                 reg89,
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
                 reg70,
                 reg69,
                 reg68,
                 (1'h0)};
  assign wire53 = $unsigned($unsigned($signed(wire50)));
  assign wire54 = $signed((wire51 <<< ((wire51 ?
                      (!wire53) : wire52) & ($unsigned(wire53) ?
                      wire53 : wire49[(3'h7):(3'h4)]))));
  assign wire55 = wire54[(4'hc):(4'ha)];
  assign wire56 = {$signed(((8'hbc) >> $unsigned(wire49[(4'hb):(3'h7)]))),
                      wire50};
  assign wire57 = (wire53[(2'h3):(2'h3)] | ((($unsigned(wire53) < ((8'hb7) ?
                          wire52 : wire51)) ~^ (wire49[(4'hc):(2'h3)] ?
                          (wire53 <= wire49) : (wire51 ? (8'ha9) : wire55))) ?
                      $signed($unsigned(wire56[(3'h4):(1'h1)])) : $signed(wire55)));
  assign wire58 = {$signed(wire57)};
  assign wire59 = wire51;
  assign wire60 = $signed($signed(((-$signed(wire50)) ?
                      wire51[(3'h7):(2'h3)] : (+$signed((7'h40))))));
  assign wire61 = wire53[(1'h0):(1'h0)];
  assign wire62 = $signed({$signed(wire59[(3'h4):(3'h4)])});
  assign wire63 = {wire50[(1'h1):(1'h1)], $unsigned(wire51)};
  assign wire64 = wire60[(4'he):(4'h9)];
  assign wire65 = wire64[(2'h3):(2'h2)];
  assign wire66 = wire50[(3'h5):(1'h1)];
  assign wire67 = wire55;
  always
    @(posedge clk) begin
      reg68 <= (wire52 == {$signed((~^$signed(wire63)))});
      reg69 <= {wire51, wire52[(4'hb):(2'h2)]};
      if (({$unsigned(wire62[(1'h1):(1'h1)])} == wire64))
        begin
          reg70 <= (~&wire66);
          reg71 <= wire67[(3'h4):(2'h2)];
          reg72 <= {wire67};
          reg73 <= $unsigned($signed((-$signed({wire57}))));
          if (wire59)
            begin
              reg74 <= $signed((~($signed(reg68[(2'h2):(1'h0)]) >> ((wire50 ?
                  reg69 : wire66) >>> ((8'hb4) ? (8'hb1) : wire52)))));
              reg75 <= wire49;
            end
          else
            begin
              reg74 <= ($signed(reg69) ? reg72 : {reg72[(4'hb):(2'h2)]});
            end
        end
      else
        begin
          reg70 <= {$unsigned($unsigned($unsigned($signed(wire66))))};
          if (((wire63[(3'h6):(2'h3)] >= $unsigned(reg72)) >= wire65))
            begin
              reg71 <= wire66;
              reg72 <= wire52[(2'h2):(1'h1)];
            end
          else
            begin
              reg71 <= $unsigned($signed((~$signed(wire62))));
              reg72 <= (~$unsigned((wire66 ?
                  {$unsigned(reg74), {reg69, reg73}} : ({wire60} ^ wire59))));
              reg73 <= wire59[(4'h9):(1'h0)];
            end
          reg74 <= reg73;
          if (reg69)
            begin
              reg75 <= {$unsigned(wire58)};
              reg76 <= ($signed($signed($signed((reg73 ? (8'hb6) : wire63)))) ?
                  $unsigned({(wire62 ? $unsigned((8'hac)) : $unsigned(wire50)),
                      ((wire55 ?
                          wire51 : wire52) >>> $unsigned(wire60))}) : $unsigned(({{reg70,
                          wire59},
                      wire67[(2'h3):(2'h2)]} <<< $unsigned($signed(wire54)))));
              reg77 <= reg76[(4'hb):(1'h0)];
              reg78 <= reg75;
              reg79 <= wire67;
            end
          else
            begin
              reg75 <= ($signed(($signed(wire58[(3'h7):(3'h5)]) > {$unsigned(wire52)})) >> $unsigned(($unsigned($unsigned(reg68)) < (!$signed(reg77)))));
              reg76 <= wire49;
              reg77 <= reg69[(1'h0):(1'h0)];
              reg78 <= reg79[(3'h4):(2'h2)];
            end
        end
      reg80 <= wire67;
    end
  always
    @(posedge clk) begin
      reg81 <= {{$unsigned(wire53), wire54},
          $signed($signed((~|(wire63 ? reg78 : wire53))))};
      reg82 <= $signed($unsigned($signed(wire56[(3'h7):(1'h1)])));
    end
  always
    @(posedge clk) begin
      reg83 <= $unsigned(((!reg76) && (reg81[(3'h6):(3'h5)] ^~ $unsigned((|wire64)))));
      reg84 <= wire56[(4'hf):(3'h6)];
      reg85 <= wire54[(4'hd):(4'h9)];
    end
  assign wire86 = wire49[(5'h11):(5'h10)];
  assign wire87 = $unsigned(($unsigned({reg84, (reg80 ? wire64 : wire55)}) ?
                      (((!wire57) >> $signed(reg70)) > $unsigned(wire65[(3'h5):(1'h1)])) : (~^($unsigned((8'hb7)) ~^ $signed(wire65)))));
  assign wire88 = (&({$unsigned(reg85), $signed((~reg75))} >>> reg84));
  always
    @(posedge clk) begin
      reg89 <= (~|$signed($unsigned($signed(wire59[(3'h6):(1'h1)]))));
      reg90 <= wire49[(5'h10):(4'hf)];
      reg91 <= (((8'hb7) << wire64[(1'h1):(1'h1)]) ?
          (8'hae) : $unsigned(wire67));
      reg92 <= wire59;
    end
  assign wire93 = $signed($unsigned((~&(wire55 ?
                      reg85[(2'h3):(2'h3)] : $unsigned(wire61)))));
endmodule
