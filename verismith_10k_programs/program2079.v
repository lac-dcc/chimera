module top
#(parameter param178 = (({(((8'ha7) ? (8'hab) : (7'h40)) >>> (~&(8'ha1))), ((-(8'ha5)) ? ((8'hb5) ^ (8'h9f)) : (^~(8'hb7)))} ? (^(((8'hb8) || (8'hb1)) << ((8'ha4) ? (8'ha5) : (8'hb9)))) : ((~&{(8'h9c)}) >= ((+(8'hb8)) ? {(8'hab), (8'hb3)} : (-(8'hbc))))) ? {(~^(7'h40)), (({(8'ha6)} ? (~&(8'hac)) : ((8'hb6) != (8'hbc))) ^ ((~(8'hab)) || (8'h9e)))} : ((({(7'h43)} >= ((8'ha6) == (8'hb0))) ^~ {{(8'hbc), (8'ha6)}, (&(8'ha1))}) && (-((8'hab) == {(8'h9c)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h161):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(4'hc):(1'h0)] wire2;
  input wire [(4'h8):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire0;
  wire [(5'h10):(1'h0)] wire177;
  wire signed [(4'he):(1'h0)] wire176;
  wire [(2'h3):(1'h0)] wire175;
  wire signed [(4'h9):(1'h0)] wire155;
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg173 = (1'h0);
  reg [(5'h13):(1'h0)] reg172 = (1'h0);
  reg [(5'h11):(1'h0)] reg171 = (1'h0);
  reg [(5'h15):(1'h0)] reg170 = (1'h0);
  reg [(4'hd):(1'h0)] reg169 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg168 = (1'h0);
  reg [(4'h9):(1'h0)] reg167 = (1'h0);
  reg [(4'h8):(1'h0)] reg166 = (1'h0);
  reg [(5'h13):(1'h0)] reg165 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg164 = (1'h0);
  reg [(2'h3):(1'h0)] reg163 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg162 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg161 = (1'h0);
  reg [(3'h6):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg159 = (1'h0);
  reg [(5'h14):(1'h0)] reg158 = (1'h0);
  reg [(3'h7):(1'h0)] reg157 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg4 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg6 = (1'h0);
  reg [(5'h13):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(4'he):(1'h0)] reg9 = (1'h0);
  reg [(4'hd):(1'h0)] reg10 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg11 = (1'h0);
  assign y = {wire177,
                 wire176,
                 wire175,
                 wire155,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg170,
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
                 reg4,
                 reg5,
                 reg6,
                 reg7,
                 reg8,
                 reg9,
                 reg10,
                 reg11,
                 (1'h0)};
  always
    @(posedge clk) begin
      if ($signed(wire2[(3'h5):(1'h1)]))
        begin
          if ({((8'hab) ? wire2 : {$signed(((8'ha3) * (8'hb6)))})})
            begin
              reg4 <= (~|({wire1, ({wire2, (8'hb4)} || wire2)} >= wire3));
              reg5 <= (((~^(-(wire3 ? wire3 : (8'ha7)))) ?
                  $signed(wire0[(3'h7):(3'h7)]) : ((!wire0) ?
                      $unsigned((reg4 ? wire3 : wire1)) : reg4)) ^ wire0);
              reg6 <= (((+$signed(wire1)) >= reg5) >> ({((8'hb7) ?
                          $unsigned(reg5) : $unsigned(wire0)),
                      reg5} ?
                  wire0[(2'h3):(1'h0)] : $unsigned(wire0[(4'h8):(2'h2)])));
              reg7 <= ($signed((8'hab)) && (-reg4[(4'h9):(3'h5)]));
            end
          else
            begin
              reg4 <= reg6;
              reg5 <= $unsigned(reg7[(3'h5):(2'h3)]);
            end
          reg8 <= $signed($signed($signed($unsigned(reg6))));
          reg9 <= wire2;
        end
      else
        begin
          reg4 <= (($signed(((wire1 & reg9) ?
                  (reg5 >= reg4) : $unsigned(reg6))) ?
              reg8 : wire1[(3'h5):(1'h1)]) || $signed(reg7));
          reg5 <= reg9[(4'h9):(4'h9)];
          reg6 <= (^($unsigned(($unsigned(reg5) ? wire0 : (-reg8))) ?
              wire2[(3'h5):(3'h5)] : ({(reg8 || wire1),
                  $unsigned(wire3)} <<< wire1)));
          reg7 <= $unsigned((+reg4));
        end
      reg10 <= ((&((reg5[(3'h7):(3'h7)] ?
          (wire3 ~^ wire2) : (reg6 ? wire0 : reg9)) == ($unsigned(wire1) ?
          wire3 : {(8'hba)}))) || reg8[(1'h0):(1'h0)]);
      reg11 <= reg10[(2'h2):(1'h1)];
    end
  module12 #() modinst156 (wire155, clk, reg6, reg5, reg7, reg10, reg9);
  always
    @(posedge clk) begin
      reg157 <= {(-$signed(reg7[(5'h13):(2'h2)])), reg8};
      if (reg4[(5'h10):(4'hf)])
        begin
          reg158 <= (^~($unsigned((^~{reg5})) <<< (reg7 ?
              $signed($signed(reg6)) : reg5)));
          if ((reg6[(1'h1):(1'h0)] > (reg5 ?
              (~(reg8 ?
                  $signed(reg5) : reg7[(4'hf):(4'hb)])) : (($unsigned(reg9) ?
                      reg157[(3'h6):(1'h1)] : (-reg158)) ?
                  wire2[(4'h9):(4'h9)] : (-{reg6})))))
            begin
              reg159 <= wire3[(4'ha):(1'h1)];
              reg160 <= ($signed($signed(reg6)) ?
                  $signed((wire1[(3'h6):(3'h6)] << ((reg158 <<< reg7) ?
                      reg10 : reg158[(5'h11):(2'h2)]))) : {reg11[(1'h0):(1'h0)]});
              reg161 <= (+{{(|(wire0 ? reg5 : reg159)),
                      ({wire1} >>> (reg159 ? wire3 : reg8))}});
              reg162 <= ($signed((wire3 ?
                  reg158[(4'hb):(4'h9)] : (+reg159))) || reg161);
              reg163 <= reg5[(3'h6):(2'h3)];
            end
          else
            begin
              reg159 <= reg159[(3'h4):(2'h3)];
            end
          if (($unsigned(reg158) ?
              wire0[(4'ha):(4'h9)] : {$unsigned(reg6[(2'h2):(1'h0)]),
                  {(^~{wire155, wire0})}}))
            begin
              reg164 <= reg9[(4'h8):(4'h8)];
              reg165 <= $unsigned((-$signed((~&((8'ha4) ~^ wire1)))));
              reg166 <= reg11[(3'h7):(1'h1)];
              reg167 <= wire155[(1'h1):(1'h1)];
            end
          else
            begin
              reg164 <= $signed((reg11[(3'h6):(2'h2)] & {(reg166[(3'h6):(2'h2)] >>> {reg163}),
                  ((|reg9) ? $signed(reg8) : $unsigned(reg6))}));
              reg165 <= wire155;
              reg166 <= reg8[(4'h8):(2'h3)];
              reg167 <= reg160;
              reg168 <= wire0[(3'h7):(3'h7)];
            end
          if ((~^(|$unsigned(reg157))))
            begin
              reg169 <= wire0;
              reg170 <= (((reg10 <= $signed(reg163)) ?
                      ($unsigned((wire3 ? wire2 : reg158)) ?
                          (((8'ha5) & (8'hb6)) && (^wire3)) : (8'hae)) : ({{reg164}} | reg8[(3'h5):(2'h2)])) ?
                  (reg6 ?
                      (&(|reg159[(4'hc):(3'h5)])) : $unsigned((|(reg5 >= reg163)))) : reg169[(3'h6):(2'h2)]);
              reg171 <= (8'h9e);
            end
          else
            begin
              reg169 <= reg167[(3'h5):(2'h2)];
              reg170 <= $signed((!$unsigned((reg6 ^~ wire2[(1'h1):(1'h1)]))));
              reg171 <= (-reg157);
            end
        end
      else
        begin
          reg158 <= ((|$unsigned($unsigned((wire1 ?
              wire3 : (8'hb3))))) << $unsigned(($signed($signed(reg9)) > (^~$unsigned(reg166)))));
        end
      reg172 <= {(((reg171[(2'h2):(1'h1)] ?
                  {(8'h9d)} : (^(8'ha5))) << ((8'ha6) ~^ $unsigned(reg9))) ?
              $signed({{reg8, reg10}}) : {(((8'haa) ?
                      reg166 : wire155) ^ reg166)})};
      reg173 <= (^~$unsigned((reg159 ?
          ((reg7 + reg171) ?
              $signed(reg162) : (reg165 * reg160)) : (~|$unsigned((8'ha0))))));
      reg174 <= (7'h43);
    end
  assign wire175 = (8'hb3);
  assign wire176 = (((!(&$unsigned(reg6))) && {reg163[(1'h1):(1'h1)]}) ?
                       (|reg5) : $unsigned((reg7 ?
                           ((reg170 && (7'h42)) ?
                               ((8'hbf) ?
                                   reg159 : (8'hbc)) : $signed(reg168)) : ((8'hbc) ?
                               reg171 : (8'had)))));
  assign wire177 = (($unsigned(reg8) & (((^~(8'hba)) != (reg174 ?
                           wire175 : (8'ha4))) == wire176[(1'h1):(1'h1)])) ?
                       $signed(((reg9 ? (~|reg8) : {(8'hbe), wire2}) ?
                           (~|(reg11 ?
                               reg165 : reg163)) : (~^(wire3 | reg9)))) : $signed(reg173[(2'h2):(1'h0)]));
endmodule

module module12
#(parameter param153 = (~^(((8'ha8) >> (^((8'ha5) == (8'had)))) <= {(!((8'hb9) << (8'hae)))})), 
parameter param154 = param153)
(y, clk, wire13, wire14, wire15, wire16, wire17);
  output wire [(32'h61):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire13;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire [(5'h13):(1'h0)] wire15;
  input wire signed [(4'hd):(1'h0)] wire16;
  input wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h15):(1'h0)] wire151;
  wire signed [(5'h14):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire39;
  wire signed [(4'ha):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire43;
  wire [(3'h6):(1'h0)] wire104;
  assign y = {wire151, wire18, wire39, wire41, wire42, wire43, wire104, (1'h0)};
  assign wire18 = (!($unsigned(wire17) ? (8'hbb) : wire17[(3'h7):(3'h7)]));
  module19 #() modinst40 (.wire23(wire14), .wire20(wire18), .wire22(wire13), .clk(clk), .y(wire39), .wire21(wire15));
  assign wire41 = (8'h9f);
  assign wire42 = (wire16 >= $unsigned(wire16[(3'h7):(1'h0)]));
  assign wire43 = $signed($signed($signed($unsigned((wire18 ?
                      wire17 : wire15)))));
  module44 #() modinst105 (wire104, clk, wire14, wire16, wire43, wire39, wire13);
  module106 #() modinst152 (.wire108(wire14), .wire109(wire39), .wire107(wire18), .wire110(wire17), .y(wire151), .clk(clk));
endmodule

module module106
#(parameter param149 = (~|{({((8'hb6) ? (7'h40) : (8'hab))} > {{(8'hb4)}})}), 
parameter param150 = ((^~(((7'h40) ? param149 : param149) ? param149 : (|((8'hbd) ? param149 : param149)))) > ((param149 ? ({param149, param149} < (&param149)) : (((8'hbe) ? param149 : param149) ? (param149 ? param149 : param149) : (~(8'hb3)))) ? (((^param149) + param149) ? ((param149 ? param149 : param149) ? (param149 ? (8'hac) : param149) : param149) : (param149 ? (param149 ? (8'hb0) : param149) : (param149 | param149))) : (((^param149) ? param149 : (param149 ? param149 : param149)) ~^ ((param149 ? param149 : param149) ? (+param149) : (~&param149))))))
(y, clk, wire110, wire109, wire108, wire107);
  output wire [(32'h181):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire110;
  input wire signed [(3'h6):(1'h0)] wire109;
  input wire signed [(3'h4):(1'h0)] wire108;
  input wire [(5'h10):(1'h0)] wire107;
  wire signed [(5'h14):(1'h0)] wire148;
  wire [(5'h13):(1'h0)] wire147;
  wire [(5'h12):(1'h0)] wire146;
  wire [(4'h9):(1'h0)] wire145;
  wire [(3'h6):(1'h0)] wire139;
  wire [(4'h9):(1'h0)] wire138;
  wire signed [(3'h5):(1'h0)] wire137;
  wire [(5'h15):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  reg signed [(5'h11):(1'h0)] reg144 = (1'h0);
  reg [(5'h13):(1'h0)] reg143 = (1'h0);
  reg [(5'h12):(1'h0)] reg142 = (1'h0);
  reg signed [(4'he):(1'h0)] reg141 = (1'h0);
  reg [(2'h3):(1'h0)] reg140 = (1'h0);
  reg [(4'hc):(1'h0)] reg136 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg135 = (1'h0);
  reg [(3'h5):(1'h0)] reg134 = (1'h0);
  reg [(5'h10):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg132 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg131 = (1'h0);
  reg [(5'h10):(1'h0)] reg130 = (1'h0);
  reg signed [(4'he):(1'h0)] reg129 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg128 = (1'h0);
  reg [(4'h9):(1'h0)] reg127 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg126 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg125 = (1'h0);
  reg [(4'h8):(1'h0)] reg124 = (1'h0);
  reg [(3'h5):(1'h0)] reg121 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg120 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg118 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg117 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg116 = (1'h0);
  reg [(3'h4):(1'h0)] reg115 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg114 = (1'h0);
  reg [(3'h4):(1'h0)] reg113 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg112 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg111 = (1'h0);
  assign y = {wire148,
                 wire147,
                 wire146,
                 wire145,
                 wire139,
                 wire138,
                 wire137,
                 wire123,
                 wire122,
                 reg144,
                 reg143,
                 reg142,
                 reg141,
                 reg140,
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
  always
    @(posedge clk) begin
      if (wire108)
        begin
          reg111 <= (~$signed(((&(wire110 ? wire109 : wire107)) ?
              (^(8'hb4)) : ($unsigned(wire108) ?
                  (wire108 ? wire107 : wire109) : wire107))));
          reg112 <= $signed(wire110[(3'h5):(3'h5)]);
        end
      else
        begin
          if ($signed((wire108 ? wire109 : (~|{$unsigned((8'hb8))}))))
            begin
              reg111 <= reg112;
            end
          else
            begin
              reg111 <= (^~(8'ha1));
            end
          reg112 <= $unsigned(($unsigned(wire107) ?
              $signed(reg111) : wire110[(1'h0):(1'h0)]));
          reg113 <= (~^reg112);
          reg114 <= (+wire107);
          reg115 <= $signed($unsigned($signed(((reg113 ? wire108 : wire109) ?
              $unsigned(wire109) : (|reg111)))));
        end
      reg116 <= (&$unsigned($signed(wire107)));
    end
  always
    @(posedge clk) begin
      reg117 <= $unsigned($unsigned({({wire108} | reg113)}));
      reg118 <= $signed((!((((8'haa) ?
              (8'haa) : wire107) >= (wire110 == wire107)) ?
          wire109[(2'h3):(2'h2)] : wire109)));
      reg119 <= ((wire109 << $signed(($signed(reg114) ?
          $signed(wire108) : wire108))) ^ (8'hb2));
      if (wire107[(4'hb):(3'h5)])
        begin
          reg120 <= ((~^$signed(reg119[(3'h4):(3'h4)])) ?
              reg117 : reg112[(2'h3):(2'h2)]);
        end
      else
        begin
          reg120 <= reg116[(4'hc):(4'hc)];
        end
      reg121 <= reg115;
    end
  assign wire122 = wire110[(2'h2):(1'h0)];
  assign wire123 = (!reg112);
  always
    @(posedge clk) begin
      if (wire122)
        begin
          if (wire122[(1'h1):(1'h1)])
            begin
              reg124 <= (^$unsigned({{(reg117 ? wire122 : reg118)}}));
              reg125 <= ((wire123[(5'h11):(3'h4)] ?
                      $unsigned($signed((wire108 ?
                          wire110 : reg119))) : (!$signed((reg116 ?
                          reg114 : reg114)))) ?
                  reg116 : wire122[(2'h2):(1'h0)]);
            end
          else
            begin
              reg124 <= {((wire123 ?
                          $unsigned((~(8'hb9))) : ((reg118 ?
                              reg118 : reg124) == $signed(reg124))) ?
                      (((reg125 ?
                          wire123 : reg121) >= (wire109 >> reg120)) <<< ($signed(wire109) <= {reg121})) : wire122[(1'h1):(1'h0)])};
              reg125 <= ((({$signed((8'hbd))} ?
                      ({wire110, (8'ha7)} ?
                          $unsigned(wire110) : reg124) : reg124[(1'h1):(1'h0)]) ^ (!wire108)) ?
                  reg120 : $signed($signed(wire123[(4'ha):(3'h6)])));
              reg126 <= (~|((($signed(wire108) ^ wire107[(4'hd):(4'h9)]) ~^ $unsigned((^~wire107))) ?
                  $signed($unsigned((-reg111))) : (!wire108[(1'h1):(1'h0)])));
              reg127 <= $signed($unsigned(reg111[(4'h8):(3'h6)]));
              reg128 <= reg116;
            end
          reg129 <= {wire108};
          reg130 <= (~reg124);
          reg131 <= ((8'hb4) >> reg114);
          reg132 <= {(8'hb7)};
        end
      else
        begin
          reg124 <= $signed(reg117[(2'h2):(1'h1)]);
          reg125 <= $unsigned($signed(((reg130 ? (+wire123) : (-wire108)) ?
              ((~reg130) ?
                  $unsigned((7'h42)) : $signed((8'hb1))) : $unsigned(wire122[(2'h2):(1'h1)]))));
          if (((($signed($signed(wire122)) ? reg127 : (!(^~wire123))) ?
              (reg111[(3'h4):(3'h4)] ?
                  ($signed((8'haf)) == reg131[(4'h8):(3'h4)]) : $signed($unsigned(reg112))) : (reg119 ?
                  (~^$signed(wire108)) : (^~(~^reg115)))) == $signed(reg117)))
            begin
              reg126 <= reg113[(3'h4):(3'h4)];
              reg127 <= {reg111[(4'ha):(4'h8)],
                  (~^($signed($unsigned(reg127)) ?
                      (^reg113[(2'h3):(1'h1)]) : (8'hbd)))};
            end
          else
            begin
              reg126 <= ((&$unsigned(($signed(reg117) <<< reg117))) ?
                  {$unsigned(((reg114 ? reg114 : reg128) ?
                          $signed((8'ha8)) : reg117))} : ($unsigned($unsigned($signed(reg130))) >= $signed(wire109)));
            end
          reg128 <= (!((~|(!$unsigned(wire109))) ? reg111 : reg129));
        end
      reg133 <= (^~reg111[(3'h4):(3'h4)]);
      reg134 <= (|($unsigned((wire109[(2'h2):(1'h1)] ?
          (reg119 != (8'ha8)) : $signed(reg116))) || reg133));
      reg135 <= ((($unsigned(reg124) || (~^(!reg120))) ?
              reg133 : ($unsigned((reg124 ?
                  wire122 : reg113)) || reg121[(2'h2):(2'h2)])) ?
          $signed((~reg132[(1'h1):(1'h1)])) : ($signed($unsigned(reg119[(3'h4):(2'h3)])) >> ((reg134[(1'h0):(1'h0)] >= $unsigned(wire110)) ?
              $unsigned($signed(reg118)) : (^(reg112 > reg116)))));
      reg136 <= reg117;
    end
  assign wire137 = reg114[(1'h1):(1'h1)];
  assign wire138 = (~|($signed((&wire109[(1'h0):(1'h0)])) ?
                       $signed(((reg131 ?
                           reg115 : reg134) & (-reg132))) : $signed(reg121[(3'h4):(2'h2)])));
  assign wire139 = ((reg117[(4'h8):(4'h8)] < (({reg130} ?
                           $signed(reg134) : $signed((8'hb1))) ?
                       reg117[(1'h0):(1'h0)] : reg124)) != (reg125 ?
                       $unsigned(reg114) : $unsigned($signed(((8'haa) ?
                           (8'hae) : reg119)))));
  always
    @(posedge clk) begin
      if (({reg136[(3'h7):(3'h4)]} ?
          (wire138[(3'h6):(3'h5)] >= (&(^reg132[(2'h2):(1'h0)]))) : ({$signed((reg117 ?
                  reg129 : reg132))} * (8'hbd))))
        begin
          reg140 <= ((8'ha2) * (~^wire137[(2'h3):(1'h0)]));
        end
      else
        begin
          reg140 <= ((~&(((!(8'had)) && (reg115 ? reg136 : wire110)) ?
                  $signed(wire123[(5'h10):(2'h3)]) : reg114[(1'h1):(1'h0)])) ?
              (reg121 || ($unsigned(((8'hbd) <= reg121)) <<< $unsigned(wire107[(4'hb):(4'h8)]))) : reg116);
        end
      reg141 <= {(~&wire108), $unsigned({((7'h40) << (wire137 >>> reg120))})};
      reg142 <= $unsigned(({$unsigned({reg114})} ?
          $signed(($signed(reg129) ?
              reg140[(1'h1):(1'h0)] : (reg124 <= reg140))) : (reg134[(1'h1):(1'h1)] | {reg134[(1'h0):(1'h0)]})));
      reg143 <= (((~(^~(&wire108))) ?
          reg129 : $unsigned(reg120[(2'h2):(1'h0)])) - $unsigned((8'haf)));
      reg144 <= $signed((|$signed($unsigned((reg142 ~^ reg142)))));
    end
  assign wire145 = ((!reg130) ?
                       $unsigned($signed($signed((reg140 + reg116)))) : $unsigned(((8'hbc) || (8'ha0))));
  assign wire146 = wire137[(2'h3):(2'h3)];
  assign wire147 = ((8'ha6) ?
                       (~(wire108 ^~ $signed($signed(wire138)))) : reg136[(2'h2):(1'h0)]);
  assign wire148 = reg135;
endmodule

module module44
#(parameter param103 = ((|((!((8'ha3) ? (7'h42) : (8'ha9))) << {((8'hbd) & (8'h9f))})) ? (((((8'ha1) >= (8'ha8)) ? (+(8'hbb)) : ((8'had) ? (8'hb5) : (8'hbd))) ? {{(8'haa)}, ((8'ha4) & (7'h43))} : {(~(8'hb4)), {(8'ha0)}}) ? ((((8'hbe) ? (8'hab) : (7'h42)) >>> (^(8'h9d))) ? (((8'h9d) ? (8'ha3) : (8'hb8)) >> (7'h41)) : (~(~(8'hb7)))) : {(+{(8'ha7)})}) : ((~((-(8'hbf)) > ((7'h42) ? (8'ha3) : (8'hba)))) && (((^~(8'hbd)) ? ((8'hb6) <<< (8'hb0)) : ((8'hbd) ? (8'haf) : (8'hab))) ? (!((8'h9f) ? (8'h9d) : (8'hbe))) : (!{(8'hba)})))))
(y, clk, wire49, wire48, wire47, wire46, wire45);
  output wire [(32'h23f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h8):(1'h0)] wire49;
  input wire [(4'ha):(1'h0)] wire48;
  input wire [(5'h12):(1'h0)] wire47;
  input wire [(4'hb):(1'h0)] wire46;
  input wire signed [(3'h7):(1'h0)] wire45;
  wire signed [(4'hf):(1'h0)] wire95;
  wire signed [(4'hb):(1'h0)] wire92;
  wire [(4'he):(1'h0)] wire91;
  wire [(4'hb):(1'h0)] wire90;
  wire [(4'hf):(1'h0)] wire86;
  wire signed [(4'hc):(1'h0)] wire85;
  wire signed [(4'h8):(1'h0)] wire84;
  wire signed [(4'h9):(1'h0)] wire71;
  wire [(2'h2):(1'h0)] wire70;
  wire signed [(3'h6):(1'h0)] wire69;
  wire signed [(2'h2):(1'h0)] wire68;
  wire [(2'h2):(1'h0)] wire50;
  reg signed [(2'h3):(1'h0)] reg102 = (1'h0);
  reg [(4'ha):(1'h0)] reg101 = (1'h0);
  reg [(2'h2):(1'h0)] reg100 = (1'h0);
  reg [(2'h3):(1'h0)] reg99 = (1'h0);
  reg [(3'h6):(1'h0)] reg98 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg97 = (1'h0);
  reg [(5'h10):(1'h0)] reg96 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg94 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg93 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg89 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg88 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg87 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg83 = (1'h0);
  reg [(5'h15):(1'h0)] reg82 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg81 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg79 = (1'h0);
  reg [(5'h12):(1'h0)] reg78 = (1'h0);
  reg [(4'hd):(1'h0)] reg77 = (1'h0);
  reg [(5'h10):(1'h0)] reg76 = (1'h0);
  reg [(4'hb):(1'h0)] reg75 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg74 = (1'h0);
  reg [(2'h2):(1'h0)] reg73 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg65 = (1'h0);
  reg [(5'h14):(1'h0)] reg64 = (1'h0);
  reg [(4'hb):(1'h0)] reg63 = (1'h0);
  reg [(5'h13):(1'h0)] reg62 = (1'h0);
  reg [(5'h15):(1'h0)] reg61 = (1'h0);
  reg [(5'h13):(1'h0)] reg60 = (1'h0);
  reg [(2'h3):(1'h0)] reg59 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg58 = (1'h0);
  reg [(2'h3):(1'h0)] reg57 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(3'h5):(1'h0)] reg53 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg52 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg51 = (1'h0);
  assign y = {wire95,
                 wire92,
                 wire91,
                 wire90,
                 wire86,
                 wire85,
                 wire84,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire50,
                 reg102,
                 reg101,
                 reg100,
                 reg99,
                 reg98,
                 reg97,
                 reg96,
                 reg94,
                 reg93,
                 reg89,
                 reg88,
                 reg87,
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
                 reg53,
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire50 = wire46[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg51 <= wire46[(3'h6):(1'h1)];
      if ((!{wire50[(1'h0):(1'h0)]}))
        begin
          if ($signed($signed(({wire45,
              (wire46 ? reg51 : wire48)} <= {$unsigned(wire48),
              (wire50 | reg51)}))))
            begin
              reg52 <= wire50;
              reg53 <= (~^$signed($signed($signed((!wire47)))));
            end
          else
            begin
              reg52 <= wire48[(4'ha):(1'h1)];
              reg53 <= (($unsigned((^(~^wire50))) ?
                      (({wire49} * reg52) ?
                          wire47[(3'h7):(2'h2)] : {wire45}) : ((&reg52[(3'h7):(3'h5)]) || reg52)) ?
                  (~&wire45) : (({$signed(wire46)} ?
                      wire46[(4'h9):(4'h9)] : $unsigned(wire50[(1'h1):(1'h1)])) & (reg53[(3'h4):(2'h2)] >> (&wire49[(1'h1):(1'h0)]))));
              reg54 <= (~($signed($unsigned((8'hbf))) ?
                  wire47 : ((!(&wire49)) ?
                      {(&wire46),
                          (!reg53)} : (reg53[(1'h0):(1'h0)] << (~^wire48)))));
              reg55 <= wire50;
              reg56 <= ((8'hb8) ?
                  ((+(&wire45[(3'h6):(2'h3)])) ^ $unsigned(reg54)) : ($unsigned((wire50[(2'h2):(1'h1)] ?
                          (|wire45) : wire47)) ?
                      $signed((wire45[(1'h1):(1'h1)] <<< (reg52 >> reg51))) : $unsigned((reg53[(2'h3):(2'h3)] && (reg54 ?
                          wire46 : reg52)))));
            end
        end
      else
        begin
          reg52 <= ($unsigned(reg56) & reg51[(3'h4):(3'h4)]);
          reg53 <= ({(&$unsigned((reg52 ? (8'h9c) : (8'haf)))),
                  (reg55 > ((reg53 & (8'haa)) ?
                      (reg56 ? (8'ha7) : wire48) : (reg53 + reg52)))} ?
              (|$signed(wire46)) : $unsigned($signed(reg55)));
        end
      reg57 <= wire50[(1'h0):(1'h0)];
      reg58 <= (~($signed(wire46) << {$unsigned($signed(wire49)),
          (^~(reg53 ^~ (8'ha8)))}));
      if ({wire45[(1'h1):(1'h0)]})
        begin
          reg59 <= $signed({($unsigned((reg58 ? wire50 : reg54)) ?
                  (^$unsigned(wire45)) : reg58),
              (^((&reg52) - (~reg55)))});
          reg60 <= (reg58 << ((reg57 ?
              reg54 : $unsigned((&reg55))) >= $signed(wire49[(3'h6):(1'h0)])));
          reg61 <= {reg52};
          reg62 <= ($unsigned($signed(((reg52 ^ reg55) << $signed((8'hab))))) >> wire45[(3'h4):(1'h0)]);
        end
      else
        begin
          reg59 <= wire47[(4'h8):(2'h2)];
          reg60 <= (^{reg56[(1'h1):(1'h0)], $unsigned($unsigned((~&wire46)))});
          if ((8'hb3))
            begin
              reg61 <= ((wire47 ?
                      $signed(((reg51 && reg62) ?
                          $unsigned(reg57) : reg52[(3'h6):(1'h1)])) : (reg52 > reg54[(4'hb):(1'h0)])) ?
                  ((^(~&reg58[(2'h3):(1'h0)])) ?
                      $unsigned($signed(wire49)) : ({(reg61 << reg62)} ?
                          ({reg61} + (reg53 ?
                              reg61 : wire47)) : (8'haa))) : {$signed((((8'hb8) << reg59) ?
                          (~|wire45) : reg55[(3'h7):(2'h2)]))});
              reg62 <= ($unsigned(reg58) ^ $unsigned($signed((+$signed(reg54)))));
              reg63 <= wire50;
              reg64 <= $unsigned(reg55[(4'hd):(3'h6)]);
              reg65 <= $signed(({reg57} ?
                  ((+(reg55 ? reg59 : wire49)) ?
                      {$unsigned(reg52),
                          $signed(reg52)} : reg62) : (^~{(wire47 < reg58)})));
            end
          else
            begin
              reg61 <= reg64;
              reg62 <= (!reg57);
              reg63 <= {$signed($unsigned({((8'hb5) ? wire50 : wire50),
                      (~^reg63)}))};
            end
          reg66 <= reg52;
          reg67 <= (8'hb4);
        end
    end
  assign wire68 = ($unsigned((($signed(wire45) ?
                      (reg51 <<< wire49) : $unsigned(reg55)) ^~ reg64[(3'h5):(2'h2)])) < $signed((~|(8'hba))));
  assign wire69 = $signed($unsigned((8'h9e)));
  assign wire70 = $signed({$signed((&$unsigned(wire46)))});
  assign wire71 = wire45[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg72 <= $signed({(&(8'hb5))});
      reg73 <= (^$signed(((^~wire46[(4'h9):(1'h0)]) & ((reg62 ?
          wire45 : wire45) < wire48))));
      if ($unsigned($signed(($unsigned((&reg72)) ^~ (wire70[(2'h2):(1'h1)] << (reg67 & reg52))))))
        begin
          reg74 <= $unsigned({$signed($unsigned(wire50)),
              (reg56 ? (|reg58[(2'h2):(1'h1)]) : $unsigned($signed((8'hab))))});
          reg75 <= wire48;
          if ($unsigned(($signed((!(reg60 ? (7'h44) : wire71))) - reg57)))
            begin
              reg76 <= (reg59 ?
                  (~^(reg53[(1'h1):(1'h0)] ?
                      reg54[(4'hd):(1'h1)] : (reg62 ?
                          $signed(reg73) : (reg74 <= reg58)))) : ($signed((~(reg74 ?
                          reg60 : reg57))) ?
                      (wire68[(2'h2):(2'h2)] - (8'had)) : (reg52[(3'h7):(3'h4)] ?
                          reg55[(3'h7):(2'h2)] : wire49[(1'h1):(1'h1)])));
              reg77 <= reg62;
              reg78 <= ($unsigned(wire71) ?
                  $signed($unsigned(reg75)) : reg53[(2'h2):(1'h1)]);
            end
          else
            begin
              reg76 <= $signed(reg74[(4'hb):(4'ha)]);
              reg77 <= reg53;
              reg78 <= wire71[(3'h5):(2'h2)];
              reg79 <= $signed((($unsigned((^~reg60)) ?
                  (8'hb4) : $unsigned((reg57 >> (8'hba)))) >= $signed((((8'h9c) ?
                      reg54 : (8'haf)) ?
                  wire50 : (~&reg59)))));
            end
        end
      else
        begin
          reg74 <= $unsigned(reg54[(3'h5):(2'h2)]);
          reg75 <= $unsigned(((((reg54 < (8'h9d)) || reg63) ?
              ($signed(wire68) ?
                  reg67[(4'hc):(1'h1)] : (wire71 ?
                      wire46 : reg73)) : reg77) == reg73[(1'h0):(1'h0)]));
        end
      if ($unsigned(reg57[(1'h0):(1'h0)]))
        begin
          reg80 <= reg65[(2'h2):(1'h0)];
        end
      else
        begin
          reg80 <= (^~wire69[(2'h2):(1'h1)]);
          if (($unsigned($unsigned((reg78[(2'h2):(1'h0)] + (wire70 ?
              (8'ha0) : (8'hb1))))) >= $signed(reg78[(4'hb):(3'h5)])))
            begin
              reg81 <= ($unsigned(wire47[(4'ha):(3'h7)]) ^ $unsigned((~|(+(reg63 ?
                  reg58 : wire48)))));
            end
          else
            begin
              reg81 <= {($signed(((7'h41) ?
                      (7'h44) : (+reg72))) * $unsigned(({reg72} ?
                      {reg64, reg73} : (reg54 ^ reg51))))};
              reg82 <= $signed((&reg60[(3'h7):(1'h1)]));
              reg83 <= (8'ha9);
            end
        end
    end
  assign wire84 = wire68;
  assign wire85 = (reg57[(1'h1):(1'h0)] ?
                      $signed($unsigned(reg75[(4'ha):(1'h1)])) : $unsigned($signed((reg82[(3'h6):(3'h6)] ?
                          (~|reg55) : (~|(8'had))))));
  assign wire86 = reg63[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg87 <= $unsigned(($signed(($signed(reg58) & (wire68 ?
          reg52 : reg56))) <= reg66));
    end
  always
    @(posedge clk) begin
      reg88 <= $unsigned($unsigned($signed((wire50 <= $signed(reg79)))));
      reg89 <= (8'ha7);
    end
  assign wire90 = {($signed($signed((^(8'ha5)))) ?
                          $signed((reg82[(5'h15):(1'h1)] & {reg52,
                              wire45})) : reg66)};
  assign wire91 = $unsigned((8'ha0));
  assign wire92 = (8'ha1);
  always
    @(posedge clk) begin
      reg93 <= (^reg60);
      reg94 <= $unsigned(({((reg89 > (8'hb0)) >= (reg57 | wire84)),
              $signed((reg67 ? reg60 : reg60))} ?
          (+((8'hb3) << ((8'haa) ?
              wire92 : reg59))) : ($unsigned($signed(reg79)) ?
              reg77[(2'h2):(1'h1)] : $unsigned($signed(reg73)))));
    end
  assign wire95 = wire91;
  always
    @(posedge clk) begin
      reg96 <= $unsigned($unsigned({reg88[(2'h3):(2'h3)]}));
      reg97 <= (^~(8'haf));
      reg98 <= reg65[(3'h6):(3'h5)];
      if ($signed((({$unsigned(reg80)} & (reg59 * $signed((8'haa)))) ?
          (((reg73 >> wire68) >= {wire50}) ?
              (^{wire70, reg81}) : reg79) : reg98[(3'h6):(2'h3)])))
        begin
          if ($signed((wire49 ? reg53 : reg80)))
            begin
              reg99 <= (reg78[(4'hb):(4'hb)] ?
                  (&reg57) : ((reg79 << (reg80[(3'h5):(2'h2)] ?
                      {reg80} : (reg51 < (8'hb6)))) < $unsigned(($signed(wire91) ?
                      $unsigned(reg60) : reg64))));
              reg100 <= $unsigned((|(~&reg63[(3'h7):(1'h1)])));
              reg101 <= (~&$signed((+(reg65 ?
                  $signed(wire48) : {reg52, wire47}))));
            end
          else
            begin
              reg99 <= (&((~|$unsigned((reg83 ? (7'h40) : reg56))) ?
                  (({reg87} ~^ reg89) ?
                      reg100[(2'h2):(1'h1)] : ($unsigned(wire46) ?
                          (^reg97) : reg59[(2'h2):(2'h2)])) : {((reg72 >= (8'hab)) ?
                          wire48 : $unsigned(wire71))}));
              reg100 <= reg83;
              reg101 <= reg96;
              reg102 <= wire90[(2'h3):(2'h2)];
            end
        end
      else
        begin
          reg99 <= ({reg79[(3'h5):(2'h2)]} ?
              reg74 : (~^(^~(reg96 ? reg54[(3'h6):(3'h4)] : $signed(reg98)))));
          reg100 <= reg51[(2'h3):(2'h2)];
          reg101 <= (-$signed(wire48[(4'ha):(4'h9)]));
        end
    end
endmodule

module module19  (y, clk, wire23, wire22, wire21, wire20);
  output wire [(32'h9f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire23;
  input wire [(3'h6):(1'h0)] wire22;
  input wire [(5'h13):(1'h0)] wire21;
  input wire signed [(5'h14):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire38;
  wire [(4'hf):(1'h0)] wire37;
  wire [(4'he):(1'h0)] wire36;
  wire signed [(3'h5):(1'h0)] wire35;
  wire [(4'hf):(1'h0)] wire34;
  wire signed [(2'h2):(1'h0)] wire33;
  wire signed [(5'h11):(1'h0)] wire32;
  wire [(3'h7):(1'h0)] wire31;
  wire signed [(3'h6):(1'h0)] wire30;
  wire [(4'he):(1'h0)] wire29;
  wire [(4'hd):(1'h0)] wire28;
  wire [(5'h12):(1'h0)] wire26;
  wire signed [(4'hf):(1'h0)] wire25;
  wire [(2'h3):(1'h0)] wire24;
  reg [(3'h5):(1'h0)] reg27 = (1'h0);
  assign y = {wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire26,
                 wire25,
                 wire24,
                 reg27,
                 (1'h0)};
  assign wire24 = wire21[(3'h4):(1'h1)];
  assign wire25 = {wire21[(4'hb):(4'hb)]};
  assign wire26 = $signed((~&{$signed((8'hbe))}));
  always
    @(posedge clk) begin
      reg27 <= wire26;
    end
  assign wire28 = $unsigned((wire24 >= wire20));
  assign wire29 = {reg27,
                      ($signed({(wire22 ?
                              wire28 : wire22)}) > ($signed((wire21 || (8'hab))) * $signed($signed(reg27))))};
  assign wire30 = wire23[(3'h7):(1'h1)];
  assign wire31 = (8'hb9);
  assign wire32 = ({(^~{(wire22 ? wire31 : wire29), wire26}),
                          (($unsigned((7'h43)) ? (8'hb7) : $signed(wire20)) ?
                              ((wire20 >> wire22) != $signed(wire20)) : (^~$unsigned(wire21)))} ?
                      wire20[(4'hf):(2'h3)] : ((^(~|(~^wire24))) ?
                          {(|$signed(wire25))} : (-{$signed(reg27)})));
  assign wire33 = (wire30[(3'h5):(2'h2)] ?
                      (wire28[(4'h9):(2'h3)] >= $unsigned($signed(wire30[(2'h3):(2'h3)]))) : (wire29[(3'h7):(2'h2)] && ($unsigned({wire20,
                          wire22}) ~^ $unsigned((&reg27)))));
  assign wire34 = (+wire24);
  assign wire35 = ({(~|wire28)} >= $unsigned($signed((wire33[(2'h2):(2'h2)] ^ {(8'ha3),
                      (8'ha0)}))));
  assign wire36 = $signed($unsigned(($signed($signed(wire21)) ?
                      (8'hba) : $unsigned((^~wire25)))));
  assign wire37 = {$signed($unsigned({(~^wire28), $signed(wire30)})),
                      ($signed($unsigned((wire36 ? wire31 : wire32))) ?
                          (wire24 ?
                              $unsigned((8'ha0)) : wire28[(4'ha):(1'h0)]) : {wire36[(4'hc):(2'h3)],
                              {$signed(wire26), (wire21 >> (8'hb9))}})};
  assign wire38 = $signed(($unsigned((!$unsigned(wire25))) & (($unsigned(reg27) ?
                          reg27 : $unsigned(wire33)) ?
                      ($unsigned(wire25) ?
                          {wire20} : $signed(reg27)) : (^(wire22 ?
                          wire32 : wire33)))));
endmodule
