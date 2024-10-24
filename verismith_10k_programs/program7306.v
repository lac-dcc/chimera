module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'hcd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hf):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(4'ha):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire222;
  wire [(4'he):(1'h0)] wire5;
  wire signed [(5'h12):(1'h0)] wire220;
  wire [(4'h8):(1'h0)] wire224;
  wire [(4'hc):(1'h0)] wire225;
  wire signed [(5'h11):(1'h0)] wire235;
  wire [(4'hb):(1'h0)] wire236;
  reg signed [(5'h10):(1'h0)] reg234 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg233 = (1'h0);
  reg [(4'h9):(1'h0)] reg232 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg231 = (1'h0);
  reg [(5'h14):(1'h0)] reg230 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg229 = (1'h0);
  reg [(2'h3):(1'h0)] reg228 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg227 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg226 = (1'h0);
  assign y = {wire222,
                 wire5,
                 wire220,
                 wire224,
                 wire225,
                 wire235,
                 wire236,
                 reg234,
                 reg233,
                 reg232,
                 reg231,
                 reg230,
                 reg229,
                 reg228,
                 reg227,
                 reg226,
                 (1'h0)};
  assign wire5 = ((~wire0[(3'h5):(2'h3)]) & $unsigned((~|$signed(wire1[(1'h1):(1'h1)]))));
  module6 #() modinst221 (.clk(clk), .wire9(wire3), .y(wire220), .wire11(wire2), .wire10(wire5), .wire7(wire0), .wire8(wire4));
  module30 #() modinst223 (.y(wire222), .clk(clk), .wire35(wire1), .wire33(wire2), .wire32(wire4), .wire31(wire0), .wire34(wire220));
  assign wire224 = (^~$unsigned($unsigned($unsigned({wire2, wire2}))));
  assign wire225 = $signed((wire1 && wire5[(2'h3):(1'h0)]));
  always
    @(posedge clk) begin
      reg226 <= (&{wire0, $signed($signed((^~wire5)))});
      if ($signed((($unsigned($unsigned(wire5)) ?
          (~^$unsigned(wire0)) : (~|((8'hb2) ?
              wire2 : wire224))) > $unsigned($signed((|(8'ha2)))))))
        begin
          reg227 <= wire0;
        end
      else
        begin
          reg227 <= {wire2, wire224[(2'h2):(1'h0)]};
          reg228 <= (wire220 <<< $signed(wire3));
          reg229 <= wire0[(3'h5):(1'h0)];
          if ((-(wire220 ?
              (|$signed($unsigned(reg226))) : wire222[(4'he):(4'ha)])))
            begin
              reg230 <= (((-(|$unsigned(wire3))) >>> wire224) ?
                  (wire5 & $signed(((^wire2) ~^ (reg228 * wire225)))) : (~|(reg229[(1'h0):(1'h0)] < $unsigned(((8'ha1) && wire2)))));
              reg231 <= ($signed(reg230[(3'h5):(3'h5)]) & reg228);
              reg232 <= (~&(~(~{$unsigned((8'hb6)),
                  ((8'hb7) ? wire1 : wire2)})));
              reg233 <= $signed($signed($signed(($signed((8'ha0)) ?
                  (^~wire224) : reg229))));
            end
          else
            begin
              reg230 <= wire1;
            end
          reg234 <= (8'h9e);
        end
    end
  assign wire235 = ($unsigned(($unsigned((^(8'hb7))) & wire224[(1'h0):(1'h0)])) ?
                       $unsigned((($signed(reg231) ^~ {(8'h9e)}) ?
                           (8'hbd) : (~&wire220[(4'hb):(3'h7)]))) : $signed(reg227[(2'h3):(1'h1)]));
  module152 #() modinst237 (.wire156(reg226), .wire155(reg233), .wire157(reg230), .clk(clk), .wire153(reg229), .y(wire236), .wire154(wire3));
endmodule

module module6  (y, clk, wire11, wire10, wire9, wire8, wire7);
  output wire [(32'h1de):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'h9):(1'h0)] wire11;
  input wire [(4'he):(1'h0)] wire10;
  input wire [(5'h13):(1'h0)] wire9;
  input wire signed [(4'ha):(1'h0)] wire8;
  input wire signed [(5'h12):(1'h0)] wire7;
  wire signed [(4'hc):(1'h0)] wire218;
  wire signed [(5'h13):(1'h0)] wire151;
  wire [(3'h4):(1'h0)] wire140;
  wire signed [(4'hd):(1'h0)] wire139;
  wire signed [(5'h11):(1'h0)] wire119;
  wire signed [(4'hb):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire16;
  wire [(4'h8):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(2'h3):(1'h0)] wire13;
  wire [(4'hb):(1'h0)] wire12;
  wire [(4'hc):(1'h0)] wire59;
  wire [(5'h14):(1'h0)] wire85;
  wire signed [(3'h4):(1'h0)] wire121;
  wire [(5'h13):(1'h0)] wire137;
  reg [(3'h6):(1'h0)] reg29 = (1'h0);
  reg [(5'h15):(1'h0)] reg28 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg [(5'h10):(1'h0)] reg22 = (1'h0);
  reg [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg19 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg18 = (1'h0);
  reg [(5'h13):(1'h0)] reg17 = (1'h0);
  reg [(5'h15):(1'h0)] reg141 = (1'h0);
  reg [(3'h6):(1'h0)] reg142 = (1'h0);
  reg [(3'h4):(1'h0)] reg143 = (1'h0);
  reg [(3'h4):(1'h0)] reg144 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg145 = (1'h0);
  reg [(5'h12):(1'h0)] reg146 = (1'h0);
  reg signed [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg148 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg149 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg150 = (1'h0);
  assign y = {wire218,
                 wire151,
                 wire140,
                 wire139,
                 wire119,
                 wire57,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire59,
                 wire85,
                 wire121,
                 wire137,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg141,
                 reg142,
                 reg143,
                 reg144,
                 reg145,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 (1'h0)};
  assign wire12 = {(($signed({wire9, wire8}) * (^~(wire10 ?
                          wire8 : (8'ha2)))) >>> wire10[(1'h0):(1'h0)])};
  assign wire13 = $unsigned((|(-$signed((8'hb3)))));
  assign wire14 = (~|({wire8[(2'h3):(1'h0)]} >> wire13[(1'h0):(1'h0)]));
  assign wire15 = (wire9[(3'h6):(1'h0)] <= ((((~|wire13) ?
                              $signed(wire13) : (wire13 != wire14)) ?
                          {$signed(wire11), (wire8 || wire10)} : wire11) ?
                      $unsigned($unsigned($signed(wire10))) : wire7[(1'h0):(1'h0)]));
  assign wire16 = $signed(wire15[(3'h6):(3'h6)]);
  always
    @(posedge clk) begin
      if (wire13[(2'h2):(2'h2)])
        begin
          reg17 <= ({$unsigned($signed($signed(wire15))),
                  $unsigned($unsigned((~|wire10)))} ?
              (~^((8'hae) > wire8)) : $unsigned(wire10[(3'h7):(3'h5)]));
          if ({(wire16[(2'h2):(1'h1)] + (~&(reg17[(5'h12):(1'h1)] ?
                  wire9 : (wire15 ? wire16 : (8'hb2)))))})
            begin
              reg18 <= $signed((~$signed(wire15[(3'h5):(3'h4)])));
              reg19 <= $unsigned(wire16);
            end
          else
            begin
              reg18 <= wire10;
              reg19 <= {wire10};
              reg20 <= wire15;
              reg21 <= wire15[(1'h0):(1'h0)];
              reg22 <= wire7;
            end
          reg23 <= {(+($signed(reg20[(1'h1):(1'h0)]) <<< {(reg22 ?
                      reg21 : reg22),
                  (reg21 ? reg17 : reg21)}))};
        end
      else
        begin
          if ((8'ha1))
            begin
              reg17 <= ($signed(({(wire15 - wire8)} ?
                  $signed(reg23) : reg20)) <= (((((8'hb6) >= wire16) * {wire12,
                      reg20}) ?
                  ($signed(reg19) ?
                      (~(8'ha3)) : $signed((8'ha5))) : $signed((~&wire12))) != (~^wire9[(3'h5):(1'h0)])));
              reg18 <= {($unsigned((+reg21)) ?
                      (8'haf) : ($signed((8'ha5)) ?
                          $signed($signed(wire16)) : $signed({reg19}))),
                  $unsigned((($unsigned(wire10) ?
                      ((8'hb2) ?
                          reg17 : wire9) : (~wire11)) ^ ($unsigned(wire16) ^~ reg22)))};
              reg19 <= $unsigned($signed({(~(8'hb6))}));
            end
          else
            begin
              reg17 <= {$unsigned($unsigned($signed((wire16 ?
                      wire8 : reg21))))};
              reg18 <= {(wire9 ^~ ($signed((~^wire14)) ?
                      ($signed(wire9) == $signed(wire12)) : $unsigned(reg23[(3'h6):(2'h2)])))};
              reg19 <= (($signed((~reg20)) && $signed(($signed((8'hba)) <<< $signed(wire15)))) ?
                  $signed((~&(-(wire8 ? reg18 : wire12)))) : (({(~reg23),
                      $signed(wire8)} < $signed($signed(wire9))) == (reg17[(3'h7):(2'h2)] ~^ reg19)));
            end
          if (((^wire9[(2'h2):(2'h2)]) || $unsigned((8'ha5))))
            begin
              reg20 <= ($unsigned($signed((((8'ha5) ? wire16 : wire12) ?
                  wire14[(3'h5):(1'h0)] : {(8'h9f),
                      wire12}))) | $unsigned({((wire11 == reg18) && (wire16 ?
                      (8'haa) : wire12))}));
              reg21 <= $unsigned({$unsigned(reg21), reg23});
            end
          else
            begin
              reg20 <= reg20[(3'h4):(2'h3)];
              reg21 <= {$unsigned({(~&{(8'haf)})}),
                  $signed($unsigned($signed(wire16[(4'he):(2'h3)])))};
              reg22 <= {{$signed(reg17[(1'h1):(1'h1)]),
                      $signed($unsigned((wire7 ? wire13 : wire7)))}};
              reg23 <= $unsigned(((($signed(wire10) ?
                      wire13 : (reg23 ?
                          reg21 : reg19)) ^~ wire15[(3'h4):(3'h4)]) ?
                  ((~(wire8 >> (8'ha2))) >>> reg19[(4'hb):(3'h6)]) : $unsigned((reg20 ?
                      {(8'hbe)} : {reg23, wire8}))));
            end
          reg24 <= reg22[(2'h3):(1'h1)];
          if ({(|$signed($unsigned({wire11}))), wire14})
            begin
              reg25 <= reg24;
              reg26 <= wire15;
              reg27 <= $unsigned(($unsigned((|$signed(wire14))) ^~ $signed(wire15[(2'h3):(1'h0)])));
              reg28 <= reg22;
            end
          else
            begin
              reg25 <= reg19[(3'h4):(1'h1)];
              reg26 <= reg28;
              reg27 <= $signed(wire12);
            end
          reg29 <= (((reg22[(3'h5):(2'h3)] == (reg26 ^ $unsigned(wire11))) ~^ $signed($unsigned(reg19))) || wire11);
        end
    end
  module30 #() modinst58 (wire57, clk, reg19, reg26, wire16, wire8, wire14);
  assign wire59 = $signed($unsigned((-wire16)));
  module60 #() modinst86 (.clk(clk), .wire63(wire9), .wire61(wire59), .wire64(reg20), .wire62(wire10), .y(wire85));
  module87 #() modinst120 (wire119, clk, reg24, reg28, reg17, wire57);
  assign wire121 = reg26[(3'h7):(1'h1)];
  module122 #() modinst138 (.wire125(wire57), .wire123(wire10), .clk(clk), .y(wire137), .wire126(wire16), .wire124(reg22));
  assign wire139 = wire10;
  assign wire140 = {$unsigned($unsigned($signed(wire14))), wire57};
  always
    @(posedge clk) begin
      if ($unsigned((wire137 ? wire85 : wire139)))
        begin
          reg141 <= $signed($signed(reg19[(4'ha):(2'h2)]));
          reg142 <= ((~($signed((wire13 ?
              reg29 : reg23)) < $unsigned($signed(reg27)))) >= wire12[(3'h7):(1'h0)]);
          reg143 <= (((-(-(wire10 ? wire85 : wire10))) ?
                  (reg24[(1'h0):(1'h0)] ?
                      reg28[(2'h2):(1'h0)] : $signed((wire121 <<< wire10))) : (-(+((8'hab) && wire121)))) ?
              reg24[(2'h2):(1'h0)] : (~|(reg142 <<< ((wire7 <<< wire59) << (~|reg22)))));
        end
      else
        begin
          reg141 <= {(~|$signed(reg22)),
              (wire85 ?
                  ((~(reg142 <<< reg28)) ?
                      $unsigned(reg27[(4'h9):(4'h8)]) : $signed((reg26 ?
                          reg18 : wire11))) : (reg142 ?
                      ($signed(wire12) ?
                          (reg143 ?
                              reg21 : wire9) : reg24[(3'h5):(3'h5)]) : reg22))};
          reg142 <= reg141;
          if ($unsigned((8'had)))
            begin
              reg143 <= $signed({{reg142[(2'h2):(1'h1)]}});
              reg144 <= reg142;
            end
          else
            begin
              reg143 <= wire9[(4'hb):(4'h9)];
              reg144 <= $unsigned(reg21);
              reg145 <= $signed((!((~reg24[(2'h3):(1'h1)]) + wire139[(3'h7):(1'h0)])));
              reg146 <= $unsigned((wire14 ?
                  reg145[(4'hb):(4'ha)] : (reg22[(3'h4):(2'h2)] * wire13)));
            end
        end
      if ($signed(($signed(wire85[(3'h6):(1'h1)]) ?
          reg21 : ({(8'had)} ? wire12 : wire137))))
        begin
          reg147 <= wire140;
        end
      else
        begin
          reg147 <= reg27;
          reg148 <= (^~wire57[(4'h8):(3'h4)]);
          reg149 <= ($unsigned($signed(reg21)) + (({(~&reg142)} ?
                  {{reg22, reg23}, {(8'hbd)}} : wire9) ?
              $signed(reg24) : wire137));
          reg150 <= $unsigned((~({wire137} ? reg149 : (wire57 | (8'hbb)))));
        end
    end
  assign wire151 = $unsigned(wire12[(3'h4):(1'h1)]);
  module152 #() modinst219 (.wire156(wire119), .wire155(reg21), .wire154(reg150), .wire153(wire137), .clk(clk), .wire157(reg148), .y(wire218));
endmodule

module module152  (y, clk, wire157, wire156, wire155, wire154, wire153);
  output wire [(32'h2d8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire157;
  input wire signed [(3'h7):(1'h0)] wire156;
  input wire [(5'h15):(1'h0)] wire155;
  input wire signed [(4'hc):(1'h0)] wire154;
  input wire [(5'h13):(1'h0)] wire153;
  wire signed [(4'ha):(1'h0)] wire217;
  wire [(5'h14):(1'h0)] wire216;
  wire [(4'he):(1'h0)] wire215;
  wire [(4'h9):(1'h0)] wire198;
  wire [(3'h5):(1'h0)] wire170;
  wire signed [(3'h5):(1'h0)] wire169;
  wire signed [(2'h2):(1'h0)] wire168;
  wire signed [(5'h10):(1'h0)] wire167;
  wire [(2'h3):(1'h0)] wire160;
  wire [(5'h10):(1'h0)] wire159;
  wire [(5'h15):(1'h0)] wire158;
  reg signed [(5'h10):(1'h0)] reg214 = (1'h0);
  reg [(4'h9):(1'h0)] reg213 = (1'h0);
  reg [(5'h15):(1'h0)] reg212 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg211 = (1'h0);
  reg [(4'h8):(1'h0)] reg210 = (1'h0);
  reg [(4'hf):(1'h0)] reg209 = (1'h0);
  reg [(5'h11):(1'h0)] reg208 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg207 = (1'h0);
  reg [(5'h15):(1'h0)] reg206 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg205 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg204 = (1'h0);
  reg [(3'h4):(1'h0)] reg203 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg202 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg201 = (1'h0);
  reg [(3'h7):(1'h0)] reg200 = (1'h0);
  reg [(5'h14):(1'h0)] reg199 = (1'h0);
  reg [(3'h7):(1'h0)] reg197 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg196 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg195 = (1'h0);
  reg [(4'hd):(1'h0)] reg194 = (1'h0);
  reg [(3'h6):(1'h0)] reg193 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg192 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg191 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg190 = (1'h0);
  reg [(4'h9):(1'h0)] reg189 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg188 = (1'h0);
  reg [(4'ha):(1'h0)] reg187 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg186 = (1'h0);
  reg [(4'ha):(1'h0)] reg185 = (1'h0);
  reg signed [(4'he):(1'h0)] reg184 = (1'h0);
  reg [(4'hb):(1'h0)] reg183 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg182 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg181 = (1'h0);
  reg [(5'h12):(1'h0)] reg180 = (1'h0);
  reg [(5'h11):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg178 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg177 = (1'h0);
  reg [(5'h15):(1'h0)] reg176 = (1'h0);
  reg [(4'h9):(1'h0)] reg175 = (1'h0);
  reg [(4'hd):(1'h0)] reg174 = (1'h0);
  reg [(3'h7):(1'h0)] reg173 = (1'h0);
  reg [(3'h7):(1'h0)] reg172 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg171 = (1'h0);
  reg [(3'h4):(1'h0)] reg166 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg165 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg164 = (1'h0);
  reg [(4'hb):(1'h0)] reg163 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg161 = (1'h0);
  assign y = {wire217,
                 wire216,
                 wire215,
                 wire198,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire160,
                 wire159,
                 wire158,
                 reg214,
                 reg213,
                 reg212,
                 reg211,
                 reg210,
                 reg209,
                 reg208,
                 reg207,
                 reg206,
                 reg205,
                 reg204,
                 reg203,
                 reg202,
                 reg201,
                 reg200,
                 reg199,
                 reg197,
                 reg196,
                 reg195,
                 reg194,
                 reg193,
                 reg192,
                 reg191,
                 reg190,
                 reg189,
                 reg188,
                 reg187,
                 reg186,
                 reg185,
                 reg184,
                 reg183,
                 reg182,
                 reg181,
                 reg180,
                 reg179,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
                 reg173,
                 reg172,
                 reg171,
                 reg166,
                 reg165,
                 reg164,
                 reg163,
                 reg162,
                 reg161,
                 (1'h0)};
  assign wire158 = wire155;
  assign wire159 = wire153[(5'h10):(4'hc)];
  assign wire160 = ((|wire153[(1'h0):(1'h0)]) ?
                       (8'h9e) : ((~|$signed(wire157[(4'h8):(2'h3)])) ?
                           {($signed(wire155) ?
                                   wire159 : $signed(wire155))} : ({(-wire158),
                               ((7'h40) ?
                                   wire159 : wire158)} <<< wire154[(3'h4):(2'h3)])));
  always
    @(posedge clk) begin
      reg161 <= {wire154};
      reg162 <= reg161[(4'hb):(2'h2)];
      reg163 <= ($unsigned((~(&$signed((7'h41))))) < ((wire154 ?
              wire159 : (&(wire159 ? (8'hb2) : wire158))) ?
          (wire155 ?
              ((reg161 ? (8'hb0) : wire156) ?
                  ((8'haf) ?
                      wire157 : reg161) : wire155) : (-((7'h44) >>> wire156))) : $unsigned(((wire154 <= (8'ha8)) ^ $signed(reg162)))));
    end
  always
    @(posedge clk) begin
      if ((~&$unsigned((-($unsigned(wire156) ?
          reg161[(4'hd):(3'h5)] : $unsigned(wire153))))))
        begin
          reg164 <= ((~|($signed((wire157 ? reg161 : reg162)) - {(wire158 ?
                  wire153 : (8'hba))})) || reg163[(2'h3):(2'h2)]);
          reg165 <= $unsigned($unsigned((wire157 | reg164)));
        end
      else
        begin
          reg164 <= $unsigned(({(wire159[(4'hd):(4'hc)] & $signed(reg163))} ?
              $signed((reg163 ~^ (wire158 ?
                  reg164 : (8'ha0)))) : reg165[(4'h9):(4'h9)]));
          reg165 <= (reg161 ?
              ({$unsigned($unsigned(wire158))} ?
                  (~(-{reg162,
                      wire157})) : wire160[(1'h0):(1'h0)]) : ((8'hab) >> $signed((wire154 || reg161))));
          reg166 <= wire156[(3'h5):(3'h5)];
        end
    end
  assign wire167 = ((~&wire154[(4'ha):(4'ha)]) >= $unsigned(wire159[(4'he):(4'ha)]));
  assign wire168 = ($unsigned((~((~^reg161) ?
                       $unsigned(wire157) : $unsigned(wire157)))) * $unsigned(reg161));
  assign wire169 = (({wire153[(1'h0):(1'h0)]} ?
                           ($unsigned(wire168) ?
                               {wire160,
                                   wire154[(2'h3):(1'h0)]} : (+wire167)) : $unsigned($unsigned(wire153))) ?
                       {(~|$unsigned($signed(reg164)))} : wire160[(1'h1):(1'h0)]);
  assign wire170 = wire154[(1'h1):(1'h0)];
  always
    @(posedge clk) begin
      if ((8'hbd))
        begin
          reg171 <= $unsigned(wire169);
          reg172 <= ($signed($signed(($unsigned((7'h44)) ?
              $signed((8'h9d)) : (wire170 ?
                  wire156 : (8'ha1))))) ~^ ((wire153[(4'h9):(2'h3)] < $signed((reg166 ?
              reg162 : wire158))) << $signed(wire167)));
          reg173 <= (&$signed(wire169));
          reg174 <= {$unsigned($signed($signed($unsigned(reg163)))),
              {(~&(reg171 ^~ $signed(reg173))),
                  ((~^reg163) ? reg164 : reg172)}};
        end
      else
        begin
          reg171 <= (wire156[(3'h5):(2'h3)] ?
              {$unsigned((~^$unsigned(reg165))),
                  (!(&(reg165 == wire168)))} : (~(~{(|wire160),
                  reg173[(1'h0):(1'h0)]})));
          reg172 <= {$unsigned($unsigned((~^reg161)))};
          if ((($signed((!$unsigned(wire153))) ?
              (($unsigned(reg162) ? (8'ha2) : $unsigned((8'haf))) ?
                  ((8'hab) ?
                      reg161 : {wire154,
                          (8'hb3)}) : $unsigned(wire155)) : ($signed({wire167}) ?
                  {reg164[(3'h7):(3'h7)]} : (reg162 ?
                      (wire160 << (8'had)) : $signed(reg163)))) < (!(reg166[(2'h3):(1'h1)] ?
              $unsigned((~|reg172)) : (reg174 ?
                  $signed(wire170) : (reg171 ? reg172 : wire156))))))
            begin
              reg173 <= ({$unsigned(reg172)} ?
                  ((~(~&(-wire156))) <<< (&(^{wire157}))) : (wire159 ?
                      (wire153 > $unsigned(((8'haf) ?
                          reg164 : reg163))) : ((8'haf) << wire153[(5'h13):(4'h9)])));
            end
          else
            begin
              reg173 <= ((~&$signed($unsigned(wire158[(5'h10):(4'he)]))) ?
                  reg161[(4'hc):(4'h8)] : wire169[(2'h3):(2'h2)]);
              reg174 <= (wire156 - $unsigned((((reg174 ?
                      reg173 : (8'ha0)) >= ((7'h41) ? wire169 : reg161)) ?
                  ((+(8'hab)) != ((8'hbf) ?
                      wire158 : (7'h44))) : $unsigned(wire160[(2'h3):(1'h0)]))));
              reg175 <= (($signed(((!wire153) ? {reg172, wire157} : (8'haf))) ?
                      $signed($signed((wire168 ?
                          reg162 : (8'ha3)))) : (|(^~$unsigned(reg173)))) ?
                  $unsigned($unsigned($unsigned((^~reg161)))) : reg164);
            end
          reg176 <= $signed(((({wire167} ? $signed(wire158) : (~wire155)) ?
                  ($unsigned(wire167) ?
                      (reg174 ? (8'hbc) : reg174) : $signed(reg164)) : reg161) ?
              ($unsigned($signed(wire160)) <<< (reg175 ?
                  (wire157 <= reg163) : $unsigned((8'ha9)))) : $signed((^~wire157[(5'h10):(2'h2)]))));
          if ((($unsigned($signed((wire167 ?
              reg163 : wire156))) && (^(((8'hba) ? wire160 : (8'hb1)) ?
              $signed(wire155) : (^~(7'h43))))) <= wire157[(4'h8):(2'h2)]))
            begin
              reg177 <= ((+({(reg163 ?
                          (8'hb7) : wire157)} >>> $unsigned(wire157))) ?
                  ((-({wire153, wire158} ? (wire167 | wire153) : {reg164})) ?
                      (wire159 >= (wire153[(3'h7):(1'h1)] + $unsigned((8'haa)))) : $unsigned(reg164[(4'h8):(3'h7)])) : (reg165[(1'h1):(1'h0)] | $signed((^(reg175 ?
                      (8'ha0) : wire153)))));
              reg178 <= (!{(($signed(reg166) ?
                      $signed(wire158) : $signed(reg164)) ~^ (8'hba))});
              reg179 <= (-({(~|(~|(8'had)))} >>> (8'hbf)));
              reg180 <= reg165;
              reg181 <= (reg165 ?
                  (~&(wire170 & ($signed(wire154) == reg177))) : (^~(^(wire159 ?
                      $unsigned(wire153) : $signed(reg162)))));
            end
          else
            begin
              reg177 <= $unsigned(wire156);
              reg178 <= ((((reg163 ?
                          {wire158} : reg162[(2'h2):(2'h2)]) != $signed($unsigned(wire158))) ?
                      ($unsigned(reg180[(3'h7):(2'h2)]) < $signed($signed(reg179))) : $unsigned((~$signed(reg162)))) ?
                  $signed(({(~reg179), (!reg180)} ?
                      reg162[(4'h9):(1'h0)] : wire154)) : reg165);
              reg179 <= $signed($unsigned($signed({$signed(reg178)})));
              reg180 <= ($signed($unsigned({(!reg166), wire170})) >> wire159);
              reg181 <= (((~$signed($unsigned(reg176))) ?
                      (((~^wire170) ?
                              (wire159 ?
                                  reg164 : (7'h41)) : reg179[(4'hf):(4'hc)]) ?
                          ((reg166 >= reg181) & ((7'h42) & reg175)) : $unsigned($signed((8'h9e)))) : reg173[(1'h1):(1'h0)]) ?
                  (8'hbe) : $unsigned({(~&wire153)}));
            end
        end
      reg182 <= (reg180 > (-$signed((~|(~reg174)))));
      reg183 <= reg175[(3'h7):(1'h0)];
      if (reg180[(3'h4):(2'h2)])
        begin
          reg184 <= reg183;
          reg185 <= ($unsigned(($signed($unsigned(reg175)) & ((wire160 ?
                  reg164 : wire170) ^~ (^wire153)))) ?
              ((^~wire170) ~^ {(^$signed(reg173)),
                  wire157}) : (~&($signed(reg177) ~^ ($signed(reg183) - reg162[(2'h3):(1'h0)]))));
          reg186 <= ((((+(wire159 <<< reg162)) | $signed((reg185 >> wire167))) ?
              reg183 : (((reg173 ?
                  reg165 : wire154) ^~ wire159[(3'h7):(1'h1)]) == $signed((&reg176)))) > reg163);
          reg187 <= {$signed((wire167[(3'h5):(2'h2)] ?
                  ((reg166 ? (8'had) : (8'hbc)) ?
                      (wire168 ?
                          reg166 : wire157) : $unsigned(reg172)) : ((wire157 ?
                      reg183 : reg177) & reg181))),
              ($signed((|(reg164 ^~ reg183))) ?
                  (wire160 | {(wire170 >> reg174),
                      (wire158 ?
                          reg162 : (8'ha0))}) : (~(~|$signed(wire158))))};
          if ((wire159[(4'hd):(4'ha)] ?
              (8'hb5) : {($signed($unsigned(wire155)) ~^ reg173),
                  {$signed(wire154)}}))
            begin
              reg188 <= reg175;
            end
          else
            begin
              reg188 <= $signed($signed($signed((|$unsigned(wire160)))));
              reg189 <= $signed($signed($signed($unsigned($signed(reg166)))));
            end
        end
      else
        begin
          if ((($unsigned(((wire160 + reg172) + (reg163 * reg187))) <= $unsigned(wire156)) >>> $unsigned((!wire160))))
            begin
              reg184 <= wire168[(1'h0):(1'h0)];
              reg185 <= $unsigned($signed($signed(reg182[(2'h2):(2'h2)])));
              reg186 <= reg177[(2'h2):(2'h2)];
              reg187 <= $signed((^(reg189 | ((reg178 ?
                  reg184 : reg179) <<< reg181[(5'h13):(2'h3)]))));
            end
          else
            begin
              reg184 <= {(-wire168)};
            end
          reg188 <= (!(reg189[(3'h4):(3'h4)] >= (reg166 ?
              ((reg179 * wire158) ?
                  (+reg176) : (reg164 ? (8'hb4) : wire159)) : ((~&wire160) ?
                  (^~reg163) : $unsigned(wire157)))));
          if (((wire158[(2'h3):(2'h2)] != $signed(({(8'h9e),
                  reg177} * $unsigned(wire157)))) ?
              ((~&wire156) - (($signed(wire167) << $unsigned(reg173)) == (wire159 ?
                  $signed(wire169) : (|(8'hb9))))) : (($unsigned((reg165 <<< wire170)) == reg174[(2'h2):(2'h2)]) ^ {$unsigned((~^wire167))})))
            begin
              reg189 <= $signed(($signed(((+(8'hae)) >> {reg171})) ?
                  (($signed(reg164) ?
                      {reg165,
                          reg179} : (!reg173)) != wire170) : (-(~$unsigned(wire157)))));
              reg190 <= reg164[(4'he):(3'h7)];
              reg191 <= $unsigned(((reg190[(1'h1):(1'h0)] ?
                  (reg189[(4'h8):(2'h2)] >>> $unsigned((8'ha9))) : wire154[(3'h4):(2'h2)]) ^~ ((~|(reg184 < wire167)) ?
                  reg177[(2'h2):(1'h1)] : $unsigned(reg173))));
            end
          else
            begin
              reg189 <= wire156;
              reg190 <= $unsigned(((|((wire158 <= wire159) ?
                      (wire157 ? wire158 : (8'ha6)) : (wire155 > reg162))) ?
                  (($unsigned(reg186) != ((8'hb9) != wire167)) ?
                      ((8'haf) ?
                          $unsigned(reg185) : $signed(wire157)) : (&wire167)) : (((~^reg177) ^ ((8'hbd) ?
                      (7'h42) : (8'h9f))) >>> reg191[(2'h3):(1'h0)])));
              reg191 <= (^~(+(wire154 ?
                  wire157 : (((8'hbe) > wire159) ?
                      $unsigned(reg181) : wire170))));
              reg192 <= ($unsigned(reg185) ?
                  (~&{($signed(wire160) ? {reg174} : (&reg178)),
                      $signed((wire153 * reg174))}) : (wire169[(3'h4):(2'h2)] >> wire170[(1'h0):(1'h0)]));
              reg193 <= ({$unsigned(reg161[(4'ha):(2'h3)])} ?
                  {($signed((reg192 ? reg166 : wire154)) ^ ({reg182, wire157} ?
                          {wire157, reg180} : reg175)),
                      ($unsigned(reg180) | {reg165[(4'hb):(2'h2)],
                          (7'h40)})} : $unsigned($unsigned((^((8'h9c) ?
                      reg184 : wire157)))));
            end
        end
      if (($unsigned(({((8'hb9) ? reg163 : reg187)} ?
              wire159 : {(~^wire153), reg186})) ?
          reg187[(3'h7):(1'h0)] : ((wire159[(3'h7):(3'h6)] == (reg171[(2'h3):(1'h0)] ?
              (reg180 ? (8'h9c) : reg189) : (reg172 ?
                  (8'h9c) : reg172))) == reg172)))
        begin
          reg194 <= reg186[(4'h8):(2'h2)];
          reg195 <= (($signed(((~reg181) ?
                      reg185[(4'h9):(2'h2)] : (reg164 ? wire153 : reg194))) ?
                  ({reg189[(3'h5):(2'h2)]} + $unsigned(reg185[(4'h9):(2'h3)])) : reg165[(3'h5):(2'h2)]) ?
              $unsigned((~|$signed(reg189[(3'h7):(3'h7)]))) : (^~{$signed((wire155 > reg189))}));
        end
      else
        begin
          reg194 <= $unsigned(reg161[(2'h3):(1'h0)]);
          if (reg175)
            begin
              reg195 <= reg161[(4'hb):(1'h0)];
              reg196 <= {$unsigned((reg189 ^~ reg194[(4'hb):(3'h7)])), reg195};
            end
          else
            begin
              reg195 <= (reg184 ?
                  reg172[(1'h0):(1'h0)] : $unsigned((($signed(wire168) ?
                          {reg163} : (reg184 != reg161)) ?
                      ($signed(reg192) ? (+(7'h40)) : (8'hb0)) : (7'h42))));
            end
          reg197 <= (($signed($unsigned($signed(reg192))) ?
                  reg162[(4'ha):(1'h0)] : $unsigned($unsigned({(8'ha8),
                      reg161}))) ?
              wire155[(1'h1):(1'h1)] : reg180[(3'h5):(1'h0)]);
        end
    end
  assign wire198 = (reg184[(1'h0):(1'h0)] ~^ {$signed((|$unsigned((7'h40))))});
  always
    @(posedge clk) begin
      if ((|$signed($unsigned(reg172))))
        begin
          if (((8'ha7) | $signed((($unsigned(wire198) ?
              $signed(wire169) : (reg180 ?
                  reg197 : (8'ha1))) - wire168[(2'h2):(1'h0)]))))
            begin
              reg199 <= ($signed($unsigned((~|((7'h43) << wire158)))) - reg171);
              reg200 <= $unsigned(($signed(((!reg180) + reg184)) ?
                  reg188 : (&($signed(reg183) ? (8'hac) : (^reg171)))));
              reg201 <= $signed(wire169);
            end
          else
            begin
              reg199 <= (~|$signed($signed(reg190[(3'h5):(3'h4)])));
              reg200 <= $unsigned(reg194[(3'h6):(3'h5)]);
              reg201 <= reg182;
              reg202 <= {wire168, wire170};
            end
        end
      else
        begin
          reg199 <= ($unsigned({$unsigned((^~wire156)),
              $signed(wire167[(3'h6):(3'h4)])}) * reg178[(5'h11):(4'h9)]);
        end
      reg203 <= $signed($signed((((~|wire158) ?
          ((8'ha7) >= wire198) : (reg164 ? (8'h9f) : reg182)) >= {(8'hbb)})));
      if (wire160)
        begin
          reg204 <= $unsigned(reg172[(3'h6):(3'h5)]);
          reg205 <= (((($signed(reg183) & (reg194 < reg185)) * ($signed(reg202) >= $unsigned(wire153))) & wire169[(1'h0):(1'h0)]) + reg183[(4'ha):(1'h0)]);
          reg206 <= (~reg182);
        end
      else
        begin
          if ({$signed(reg184[(2'h2):(1'h0)]),
              (reg204 ?
                  $signed({reg194, (wire168 - (7'h42))}) : $signed({(8'h9c)}))})
            begin
              reg204 <= (+(reg190 ? reg187 : (8'ha6)));
              reg205 <= $unsigned(reg201[(3'h4):(2'h3)]);
              reg206 <= reg189[(2'h2):(1'h1)];
              reg207 <= (reg180 ?
                  $unsigned($signed($unsigned(reg182))) : (^~(^~reg203)));
              reg208 <= ((wire158[(1'h0):(1'h0)] && $unsigned(((^reg165) << reg182))) == $signed((((^reg203) ?
                      (8'hb7) : $unsigned((8'ha4))) ?
                  $signed($signed(reg187)) : ((reg207 == reg178) ?
                      (!reg207) : (wire155 ? reg187 : wire198)))));
            end
          else
            begin
              reg204 <= reg208[(3'h7):(3'h5)];
            end
          reg209 <= $signed((^~(~^$unsigned(wire158))));
          if ((wire154 ?
              $unsigned(({wire160[(1'h1):(1'h1)]} ?
                  ((reg172 ? reg208 : reg202) ?
                      $signed(reg193) : reg201[(4'hf):(2'h3)]) : wire160[(1'h0):(1'h0)])) : $unsigned(((7'h41) ?
                  wire158[(2'h2):(1'h1)] : (8'ha1)))))
            begin
              reg210 <= $unsigned($unsigned({(7'h41)}));
              reg211 <= (~&reg185[(3'h5):(3'h4)]);
              reg212 <= $signed({(~^reg190[(1'h0):(1'h0)])});
              reg213 <= $signed(reg182[(3'h5):(3'h5)]);
            end
          else
            begin
              reg210 <= $unsigned((-$signed($signed((+reg184)))));
              reg211 <= reg205[(1'h0):(1'h0)];
            end
        end
      reg214 <= $unsigned($unsigned((-$signed((reg189 | wire154)))));
    end
  assign wire215 = reg204;
  assign wire216 = reg213;
  assign wire217 = reg163[(4'ha):(3'h5)];
endmodule

module module122
#(parameter param136 = {(~&(^~(((8'haa) ? (8'hbe) : (8'hbb)) ? (&(8'haf)) : (+(8'ha4)))))})
(y, clk, wire126, wire125, wire124, wire123);
  output wire [(32'h68):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'ha):(1'h0)] wire126;
  input wire signed [(3'h5):(1'h0)] wire125;
  input wire signed [(2'h2):(1'h0)] wire124;
  input wire [(2'h3):(1'h0)] wire123;
  wire signed [(2'h2):(1'h0)] wire135;
  wire signed [(5'h10):(1'h0)] wire131;
  wire signed [(4'ha):(1'h0)] wire130;
  wire signed [(4'hb):(1'h0)] wire129;
  wire signed [(4'hd):(1'h0)] wire128;
  wire signed [(5'h14):(1'h0)] wire127;
  reg [(3'h4):(1'h0)] reg134 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg133 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg132 = (1'h0);
  assign y = {wire135,
                 wire131,
                 wire130,
                 wire129,
                 wire128,
                 wire127,
                 reg134,
                 reg133,
                 reg132,
                 (1'h0)};
  assign wire127 = wire123;
  assign wire128 = wire125;
  assign wire129 = (($unsigned(wire128[(4'ha):(3'h5)]) ^~ (~|wire126[(3'h7):(3'h6)])) && wire123[(2'h3):(1'h1)]);
  assign wire130 = (~^$signed({{$signed(wire127)}, (8'hb5)}));
  assign wire131 = $signed($signed($unsigned((-((8'ha5) >>> wire127)))));
  always
    @(posedge clk) begin
      reg132 <= $unsigned($unsigned((((wire126 != wire125) & (wire128 <<< wire124)) ^ (^~$signed(wire126)))));
      reg133 <= ($signed(wire125[(2'h3):(2'h2)]) >>> (((wire127[(4'hf):(3'h4)] ?
              wire131[(4'he):(4'h8)] : wire124[(1'h0):(1'h0)]) ?
          (wire126[(2'h2):(2'h2)] ?
              wire129 : (^wire127)) : {wire123[(1'h0):(1'h0)]}) > wire127));
      reg134 <= ((-(((wire129 - wire129) << wire129) <= ((reg133 * wire123) ?
              wire126 : $unsigned(reg133)))) ?
          wire126 : wire123[(2'h2):(1'h0)]);
    end
  assign wire135 = $unsigned($signed({reg133[(4'hb):(4'ha)],
                       $signed((wire128 >= wire126))}));
endmodule

module module87
#(parameter param118 = (+(|{({(8'hb3)} ? (8'hb0) : ((8'hb7) | (8'hb1)))})))
(y, clk, wire91, wire90, wire89, wire88);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire91;
  input wire signed [(5'h15):(1'h0)] wire90;
  input wire signed [(5'h10):(1'h0)] wire89;
  input wire [(4'hb):(1'h0)] wire88;
  wire signed [(3'h7):(1'h0)] wire117;
  wire signed [(2'h2):(1'h0)] wire116;
  wire [(4'h8):(1'h0)] wire115;
  wire [(2'h3):(1'h0)] wire114;
  wire [(2'h2):(1'h0)] wire113;
  wire signed [(5'h11):(1'h0)] wire112;
  wire signed [(2'h2):(1'h0)] wire105;
  wire signed [(4'hb):(1'h0)] wire104;
  wire signed [(2'h3):(1'h0)] wire102;
  wire [(4'ha):(1'h0)] wire100;
  wire [(3'h5):(1'h0)] wire99;
  wire [(3'h5):(1'h0)] wire98;
  wire [(5'h13):(1'h0)] wire97;
  wire [(2'h3):(1'h0)] wire96;
  wire signed [(2'h2):(1'h0)] wire95;
  wire signed [(4'hd):(1'h0)] wire92;
  reg signed [(3'h4):(1'h0)] reg111 = (1'h0);
  reg [(3'h7):(1'h0)] reg110 = (1'h0);
  reg [(4'hf):(1'h0)] reg109 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg108 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg107 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg106 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg103 = (1'h0);
  reg signed [(4'he):(1'h0)] reg101 = (1'h0);
  reg [(4'hf):(1'h0)] reg94 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg93 = (1'h0);
  assign y = {wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire105,
                 wire104,
                 wire102,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire96,
                 wire95,
                 wire92,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 reg103,
                 reg101,
                 reg94,
                 reg93,
                 (1'h0)};
  assign wire92 = wire90[(5'h15):(5'h11)];
  always
    @(posedge clk) begin
      reg93 <= ($unsigned((((wire92 ?
              wire88 : wire90) >> $signed(wire91)) * wire89)) ?
          (~^(^~wire88)) : (wire92 ?
              wire90 : ({(+(8'ha3))} ~^ ((|wire92) ?
                  (wire88 ^ wire90) : wire92[(3'h5):(2'h3)]))));
      if (((wire88 ?
          ($unsigned(((8'hbd) ?
              wire90 : (8'hb3))) && $signed(wire89[(4'hd):(3'h4)])) : $signed(($signed((7'h40)) ?
              wire92[(3'h7):(2'h2)] : {wire88}))) << (+$signed((wire91 | (^~wire89))))))
        begin
          reg94 <= reg93[(3'h5):(2'h3)];
        end
      else
        begin
          reg94 <= $signed(((~$signed(wire92)) << $signed((8'ha4))));
        end
    end
  assign wire95 = (|$signed(wire89));
  assign wire96 = {(~|(-wire95))};
  assign wire97 = (~wire89[(1'h1):(1'h1)]);
  assign wire98 = $unsigned((!(~&$unsigned($unsigned(wire96)))));
  assign wire99 = wire90;
  assign wire100 = reg93;
  always
    @(posedge clk) begin
      reg101 <= wire97[(2'h2):(1'h0)];
    end
  assign wire102 = wire100[(3'h7):(2'h2)];
  always
    @(posedge clk) begin
      reg103 <= $unsigned(((wire100 ?
          (-(~^(8'h9f))) : (8'h9d)) ^~ ($unsigned(reg101) ?
          $unsigned((reg94 | (8'hb7))) : $unsigned(wire99))));
    end
  assign wire104 = wire98;
  assign wire105 = ((~$unsigned($unsigned($unsigned(wire102)))) ?
                       wire97 : ($unsigned((((8'hb7) < reg93) ?
                           ((8'ha1) ?
                               reg93 : wire97) : $unsigned(reg93))) <= ($signed(((8'ha8) ?
                               wire99 : reg101)) ?
                           ($signed(wire98) < wire89[(4'hd):(2'h3)]) : $unsigned((~reg103)))));
  always
    @(posedge clk) begin
      reg106 <= {wire99[(2'h3):(1'h0)], $unsigned(reg103)};
    end
  always
    @(posedge clk) begin
      reg107 <= wire102;
      reg108 <= $unsigned({wire91, ((&(wire88 >= reg101)) && wire99)});
      reg109 <= (~wire89);
      reg110 <= (&{{$signed(wire105[(1'h1):(1'h0)]), reg94}, $signed(wire96)});
      reg111 <= wire90[(5'h10):(4'he)];
    end
  assign wire112 = reg107[(3'h4):(1'h0)];
  assign wire113 = wire102[(1'h0):(1'h0)];
  assign wire114 = ((8'haf) >>> wire91[(1'h1):(1'h0)]);
  assign wire115 = reg109[(4'hf):(4'ha)];
  assign wire116 = wire88[(2'h3):(2'h3)];
  assign wire117 = ((!$unsigned($signed($signed((7'h40))))) ^ ((((-reg94) ?
                               (wire90 ? wire96 : wire95) : $signed((8'hbc))) ?
                           wire114 : {(wire95 >> wire92)}) ?
                       wire96[(2'h2):(1'h0)] : reg109));
endmodule

module module60
#(parameter param84 = ((~^(^~(8'hb7))) <= (((+(~(7'h42))) ^ {(^~(8'hba)), ((8'had) ? (8'h9e) : (8'hb9))}) ? (({(8'ha2)} <<< (&(7'h41))) ? {(+(8'ha4))} : ((~&(8'hb0)) ? ((8'hb6) ? (8'ha9) : (7'h44)) : ((7'h42) ? (8'h9e) : (8'h9c)))) : {(|(^~(8'h9c)))})))
(y, clk, wire64, wire63, wire62, wire61);
  output wire [(32'h114):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire64;
  input wire [(5'h13):(1'h0)] wire63;
  input wire signed [(4'he):(1'h0)] wire62;
  input wire signed [(4'hc):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire83;
  wire [(4'he):(1'h0)] wire82;
  wire [(5'h10):(1'h0)] wire81;
  wire signed [(4'h9):(1'h0)] wire80;
  wire signed [(5'h10):(1'h0)] wire79;
  wire [(5'h15):(1'h0)] wire78;
  wire signed [(4'hf):(1'h0)] wire77;
  wire [(4'he):(1'h0)] wire76;
  wire signed [(5'h12):(1'h0)] wire75;
  wire [(4'hc):(1'h0)] wire74;
  wire [(5'h12):(1'h0)] wire73;
  wire [(4'hb):(1'h0)] wire72;
  wire signed [(5'h12):(1'h0)] wire71;
  wire [(5'h15):(1'h0)] wire70;
  wire [(4'h8):(1'h0)] wire69;
  wire signed [(5'h10):(1'h0)] wire68;
  wire signed [(4'hc):(1'h0)] wire67;
  wire signed [(5'h14):(1'h0)] wire66;
  wire [(3'h5):(1'h0)] wire65;
  assign y = {wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire67,
                 wire66,
                 wire65,
                 (1'h0)};
  assign wire65 = wire62[(4'hc):(2'h3)];
  assign wire66 = (-($unsigned($signed((^~wire62))) ?
                      wire61[(3'h6):(2'h3)] : $signed($unsigned($signed(wire61)))));
  assign wire67 = {(~|$signed(wire62)),
                      {(wire61 ?
                              (~&$unsigned(wire62)) : $unsigned($signed(wire62))),
                          ((^~$unsigned(wire62)) ?
                              wire62[(3'h7):(3'h6)] : wire62)}};
  assign wire68 = $unsigned(({wire67} >= (wire65[(3'h5):(2'h3)] ?
                      (^((8'ha0) + (8'ha5))) : wire65)));
  assign wire69 = wire63[(4'he):(4'h8)];
  assign wire70 = {$signed(wire68), wire64[(4'hc):(3'h7)]};
  assign wire71 = $unsigned(($signed({$unsigned(wire62)}) > (~^$signed(wire61[(3'h4):(1'h1)]))));
  assign wire72 = wire65;
  assign wire73 = wire64;
  assign wire74 = ((|{(wire62 | $unsigned(wire65)), (8'hab)}) ?
                      $signed((&$unsigned(wire71))) : $unsigned((((wire69 ?
                                  wire63 : wire68) ?
                              (|wire62) : (^~wire65)) ?
                          wire68[(1'h1):(1'h1)] : (&(wire61 == wire65)))));
  assign wire75 = (~^$unsigned($signed($signed((-wire69)))));
  assign wire76 = wire73[(5'h10):(3'h6)];
  assign wire77 = (~&(+{(~&$unsigned(wire64))}));
  assign wire78 = $unsigned((~^wire70));
  assign wire79 = wire61;
  assign wire80 = $unsigned(wire74);
  assign wire81 = (8'hac);
  assign wire82 = $unsigned($unsigned(($unsigned($unsigned(wire61)) != $signed($unsigned(wire70)))));
  assign wire83 = (+$signed((wire63 ?
                      ((wire82 + wire78) ?
                          ((7'h44) ?
                              wire71 : wire70) : {wire77}) : {(wire78 >> (8'ha1))})));
endmodule

module module30
#(parameter param56 = ((8'hbd) & ({(((8'hbe) ? (8'ha5) : (7'h40)) << (|(8'ha2))), (((8'haa) ? (8'ha5) : (8'ha2)) ? ((8'h9d) + (8'hae)) : ((8'ha6) ^~ (8'hbf)))} + ({(^~(8'ha3)), {(8'hac)}} ? (-(~|(8'ha0))) : {((8'hb7) == (8'h9d))}))))
(y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h122):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(3'h5):(1'h0)] wire35;
  input wire [(5'h12):(1'h0)] wire34;
  input wire [(3'h4):(1'h0)] wire33;
  input wire [(2'h2):(1'h0)] wire32;
  input wire [(3'h5):(1'h0)] wire31;
  wire [(3'h4):(1'h0)] wire55;
  wire [(5'h12):(1'h0)] wire54;
  wire signed [(4'hc):(1'h0)] wire53;
  wire signed [(4'hc):(1'h0)] wire52;
  wire [(5'h11):(1'h0)] wire51;
  wire signed [(5'h10):(1'h0)] wire50;
  wire [(4'ha):(1'h0)] wire49;
  wire [(4'hf):(1'h0)] wire48;
  wire [(5'h15):(1'h0)] wire47;
  wire [(4'hb):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(4'h8):(1'h0)] wire44;
  wire signed [(5'h13):(1'h0)] wire43;
  wire [(5'h15):(1'h0)] wire42;
  wire signed [(4'hb):(1'h0)] wire41;
  wire signed [(5'h12):(1'h0)] wire40;
  wire signed [(5'h14):(1'h0)] wire39;
  wire [(5'h15):(1'h0)] wire37;
  wire [(4'hc):(1'h0)] wire36;
  reg signed [(4'hb):(1'h0)] reg38 = (1'h0);
  assign y = {wire55,
                 wire54,
                 wire53,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire37,
                 wire36,
                 reg38,
                 (1'h0)};
  assign wire36 = $unsigned((&(wire32[(2'h2):(1'h0)] >= (8'hb2))));
  assign wire37 = wire36;
  always
    @(posedge clk) begin
      reg38 <= wire32[(1'h0):(1'h0)];
    end
  assign wire39 = {(({(wire37 ? wire36 : wire35), (wire33 ? (8'hab) : wire36)} ?
                              (wire36 ?
                                  $unsigned((8'ha8)) : ((8'ha3) ^ wire35)) : $signed((|wire36))) ?
                          (8'hbf) : (~|wire35[(1'h0):(1'h0)]))};
  assign wire40 = ($signed((~&wire37)) ?
                      wire36[(4'hb):(1'h1)] : ($unsigned(wire37) ^~ wire32[(2'h2):(2'h2)]));
  assign wire41 = {$unsigned(((&wire33[(2'h2):(1'h0)]) ^ {(wire35 ?
                              wire33 : wire32),
                          ((8'hb1) ? wire35 : wire32)}))};
  assign wire42 = wire39;
  assign wire43 = (wire41 ? wire34 : wire31[(3'h5):(2'h2)]);
  assign wire44 = wire43;
  assign wire45 = $signed((!$signed((wire40[(4'h9):(3'h7)] ~^ $unsigned(wire32)))));
  assign wire46 = $unsigned((($unsigned(wire32) ^~ $signed(wire31)) + $unsigned(wire35)));
  assign wire47 = $signed(((^~(wire45 ?
                          $unsigned(reg38) : wire31[(1'h0):(1'h0)])) ?
                      {{(~|wire37), $unsigned(wire37)}} : {((~|wire39) ?
                              (+wire45) : (^wire43)),
                          $unsigned(wire34)}));
  assign wire48 = $unsigned((-$unsigned({$signed(wire47)})));
  assign wire49 = (~|wire33);
  assign wire50 = (((({wire37} ? (wire35 >= reg38) : wire33[(3'h4):(2'h2)]) ?
                      (~^wire39[(3'h6):(1'h1)]) : ((reg38 << wire42) & (wire40 <<< wire39))) <<< wire44) || wire45[(1'h0):(1'h0)]);
  assign wire51 = wire50;
  assign wire52 = $signed(wire33);
  assign wire53 = {wire35[(3'h4):(1'h0)]};
  assign wire54 = $signed(wire52);
  assign wire55 = wire48;
endmodule
