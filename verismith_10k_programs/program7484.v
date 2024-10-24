module top
#(parameter param187 = ((((~|(8'hae)) ? (~((8'hb6) ? (7'h44) : (8'hb6))) : (((8'hbe) <<< (8'hba)) ? (+(8'hba)) : ((8'hb1) ? (8'hae) : (8'hab)))) ? ((~^((8'ha6) ? (8'hb5) : (7'h42))) != ((!(7'h42)) <<< ((8'hb8) == (8'hb3)))) : (&((^~(8'h9f)) >= ((8'hb4) ^ (8'hbb))))) * ((~&(8'ha4)) ? (+{((8'hbb) ? (8'hb2) : (8'hac))}) : ({(^~(7'h40)), (+(8'h9f))} >= (((8'hb4) ^ (8'hab)) == ((8'ha7) ? (8'hae) : (8'hb2)))))), 
parameter param188 = ((((((8'hb7) ? param187 : param187) ? (param187 != (8'ha1)) : (param187 < param187)) ? param187 : param187) && ((param187 ? (|(8'hb7)) : {(8'ha9), param187}) && (param187 ? (^~param187) : param187))) >= ({(8'h9d)} ? param187 : (~|(((8'ha6) && param187) ? (param187 * param187) : (param187 ? param187 : param187))))))
(y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h259):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire0;
  input wire [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire4;
  wire [(5'h12):(1'h0)] wire185;
  wire signed [(4'h9):(1'h0)] wire183;
  wire signed [(4'he):(1'h0)] wire162;
  wire signed [(4'hd):(1'h0)] wire161;
  wire signed [(4'he):(1'h0)] wire145;
  wire signed [(4'h8):(1'h0)] wire144;
  wire signed [(4'hc):(1'h0)] wire143;
  wire [(5'h10):(1'h0)] wire141;
  wire [(5'h10):(1'h0)] wire7;
  wire signed [(4'ha):(1'h0)] wire8;
  wire signed [(4'hc):(1'h0)] wire9;
  wire [(4'hb):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire90;
  wire signed [(3'h4):(1'h0)] wire181;
  reg signed [(5'h11):(1'h0)] reg6 = (1'h0);
  reg [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg146 = (1'h0);
  reg [(4'he):(1'h0)] reg147 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg148 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg149 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg150 = (1'h0);
  reg [(4'hb):(1'h0)] reg151 = (1'h0);
  reg [(3'h6):(1'h0)] reg152 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg153 = (1'h0);
  reg [(5'h10):(1'h0)] reg154 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg156 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg157 = (1'h0);
  reg [(4'ha):(1'h0)] reg158 = (1'h0);
  reg [(4'h8):(1'h0)] reg159 = (1'h0);
  reg [(5'h13):(1'h0)] reg160 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg164 = (1'h0);
  reg [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(5'h10):(1'h0)] reg166 = (1'h0);
  reg [(5'h15):(1'h0)] reg167 = (1'h0);
  reg [(5'h15):(1'h0)] reg168 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg169 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg170 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg171 = (1'h0);
  reg [(5'h11):(1'h0)] reg172 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg173 = (1'h0);
  reg [(5'h10):(1'h0)] reg174 = (1'h0);
  reg [(4'ha):(1'h0)] reg175 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg176 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg177 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg178 = (1'h0);
  reg [(4'h8):(1'h0)] reg179 = (1'h0);
  reg [(5'h13):(1'h0)] reg180 = (1'h0);
  assign y = {wire185,
                 wire183,
                 wire162,
                 wire161,
                 wire145,
                 wire144,
                 wire143,
                 wire141,
                 wire7,
                 wire8,
                 wire9,
                 wire10,
                 wire90,
                 wire181,
                 reg6,
                 reg5,
                 reg146,
                 reg147,
                 reg148,
                 reg149,
                 reg150,
                 reg151,
                 reg152,
                 reg153,
                 reg154,
                 reg155,
                 reg156,
                 reg157,
                 reg158,
                 reg159,
                 reg160,
                 reg164,
                 reg165,
                 reg166,
                 reg167,
                 reg168,
                 reg169,
                 reg170,
                 reg171,
                 reg172,
                 reg173,
                 reg174,
                 reg175,
                 reg176,
                 reg177,
                 reg178,
                 reg179,
                 reg180,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire4[(4'h8):(3'h5)];
      reg6 <= ((($signed((-reg5)) >> wire0) <<< {{((8'hb9) ?
                      wire0 : (7'h43))}}) ?
          (wire2 || ((reg5 ?
              (wire4 ? wire0 : (8'hb7)) : (wire3 ?
                  (8'hae) : wire2)) ^~ (reg5[(4'hc):(3'h7)] ?
              (wire3 >> wire2) : (wire4 ?
                  reg5 : (8'hb9))))) : (~|((((8'hb1) || wire0) ^~ $unsigned(wire3)) ?
              $unsigned((wire3 ~^ wire3)) : wire1[(2'h3):(2'h2)])));
    end
  assign wire7 = $unsigned(wire3);
  assign wire8 = (($signed(({reg5, wire4} >= (wire4 ^ wire2))) ?
                     $signed({$unsigned(wire1),
                         (wire7 ^ wire7)}) : wire3) <= $signed($signed(($unsigned(wire1) != {wire4}))));
  assign wire9 = (~|wire1);
  assign wire10 = (^{$unsigned(reg5), wire7[(3'h7):(1'h1)]});
  module11 #() modinst91 (wire90, clk, wire1, wire7, reg6, wire4);
  module92 #() modinst142 (.wire95(wire4), .clk(clk), .y(wire141), .wire96(wire2), .wire93(wire9), .wire94(wire7));
  assign wire143 = (~&{(!(~^$signed(wire9)))});
  assign wire144 = (^$unsigned(wire9[(1'h1):(1'h1)]));
  assign wire145 = wire143;
  always
    @(posedge clk) begin
      reg146 <= ((((~&(wire144 || wire2)) == (~$unsigned((8'hbb)))) | (&($unsigned(wire90) >> wire10))) > $unsigned($signed($signed($unsigned(reg6)))));
      if ($unsigned((~wire9[(4'h8):(3'h6)])))
        begin
          reg147 <= wire144;
          reg148 <= (wire10 | ((~^{(&(8'hbe)), (!(7'h40))}) ?
              ($signed((wire2 < wire10)) ?
                  $signed($signed(wire2)) : ($unsigned((8'ha3)) ^ (reg5 & wire145))) : $unsigned((+((8'hb3) ?
                  reg5 : reg146)))));
        end
      else
        begin
          if ($unsigned((~&(~wire90))))
            begin
              reg147 <= ((8'ha6) ? wire1 : wire7);
              reg148 <= {$unsigned($signed((&wire7))),
                  $unsigned(wire2[(1'h0):(1'h0)])};
              reg149 <= (!($unsigned({(-wire90),
                  wire2[(4'hc):(3'h4)]}) ^ wire0[(2'h2):(1'h1)]));
              reg150 <= reg148;
              reg151 <= reg149;
            end
          else
            begin
              reg147 <= {($unsigned($unsigned(wire2)) ?
                      (~|($unsigned(reg146) ?
                          (^~wire2) : (wire10 ? reg5 : wire9))) : {reg5})};
              reg148 <= {(+(8'ha7)),
                  $signed($unsigned(wire144[(3'h4):(2'h2)]))};
              reg149 <= (reg146[(2'h2):(2'h2)] ?
                  (~&((8'hb1) && ((~|wire3) ?
                      $signed(wire1) : wire90[(3'h6):(1'h1)]))) : (reg6[(2'h3):(1'h1)] || (~$unsigned($signed(wire0)))));
            end
          reg152 <= (~|$signed(wire141[(4'h9):(3'h6)]));
        end
      reg153 <= ({(|$signed($signed(wire3)))} ?
          {{wire4}, $unsigned($unsigned(wire4[(3'h4):(3'h4)]))} : reg6);
      if (wire8[(1'h1):(1'h0)])
        begin
          reg154 <= ($unsigned(reg152[(3'h4):(1'h0)]) * reg146[(1'h0):(1'h0)]);
          if ({wire1[(3'h5):(3'h5)]})
            begin
              reg155 <= {(~^$unsigned(($signed(reg153) ?
                      (reg147 & wire4) : (&(8'ha0)))))};
              reg156 <= reg5;
              reg157 <= (reg149 ? (8'hba) : wire143);
              reg158 <= wire3[(2'h3):(2'h3)];
              reg159 <= $unsigned(((wire9[(3'h4):(1'h1)] ?
                      ($signed(reg150) <= reg156) : wire90[(2'h2):(2'h2)]) ?
                  {((wire7 > (8'ha4)) ? (+reg149) : (8'hb3)),
                      reg146[(2'h2):(2'h2)]} : (~&$unsigned((~&wire10)))));
            end
          else
            begin
              reg155 <= reg148;
            end
          reg160 <= wire1;
        end
      else
        begin
          if ($signed(reg156[(2'h2):(1'h0)]))
            begin
              reg154 <= wire90[(3'h5):(3'h4)];
              reg155 <= ($unsigned(reg152[(1'h0):(1'h0)]) ?
                  $signed(reg146) : wire0);
              reg156 <= ((+$signed(wire141[(2'h2):(1'h1)])) ?
                  (!{$unsigned({wire145, wire90}),
                      {wire141}}) : (($unsigned((&reg146)) ?
                      $signed((&wire9)) : $unsigned((reg157 ?
                          wire90 : wire7))) != (((wire141 ? reg157 : reg157) ?
                          reg148 : wire141) ?
                      {reg148[(3'h5):(3'h5)], wire4} : reg155[(1'h0):(1'h0)])));
            end
          else
            begin
              reg154 <= ($signed(wire141) ?
                  {$unsigned($signed(wire10))} : reg155);
              reg155 <= reg156;
              reg156 <= (8'ha6);
              reg157 <= {(-wire2),
                  ((wire7 ?
                      wire145[(2'h3):(1'h1)] : (reg160 ?
                          $unsigned(reg154) : (wire0 ?
                              (8'hac) : reg153))) <= reg146[(2'h2):(1'h0)])};
            end
          reg158 <= $signed((reg153 ?
              (^(|(~reg6))) : $signed((((8'hb8) * wire8) ?
                  wire90 : (~^wire7)))));
        end
    end
  assign wire161 = ($signed({(reg152 <<< reg152[(1'h1):(1'h1)])}) >>> (|($unsigned((wire3 ?
                       reg149 : wire4)) >= (((8'hb7) & wire90) ?
                       (reg160 ? reg152 : reg157) : (7'h41)))));
  module35 #() modinst163 (.wire40(wire7), .wire38(wire161), .wire39(reg150), .clk(clk), .wire37(wire144), .y(wire162), .wire36(reg158));
  always
    @(posedge clk) begin
      reg164 <= $unsigned($signed((~|$signed($signed(wire145)))));
      if ({((reg164[(4'hd):(4'h8)] + wire141) ?
              reg159 : (((8'ha3) != (wire10 ^~ (8'hb5))) ?
                  reg157[(3'h4):(2'h3)] : $unsigned((+(8'hb3))))),
          reg146})
        begin
          reg165 <= wire2[(5'h11):(3'h5)];
        end
      else
        begin
          reg165 <= $unsigned((reg154[(3'h7):(3'h4)] >>> (-(~^{reg158,
              (8'hba)}))));
          reg166 <= ($unsigned({$unsigned($signed((8'ha0))),
              ((reg6 ? wire2 : reg6) ?
                  $unsigned(wire141) : {(8'hb9)})}) ~^ wire1);
          reg167 <= (!((^$signed(reg165)) ?
              wire7[(3'h7):(3'h7)] : reg151[(3'h4):(2'h3)]));
          reg168 <= $unsigned((~|(reg151 ?
              {(reg167 + wire145),
                  (reg167 ? (7'h41) : wire7)} : reg166[(3'h6):(2'h3)])));
        end
      reg169 <= reg159[(1'h1):(1'h0)];
      if ({(reg159 ?
              reg166[(5'h10):(4'h8)] : ((reg167[(5'h13):(2'h3)] ?
                      reg147 : ((7'h40) ? wire7 : wire3)) ?
                  ($unsigned(reg160) ?
                      (^~wire7) : ((8'hb9) == reg151)) : {$signed(wire0)})),
          $signed(wire2[(3'h7):(3'h5)])})
        begin
          reg170 <= (wire2[(3'h4):(1'h0)] != reg5[(1'h0):(1'h0)]);
          reg171 <= reg159;
          if (wire1)
            begin
              reg172 <= (wire10[(2'h3):(2'h2)] + wire3);
              reg173 <= reg6[(3'h5):(2'h3)];
              reg174 <= $unsigned($signed((|(wire2 ?
                  $signed((7'h44)) : (~^(7'h43))))));
              reg175 <= (wire3 | $signed((~^$signed($signed(reg167)))));
            end
          else
            begin
              reg172 <= {wire161[(2'h2):(1'h0)],
                  ($signed((~^reg152[(3'h5):(3'h5)])) ?
                      reg166[(4'hc):(4'hb)] : ((|$signed(wire8)) ?
                          (!(wire4 ? reg153 : reg146)) : (~^(^~wire8))))};
              reg173 <= $unsigned({$signed(({reg151} <<< (~|reg165)))});
              reg174 <= (~wire90[(1'h1):(1'h1)]);
              reg175 <= (8'hb4);
              reg176 <= (8'ha8);
            end
        end
      else
        begin
          reg170 <= reg154[(2'h2):(1'h0)];
          reg171 <= $unsigned(wire141[(4'h8):(3'h7)]);
          if ({$unsigned((&$unsigned((reg165 || wire10))))})
            begin
              reg172 <= reg170;
            end
          else
            begin
              reg172 <= wire143;
              reg173 <= reg159[(1'h0):(1'h0)];
              reg174 <= reg171[(3'h5):(1'h1)];
              reg175 <= (~&(((reg153 ?
                      {wire145,
                          reg170} : $signed(reg147)) & (~&wire10[(2'h3):(1'h0)])) ?
                  (($unsigned(reg170) * (reg173 < reg158)) > $signed(wire7)) : (~^(8'ha5))));
            end
        end
      if ($unsigned(wire1[(4'he):(4'h8)]))
        begin
          reg177 <= ((^((~^(reg172 ^~ wire90)) ?
                  reg171[(3'h4):(1'h1)] : (+$signed(reg159)))) ?
              ((~|(-wire141[(4'ha):(4'h9)])) == $unsigned((~^(~wire9)))) : (-$signed($unsigned(wire3))));
          reg178 <= reg150;
        end
      else
        begin
          reg177 <= $signed((+$unsigned((|wire8))));
          reg178 <= $unsigned($signed((wire1[(4'hb):(2'h3)] ?
              (^~(reg177 ?
                  wire161 : reg6)) : ((reg173 == reg146) != (^~reg168)))));
          if (reg164[(4'hc):(3'h7)])
            begin
              reg179 <= (~&reg154[(4'hc):(3'h6)]);
            end
          else
            begin
              reg179 <= $unsigned(wire4);
              reg180 <= reg151;
            end
        end
    end
  module68 #() modinst182 (.wire72(wire145), .wire70(reg180), .y(wire181), .clk(clk), .wire69(reg172), .wire71(reg165));
  module35 #() modinst184 (.wire40(reg174), .y(wire183), .clk(clk), .wire38(wire144), .wire39(wire161), .wire37(reg179), .wire36(reg175));
  module97 #() modinst186 (.clk(clk), .wire101(wire0), .wire102(wire2), .wire98(reg147), .y(wire185), .wire100(reg176), .wire99(reg171));
endmodule

module module92
#(parameter param139 = (^({((~&(8'hbd)) >> ((8'hbc) ? (8'ha9) : (8'hb7))), (((8'hba) ? (7'h43) : (8'hbb)) ? ((7'h41) ^ (8'hb9)) : (|(8'hb8)))} + ((^~(&(8'hb0))) ? ({(8'hb6)} * ((8'ha1) & (8'haf))) : ({(8'haa), (8'h9d)} <<< ((8'ha8) ? (7'h41) : (8'hbb)))))), 
parameter param140 = ((param139 ? param139 : {{(param139 - param139), (param139 <= param139)}}) ? {(param139 ? ((|param139) ? (param139 ~^ param139) : param139) : (((8'haf) <= (8'ha2)) < (param139 ? (8'ha4) : param139)))} : param139))
(y, clk, wire96, wire95, wire94, wire93);
  output wire [(32'h8a):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire96;
  input wire [(5'h10):(1'h0)] wire95;
  input wire [(3'h6):(1'h0)] wire94;
  input wire signed [(4'hb):(1'h0)] wire93;
  wire signed [(5'h10):(1'h0)] wire138;
  wire [(4'h8):(1'h0)] wire137;
  wire [(4'hd):(1'h0)] wire136;
  wire signed [(4'hc):(1'h0)] wire135;
  wire [(5'h11):(1'h0)] wire125;
  reg [(4'h8):(1'h0)] reg134 = (1'h0);
  reg [(3'h7):(1'h0)] reg133 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg131 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg130 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg129 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg128 = (1'h0);
  reg [(4'hf):(1'h0)] reg127 = (1'h0);
  assign y = {wire138,
                 wire137,
                 wire136,
                 wire135,
                 wire125,
                 reg134,
                 reg133,
                 reg132,
                 reg131,
                 reg130,
                 reg129,
                 reg128,
                 reg127,
                 (1'h0)};
  module97 #() modinst126 (wire125, clk, wire93, wire96, wire94, wire95, (8'hbd));
  always
    @(posedge clk) begin
      reg127 <= wire93[(3'h6):(2'h2)];
      if ((((wire96[(2'h2):(2'h2)] ?
                  {(wire95 ? wire94 : wire96),
                      (^wire95)} : (~$signed(reg127))) ?
              wire94 : $unsigned((~{reg127, wire93}))) ?
          $unsigned($unsigned(wire95)) : (-$unsigned(((wire95 <= (8'hb6)) || (~&wire94))))))
        begin
          reg128 <= (~wire94[(3'h4):(1'h0)]);
          reg129 <= wire94[(1'h1):(1'h0)];
          reg130 <= (^((8'ha5) ?
              (~{$unsigned(reg129)}) : $unsigned(wire96[(4'hb):(4'h9)])));
        end
      else
        begin
          reg128 <= $signed(({((-(8'hbe)) & reg130[(1'h1):(1'h1)]),
              (!wire93[(4'ha):(1'h1)])} < (~(8'hbf))));
          if ($signed(reg130))
            begin
              reg129 <= ($unsigned(wire94) != (-wire93[(3'h4):(1'h1)]));
              reg130 <= {(($signed({wire96, wire94}) ?
                      wire93 : $signed((wire94 ?
                          wire96 : reg127))) >> ((8'h9f) ?
                      wire95 : (reg127[(2'h3):(2'h3)] <= $signed(reg130)))),
                  $unsigned(wire95)};
              reg131 <= ($signed(wire95) ?
                  $unsigned((($unsigned((8'had)) ?
                      reg128[(3'h5):(1'h0)] : (reg127 ?
                          wire95 : (8'hb6))) ^ (reg128[(4'h9):(3'h4)] << reg129))) : $signed($signed((reg128[(4'hf):(3'h5)] & (wire95 & reg128)))));
            end
          else
            begin
              reg129 <= $unsigned((^{wire125, reg130[(4'h8):(3'h5)]}));
            end
          reg132 <= $unsigned((reg127[(4'h8):(1'h0)] ?
              $signed(wire125) : reg128[(4'hf):(1'h0)]));
        end
      reg133 <= {wire96[(3'h6):(3'h5)]};
      reg134 <= reg130;
    end
  assign wire135 = $signed(wire96[(4'hd):(4'hd)]);
  assign wire136 = $signed((-reg127[(1'h0):(1'h0)]));
  assign wire137 = reg131;
  assign wire138 = wire135;
endmodule

module module11
#(parameter param88 = ({((((8'hb7) & (8'haa)) ? ((8'ha6) + (8'h9c)) : (^(8'ha6))) && {((8'hbc) ^ (8'hbb)), ((8'hac) ? (8'ha8) : (8'h9c))}), (+(^((8'hac) ? (8'ha4) : (8'hae))))} >= (|{(((8'h9c) ? (8'ha8) : (8'hb2)) ? {(8'ha4), (8'hb0)} : {(8'ha2)}), (8'ha7)})), 
parameter param89 = ((param88 != ((param88 ? (param88 && param88) : (param88 ? param88 : param88)) << param88)) & (((8'hb3) ^ (param88 || (param88 ? (8'hbf) : param88))) ? (~((~|param88) ? {param88, param88} : (param88 ? param88 : param88))) : {param88, ((~^param88) ^ (param88 & param88))})))
(y, clk, wire12, wire13, wire14, wire15);
  output wire [(32'h13d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire12;
  input wire signed [(4'hc):(1'h0)] wire13;
  input wire signed [(5'h11):(1'h0)] wire14;
  input wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire87;
  wire signed [(4'hb):(1'h0)] wire86;
  wire [(5'h10):(1'h0)] wire85;
  wire signed [(4'hf):(1'h0)] wire83;
  wire [(5'h11):(1'h0)] wire67;
  wire [(3'h7):(1'h0)] wire66;
  wire signed [(3'h5):(1'h0)] wire16;
  wire signed [(5'h14):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire33;
  wire signed [(4'hb):(1'h0)] wire34;
  wire signed [(4'hd):(1'h0)] wire64;
  reg [(5'h11):(1'h0)] reg32 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg30 = (1'h0);
  reg [(4'hd):(1'h0)] reg29 = (1'h0);
  reg [(3'h6):(1'h0)] reg28 = (1'h0);
  reg [(4'hd):(1'h0)] reg27 = (1'h0);
  reg [(5'h10):(1'h0)] reg26 = (1'h0);
  reg [(3'h4):(1'h0)] reg25 = (1'h0);
  reg [(2'h3):(1'h0)] reg24 = (1'h0);
  reg [(2'h2):(1'h0)] reg23 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg21 = (1'h0);
  reg [(5'h15):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'hf):(1'h0)] reg18 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire83,
                 wire67,
                 wire66,
                 wire16,
                 wire17,
                 wire33,
                 wire34,
                 wire64,
                 reg32,
                 reg31,
                 reg30,
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
                 (1'h0)};
  assign wire16 = $unsigned($unsigned($signed(wire13)));
  assign wire17 = {wire16[(1'h0):(1'h0)], $unsigned(wire15)};
  always
    @(posedge clk) begin
      reg18 <= ((~|$signed(((wire12 ? wire15 : wire15) ?
          wire17[(2'h2):(2'h2)] : wire16))) * (((~^wire13) <<< wire13[(4'h9):(4'h9)]) ?
          $unsigned(wire13) : $signed(wire16[(3'h4):(1'h1)])));
      reg19 <= wire13;
      reg20 <= reg19[(1'h0):(1'h0)];
      if ({(($signed({wire12, wire12}) ?
                  (~|wire16[(1'h1):(1'h1)]) : $signed($unsigned(wire17))) ?
              $signed(wire14[(3'h5):(1'h1)]) : (~|wire17)),
          wire14})
        begin
          reg21 <= $signed((&$signed(wire15)));
          if (((~&(^(&$unsigned((8'hba))))) ? (^$signed((8'hb1))) : wire15))
            begin
              reg22 <= $unsigned({((wire14 != {wire15}) ?
                      wire13[(3'h6):(1'h1)] : $signed((wire15 ?
                          (8'haa) : reg18)))});
            end
          else
            begin
              reg22 <= $unsigned(wire15);
              reg23 <= ((~|(^wire17[(3'h5):(2'h2)])) ?
                  $signed($unsigned((wire13[(3'h4):(2'h2)] ?
                      (reg20 ?
                          (8'hb6) : reg19) : (reg21 + (7'h41))))) : $unsigned({((-wire13) != $unsigned(wire14))}));
            end
          if ((wire16 ?
              $signed(({$unsigned((8'haa)), (wire12 ? (8'ha4) : reg18)} ?
                  $unsigned($unsigned((8'hbd))) : wire13[(4'hb):(3'h4)])) : ($unsigned((^wire15[(1'h0):(1'h0)])) ?
                  reg20[(4'h8):(3'h4)] : $signed(wire13[(2'h3):(1'h1)]))))
            begin
              reg24 <= $unsigned(wire16);
              reg25 <= wire16[(1'h1):(1'h0)];
              reg26 <= (wire12 ?
                  $signed($signed(((~&wire17) ?
                      wire16 : {reg24}))) : $unsigned((($signed(reg22) ?
                          reg20[(1'h1):(1'h0)] : reg20) ?
                      (!$unsigned(reg21)) : (|$unsigned(reg25)))));
              reg27 <= reg25;
            end
          else
            begin
              reg24 <= (({(((8'haf) ? reg23 : (8'ha1)) >> ((8'h9f) ?
                          reg21 : (8'hbb))),
                      wire16[(1'h0):(1'h0)]} & (((!(8'hab)) <= wire17[(2'h3):(1'h0)]) >>> $unsigned({wire17}))) ?
                  reg20[(3'h7):(1'h0)] : $unsigned($unsigned({(reg24 ?
                          (8'ha2) : wire17),
                      reg25})));
              reg25 <= $unsigned((wire15[(1'h1):(1'h1)] != $signed(reg20[(1'h1):(1'h0)])));
              reg26 <= $signed((8'ha4));
              reg27 <= reg27;
              reg28 <= $unsigned($unsigned(wire12[(2'h2):(2'h2)]));
            end
          reg29 <= (8'hb9);
          if ($unsigned(reg20[(1'h0):(1'h0)]))
            begin
              reg30 <= (~(reg29 && {reg20[(3'h7):(2'h3)],
                  ((~(8'ha1)) || $unsigned((8'hb5)))}));
              reg31 <= ($signed(($unsigned(wire14) ?
                      ({wire14, (8'ha4)} ?
                          reg30 : $signed(reg20)) : (~$unsigned(reg28)))) ?
                  {{($unsigned(wire12) ? (-reg27) : wire15),
                          $unsigned($unsigned(reg24))}} : {(~^$signed(reg28)),
                      $signed((^~(reg20 ? wire14 : reg22)))});
            end
          else
            begin
              reg30 <= reg25;
            end
        end
      else
        begin
          if ($signed($signed({$unsigned(reg25[(2'h2):(1'h0)]),
              (((8'hab) <<< reg22) ?
                  $unsigned(reg19) : ((8'hba) ? (8'hb2) : wire15))})))
            begin
              reg21 <= reg26;
              reg22 <= $signed($unsigned($signed(reg26[(4'hd):(4'h9)])));
              reg23 <= reg27;
              reg24 <= wire12;
            end
          else
            begin
              reg21 <= $unsigned(((wire15 > (~^reg30[(3'h7):(2'h3)])) * $unsigned($signed((~&wire15)))));
              reg22 <= $unsigned(((reg18 ?
                      (!{reg23, wire13}) : {(wire16 ? reg25 : reg18)}) ?
                  $unsigned((wire14 ?
                      reg22[(1'h1):(1'h1)] : ((8'hb9) ?
                          reg22 : reg20))) : $unsigned({(reg20 | reg29)})));
              reg23 <= ((8'h9f) ?
                  reg26[(1'h1):(1'h1)] : {reg24[(2'h3):(1'h1)]});
            end
          if ($unsigned($unsigned((!($signed((8'hbe)) ?
              (reg26 - (8'hbe)) : reg25)))))
            begin
              reg25 <= wire14[(1'h1):(1'h1)];
              reg26 <= $unsigned(reg26[(3'h7):(2'h3)]);
              reg27 <= reg18[(4'h8):(1'h1)];
            end
          else
            begin
              reg25 <= $signed($signed((~|((reg31 << wire13) * (reg29 ?
                  reg24 : reg27)))));
              reg26 <= reg25[(2'h2):(1'h0)];
              reg27 <= (~|$signed({$signed((wire17 ? reg26 : reg19)),
                  $signed({wire17})}));
              reg28 <= $unsigned((reg26 ?
                  $unsigned(wire14[(3'h7):(3'h7)]) : reg28));
              reg29 <= reg19;
            end
        end
      reg32 <= ({($signed(reg30) > {(wire17 >= (8'ha7))})} ?
          (^reg25) : $unsigned(((-{reg27}) ?
              $signed(reg20[(5'h11):(1'h0)]) : {wire16})));
    end
  assign wire33 = ((reg22 ?
                      (^~(reg26 ?
                          $signed(reg23) : $signed(wire16))) : reg19) <= ($unsigned((((8'hb0) ?
                          reg21 : wire15) ?
                      ((8'had) | reg29) : $signed(wire13))) ~^ {reg31,
                      (~|reg28)}));
  assign wire34 = (~(!reg18[(4'h8):(3'h6)]));
  module35 #() modinst65 (wire64, clk, wire12, reg27, reg28, reg32, reg31);
  assign wire66 = $signed($unsigned(((&reg28) ~^ ((reg22 << reg29) != reg29))));
  assign wire67 = (reg25 ?
                      $signed(((^~{(8'hb1),
                          reg32}) && wire13[(4'h9):(1'h1)])) : $unsigned($signed((~(reg24 ?
                          reg24 : (8'ha6))))));
  module68 #() modinst84 (.wire69(wire14), .y(wire83), .wire71(wire17), .wire72(wire15), .wire70(wire33), .clk(clk));
  assign wire85 = $signed($signed((8'hbe)));
  assign wire86 = (!$signed(wire66[(3'h6):(2'h3)]));
  assign wire87 = (!wire14);
endmodule

module module68
#(parameter param81 = (~{(({(8'h9d)} ? ((8'hb1) ? (7'h43) : (8'haf)) : ((8'ha4) ? (7'h44) : (8'hb6))) <= (~|(~&(8'ha2)))), (-((8'hbf) < {(8'ha8), (8'hb4)}))}), 
parameter param82 = (({((|param81) ? (param81 != param81) : param81), (~^(param81 ? param81 : param81))} ? (((+param81) == {(8'ha9), param81}) ? param81 : ((^param81) ? (param81 == param81) : param81)) : (~param81)) ? (param81 ? (~|({param81, param81} ~^ (~param81))) : (((param81 ? param81 : param81) + param81) != param81)) : param81))
(y, clk, wire72, wire71, wire70, wire69);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire72;
  input wire signed [(5'h14):(1'h0)] wire71;
  input wire [(5'h13):(1'h0)] wire70;
  input wire signed [(5'h11):(1'h0)] wire69;
  wire [(4'hc):(1'h0)] wire77;
  wire [(4'hb):(1'h0)] wire76;
  wire [(5'h15):(1'h0)] wire75;
  wire signed [(5'h12):(1'h0)] wire74;
  wire [(4'ha):(1'h0)] wire73;
  reg signed [(5'h10):(1'h0)] reg80 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg79 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg78 = (1'h0);
  assign y = {wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire73,
                 reg80,
                 reg79,
                 reg78,
                 (1'h0)};
  assign wire73 = wire72;
  assign wire74 = $unsigned(wire70);
  assign wire75 = (wire69 >>> $signed(wire73[(1'h0):(1'h0)]));
  assign wire76 = (((^wire72[(3'h4):(3'h4)]) ?
                      (^(|$unsigned(wire71))) : ((8'hb8) - wire70)) ~^ ($unsigned({$unsigned((8'h9d)),
                          (8'hbb)}) ?
                      (|(!(wire75 ?
                          wire75 : wire71))) : wire70[(1'h1):(1'h1)]));
  assign wire77 = wire74[(3'h5):(3'h5)];
  always
    @(posedge clk) begin
      reg78 <= $unsigned((|((~^(-wire73)) - ($signed(wire74) * (|wire69)))));
      reg79 <= wire69;
      reg80 <= wire69;
    end
endmodule

module module35
#(parameter param62 = ((~&((&(8'had)) ? ((8'ha2) ? (8'hb9) : (~|(8'hbe))) : (~^(8'had)))) ? (~^(~{{(8'h9c)}})) : (&(((~|(8'haf)) <<< ((7'h44) < (8'hb3))) >= (7'h41)))), 
parameter param63 = {param62})
(y, clk, wire40, wire39, wire38, wire37, wire36);
  output wire [(32'hf1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire40;
  input wire [(4'hd):(1'h0)] wire39;
  input wire [(3'h6):(1'h0)] wire38;
  input wire [(4'h8):(1'h0)] wire37;
  input wire signed [(4'ha):(1'h0)] wire36;
  wire signed [(3'h7):(1'h0)] wire61;
  wire signed [(4'hb):(1'h0)] wire60;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(2'h2):(1'h0)] wire58;
  wire [(4'hc):(1'h0)] wire57;
  wire [(4'he):(1'h0)] wire56;
  wire signed [(3'h7):(1'h0)] wire55;
  wire signed [(3'h7):(1'h0)] wire42;
  wire [(5'h14):(1'h0)] wire41;
  reg signed [(4'h8):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'ha):(1'h0)] reg48 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(5'h12):(1'h0)] reg45 = (1'h0);
  reg [(5'h10):(1'h0)] reg44 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg43 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire42,
                 wire41,
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
                 (1'h0)};
  assign wire41 = wire37[(3'h5):(3'h5)];
  assign wire42 = (~|((~&(wire36[(3'h4):(1'h1)] ^~ ((8'hb2) ^~ wire37))) ?
                      (8'hbd) : (-(~|(wire36 ? wire39 : wire39)))));
  always
    @(posedge clk) begin
      if ((({{$signed(wire41)}} ~^ (^~(&(^wire41)))) == (($unsigned(((8'hbc) * wire38)) ^ wire42[(3'h4):(2'h2)]) - $unsigned(wire38[(3'h6):(3'h4)]))))
        begin
          reg43 <= wire42;
          reg44 <= (&$unsigned(wire39));
          reg45 <= (-($unsigned((~|wire40)) & wire42));
          reg46 <= {reg44};
          if ($signed(reg46))
            begin
              reg47 <= wire42[(3'h5):(1'h0)];
              reg48 <= $signed(((($unsigned(wire38) || $signed(wire39)) >= $signed((~|wire39))) ?
                  {(wire40 ?
                          wire36 : (!wire37))} : $unsigned((((8'haa) >= reg46) ?
                      {wire40} : (7'h42)))));
              reg49 <= ($signed($signed((|wire42[(3'h5):(2'h2)]))) ?
                  (($unsigned((reg43 & wire40)) >> wire42[(1'h0):(1'h0)]) ?
                      ($signed((wire36 >> wire36)) + $unsigned((wire41 ?
                          wire37 : (8'hb3)))) : (-wire39[(1'h1):(1'h1)])) : $unsigned((-$unsigned((wire42 ?
                      wire39 : reg44)))));
              reg50 <= reg45[(4'h8):(3'h5)];
              reg51 <= {reg45};
            end
          else
            begin
              reg47 <= reg48;
              reg48 <= wire42;
              reg49 <= $unsigned(wire42[(3'h6):(2'h3)]);
              reg50 <= $unsigned($signed(wire42));
              reg51 <= (($signed($unsigned((wire39 * wire42))) * $signed((wire36[(1'h1):(1'h1)] != wire38[(1'h1):(1'h1)]))) <= $unsigned((~|((~reg51) ?
                  wire36 : $unsigned(reg43)))));
            end
        end
      else
        begin
          if (reg48[(4'h8):(2'h3)])
            begin
              reg43 <= (^~($unsigned($unsigned((wire39 ? reg45 : (8'hb1)))) ?
                  reg46 : (~|(reg47[(2'h3):(2'h3)] > reg50))));
              reg44 <= $unsigned($unsigned(((~|wire36[(3'h5):(3'h5)]) >> (reg47[(1'h1):(1'h1)] ?
                  (^~reg50) : $signed(reg44)))));
            end
          else
            begin
              reg43 <= reg47;
              reg44 <= $signed({(~$signed($unsigned(reg51))),
                  ($signed((&wire36)) >> (reg50 ?
                      (^wire38) : reg51[(2'h2):(2'h2)]))});
              reg45 <= $unsigned($unsigned($unsigned((+(reg45 ?
                  wire39 : (8'hb6))))));
              reg46 <= wire38[(2'h3):(2'h2)];
            end
        end
      reg52 <= (^(-(($unsigned(reg43) ?
          wire40 : $signed(wire38)) == $signed((reg51 ? reg49 : (7'h42))))));
      reg53 <= reg51;
      reg54 <= $unsigned((((~&(~|(8'h9e))) << $signed((^~reg53))) ?
          (reg51[(4'hc):(2'h3)] >= $signed((+reg53))) : {($signed(wire37) || (reg45 || reg44)),
              reg45}));
    end
  assign wire55 = reg54;
  assign wire56 = wire40[(4'h9):(4'h9)];
  assign wire57 = $unsigned(wire40);
  assign wire58 = $signed((|reg46));
  assign wire59 = $unsigned(($unsigned($signed($unsigned(wire36))) ?
                      (wire58[(2'h2):(1'h1)] ?
                          ($signed((8'h9f)) + $signed(reg54)) : (^~wire39)) : $signed(reg49)));
  assign wire60 = reg54;
  assign wire61 = ($unsigned((wire37 + {(-(8'haf)), $signed(reg46)})) ?
                      $signed($unsigned((((8'hac) ?
                          reg46 : wire59) != $signed(reg54)))) : ((wire38[(3'h5):(1'h0)] ?
                              wire36[(4'ha):(4'ha)] : $unsigned($unsigned((8'hab)))) ?
                          $unsigned((~&(!wire42))) : wire57));
endmodule

module module97
#(parameter param123 = (!({{(8'hb2), ((7'h44) ~^ (8'haa))}, (8'hb4)} ^~ (!(-(&(8'ha7)))))), 
parameter param124 = ((-(((param123 >= param123) ? (param123 > param123) : (param123 ? param123 : param123)) >> ((|param123) == (param123 ? param123 : param123)))) > param123))
(y, clk, wire102, wire101, wire100, wire99, wire98);
  output wire [(32'hb0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire102;
  input wire signed [(5'h12):(1'h0)] wire101;
  input wire [(3'h6):(1'h0)] wire100;
  input wire [(3'h4):(1'h0)] wire99;
  input wire [(4'he):(1'h0)] wire98;
  wire signed [(2'h3):(1'h0)] wire122;
  wire [(4'hb):(1'h0)] wire121;
  wire signed [(5'h11):(1'h0)] wire120;
  wire [(3'h5):(1'h0)] wire119;
  wire [(5'h12):(1'h0)] wire118;
  wire signed [(3'h5):(1'h0)] wire117;
  wire signed [(5'h13):(1'h0)] wire116;
  wire signed [(3'h5):(1'h0)] wire105;
  wire [(4'h9):(1'h0)] wire104;
  wire [(4'hb):(1'h0)] wire103;
  reg [(5'h10):(1'h0)] reg115 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg114 = (1'h0);
  reg [(2'h3):(1'h0)] reg113 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg112 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg111 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg110 = (1'h0);
  reg [(3'h7):(1'h0)] reg109 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg108 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg107 = (1'h0);
  reg [(3'h6):(1'h0)] reg106 = (1'h0);
  assign y = {wire122,
                 wire121,
                 wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire105,
                 wire104,
                 wire103,
                 reg115,
                 reg114,
                 reg113,
                 reg112,
                 reg111,
                 reg110,
                 reg109,
                 reg108,
                 reg107,
                 reg106,
                 (1'h0)};
  assign wire103 = ((~^$unsigned(({wire100} >> {wire102, wire102}))) ?
                       ($signed($unsigned(wire102)) ?
                           $signed($unsigned(wire98[(4'h9):(2'h3)])) : (~^((8'hb8) ?
                               $unsigned((8'hb6)) : (wire101 | wire100)))) : (7'h43));
  assign wire104 = $signed(wire100);
  assign wire105 = (~^{$signed((wire101 ?
                           (~|(7'h43)) : wire104[(1'h1):(1'h0)])),
                       $signed({$signed((8'hba)), $signed(wire100)})});
  always
    @(posedge clk) begin
      reg106 <= wire105;
      reg107 <= wire104;
      reg108 <= wire102[(2'h2):(1'h0)];
      reg109 <= wire99[(2'h2):(1'h0)];
      if ($signed($unsigned(((8'hb7) ?
          wire99[(1'h1):(1'h0)] : ((!reg107) ^ (~wire103))))))
        begin
          reg110 <= $unsigned((reg109[(2'h3):(1'h1)] ?
              (-wire101) : {$signed({wire99, wire102}),
                  $signed($unsigned((8'had)))}));
          reg111 <= reg108;
          reg112 <= (~{wire100});
          reg113 <= ($unsigned($signed((-$unsigned(wire103)))) - (~&($unsigned($unsigned((8'hbb))) ?
              (~{reg109, wire103}) : ((^~reg107) <<< $unsigned(wire105)))));
        end
      else
        begin
          reg110 <= wire105[(1'h1):(1'h1)];
          if ($signed((reg109 <= (~|$unsigned(reg110[(1'h0):(1'h0)])))))
            begin
              reg111 <= (8'ha0);
              reg112 <= wire98;
              reg113 <= reg112[(4'ha):(4'ha)];
              reg114 <= $signed(((($unsigned(reg112) ?
                          $signed(reg111) : (reg106 ? reg110 : reg112)) ?
                      reg112[(1'h0):(1'h0)] : reg108) ?
                  wire105 : ({(|reg110),
                      $signed(wire99)} > (reg110[(3'h5):(3'h4)] ~^ (wire102 ?
                      wire99 : reg109)))));
              reg115 <= (~|wire104);
            end
          else
            begin
              reg111 <= ($unsigned((wire100 ?
                  (~^$signed(reg111)) : $signed((wire104 < wire100)))) > $unsigned((wire104 ?
                  ({reg107} ? wire102 : (+(8'ha9))) : wire100[(3'h6):(3'h5)])));
              reg112 <= reg109;
            end
        end
    end
  assign wire116 = (-$signed($signed(((wire101 ? wire100 : reg110) ?
                       ((8'hbc) && wire103) : (~^reg115)))));
  assign wire117 = $signed((^~$signed($signed(reg114))));
  assign wire118 = reg115;
  assign wire119 = {{(+wire102)}};
  assign wire120 = (|wire103[(1'h1):(1'h0)]);
  assign wire121 = (reg112 ?
                       ({(^$signed(wire119)),
                               $signed((wire117 ? (8'ha6) : wire104))} ?
                           $unsigned(wire103) : wire105) : wire104);
  assign wire122 = $unsigned((~&reg109));
endmodule
