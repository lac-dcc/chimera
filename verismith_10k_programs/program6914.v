module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h178):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire181;
  wire [(4'h9):(1'h0)] wire180;
  wire signed [(5'h15):(1'h0)] wire179;
  wire signed [(2'h2):(1'h0)] wire173;
  wire [(3'h6):(1'h0)] wire172;
  wire signed [(2'h2):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire signed [(2'h3):(1'h0)] wire168;
  wire [(5'h10):(1'h0)] wire154;
  wire [(5'h11):(1'h0)] wire152;
  wire signed [(5'h10):(1'h0)] wire89;
  wire [(5'h15):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire92;
  wire [(5'h12):(1'h0)] wire150;
  reg [(4'hd):(1'h0)] reg178 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg177 = (1'h0);
  reg [(2'h2):(1'h0)] reg176 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg175 = (1'h0);
  reg [(4'hf):(1'h0)] reg174 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg167 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg166 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg165 = (1'h0);
  reg [(5'h14):(1'h0)] reg164 = (1'h0);
  reg [(4'hc):(1'h0)] reg163 = (1'h0);
  reg [(2'h2):(1'h0)] reg162 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg161 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg160 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg158 = (1'h0);
  reg [(4'he):(1'h0)] reg157 = (1'h0);
  reg [(3'h4):(1'h0)] reg156 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg155 = (1'h0);
  assign y = {wire181,
                 wire180,
                 wire179,
                 wire173,
                 wire172,
                 wire170,
                 wire169,
                 wire168,
                 wire154,
                 wire152,
                 wire89,
                 wire91,
                 wire92,
                 wire150,
                 reg178,
                 reg177,
                 reg176,
                 reg175,
                 reg174,
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
                 (1'h0)};
  module4 #() modinst90 (.wire9(wire1), .wire8(wire0), .wire7(wire2), .y(wire89), .clk(clk), .wire6(wire3), .wire5((8'hbc)));
  assign wire91 = ((wire0 ?
                          ($signed(wire1[(1'h0):(1'h0)]) ?
                              $unsigned(wire89) : $signed(wire89)) : (-$signed((|wire3)))) ?
                      ($signed(({wire89} ?
                          $unsigned((8'h9d)) : wire1)) ^~ $unsigned($signed($signed(wire1)))) : (((7'h41) >>> ($signed(wire2) ^ ((8'hbb) ?
                          wire1 : wire2))) >>> ((^~{wire0}) ?
                          $unsigned(wire1[(4'hf):(4'hb)]) : (^$signed(wire1)))));
  assign wire92 = wire1[(4'hb):(2'h3)];
  module93 #() modinst151 (.y(wire150), .wire94(wire1), .wire97(wire92), .clk(clk), .wire96(wire2), .wire95(wire0), .wire98(wire3));
  module18 #() modinst153 (.clk(clk), .wire21(wire0), .wire19(wire3), .wire22(wire91), .y(wire152), .wire20(wire92));
  assign wire154 = $signed((wire92[(4'h9):(1'h0)] ?
                       (^~wire150[(4'h8):(1'h0)]) : (wire152 <= ((wire3 ?
                           wire2 : wire91) <<< (wire152 && wire2)))));
  always
    @(posedge clk) begin
      reg155 <= $signed(($unsigned($unsigned($signed((8'h9e)))) ?
          wire0[(3'h4):(1'h0)] : (+$unsigned((~wire154)))));
      if (($signed($unsigned($unsigned({(8'haf)}))) - {$signed((~&(wire150 ?
              wire154 : wire152))),
          wire92}))
        begin
          reg156 <= $unsigned(wire150[(1'h0):(1'h0)]);
          reg157 <= $unsigned((~|wire1[(2'h2):(2'h2)]));
        end
      else
        begin
          reg156 <= wire154;
          reg157 <= {$signed(wire92),
              (wire0[(2'h2):(1'h1)] ^~ ($unsigned((-reg156)) > (wire0[(2'h3):(1'h1)] ?
                  (&wire92) : wire3[(4'hf):(1'h1)])))};
          reg158 <= (8'haa);
          reg159 <= $unsigned(wire92[(4'hf):(4'hb)]);
          if ({$unsigned({wire3[(5'h10):(4'he)], $signed(reg158)}),
              (+$unsigned($signed(wire3[(2'h3):(2'h2)])))})
            begin
              reg160 <= ((-($signed(wire154[(3'h4):(2'h2)]) && wire92)) && ($unsigned((~&reg159[(5'h11):(4'ha)])) ?
                  ({$signed(wire92)} ?
                      ($signed(reg157) * wire91[(4'h8):(3'h6)]) : reg158[(3'h7):(2'h3)]) : $signed($signed((reg157 ?
                      wire1 : reg156)))));
              reg161 <= $signed(wire92[(1'h1):(1'h0)]);
              reg162 <= {((wire0[(2'h3):(2'h3)] ?
                          (!(wire89 >= reg159)) : reg155[(1'h1):(1'h1)]) ?
                      (wire0 == ((^reg156) ^ $unsigned(reg158))) : $unsigned($signed((wire89 <= reg161)))),
                  $signed($unsigned(wire91))};
              reg163 <= ((^((wire0[(4'he):(3'h6)] || {wire154}) + {(~&reg157)})) <= (wire0[(4'h8):(4'h8)] <<< $signed((wire92[(4'he):(3'h7)] ~^ (reg159 < wire3)))));
              reg164 <= ((wire152 <= {$signed($unsigned(wire89))}) ?
                  {($signed($signed(reg155)) ?
                          $unsigned((7'h40)) : (reg158 + {reg160})),
                      $signed($unsigned(wire91))} : ($unsigned($signed(wire3[(4'h8):(2'h2)])) ?
                      wire0[(5'h10):(1'h0)] : ($unsigned($signed(wire3)) ?
                          (reg156 & $signed(reg160)) : $unsigned($signed(wire91)))));
            end
          else
            begin
              reg160 <= (8'hba);
              reg161 <= wire92[(5'h10):(4'h9)];
            end
        end
    end
  always
    @(posedge clk) begin
      reg165 <= $unsigned(((reg160 ~^ (^~$signed(reg164))) ?
          (~&$unsigned(reg156)) : wire150[(2'h2):(2'h2)]));
      reg166 <= wire89[(5'h10):(4'he)];
      reg167 <= ({wire92[(4'hb):(2'h3)], wire92} ?
          reg162[(2'h2):(2'h2)] : wire2[(4'ha):(4'h9)]);
    end
  assign wire168 = reg165;
  assign wire169 = (reg158[(1'h1):(1'h0)] ? reg156 : reg156);
  module69 #() modinst171 (wire170, clk, reg161, wire89, reg158, wire2);
  assign wire172 = (8'hac);
  assign wire173 = (~^(wire3 ? $signed((8'ha8)) : wire1[(2'h3):(2'h3)]));
  always
    @(posedge clk) begin
      if ((wire0 & {(wire168 ? wire172[(1'h0):(1'h0)] : reg161[(3'h6):(2'h3)]),
          ($signed($unsigned(wire89)) ?
              (~^reg161[(3'h4):(2'h2)]) : (~$signed(reg164)))}))
        begin
          reg174 <= $signed($unsigned($signed(wire3)));
          reg175 <= (!(wire150[(2'h3):(2'h2)] | ((!wire169) <<< reg157)));
          reg176 <= {reg161[(2'h3):(2'h3)], wire152[(4'hb):(3'h6)]};
          reg177 <= $signed($signed(({(wire170 ^ wire169)} ?
              wire89[(4'hc):(3'h5)] : $signed({wire169}))));
          reg178 <= {$unsigned($unsigned($unsigned($unsigned(reg174))))};
        end
      else
        begin
          reg174 <= (~^(wire2[(1'h0):(1'h0)] ?
              (((reg162 & wire150) <<< (|wire3)) ?
                  $signed($signed(wire89)) : $signed({reg159,
                      (8'ha2)})) : (|(~$unsigned(reg166)))));
          reg175 <= wire172;
        end
    end
  assign wire179 = reg178[(4'hb):(4'ha)];
  assign wire180 = {wire0[(1'h0):(1'h0)]};
  assign wire181 = $unsigned(($unsigned((^(reg176 ? reg160 : reg161))) ?
                       $unsigned((^~(wire91 ?
                           reg175 : wire3))) : $unsigned(wire0[(4'he):(3'h7)])));
endmodule

module module93
#(parameter param148 = (8'hb3), 
parameter param149 = ({(({param148, param148} > param148) ? param148 : ((param148 ? param148 : param148) ? (param148 != param148) : (param148 ^~ param148)))} ? ((8'hb7) ? (^~param148) : (^((param148 ^~ param148) != (~|param148)))) : {((~&(&(8'haf))) ? ((param148 << param148) ? (param148 >= param148) : (param148 ? param148 : param148)) : ((~param148) ? (param148 ~^ param148) : param148)), param148}))
(y, clk, wire98, wire97, wire96, wire95, wire94);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire98;
  input wire [(4'hd):(1'h0)] wire97;
  input wire [(4'ha):(1'h0)] wire96;
  input wire signed [(4'he):(1'h0)] wire95;
  input wire [(4'he):(1'h0)] wire94;
  wire signed [(5'h10):(1'h0)] wire147;
  wire [(4'hc):(1'h0)] wire146;
  wire signed [(5'h14):(1'h0)] wire145;
  wire signed [(5'h10):(1'h0)] wire144;
  wire signed [(3'h4):(1'h0)] wire143;
  wire signed [(4'hf):(1'h0)] wire142;
  wire [(2'h2):(1'h0)] wire141;
  wire signed [(4'h8):(1'h0)] wire139;
  assign y = {wire147,
                 wire146,
                 wire145,
                 wire144,
                 wire143,
                 wire142,
                 wire141,
                 wire139,
                 (1'h0)};
  module99 #() modinst140 (wire139, clk, wire98, wire96, wire94, wire95);
  assign wire141 = $signed($signed((wire139 ?
                       wire98[(4'h8):(3'h7)] : (((8'ha9) <= wire95) ?
                           wire97 : wire139[(3'h6):(2'h2)]))));
  assign wire142 = $signed({wire97});
  assign wire143 = $signed((wire96[(1'h1):(1'h1)] * (~&$unsigned(wire94))));
  assign wire144 = ((wire97 ?
                       $unsigned(($unsigned(wire139) <<< $signed(wire95))) : $unsigned((8'ha1))) >>> (~$signed($signed($unsigned(wire95)))));
  assign wire145 = wire95[(4'h9):(2'h2)];
  assign wire146 = $unsigned(wire96);
  assign wire147 = wire97[(2'h3):(2'h2)];
endmodule

module module4
#(parameter param88 = ({(^~(((8'ha0) + (7'h40)) ? ((8'ha8) ? (8'h9e) : (8'haa)) : {(8'hbf)}))} <= (~|{((+(8'ha4)) <<< (7'h41))})))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h1dc):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h9):(1'h0)] wire9;
  input wire signed [(4'hf):(1'h0)] wire8;
  input wire signed [(4'h8):(1'h0)] wire7;
  input wire signed [(3'h6):(1'h0)] wire6;
  input wire signed [(5'h11):(1'h0)] wire5;
  wire [(4'hf):(1'h0)] wire87;
  wire signed [(2'h2):(1'h0)] wire86;
  wire [(5'h15):(1'h0)] wire85;
  wire signed [(4'h9):(1'h0)] wire84;
  wire [(4'he):(1'h0)] wire83;
  wire [(2'h2):(1'h0)] wire82;
  wire [(2'h3):(1'h0)] wire81;
  wire signed [(4'hb):(1'h0)] wire79;
  wire [(4'hc):(1'h0)] wire53;
  wire signed [(2'h2):(1'h0)] wire50;
  wire [(5'h12):(1'h0)] wire49;
  wire [(5'h13):(1'h0)] wire48;
  wire signed [(4'hf):(1'h0)] wire46;
  wire [(4'hc):(1'h0)] wire17;
  wire signed [(5'h14):(1'h0)] wire16;
  wire [(5'h12):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire signed [(4'he):(1'h0)] wire13;
  wire signed [(3'h7):(1'h0)] wire12;
  wire signed [(5'h13):(1'h0)] wire11;
  wire signed [(5'h14):(1'h0)] wire10;
  reg [(3'h7):(1'h0)] reg68 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg67 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg66 = (1'h0);
  reg [(3'h6):(1'h0)] reg65 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg64 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg63 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg62 = (1'h0);
  reg [(4'hf):(1'h0)] reg61 = (1'h0);
  reg [(4'hf):(1'h0)] reg60 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg59 = (1'h0);
  reg [(4'hb):(1'h0)] reg58 = (1'h0);
  reg [(4'hd):(1'h0)] reg57 = (1'h0);
  reg [(2'h2):(1'h0)] reg56 = (1'h0);
  reg [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(4'hd):(1'h0)] reg54 = (1'h0);
  reg [(4'hb):(1'h0)] reg52 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg51 = (1'h0);
  assign y = {wire87,
                 wire86,
                 wire85,
                 wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire79,
                 wire53,
                 wire50,
                 wire49,
                 wire48,
                 wire46,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 reg68,
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
                 reg52,
                 reg51,
                 (1'h0)};
  assign wire10 = (wire7 ? wire9[(4'h9):(4'h9)] : wire7);
  assign wire11 = (|($unsigned((~&(~|wire9))) ^ (~^wire6)));
  assign wire12 = (+$signed(((^~((8'ha3) <= wire10)) >= $unsigned($signed(wire7)))));
  assign wire13 = (|(wire6[(2'h3):(1'h0)] ?
                      (~^$unsigned($signed(wire10))) : $signed({(wire7 ?
                              wire10 : wire8),
                          (wire9 <= wire8)})));
  assign wire14 = $signed((8'ha4));
  assign wire15 = ((~|($signed((wire13 | (8'hb2))) >= (^$signed((8'hb6))))) ?
                      wire8 : $signed(($signed($signed(wire5)) ?
                          $unsigned({(8'ha2)}) : $signed(wire8))));
  assign wire16 = (wire10[(1'h1):(1'h1)] ? wire11[(4'hc):(3'h6)] : (8'hb2));
  assign wire17 = (wire10[(1'h0):(1'h0)] >>> ((((8'hb1) >> $unsigned((8'hb8))) ?
                          wire15 : ($signed((8'h9d)) ?
                              (wire7 ? (8'hbb) : wire12) : wire8)) ?
                      $unsigned(wire16) : (|wire16[(4'hb):(4'h8)])));
  module18 #() modinst47 (.wire20(wire11), .y(wire46), .clk(clk), .wire19(wire10), .wire22(wire17), .wire21(wire8));
  assign wire48 = {(~wire8), wire46[(3'h7):(1'h1)]};
  assign wire49 = (!($signed((wire46 == {wire11, wire10})) ?
                      wire7[(4'h8):(2'h2)] : wire48));
  assign wire50 = ($signed((+wire10[(2'h3):(2'h2)])) + $signed(wire16));
  always
    @(posedge clk) begin
      reg51 <= (wire8[(3'h7):(1'h0)] < $signed(wire17[(1'h0):(1'h0)]));
      reg52 <= (((8'ha4) ?
              $unsigned(wire48) : (wire10[(4'hb):(4'hb)] ?
                  ((wire11 > (8'had)) <= (reg51 ?
                      wire12 : wire14)) : {(~&wire8), (wire6 >>> wire7)})) ?
          $unsigned(wire8) : wire14);
    end
  assign wire53 = (^wire17);
  always
    @(posedge clk) begin
      if ({reg51, wire11})
        begin
          if (wire9)
            begin
              reg54 <= ($signed(wire5[(4'hb):(3'h6)]) ?
                  $unsigned(((8'hbf) ?
                      wire9[(3'h4):(1'h0)] : $unsigned(wire53))) : $unsigned(wire11));
              reg55 <= (8'had);
              reg56 <= ({(($unsigned(wire15) - (wire8 & wire10)) && {wire16[(5'h12):(3'h5)],
                          ((8'haf) ^~ wire5)})} ?
                  $signed(reg54[(1'h1):(1'h0)]) : wire46[(2'h3):(1'h1)]);
              reg57 <= ({$unsigned(wire12)} ?
                  $signed(((wire48[(4'h8):(3'h5)] == (~wire9)) ?
                      (reg55 ?
                          wire17[(1'h0):(1'h0)] : ((8'h9d) ?
                              (8'hbd) : wire13)) : ((reg54 ?
                          reg56 : wire11) | $unsigned(reg56)))) : $signed($signed(reg56)));
              reg58 <= (8'hae);
            end
          else
            begin
              reg54 <= (!((8'ha9) ? wire13[(3'h4):(2'h3)] : reg52));
              reg55 <= ((((wire8 >= $unsigned(wire8)) >> reg57) >>> $unsigned($unsigned((~|wire12)))) != wire11[(5'h13):(4'h9)]);
              reg56 <= $signed($unsigned($unsigned(wire13[(3'h7):(2'h3)])));
              reg57 <= $signed(($signed((|(~&wire12))) ?
                  ((wire13 - $unsigned(wire15)) ?
                      (wire49[(4'he):(4'hb)] <= {reg57}) : {wire50}) : (~|wire13[(3'h6):(3'h6)])));
              reg58 <= ($unsigned((~^$unsigned((8'h9c)))) * $signed(reg57[(4'h8):(1'h0)]));
            end
          reg59 <= (wire9[(3'h6):(2'h2)] + (~&$signed((8'ha8))));
          reg60 <= (($signed(((wire48 << wire53) ?
              {(8'ha8),
                  wire9} : wire8)) > wire10) + (($unsigned((reg54 != reg56)) ^~ {wire9}) ?
              (!reg56) : $signed((wire13 ? $signed(reg59) : (reg54 * wire6)))));
          if ($signed(wire48))
            begin
              reg61 <= reg55[(2'h2):(2'h2)];
              reg62 <= ({$signed((+((8'ha7) ? (8'hb8) : reg51))),
                      ($unsigned($signed(reg56)) ?
                          $unsigned(wire11) : reg61[(3'h4):(1'h1)])} ?
                  (^~{(|wire11)}) : $signed((((~|wire5) ?
                          {reg54, wire46} : $signed(reg61)) ?
                      {$unsigned((8'hae))} : $signed((^wire53)))));
            end
          else
            begin
              reg61 <= ((reg62[(4'h9):(2'h2)] >> reg54[(3'h5):(2'h2)]) ?
                  ($unsigned(wire14) ?
                      (^~$unsigned({reg54,
                          wire14})) : $signed(wire17[(1'h0):(1'h0)])) : $signed($signed(reg56)));
              reg62 <= (&($signed(({reg51} ?
                  (reg55 & (8'hac)) : $unsigned(wire48))) != ($unsigned((reg55 ?
                  reg58 : reg54)) || wire6)));
              reg63 <= $signed($unsigned(((~&(reg55 != reg52)) ?
                  ((-wire10) >> wire48[(4'hf):(4'h8)]) : (+$signed(wire5)))));
              reg64 <= $unsigned(reg56);
              reg65 <= reg62;
            end
        end
      else
        begin
          if (wire13[(3'h6):(1'h1)])
            begin
              reg54 <= ((($unsigned($signed(wire11)) && wire10) ?
                      {(wire50[(2'h2):(1'h1)] <= $unsigned(reg65))} : $signed((~&$unsigned((8'hbf))))) ?
                  reg54 : ({(+(reg55 <<< (8'h9c))),
                      $unsigned({reg58, reg52})} == wire46[(4'ha):(3'h6)]));
            end
          else
            begin
              reg54 <= wire10;
              reg55 <= $unsigned(({$unsigned(reg57)} <= wire48));
            end
          if ((^((wire9 ^ $unsigned($signed((8'hb9)))) >= (~reg57))))
            begin
              reg56 <= $unsigned(((~(wire13 > {reg59, reg64})) | wire15));
              reg57 <= {{$signed(reg57)},
                  ({reg60[(4'hb):(2'h3)]} + wire10[(3'h6):(3'h4)])};
              reg58 <= wire46[(4'h9):(1'h1)];
              reg59 <= wire16;
              reg60 <= (|wire7);
            end
          else
            begin
              reg56 <= $signed($unsigned((~|((^~reg57) ?
                  (wire50 ? wire13 : wire17) : ((8'hbd) << wire50)))));
              reg57 <= wire8;
              reg58 <= $signed((wire10 || $unsigned($unsigned((reg60 || reg51)))));
              reg59 <= (reg62 <<< $signed($unsigned($signed($signed(wire16)))));
              reg60 <= wire15;
            end
          reg61 <= (($unsigned(wire16) ?
              $unsigned($unsigned($signed((8'h9d)))) : wire17) | reg57);
        end
      reg66 <= (~^wire6[(1'h1):(1'h0)]);
      reg67 <= $signed(($unsigned(wire49[(4'hf):(4'ha)]) > $unsigned(($signed(reg60) ?
          wire9 : (reg57 ? wire7 : wire53)))));
      reg68 <= $signed(((!$unsigned(((8'ha1) >> wire11))) || $unsigned(wire9)));
    end
  module69 #() modinst80 (.wire71(reg68), .wire72(reg67), .wire73(wire11), .clk(clk), .wire70(wire13), .y(wire79));
  assign wire81 = $signed(reg62[(1'h0):(1'h0)]);
  assign wire82 = wire50;
  assign wire83 = (((~^{$unsigned(reg59),
                          (~|wire13)}) >>> {(-reg59[(4'hf):(3'h5)])}) ?
                      {wire7[(3'h6):(3'h4)]} : wire15[(1'h0):(1'h0)]);
  assign wire84 = ((|$signed((8'hb1))) || wire81[(2'h3):(1'h1)]);
  assign wire85 = (^(|{($signed(wire82) ? {reg61} : wire79)}));
  assign wire86 = reg67[(4'he):(4'hd)];
  assign wire87 = {wire53[(3'h7):(3'h6)]};
endmodule

module module69
#(parameter param78 = ({(~&(!(~(8'haa)))), (^(((8'hac) ? (8'ha2) : (8'ha0)) ? ((8'had) < (8'ha4)) : ((8'h9f) ? (7'h41) : (7'h44))))} ? (^~((^(-(8'ha4))) ^ (^((8'hbb) || (8'ha8))))) : (8'ha1)))
(y, clk, wire73, wire72, wire71, wire70);
  output wire [(32'h33):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire73;
  input wire [(5'h10):(1'h0)] wire72;
  input wire signed [(3'h6):(1'h0)] wire71;
  input wire [(4'he):(1'h0)] wire70;
  wire [(2'h2):(1'h0)] wire77;
  wire [(5'h11):(1'h0)] wire76;
  wire [(4'ha):(1'h0)] wire75;
  wire [(5'h15):(1'h0)] wire74;
  assign y = {wire77, wire76, wire75, wire74, (1'h0)};
  assign wire74 = wire72[(1'h1):(1'h1)];
  assign wire75 = $unsigned((~wire73[(2'h3):(1'h0)]));
  assign wire76 = (8'hb2);
  assign wire77 = (~^wire74[(4'hd):(2'h3)]);
endmodule

module module18
#(parameter param44 = (({{(8'ha9), ((8'ha0) ? (8'hb3) : (8'haf))}, (((8'hb5) & (8'h9f)) ? (!(8'hb1)) : (8'hac))} ? ((~|((8'h9d) ? (7'h44) : (8'h9f))) ? (!((8'h9e) - (8'hac))) : {(^(8'hb8)), {(8'h9f), (8'had)}}) : (8'ha2)) ? (!(8'haa)) : (((~&{(8'hbd), (8'haf)}) ? ((~|(8'ha5)) ? (+(8'hb5)) : (~|(8'ha1))) : (((8'ha5) > (8'hbd)) && ((8'ha5) >> (8'ha4)))) << ((((8'ha1) | (8'hbd)) ~^ ((8'haa) ? (8'ha6) : (8'haf))) == (-((8'had) < (8'hb2)))))), 
parameter param45 = ({(-param44)} ? param44 : (~(~&((&param44) ^~ (!(8'ha3)))))))
(y, clk, wire22, wire21, wire20, wire19);
  output wire [(32'hfa):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h5):(1'h0)] wire22;
  input wire signed [(4'hb):(1'h0)] wire21;
  input wire signed [(4'h8):(1'h0)] wire20;
  input wire [(5'h14):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire43;
  wire signed [(4'ha):(1'h0)] wire42;
  wire signed [(4'h9):(1'h0)] wire41;
  wire [(5'h12):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire [(5'h14):(1'h0)] wire38;
  wire [(5'h15):(1'h0)] wire37;
  wire [(3'h5):(1'h0)] wire36;
  wire [(3'h5):(1'h0)] wire35;
  wire [(5'h13):(1'h0)] wire34;
  wire signed [(5'h13):(1'h0)] wire33;
  wire [(4'h8):(1'h0)] wire30;
  wire [(4'ha):(1'h0)] wire29;
  wire [(2'h3):(1'h0)] wire28;
  wire [(5'h15):(1'h0)] wire27;
  wire [(2'h3):(1'h0)] wire26;
  wire [(2'h3):(1'h0)] wire25;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire23;
  reg signed [(5'h12):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  assign y = {wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire24,
                 wire23,
                 reg32,
                 reg31,
                 (1'h0)};
  assign wire23 = (~&(~|$signed(((wire19 * wire21) ?
                      $unsigned(wire19) : wire19[(3'h4):(2'h2)]))));
  assign wire24 = $unsigned((~^wire21[(4'h9):(2'h3)]));
  assign wire25 = ((~{$unsigned(wire20[(3'h6):(3'h4)]), (-$signed((8'ha2)))}) ?
                      wire20[(3'h6):(3'h6)] : (~&((wire20 ?
                              wire24[(3'h7):(3'h7)] : (^wire21)) ?
                          (wire23 >> wire21) : {(wire23 && wire23)})));
  assign wire26 = {wire21[(3'h7):(3'h4)]};
  assign wire27 = wire23;
  assign wire28 = ((($unsigned((8'hb8)) ?
                          (7'h40) : ((&wire23) ?
                              $signed(wire20) : $unsigned(wire21))) || wire19[(3'h4):(1'h0)]) ?
                      ((8'h9f) ?
                          $unsigned($signed($signed(wire21))) : ($signed($signed((8'ha4))) <<< ($signed(wire19) < (7'h41)))) : (wire22[(3'h4):(1'h1)] == $signed(wire26[(2'h3):(2'h3)])));
  assign wire29 = {wire26[(2'h3):(1'h0)], wire21};
  assign wire30 = (wire21[(3'h5):(3'h4)] ? (&(^~$signed((-wire20)))) : wire28);
  always
    @(posedge clk) begin
      reg31 <= ($unsigned(wire28[(2'h2):(1'h0)]) >>> $signed(wire29[(4'h8):(1'h1)]));
      reg32 <= wire30;
    end
  assign wire33 = (^$unsigned($unsigned(((~|wire20) ? (+wire28) : (&wire27)))));
  assign wire34 = $unsigned(reg31[(1'h1):(1'h0)]);
  assign wire35 = wire25;
  assign wire36 = $signed((wire29 ?
                      (($unsigned(wire22) ?
                          {wire21,
                              wire24} : $signed(wire29)) || {(~^wire34)}) : wire23));
  assign wire37 = $unsigned(((8'hba) ?
                      $signed($signed((wire21 ? wire30 : wire28))) : wire28));
  assign wire38 = (&(wire37[(2'h3):(1'h0)] ?
                      reg31 : $signed(wire22[(3'h4):(1'h0)])));
  assign wire39 = {$signed(((-((8'hb1) ? wire35 : (8'hba))) ?
                          $unsigned(((7'h40) ?
                              wire19 : wire22)) : (reg31[(1'h1):(1'h0)] ?
                              $unsigned(wire24) : wire26))),
                      $unsigned($signed({wire36}))};
  assign wire40 = (~&wire34);
  assign wire41 = (wire20 ~^ $signed(reg31[(1'h1):(1'h0)]));
  assign wire42 = (~^$unsigned((8'h9d)));
  assign wire43 = ({reg32} ?
                      (^$signed({wire21[(4'h8):(1'h1)]})) : $signed(({(^wire21),
                          {wire24, wire23}} && ((wire34 ?
                          (8'haf) : wire19) == $signed((8'hb8))))));
endmodule

module module99
#(parameter param138 = {(~^(+{((7'h43) * (8'hb1))}))})
(y, clk, wire103, wire102, wire101, wire100);
  output wire [(32'h1ab):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire103;
  input wire signed [(4'ha):(1'h0)] wire102;
  input wire signed [(2'h2):(1'h0)] wire101;
  input wire signed [(4'h8):(1'h0)] wire100;
  wire [(4'hd):(1'h0)] wire120;
  wire [(5'h14):(1'h0)] wire119;
  wire [(5'h11):(1'h0)] wire118;
  wire [(5'h15):(1'h0)] wire117;
  wire [(4'hf):(1'h0)] wire116;
  wire signed [(5'h10):(1'h0)] wire115;
  wire signed [(3'h5):(1'h0)] wire114;
  wire [(5'h11):(1'h0)] wire113;
  wire [(4'hf):(1'h0)] wire112;
  wire [(5'h13):(1'h0)] wire111;
  wire [(5'h10):(1'h0)] wire110;
  wire signed [(3'h5):(1'h0)] wire109;
  wire [(4'h9):(1'h0)] wire108;
  wire [(3'h6):(1'h0)] wire107;
  wire [(3'h5):(1'h0)] wire106;
  wire signed [(5'h10):(1'h0)] wire105;
  wire signed [(4'ha):(1'h0)] wire104;
  reg [(3'h4):(1'h0)] reg137 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg134 = (1'h0);
  reg [(5'h13):(1'h0)] reg133 = (1'h0);
  reg [(4'h9):(1'h0)] reg132 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg131 = (1'h0);
  reg [(3'h7):(1'h0)] reg130 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg129 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg128 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg127 = (1'h0);
  reg [(4'he):(1'h0)] reg126 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg125 = (1'h0);
  reg [(5'h11):(1'h0)] reg124 = (1'h0);
  reg [(4'ha):(1'h0)] reg123 = (1'h0);
  reg [(5'h10):(1'h0)] reg122 = (1'h0);
  reg [(4'h9):(1'h0)] reg121 = (1'h0);
  assign y = {wire120,
                 wire119,
                 wire118,
                 wire117,
                 wire116,
                 wire115,
                 wire114,
                 wire113,
                 wire112,
                 wire111,
                 wire110,
                 wire109,
                 wire108,
                 wire107,
                 wire106,
                 wire105,
                 wire104,
                 reg137,
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
                 reg121,
                 (1'h0)};
  assign wire104 = $unsigned(({($unsigned(wire101) >>> (!wire100))} ?
                       wire100 : wire100[(2'h2):(1'h0)]));
  assign wire105 = wire101[(1'h1):(1'h0)];
  assign wire106 = $signed(wire102[(2'h3):(2'h2)]);
  assign wire107 = (wire104 ?
                       (8'hb8) : ((&((8'ha5) ?
                           $unsigned(wire103) : (wire106 ?
                               wire106 : wire101))) ^ $signed(wire101[(1'h0):(1'h0)])));
  assign wire108 = ({$unsigned(((~&(8'ha2)) ?
                           (~^wire106) : {wire102, wire105})),
                       (~&$signed(wire105))} * (wire103[(4'hb):(1'h1)] >> wire101[(1'h1):(1'h0)]));
  assign wire109 = ($signed(wire102[(3'h5):(3'h4)]) <<< ({wire103[(3'h7):(3'h4)],
                       (|wire107)} + wire100));
  assign wire110 = ($unsigned({(~^wire102[(1'h1):(1'h1)])}) <<< (-((wire102 <= wire105) ?
                       {wire108[(3'h4):(2'h2)]} : wire101)));
  assign wire111 = (8'ha1);
  assign wire112 = $unsigned($unsigned(($signed($unsigned(wire100)) == (^~wire100))));
  assign wire113 = (8'hb6);
  assign wire114 = {$unsigned($unsigned(wire107[(2'h2):(1'h0)])),
                       (!(((+wire107) ?
                               $signed(wire103) : ((7'h41) ?
                                   wire101 : wire107)) ?
                           (|wire108[(2'h3):(1'h0)]) : $signed((^~wire108))))};
  assign wire115 = $signed(wire101);
  assign wire116 = {(7'h43),
                       ((^wire111[(4'h9):(1'h0)]) ?
                           (-(wire109[(1'h0):(1'h0)] ?
                               wire102 : (wire104 ?
                                   wire114 : wire110))) : {(wire111 < {wire112}),
                               wire114})};
  assign wire117 = $unsigned(wire116);
  assign wire118 = (wire101[(1'h1):(1'h1)] == wire114);
  assign wire119 = ((($signed({wire113}) ? $unsigned(wire104) : (^{wire107})) ?
                           $signed(wire107) : $unsigned($signed($unsigned(wire108)))) ?
                       wire107 : (!$unsigned(wire110[(4'hc):(2'h3)])));
  assign wire120 = (wire108[(1'h0):(1'h0)] << wire119[(4'ha):(1'h0)]);
  always
    @(posedge clk) begin
      reg121 <= $signed($signed((wire100 - $signed((|wire114)))));
      reg122 <= wire120;
      if ((~|(wire107 ? {$signed((reg122 ? wire101 : (7'h44)))} : wire102)))
        begin
          if (($signed($unsigned({(+wire109)})) * (wire114 ?
              (~&$unsigned((wire117 ?
                  wire118 : wire108))) : wire105[(1'h1):(1'h0)])))
            begin
              reg123 <= ({(|$signed((-wire119))),
                      ($unsigned($signed((8'ha4))) - $unsigned((-wire120)))} ?
                  ($unsigned($unsigned(wire108)) < $unsigned(((wire119 - wire103) <= (wire100 != wire103)))) : $signed(($unsigned({wire119}) ?
                      $unsigned($signed(wire112)) : (8'hbf))));
              reg124 <= wire110;
              reg125 <= ((8'hb6) ?
                  wire116[(2'h3):(1'h0)] : $signed((-wire120)));
              reg126 <= $unsigned({(~wire110)});
            end
          else
            begin
              reg123 <= $unsigned($signed(reg123[(4'h9):(3'h4)]));
            end
          reg127 <= $signed((^{$unsigned($signed(reg123)), (~&(~|wire113))}));
          if ({wire110})
            begin
              reg128 <= ((wire112[(3'h7):(1'h1)] << ($unsigned(((8'hb4) ?
                      wire109 : (8'hb5))) ?
                  reg125 : $signed((&wire119)))) & ($signed(((~^wire117) & wire118)) ^~ ({(8'ha5)} ?
                  (~(wire110 > wire101)) : ((~&wire104) ?
                      (wire107 || wire103) : $unsigned(wire104)))));
              reg129 <= (-reg122);
              reg130 <= reg121[(2'h2):(1'h0)];
              reg131 <= $signed(((((reg125 | wire111) ?
                          ((7'h40) ?
                              (8'hb7) : wire111) : reg124[(4'hc):(1'h1)]) ?
                      (+(&(8'hb6))) : reg124[(4'h9):(3'h7)]) ?
                  reg121[(1'h0):(1'h0)] : (((&reg129) ?
                      wire110 : (reg130 ?
                          wire110 : (8'ha3))) != wire111[(3'h7):(1'h1)])));
            end
          else
            begin
              reg128 <= (|(!$signed((+{(8'haa), (8'haa)}))));
              reg129 <= wire102[(3'h4):(3'h4)];
              reg130 <= ({reg122, $signed(((^wire107) << $unsigned(wire110)))} ?
                  ((8'hba) ? wire100[(2'h3):(2'h2)] : wire105) : (^(~^reg129)));
              reg131 <= wire112;
            end
          if (((wire116 ?
              reg131 : wire114) << $unsigned($signed($signed((!wire106))))))
            begin
              reg132 <= $unsigned((^~($signed(reg124) ~^ $signed((~^wire113)))));
              reg133 <= $unsigned($unsigned({(-$signed((8'hb2)))}));
              reg134 <= ({(!wire110[(4'hd):(3'h5)]), wire113} ?
                  {$signed(wire105)} : $unsigned($signed(wire101)));
            end
          else
            begin
              reg132 <= (^{$signed((8'hbf))});
              reg133 <= wire114;
              reg134 <= reg128;
              reg135 <= {{$signed(wire101), (8'ha9)}};
            end
          reg136 <= $signed(wire120[(4'ha):(3'h6)]);
        end
      else
        begin
          reg123 <= $signed((8'hb6));
          reg124 <= $unsigned(($unsigned($signed((wire102 <= wire109))) ?
              $signed($signed($signed(wire112))) : ((wire117[(5'h15):(3'h5)] ?
                  $unsigned(reg134) : $unsigned(wire117)) >= wire101[(2'h2):(1'h1)])));
        end
      reg137 <= ($unsigned(($unsigned({(8'hb6)}) ^ {$signed((7'h42))})) ?
          reg124 : ({(&$signed(wire102)),
                  {(wire104 ? reg135 : reg134), {wire100, reg125}}} ?
              (+$unsigned($signed(reg133))) : wire107[(1'h0):(1'h0)]));
    end
endmodule
