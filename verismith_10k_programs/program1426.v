module top
#(parameter param253 = {(-{({(8'hb2)} ? (^~(7'h41)) : (8'hbb)), (~^((8'hb5) <<< (8'ha1)))}), (7'h41)}, 
parameter param254 = ((((~&param253) ? ({param253, param253} <<< (|(8'had))) : param253) ? ({{param253}, (param253 ? param253 : param253)} >> (+param253)) : param253) ? (((param253 != param253) <<< ((8'ha5) >> (param253 ? param253 : param253))) ~^ param253) : (~^{((param253 - (8'hba)) ? ((8'hb5) ~^ param253) : (param253 <<< param253))})))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h267):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire [(5'h13):(1'h0)] wire1;
  input wire [(2'h3):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire252;
  wire signed [(4'hd):(1'h0)] wire245;
  wire signed [(4'hd):(1'h0)] wire244;
  wire signed [(2'h3):(1'h0)] wire243;
  wire [(5'h11):(1'h0)] wire241;
  wire [(3'h5):(1'h0)] wire215;
  wire signed [(5'h10):(1'h0)] wire214;
  wire signed [(5'h13):(1'h0)] wire205;
  wire signed [(2'h2):(1'h0)] wire204;
  wire [(4'he):(1'h0)] wire203;
  wire signed [(5'h14):(1'h0)] wire201;
  wire signed [(5'h15):(1'h0)] wire28;
  wire [(3'h6):(1'h0)] wire27;
  wire signed [(4'hf):(1'h0)] wire26;
  wire [(5'h10):(1'h0)] wire25;
  wire [(4'hd):(1'h0)] wire5;
  wire [(4'h8):(1'h0)] wire4;
  reg [(4'hb):(1'h0)] reg251 = (1'h0);
  reg [(4'hc):(1'h0)] reg250 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg249 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg248 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg247 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg246 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(2'h3):(1'h0)] reg23 = (1'h0);
  reg [(4'hc):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg21 = (1'h0);
  reg [(4'hc):(1'h0)] reg20 = (1'h0);
  reg [(4'h9):(1'h0)] reg19 = (1'h0);
  reg [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h14):(1'h0)] reg15 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg14 = (1'h0);
  reg [(4'hf):(1'h0)] reg13 = (1'h0);
  reg [(3'h5):(1'h0)] reg12 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg11 = (1'h0);
  reg [(2'h3):(1'h0)] reg10 = (1'h0);
  reg [(5'h10):(1'h0)] reg9 = (1'h0);
  reg [(5'h15):(1'h0)] reg8 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg7 = (1'h0);
  reg [(5'h10):(1'h0)] reg6 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg206 = (1'h0);
  reg [(5'h11):(1'h0)] reg207 = (1'h0);
  reg [(5'h13):(1'h0)] reg208 = (1'h0);
  reg [(3'h6):(1'h0)] reg209 = (1'h0);
  reg signed [(4'he):(1'h0)] reg210 = (1'h0);
  reg [(4'hc):(1'h0)] reg211 = (1'h0);
  reg [(4'hc):(1'h0)] reg212 = (1'h0);
  reg [(5'h15):(1'h0)] reg213 = (1'h0);
  assign y = {wire252,
                 wire245,
                 wire244,
                 wire243,
                 wire241,
                 wire215,
                 wire214,
                 wire205,
                 wire204,
                 wire203,
                 wire201,
                 wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire5,
                 wire4,
                 reg251,
                 reg250,
                 reg249,
                 reg248,
                 reg247,
                 reg246,
                 reg29,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg206,
                 reg207,
                 reg208,
                 reg209,
                 reg210,
                 reg211,
                 reg212,
                 reg213,
                 (1'h0)};
  assign wire4 = (~(~&{(^~$signed(wire1)), (+(wire0 ? wire1 : wire0))}));
  assign wire5 = ($signed((^~($signed(wire3) <= $signed(wire2)))) ?
                     {wire1,
                         {{wire1[(1'h0):(1'h0)]},
                             ((wire3 < wire2) ?
                                 $signed(wire3) : wire2[(3'h5):(2'h2)])}} : (8'hb3));
  always
    @(posedge clk) begin
      if ((wire0 << $signed({((wire3 * wire5) ? wire1 : (-(8'h9f)))})))
        begin
          reg6 <= (8'h9f);
          reg7 <= (({wire2} > reg6) ? $signed((8'ha6)) : wire0[(1'h1):(1'h0)]);
          reg8 <= (^~(wire3[(2'h3):(1'h0)] ?
              $signed($signed((wire0 <<< wire3))) : (((wire1 | reg6) >>> (8'hbd)) && wire4)));
          reg9 <= {$unsigned($signed(((reg7 ?
                  reg8 : wire4) != $unsigned(wire2)))),
              {(+$unsigned($unsigned(reg7)))}};
        end
      else
        begin
          reg6 <= (^((wire5 ? (|(wire0 << reg6)) : (wire5 == reg6)) ?
              (((!wire4) ? (^~reg7) : wire0[(2'h2):(1'h0)]) ?
                  reg7[(3'h4):(1'h0)] : ({wire3,
                      reg7} && wire1)) : (reg9[(1'h1):(1'h1)] ?
                  wire5 : (&(~reg7)))));
          if ((^~$signed(reg7[(1'h0):(1'h0)])))
            begin
              reg7 <= wire4;
              reg8 <= (((~|reg7) ?
                  wire4[(3'h6):(2'h2)] : (8'ha6)) * ($signed($unsigned((+wire5))) | {(reg8 ?
                      (wire5 * wire0) : (~^wire2)),
                  reg7[(2'h2):(1'h1)]}));
              reg9 <= (((((wire1 ? wire2 : wire1) ?
                              (reg7 ? wire3 : wire0) : (wire1 || wire2)) ?
                          ((~wire0) ? {reg9} : wire1) : wire5) ?
                      (wire4[(1'h1):(1'h0)] * wire1) : (($signed(reg8) ?
                              {reg7} : wire5) ?
                          $unsigned($signed(wire1)) : wire4[(3'h4):(1'h1)])) ?
                  $signed(((wire1 << (~&wire0)) ?
                      {(wire0 ? reg6 : wire1),
                          reg6[(1'h0):(1'h0)]} : reg8[(3'h4):(1'h0)])) : (+reg7[(3'h5):(1'h1)]));
            end
          else
            begin
              reg7 <= wire1[(3'h5):(3'h4)];
              reg8 <= (reg9 || {$signed((^$signed(wire2))),
                  $signed(reg6[(1'h0):(1'h0)])});
              reg9 <= $unsigned(wire0);
              reg10 <= ((~{reg7[(2'h3):(2'h2)], {$signed(reg6)}}) * wire3);
            end
        end
      if ((reg6 - $signed((reg8 + ((reg7 ? wire3 : wire3) & $signed(wire0))))))
        begin
          if ((^~reg7[(1'h0):(1'h0)]))
            begin
              reg11 <= $unsigned($unsigned(wire3[(3'h4):(1'h0)]));
              reg12 <= $unsigned(reg9[(3'h4):(3'h4)]);
              reg13 <= (wire1 ?
                  reg6 : (((~^(reg6 - reg6)) == $unsigned((wire3 ?
                      reg8 : (8'ha4)))) == (wire4 ?
                      ((wire3 == reg8) > ((8'ha7) | wire3)) : ((|reg10) ?
                          reg10[(2'h3):(2'h3)] : wire4))));
            end
          else
            begin
              reg11 <= (8'ha5);
            end
        end
      else
        begin
          if ((!reg9))
            begin
              reg11 <= $unsigned($signed((~^reg6[(2'h3):(1'h1)])));
              reg12 <= (^$signed({(~^(reg8 <<< reg12)), wire0}));
              reg13 <= (~^reg9[(2'h3):(1'h0)]);
              reg14 <= (^~(8'hb6));
            end
          else
            begin
              reg11 <= reg9[(3'h5):(3'h4)];
              reg12 <= reg13[(2'h3):(1'h1)];
            end
          reg15 <= $signed(wire4[(3'h7):(3'h4)]);
          reg16 <= ((^$unsigned((reg7 ~^ reg10))) <= $signed($signed(reg15[(4'hd):(3'h7)])));
        end
      if (((+{((+wire0) ~^ (~|reg16)), reg12}) | reg10))
        begin
          if (reg14)
            begin
              reg17 <= reg11;
              reg18 <= $unsigned($unsigned($signed(reg13)));
              reg19 <= {wire0[(2'h2):(2'h2)], $unsigned({reg9})};
            end
          else
            begin
              reg17 <= reg13[(3'h7):(1'h1)];
              reg18 <= $unsigned((8'ha1));
              reg19 <= reg16[(2'h3):(1'h1)];
              reg20 <= ((((^$signed(reg19)) == (~&$unsigned((8'hae)))) ?
                      {$signed({reg14, wire2})} : {{(reg18 * (8'hba))},
                          wire0[(2'h2):(1'h1)]}) ?
                  reg7 : (8'ha9));
            end
          reg21 <= (wire1[(5'h11):(3'h5)] ?
              (^reg20[(3'h6):(1'h0)]) : $unsigned((+($signed(wire3) ?
                  (!wire2) : reg20))));
          reg22 <= $signed($signed($unsigned(((~&reg11) != {reg19}))));
          reg23 <= reg21;
          reg24 <= $signed((reg14 ^~ (reg12[(1'h1):(1'h0)] ?
              reg22[(3'h4):(1'h0)] : (8'ha4))));
        end
      else
        begin
          reg17 <= ((($unsigned($signed(reg15)) ?
                      ($signed((8'h9d)) * (reg6 ?
                          (8'ha9) : reg11)) : $signed((&reg12))) ?
                  $unsigned(reg8) : reg8) ?
              (((!reg23) < $unsigned($unsigned(reg23))) ^ $signed($unsigned($unsigned(reg12)))) : (~|$unsigned($unsigned((wire3 ?
                  reg8 : (8'hbb))))));
          reg18 <= ((reg8[(3'h5):(1'h0)] ?
              $unsigned(({(8'ha4), (8'hbe)} ?
                  $unsigned(reg8) : (~|reg20))) : {$signed(reg11[(5'h11):(4'ha)])}) - wire1[(4'hd):(3'h6)]);
          reg19 <= wire5[(3'h7):(2'h3)];
          reg20 <= reg13[(4'hc):(3'h4)];
        end
    end
  assign wire25 = $unsigned($signed($unsigned(reg21)));
  assign wire26 = $unsigned(($signed((^~(reg15 ^~ (8'ha6)))) ?
                      ({(wire5 - reg7), $unsigned((8'ha3))} ?
                          wire1 : (~|$unsigned(reg9))) : (~&reg21[(4'he):(3'h6)])));
  assign wire27 = $signed(((reg18[(3'h5):(1'h0)] + {(~^reg6),
                      $signed((8'h9f))}) << wire26[(2'h2):(1'h1)]));
  assign wire28 = $unsigned((reg8[(2'h3):(1'h0)] ^ $signed((reg16 >>> reg10[(1'h1):(1'h1)]))));
  always
    @(posedge clk) begin
      reg29 <= wire1[(5'h10):(2'h2)];
    end
  module30 #() modinst202 (.y(wire201), .wire34(reg8), .clk(clk), .wire32(wire25), .wire31(reg6), .wire33(wire28), .wire35(reg9));
  assign wire203 = ($unsigned(($unsigned($unsigned((8'ha5))) ?
                       reg11 : reg11[(2'h3):(2'h3)])) | $unsigned(($unsigned(reg10) ?
                       (reg12 ? (8'ha2) : reg21) : (wire3 ^~ (~^reg13)))));
  assign wire204 = (8'hbb);
  assign wire205 = (($unsigned($unsigned(wire2)) << ((wire25 >> (~^reg18)) < (8'ha3))) ?
                       (~&(-(|$signed((8'ha1))))) : wire204[(1'h0):(1'h0)]);
  always
    @(posedge clk) begin
      if ((($unsigned((reg18[(3'h7):(3'h5)] ? (!reg7) : (~(8'ha7)))) ?
          reg17[(2'h2):(1'h1)] : (8'haf)) + (((^~(|reg24)) | wire2[(4'hc):(3'h7)]) ?
          $unsigned({wire5, {wire1}}) : {$unsigned(reg19[(3'h4):(2'h3)])})))
        begin
          reg206 <= $signed((~{reg6}));
          reg207 <= reg9[(2'h3):(2'h3)];
          reg208 <= reg8;
          reg209 <= (+reg206[(2'h2):(2'h2)]);
        end
      else
        begin
          reg206 <= ((|wire2) ?
              wire1 : ((^~($unsigned(wire0) ?
                      (-wire28) : reg10[(1'h1):(1'h0)])) ?
                  $signed(((~|reg9) ?
                      reg207[(4'hc):(3'h5)] : $unsigned(wire25))) : (((wire27 ?
                          reg7 : reg29) || $unsigned(reg15)) ?
                      reg18 : wire27)));
          reg207 <= (~|$unsigned(wire201[(1'h1):(1'h1)]));
          reg208 <= (reg13 >= $signed((|reg18)));
        end
      reg210 <= wire201;
      reg211 <= wire203;
    end
  always
    @(posedge clk) begin
      reg212 <= reg210[(3'h5):(3'h5)];
      reg213 <= {$unsigned($signed($unsigned((reg6 | reg10))))};
    end
  assign wire214 = (-(8'ha5));
  assign wire215 = $signed($signed(reg14[(3'h4):(3'h4)]));
  module216 #() modinst242 (.wire218(reg8), .wire219(reg208), .wire217(reg211), .y(wire241), .wire220(wire201), .clk(clk), .wire221(wire205));
  assign wire243 = reg8;
  assign wire244 = reg207[(2'h2):(1'h1)];
  assign wire245 = (reg21 > ((reg16[(5'h10):(4'h8)] ?
                       $unsigned((&(8'ha0))) : wire2[(4'hb):(4'h9)]) - wire2));
  always
    @(posedge clk) begin
      reg246 <= (^{wire0});
      reg247 <= (~&wire201);
      reg248 <= wire203[(4'hd):(4'hd)];
    end
  always
    @(posedge clk) begin
      reg249 <= wire28[(4'h8):(1'h0)];
      reg250 <= wire245[(2'h2):(2'h2)];
      reg251 <= ($unsigned((8'haf)) ?
          (wire5[(2'h3):(1'h0)] ~^ (|wire0[(2'h3):(1'h0)])) : ((~^$signed((wire204 + wire2))) > (-((reg249 ?
              wire204 : wire244) && wire25))));
    end
  assign wire252 = (8'ha1);
endmodule

module module216  (y, clk, wire221, wire220, wire219, wire218, wire217);
  output wire [(32'he1):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire221;
  input wire signed [(5'h14):(1'h0)] wire220;
  input wire signed [(5'h13):(1'h0)] wire219;
  input wire [(5'h15):(1'h0)] wire218;
  input wire signed [(4'hc):(1'h0)] wire217;
  wire signed [(5'h11):(1'h0)] wire240;
  wire [(3'h4):(1'h0)] wire239;
  wire signed [(4'he):(1'h0)] wire238;
  wire [(4'hb):(1'h0)] wire237;
  wire [(4'hd):(1'h0)] wire233;
  wire signed [(4'hf):(1'h0)] wire229;
  wire signed [(3'h5):(1'h0)] wire228;
  wire signed [(5'h14):(1'h0)] wire227;
  reg [(4'ha):(1'h0)] reg236 = (1'h0);
  reg [(4'he):(1'h0)] reg235 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg234 = (1'h0);
  reg [(4'he):(1'h0)] reg232 = (1'h0);
  reg [(5'h10):(1'h0)] reg231 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg230 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg226 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg225 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg224 = (1'h0);
  reg [(4'hf):(1'h0)] reg223 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg222 = (1'h0);
  assign y = {wire240,
                 wire239,
                 wire238,
                 wire237,
                 wire233,
                 wire229,
                 wire228,
                 wire227,
                 reg236,
                 reg235,
                 reg234,
                 reg232,
                 reg231,
                 reg230,
                 reg226,
                 reg225,
                 reg224,
                 reg223,
                 reg222,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg222 <= wire219[(4'hc):(4'ha)];
      reg223 <= wire218;
      reg224 <= (wire219[(5'h13):(1'h1)] >>> $unsigned(wire218));
      reg225 <= wire219;
      reg226 <= ((reg224 ?
          reg224[(2'h2):(1'h0)] : reg225) - reg225[(1'h1):(1'h1)]);
    end
  assign wire227 = (~^(+$unsigned(((reg223 ^~ wire220) ?
                       (|wire219) : $unsigned(reg222)))));
  assign wire228 = (~&$signed(($unsigned(wire219) ?
                       $unsigned((wire217 ? wire221 : reg223)) : ((wire221 ?
                           reg222 : wire219) >= (-wire217)))));
  assign wire229 = wire228;
  always
    @(posedge clk) begin
      reg230 <= wire218;
      reg231 <= {wire219[(4'hf):(3'h7)]};
      reg232 <= ($unsigned($signed((~|$signed(reg230)))) << wire220);
    end
  assign wire233 = wire227;
  always
    @(posedge clk) begin
      reg234 <= reg226;
      reg235 <= reg225[(3'h5):(3'h4)];
      reg236 <= ((8'h9f) ^~ wire233);
    end
  assign wire237 = {({((reg226 == reg225) ?
                               reg230[(4'h9):(3'h5)] : $signed((8'hba)))} ^ ($signed((wire217 ?
                           wire218 : reg223)) && $unsigned($signed((8'hac))))),
                       ((~|(8'haa)) ?
                           $signed(wire228[(3'h5):(3'h4)]) : ((~^reg223) * reg225))};
  assign wire238 = {$unsigned($signed((reg226[(1'h1):(1'h1)] != (wire233 ?
                           reg223 : wire221))))};
  assign wire239 = ($signed((reg223[(2'h3):(1'h1)] | ($unsigned(reg235) ?
                       $unsigned((8'haf)) : $unsigned(wire217)))) | {(wire217[(2'h3):(2'h2)] < $unsigned((+reg235))),
                       wire221});
  assign wire240 = reg232;
endmodule

module module30  (y, clk, wire35, wire34, wire33, wire32, wire31);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire35;
  input wire signed [(4'he):(1'h0)] wire34;
  input wire signed [(5'h15):(1'h0)] wire33;
  input wire [(5'h10):(1'h0)] wire32;
  input wire signed [(5'h10):(1'h0)] wire31;
  wire signed [(5'h10):(1'h0)] wire200;
  wire [(4'h9):(1'h0)] wire199;
  wire signed [(4'hf):(1'h0)] wire149;
  wire signed [(4'h9):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire74;
  wire signed [(4'he):(1'h0)] wire73;
  wire [(4'he):(1'h0)] wire72;
  wire signed [(5'h13):(1'h0)] wire71;
  wire [(4'hc):(1'h0)] wire70;
  wire signed [(5'h13):(1'h0)] wire69;
  wire [(5'h14):(1'h0)] wire68;
  wire signed [(3'h7):(1'h0)] wire66;
  wire [(4'hb):(1'h0)] wire197;
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg [(4'h9):(1'h0)] reg80 = (1'h0);
  reg [(4'hb):(1'h0)] reg79 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg77 = (1'h0);
  reg [(4'hb):(1'h0)] reg76 = (1'h0);
  reg [(4'hd):(1'h0)] reg75 = (1'h0);
  assign y = {wire200,
                 wire199,
                 wire149,
                 wire78,
                 wire74,
                 wire73,
                 wire72,
                 wire71,
                 wire70,
                 wire69,
                 wire68,
                 wire66,
                 wire197,
                 reg81,
                 reg80,
                 reg79,
                 reg77,
                 reg76,
                 reg75,
                 (1'h0)};
  module36 #() modinst67 (wire66, clk, wire32, wire35, wire31, wire33);
  assign wire68 = wire35[(4'ha):(3'h7)];
  assign wire69 = wire66;
  assign wire70 = ($unsigned($signed($unsigned($signed(wire69)))) ^ $unsigned($signed((^{(8'ha2),
                      (8'hbd)}))));
  assign wire71 = ((-((wire31[(4'h9):(3'h4)] ?
                              (+(8'hb7)) : (wire33 ? wire32 : wire69)) ?
                          $signed($unsigned(wire70)) : {wire69[(4'ha):(3'h6)],
                              $unsigned(wire33)})) ?
                      {wire33[(4'hd):(3'h5)]} : {wire70,
                          $unsigned({{(8'haf), (8'h9c)}})});
  assign wire72 = wire35;
  assign wire73 = wire70;
  assign wire74 = wire31[(2'h2):(1'h0)];
  always
    @(posedge clk) begin
      reg75 <= wire35;
      reg76 <= (!($unsigned({$unsigned(wire70)}) & (wire69 ?
          ($signed(wire66) ? wire31[(4'hc):(3'h5)] : (|wire69)) : wire72)));
      reg77 <= $signed((~^wire34));
    end
  assign wire78 = $unsigned({(((7'h40) ?
                              $unsigned(wire69) : (wire32 ? wire32 : wire71)) ?
                          reg75[(4'hd):(2'h2)] : $unsigned(reg77)),
                      (|$signed(wire34[(2'h3):(2'h3)]))});
  always
    @(posedge clk) begin
      reg79 <= wire31;
      reg80 <= wire35;
      reg81 <= (~^(!wire69[(3'h4):(3'h4)]));
    end
  module82 #() modinst150 (wire149, clk, reg75, wire74, wire69, wire70);
  module151 #() modinst198 (wire197, clk, wire35, reg79, reg76, reg77);
  assign wire199 = (wire31 ? wire78 : (^~$signed(wire35)));
  assign wire200 = reg75[(4'hd):(3'h4)];
endmodule

module module151  (y, clk, wire155, wire154, wire153, wire152);
  output wire [(32'h1ca):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire155;
  input wire signed [(3'h7):(1'h0)] wire154;
  input wire [(4'ha):(1'h0)] wire153;
  input wire signed [(4'hd):(1'h0)] wire152;
  wire [(5'h13):(1'h0)] wire196;
  wire [(3'h5):(1'h0)] wire195;
  wire [(3'h4):(1'h0)] wire194;
  wire [(4'hd):(1'h0)] wire193;
  wire [(4'he):(1'h0)] wire192;
  wire [(3'h6):(1'h0)] wire191;
  wire signed [(4'hd):(1'h0)] wire190;
  wire signed [(4'hd):(1'h0)] wire189;
  wire signed [(2'h2):(1'h0)] wire170;
  wire signed [(5'h14):(1'h0)] wire169;
  wire [(2'h2):(1'h0)] wire168;
  wire [(3'h4):(1'h0)] wire167;
  wire signed [(3'h4):(1'h0)] wire166;
  wire signed [(3'h4):(1'h0)] wire165;
  wire signed [(5'h14):(1'h0)] wire164;
  wire [(3'h5):(1'h0)] wire163;
  wire [(3'h4):(1'h0)] wire162;
  wire signed [(4'h9):(1'h0)] wire161;
  wire signed [(5'h12):(1'h0)] wire160;
  wire signed [(5'h15):(1'h0)] wire156;
  reg [(5'h11):(1'h0)] reg188 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg187 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg186 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg185 = (1'h0);
  reg [(3'h7):(1'h0)] reg184 = (1'h0);
  reg [(4'he):(1'h0)] reg183 = (1'h0);
  reg [(5'h11):(1'h0)] reg182 = (1'h0);
  reg [(5'h15):(1'h0)] reg181 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg180 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg179 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg178 = (1'h0);
  reg [(4'hc):(1'h0)] reg177 = (1'h0);
  reg [(3'h6):(1'h0)] reg176 = (1'h0);
  reg [(2'h2):(1'h0)] reg175 = (1'h0);
  reg [(3'h5):(1'h0)] reg174 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg173 = (1'h0);
  reg [(2'h2):(1'h0)] reg172 = (1'h0);
  reg [(3'h5):(1'h0)] reg171 = (1'h0);
  reg [(5'h12):(1'h0)] reg159 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg158 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg157 = (1'h0);
  assign y = {wire196,
                 wire195,
                 wire194,
                 wire193,
                 wire192,
                 wire191,
                 wire190,
                 wire189,
                 wire170,
                 wire169,
                 wire168,
                 wire167,
                 wire166,
                 wire165,
                 wire164,
                 wire163,
                 wire162,
                 wire161,
                 wire160,
                 wire156,
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
                 reg159,
                 reg158,
                 reg157,
                 (1'h0)};
  assign wire156 = $unsigned(wire154);
  always
    @(posedge clk) begin
      reg157 <= $signed(wire154);
      reg158 <= $unsigned($signed((wire154 ?
          (wire156 || {reg157}) : wire152[(3'h4):(2'h3)])));
      reg159 <= $unsigned({(reg158 ? wire156 : (~&reg157))});
    end
  assign wire160 = ($unsigned(wire156) != reg158[(2'h2):(1'h1)]);
  assign wire161 = reg158;
  assign wire162 = reg159;
  assign wire163 = $unsigned(wire156[(4'ha):(4'h9)]);
  assign wire164 = $signed(($signed(($unsigned(reg157) ?
                       (~&wire161) : (wire155 * wire155))) > (&(~^(wire160 ?
                       (8'haa) : wire153)))));
  assign wire165 = $signed(reg157[(3'h6):(1'h1)]);
  assign wire166 = ((wire163[(2'h2):(1'h0)] && $signed((~^$unsigned(wire162)))) && ({(wire164 > (wire152 | (8'hb5))),
                           wire160} ?
                       reg159[(3'h6):(3'h5)] : ($signed({wire163}) && wire154[(1'h1):(1'h0)])));
  assign wire167 = ((wire165 <= reg159) ?
                       {$signed(reg159[(3'h6):(3'h5)]),
                           ((8'ha5) ?
                               wire155 : ((^reg159) & (^(8'hae))))} : wire160[(2'h2):(2'h2)]);
  assign wire168 = {{wire155,
                           $unsigned((reg159[(3'h6):(3'h5)] >>> (wire161 ?
                               (8'ha0) : wire167)))},
                       {$signed(($unsigned(wire166) ?
                               {wire160} : wire164[(5'h14):(4'ha)])),
                           $signed((reg159[(3'h4):(1'h0)] ?
                               reg157[(4'hb):(3'h6)] : wire166[(1'h1):(1'h0)]))}};
  assign wire169 = ($signed($signed(wire154)) ^ wire161);
  assign wire170 = ((({(wire156 >>> wire162)} ?
                           {wire162} : ($signed(wire152) ?
                               (~|wire153) : (wire164 ? wire163 : reg158))) ?
                       $signed(($signed(wire156) ?
                           $unsigned(wire166) : (~&wire167))) : (~&reg159[(4'hd):(3'h5)])) - $unsigned(reg158[(1'h0):(1'h0)]));
  always
    @(posedge clk) begin
      if (reg158[(3'h4):(2'h2)])
        begin
          if (((wire155[(4'hf):(3'h7)] ?
                  ((|wire167) ?
                      (((8'hba) ?
                          wire167 : wire168) << (|wire165)) : wire152) : $signed($signed($signed((8'ha5))))) ?
              ((wire169 ? wire165 : $unsigned((~wire152))) ?
                  wire161 : $signed(wire156)) : wire162))
            begin
              reg171 <= wire153;
              reg172 <= (&((((wire155 <= wire156) < (^wire166)) ^~ (8'ha4)) < wire167[(2'h3):(1'h0)]));
              reg173 <= wire164;
              reg174 <= $signed($unsigned(((8'hb8) ?
                  $signed((~&wire161)) : wire168)));
              reg175 <= (((wire162[(3'h4):(2'h2)] ?
                          ($signed(wire165) >>> (reg173 != reg172)) : $unsigned((reg171 ?
                              reg174 : reg172))) ?
                      wire170 : ($unsigned($signed(wire152)) ?
                          reg158 : ((wire170 ?
                              reg157 : reg172) <<< (-wire153)))) ?
                  wire155[(4'h9):(2'h2)] : $signed({($unsigned(reg157) * $unsigned((8'hb6)))}));
            end
          else
            begin
              reg171 <= $unsigned($signed(((^~(wire155 ?
                  reg159 : wire156)) | $unsigned(wire154[(3'h5):(2'h3)]))));
              reg172 <= (8'h9d);
            end
          if ((&($signed((^reg159[(5'h12):(3'h4)])) ?
              (^(((8'ha6) != reg172) && $unsigned(reg172))) : (^$signed({wire153})))))
            begin
              reg176 <= $signed(reg159[(4'hf):(4'ha)]);
            end
          else
            begin
              reg176 <= (-$unsigned(reg158[(3'h5):(1'h0)]));
            end
          reg177 <= reg158[(3'h5):(1'h0)];
          reg178 <= ((&({(8'ha4), (|wire165)} ?
              reg175[(1'h1):(1'h1)] : {wire170})) < wire167);
          reg179 <= wire160[(4'he):(4'ha)];
        end
      else
        begin
          if ((wire161[(3'h6):(3'h4)] ?
              (&reg177) : $unsigned($signed($unsigned((~^wire152))))))
            begin
              reg171 <= $unsigned(((reg178[(4'hf):(4'h8)] ?
                      reg175 : (~|wire156)) ?
                  (reg159[(4'he):(1'h0)] ?
                      ($unsigned(reg177) << (8'haf)) : $signed((reg178 ?
                          (8'had) : wire167))) : (($unsigned(reg157) ?
                          $unsigned(wire162) : $unsigned(wire162)) ?
                      reg174[(2'h3):(1'h0)] : wire166[(1'h1):(1'h1)])));
              reg172 <= (reg176 ?
                  reg159[(4'hb):(4'hb)] : (~^(({wire154, wire156} ?
                          (8'ha1) : (-reg174)) ?
                      $unsigned($unsigned(reg172)) : wire170)));
              reg173 <= $unsigned($signed(reg157));
              reg174 <= $signed((({wire163[(1'h1):(1'h1)],
                      $signed(wire160)} << $unsigned(wire170)) ?
                  (|(-(wire163 << reg179))) : {{$signed(wire160)}}));
            end
          else
            begin
              reg171 <= $unsigned({(wire165[(1'h0):(1'h0)] ?
                      ((&reg178) ?
                          (reg158 ~^ wire156) : wire164) : $signed({wire161,
                          reg176})),
                  $unsigned($unsigned(reg159[(2'h2):(2'h2)]))});
              reg172 <= ((-(^~wire153)) ^~ $signed(wire168[(1'h0):(1'h0)]));
              reg173 <= (reg174[(2'h3):(1'h0)] ?
                  reg157[(5'h10):(3'h7)] : wire152);
            end
          reg175 <= (+{($unsigned(wire152[(4'hc):(4'h8)]) ?
                  wire164 : (|wire166))});
          reg176 <= wire162[(1'h1):(1'h1)];
        end
      if (($unsigned($unsigned($signed({wire168, wire167}))) ?
          reg171[(2'h3):(2'h3)] : $unsigned(reg158[(3'h6):(2'h3)])))
        begin
          reg180 <= reg158[(4'h9):(3'h7)];
          reg181 <= $signed((wire168[(2'h2):(2'h2)] + (((wire153 || (8'ha6)) ?
                  (&(8'ha1)) : $unsigned(wire165)) ?
              wire164 : ((reg174 ? wire152 : (8'hb6)) ?
                  (wire161 ? reg159 : (8'ha9)) : $signed(wire153)))));
          reg182 <= (($signed((^(wire163 * wire164))) ?
              (~^reg177) : reg174) >> {$unsigned(wire155)});
          if ($unsigned((+{$signed((wire170 ~^ reg174))})))
            begin
              reg183 <= (^$signed(wire163));
              reg184 <= wire160;
              reg185 <= (((~^wire163[(2'h2):(2'h2)]) ?
                      reg158[(2'h2):(1'h1)] : ((reg175 ?
                              $unsigned(wire154) : wire156[(1'h1):(1'h1)]) ?
                          $signed(reg158[(4'h9):(4'h8)]) : $unsigned((reg171 <= reg183)))) ?
                  ((($signed(reg178) >= (reg178 | wire168)) ?
                          ((reg176 ^ reg158) ?
                              $signed((8'ha8)) : (wire154 ?
                                  (8'hbb) : wire154)) : ((8'ha7) ^~ $unsigned(reg174))) ?
                      $unsigned(((reg183 ?
                          wire161 : wire160) ^ wire168[(1'h0):(1'h0)])) : ($unsigned(reg173[(4'hb):(3'h5)]) >>> $signed((reg178 ?
                          reg179 : wire155)))) : (reg172[(2'h2):(1'h1)] || reg176));
              reg186 <= wire160;
            end
          else
            begin
              reg183 <= ($unsigned((8'hb3)) ?
                  wire155 : (wire162 || reg184[(3'h7):(3'h7)]));
              reg184 <= {reg180[(3'h5):(1'h0)]};
              reg185 <= (~^(8'hbb));
              reg186 <= $signed((~|$unsigned($unsigned($signed(wire166)))));
              reg187 <= reg184;
            end
          reg188 <= reg184[(3'h5):(3'h4)];
        end
      else
        begin
          reg180 <= ($unsigned(((~|$unsigned(wire162)) + (-$signed(wire160)))) && (^$signed(wire152)));
          if (wire162[(1'h0):(1'h0)])
            begin
              reg181 <= ({{$signed($unsigned(wire154)),
                      wire166[(2'h3):(1'h0)]}} >= (8'hb1));
              reg182 <= $unsigned((reg174 ?
                  reg182[(3'h7):(3'h5)] : $unsigned($signed($unsigned(reg180)))));
            end
          else
            begin
              reg181 <= $unsigned(wire170);
            end
          reg183 <= reg159;
        end
    end
  assign wire189 = reg158;
  assign wire190 = (+reg177);
  assign wire191 = (8'hbf);
  assign wire192 = ({($unsigned((reg185 ? wire166 : reg179)) ?
                               {reg175, $signed((8'ha9))} : reg173),
                           reg157} ?
                       wire153 : (reg171[(3'h4):(1'h0)] ?
                           {(~&(!reg185)),
                               $signed($signed(wire166))} : reg183));
  assign wire193 = reg173[(3'h7):(3'h4)];
  assign wire194 = {reg180};
  assign wire195 = ((({$unsigned(wire154)} ~^ $unsigned({reg182})) + (wire166 ?
                           $signed($unsigned(reg183)) : $signed($unsigned(wire156)))) ?
                       reg180 : $signed($signed(($signed(reg183) != $unsigned((7'h42))))));
  assign wire196 = (($signed((~^reg172)) + reg188[(4'h8):(3'h6)]) ?
                       {$unsigned(wire193[(1'h0):(1'h0)]),
                           {wire163[(3'h5):(2'h2)]}} : (($unsigned(wire190) ^~ $unsigned($unsigned(wire195))) ?
                           (reg179[(1'h0):(1'h0)] ?
                               wire162 : $signed((8'hbc))) : (&wire166)));
endmodule

module module82  (y, clk, wire86, wire85, wire84, wire83);
  output wire [(32'h2b9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire86;
  input wire signed [(5'h13):(1'h0)] wire85;
  input wire [(4'h8):(1'h0)] wire84;
  input wire [(4'hc):(1'h0)] wire83;
  wire signed [(2'h3):(1'h0)] wire148;
  wire [(3'h4):(1'h0)] wire123;
  wire [(2'h2):(1'h0)] wire122;
  wire [(4'h9):(1'h0)] wire121;
  wire signed [(5'h15):(1'h0)] wire120;
  wire signed [(4'h9):(1'h0)] wire105;
  wire [(5'h12):(1'h0)] wire104;
  wire [(5'h10):(1'h0)] wire103;
  wire signed [(3'h5):(1'h0)] wire102;
  wire signed [(3'h5):(1'h0)] wire101;
  wire signed [(5'h15):(1'h0)] wire100;
  wire [(5'h12):(1'h0)] wire99;
  wire [(2'h3):(1'h0)] wire98;
  wire signed [(4'hd):(1'h0)] wire97;
  wire [(4'ha):(1'h0)] wire92;
  wire [(4'hf):(1'h0)] wire91;
  wire [(5'h11):(1'h0)] wire90;
  reg [(3'h7):(1'h0)] reg147 = (1'h0);
  reg [(4'h9):(1'h0)] reg146 = (1'h0);
  reg [(4'hd):(1'h0)] reg145 = (1'h0);
  reg signed [(4'he):(1'h0)] reg144 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg143 = (1'h0);
  reg [(4'hc):(1'h0)] reg142 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg141 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg140 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg139 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg138 = (1'h0);
  reg [(5'h11):(1'h0)] reg137 = (1'h0);
  reg [(4'h9):(1'h0)] reg136 = (1'h0);
  reg signed [(4'he):(1'h0)] reg135 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg134 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg133 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg132 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg131 = (1'h0);
  reg [(4'h9):(1'h0)] reg130 = (1'h0);
  reg [(5'h15):(1'h0)] reg129 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg128 = (1'h0);
  reg [(3'h6):(1'h0)] reg127 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg126 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg125 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg124 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg119 = (1'h0);
  reg [(5'h15):(1'h0)] reg118 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg117 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg116 = (1'h0);
  reg [(5'h13):(1'h0)] reg115 = (1'h0);
  reg [(2'h2):(1'h0)] reg114 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg113 = (1'h0);
  reg [(5'h14):(1'h0)] reg112 = (1'h0);
  reg [(2'h2):(1'h0)] reg111 = (1'h0);
  reg [(4'h8):(1'h0)] reg110 = (1'h0);
  reg [(5'h14):(1'h0)] reg109 = (1'h0);
  reg [(4'hc):(1'h0)] reg108 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg107 = (1'h0);
  reg [(5'h10):(1'h0)] reg106 = (1'h0);
  reg signed [(4'he):(1'h0)] reg96 = (1'h0);
  reg [(5'h12):(1'h0)] reg95 = (1'h0);
  reg [(5'h13):(1'h0)] reg94 = (1'h0);
  reg signed [(4'he):(1'h0)] reg93 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg89 = (1'h0);
  reg [(4'h9):(1'h0)] reg88 = (1'h0);
  reg [(4'h8):(1'h0)] reg87 = (1'h0);
  assign y = {wire148,
                 wire123,
                 wire122,
                 wire121,
                 wire120,
                 wire105,
                 wire104,
                 wire103,
                 wire102,
                 wire101,
                 wire100,
                 wire99,
                 wire98,
                 wire97,
                 wire92,
                 wire91,
                 wire90,
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
                 reg119,
                 reg118,
                 reg117,
                 reg116,
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
                 reg96,
                 reg95,
                 reg94,
                 reg93,
                 reg89,
                 reg88,
                 reg87,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg87 <= ($signed($unsigned($unsigned($unsigned(wire86)))) ^ wire86);
      reg88 <= wire85[(3'h4):(1'h0)];
      reg89 <= {$unsigned((|wire86[(3'h6):(2'h3)]))};
    end
  assign wire90 = (($unsigned($unsigned(reg88[(3'h5):(2'h2)])) ?
                          reg87[(2'h3):(1'h0)] : {$signed($signed(wire84)),
                              reg87[(3'h4):(2'h2)]}) ?
                      (&(reg88[(3'h5):(3'h5)] * $unsigned((reg87 > wire84)))) : reg87);
  assign wire91 = (reg89[(4'hc):(3'h6)] >>> (~^(!(8'hbf))));
  assign wire92 = reg87;
  always
    @(posedge clk) begin
      reg93 <= (($signed(wire84[(4'h8):(3'h5)]) ?
          (-(reg87[(2'h3):(2'h2)] >> {wire85,
              wire92})) : wire84[(3'h6):(2'h2)]) << (8'hb3));
      reg94 <= reg93;
      reg95 <= ((wire83 <= (+($signed(wire85) ?
          (-wire85) : reg94[(4'hd):(2'h3)]))) >= (($unsigned((~wire84)) ?
              ({wire84, wire91} ?
                  reg93[(4'hd):(4'h9)] : ((8'hb7) ?
                      (8'ha0) : wire90)) : (reg94[(5'h11):(4'h9)] ?
                  wire91 : wire85)) ?
          (wire91 >= $signed((wire90 ?
              (8'h9f) : reg94))) : reg94[(4'h9):(4'h8)]));
      reg96 <= {wire92};
    end
  assign wire97 = reg96;
  assign wire98 = reg87;
  assign wire99 = reg96;
  assign wire100 = ($unsigned(reg88[(3'h5):(1'h0)]) ?
                       $unsigned(wire97) : ((($unsigned(reg89) ?
                                   reg89[(3'h6):(3'h6)] : $unsigned((8'ha7))) ?
                               $unsigned(((8'hbc) ?
                                   wire91 : (8'hb2))) : (~|(^~wire85))) ?
                           ($unsigned($unsigned(reg88)) | $unsigned($signed(reg95))) : (~|{(wire92 ?
                                   reg95 : wire90),
                               (|reg89)})));
  assign wire101 = (((wire83[(3'h7):(2'h3)] ~^ (^$unsigned((8'ha4)))) ?
                       $unsigned(wire97) : $unsigned(wire97)) <<< (((wire100 >= $signed(wire91)) << reg94[(4'he):(2'h3)]) ^~ ((!$signed(wire86)) << ((~|wire83) ?
                       (reg95 ^ wire86) : reg95[(4'hb):(4'hb)]))));
  assign wire102 = {$unsigned(((|$signed(wire85)) ?
                           ((wire85 ? (8'hbe) : wire90) ?
                               $unsigned(wire101) : $unsigned(wire97)) : (reg89[(4'hd):(4'hb)] ?
                               ((8'ha1) ?
                                   reg93 : (8'hb4)) : wire83[(1'h0):(1'h0)]))),
                       (({$unsigned(reg87)} ?
                               (&wire85) : ((reg88 ? wire100 : wire90) ?
                                   (wire84 ?
                                       (8'hbe) : wire84) : (reg89 != wire92))) ?
                           ((8'hba) >>> wire92) : wire97[(3'h5):(3'h4)])};
  assign wire103 = (-((-$signed($signed(reg94))) ?
                       (({wire84,
                           wire85} ^~ $unsigned(wire91)) * $unsigned((~&wire86))) : wire99));
  assign wire104 = {(!$signed(((!wire91) >> (7'h43))))};
  assign wire105 = $unsigned($signed(((8'h9d) < ((8'hb4) == wire102[(2'h3):(1'h0)]))));
  always
    @(posedge clk) begin
      reg106 <= reg96[(2'h2):(2'h2)];
      if ($signed(reg87))
        begin
          reg107 <= wire86;
          if ($unsigned({wire86,
              ((~|wire86[(4'ha):(2'h2)]) - (~wire101[(1'h0):(1'h0)]))}))
            begin
              reg108 <= wire92;
              reg109 <= $signed(wire90);
              reg110 <= ({$signed(reg93),
                      {(reg88 ? (reg94 ? wire84 : reg108) : (^reg109))}} ?
                  wire98[(1'h1):(1'h0)] : reg93[(4'h9):(2'h3)]);
              reg111 <= reg93;
            end
          else
            begin
              reg108 <= {wire104[(4'h9):(3'h6)]};
              reg109 <= ((((wire85[(3'h7):(2'h2)] == $signed((8'ha3))) >>> $signed((wire91 ?
                      wire101 : reg110))) ?
                  reg111 : (reg108[(3'h4):(3'h4)] < wire85)) - ((|$signed((reg96 > (8'ha4)))) ?
                  (((wire85 ? (8'ha0) : (8'h9e)) ?
                      $signed(wire99) : (reg93 < wire99)) > $signed({(8'hbc)})) : (reg88[(4'h9):(4'h8)] >>> (^~(reg96 ?
                      wire98 : reg88)))));
              reg110 <= $signed($signed((($signed(wire97) ?
                  $signed((8'hb3)) : (reg93 ? reg96 : wire85)) > ((reg94 ?
                      reg110 : wire102) ?
                  $signed(reg109) : wire103))));
              reg111 <= {$unsigned($signed(((&wire105) ?
                      (~|wire83) : (wire102 || (8'h9e)))))};
            end
          reg112 <= wire102[(2'h3):(1'h1)];
        end
      else
        begin
          reg107 <= (~$unsigned($signed({wire92[(1'h0):(1'h0)],
              (wire104 ? wire97 : wire92)})));
          reg108 <= ($signed((8'hae)) && reg106);
          reg109 <= (reg93[(1'h1):(1'h0)] << $unsigned($unsigned((&wire97))));
        end
      reg113 <= (~&$unsigned((~|($unsigned(wire85) ?
          $unsigned((8'hb1)) : (~|wire100)))));
      reg114 <= ((((wire99[(3'h6):(1'h0)] ?
              wire105 : $unsigned(wire90)) << $unsigned((&reg109))) ?
          ($unsigned(reg96) ?
              reg109[(4'h8):(1'h0)] : (+$unsigned(wire85))) : reg87) > (+wire103[(5'h10):(4'hf)]));
    end
  always
    @(posedge clk) begin
      reg115 <= ($signed((~&(reg106[(3'h7):(1'h0)] ?
          reg106 : reg112[(4'h8):(3'h6)]))) ^ (({(reg95 <= wire92),
          (reg95 ? wire101 : reg107)} || wire91) ~^ (!(|(wire102 ?
          reg110 : reg93)))));
      reg116 <= $unsigned($signed($unsigned(reg107)));
      if ($signed($unsigned((reg108[(2'h3):(1'h0)] == (reg88[(1'h1):(1'h0)] ?
          $unsigned(wire102) : $unsigned(reg112))))))
        begin
          reg117 <= (($signed(wire105) ?
              reg116[(1'h1):(1'h0)] : ({reg110[(1'h0):(1'h0)], wire86} ?
                  ({reg93} >> $unsigned(wire86)) : $signed((8'ha0)))) > $unsigned(wire83[(4'h8):(1'h1)]));
          reg118 <= wire100[(1'h0):(1'h0)];
          reg119 <= ($signed($unsigned($unsigned((reg107 < wire101)))) ?
              (~|({$unsigned(reg117)} ^~ {{reg93,
                      reg107}})) : reg118[(5'h15):(4'hb)]);
        end
      else
        begin
          reg117 <= $signed(($unsigned((-reg119)) < (reg108[(2'h3):(1'h1)] ?
              (wire104 ?
                  wire86[(3'h6):(1'h0)] : ((8'ha2) >= reg88)) : $unsigned($signed(wire86)))));
        end
    end
  assign wire120 = $unsigned($unsigned(wire103));
  assign wire121 = ((&wire101) ^ (reg114[(2'h2):(1'h1)] ?
                       wire100 : (~^$unsigned($signed(wire104)))));
  assign wire122 = $signed($signed((reg94[(4'hb):(3'h5)] ?
                       $signed($unsigned(reg117)) : $signed((+(8'hb7))))));
  assign wire123 = reg110;
  always
    @(posedge clk) begin
      reg124 <= (!reg119[(2'h3):(1'h1)]);
      if (($unsigned((($unsigned(wire98) >>> (wire86 + wire100)) ~^ (~|(reg119 ?
          wire120 : reg114)))) - {{wire105[(3'h7):(1'h1)],
              ((|reg110) ? wire103 : $unsigned(wire123))},
          (((reg114 ~^ reg93) ? (reg107 ^~ reg107) : (-wire120)) >> ((reg114 ?
                  reg93 : reg96) ?
              {reg95, wire123} : (reg114 ? wire97 : reg87)))}))
        begin
          reg125 <= (((~^(wire100 ?
                      wire122[(1'h0):(1'h0)] : (wire104 - (8'hbd)))) ?
                  {(wire91 ? $unsigned(wire100) : (reg107 ? wire104 : reg87)),
                      reg109[(2'h2):(2'h2)]} : wire85) ?
              (reg109 ^~ (!reg119)) : $unsigned($unsigned(wire98)));
          reg126 <= reg118;
        end
      else
        begin
          reg125 <= reg109;
          reg126 <= ((-$unsigned((wire103[(3'h6):(3'h4)] >>> wire83[(4'hb):(4'h9)]))) ?
              wire98 : $signed((|((~|reg119) ? reg118 : $signed(wire98)))));
          reg127 <= (~^wire100[(4'hb):(2'h3)]);
          if (reg113)
            begin
              reg128 <= ($unsigned($signed($unsigned({reg124,
                  reg106}))) ^~ ($signed(($signed(wire105) ?
                  (~|(8'hb5)) : wire92[(4'h8):(2'h2)])) ^ $unsigned(((+wire122) <<< (wire86 ?
                  wire104 : wire121)))));
              reg129 <= ($unsigned((($signed(reg88) ?
                      (wire104 ^ (8'hbc)) : (^reg109)) >> wire102)) ?
                  (8'h9c) : ($signed(reg112) < (reg93 ?
                      reg128[(1'h1):(1'h0)] : reg88)));
              reg130 <= $unsigned(reg95[(2'h2):(1'h0)]);
              reg131 <= wire97;
              reg132 <= $unsigned(wire120[(5'h15):(4'hf)]);
            end
          else
            begin
              reg128 <= reg94;
              reg129 <= (wire121[(2'h2):(2'h2)] ?
                  ($unsigned($unsigned((reg114 >> (8'hbc)))) ?
                      reg119 : (wire84[(3'h5):(2'h2)] || ($signed(reg88) ~^ (reg112 >= reg87)))) : wire92);
              reg130 <= $signed((reg88[(1'h0):(1'h0)] ?
                  (reg88[(3'h7):(3'h4)] ?
                      wire122[(2'h2):(2'h2)] : $unsigned($signed(reg109))) : wire84[(1'h0):(1'h0)]));
              reg131 <= ($signed((~^reg94[(3'h4):(2'h2)])) + $signed($signed($unsigned($unsigned((8'h9f))))));
              reg132 <= {wire97,
                  (wire105[(4'h8):(3'h4)] ?
                      $signed(wire97[(4'hb):(2'h2)]) : {reg88, wire98})};
            end
          if ((wire100 ?
              {(reg127[(3'h4):(2'h2)] ? wire91 : $signed((~^reg115))),
                  wire92} : reg89[(5'h10):(4'h9)]))
            begin
              reg133 <= (~^$unsigned(((!reg109[(5'h11):(5'h11)]) || ((reg113 << wire90) <<< {reg124}))));
              reg134 <= ((~(&reg129)) ?
                  $signed($signed($signed(reg132[(2'h2):(1'h1)]))) : $signed({$signed((+(8'hb7)))}));
              reg135 <= (wire90 << (-$signed(wire105)));
            end
          else
            begin
              reg133 <= wire91;
            end
        end
      if (reg110[(3'h7):(3'h6)])
        begin
          if (($unsigned($signed((~^$signed((8'hbf))))) ?
              {$unsigned(reg124)} : reg124[(4'hc):(4'hb)]))
            begin
              reg136 <= {(^~$unsigned((reg119[(2'h2):(1'h1)] ^ {wire84})))};
            end
          else
            begin
              reg136 <= wire100;
              reg137 <= $signed({$unsigned((wire100 ?
                      (reg115 & (8'ha8)) : wire120[(5'h12):(4'hc)]))});
              reg138 <= reg95;
            end
          reg139 <= (-(8'ha0));
          if (wire98)
            begin
              reg140 <= $unsigned((&wire121));
              reg141 <= {((~|(|(^~(8'ha4)))) ?
                      $signed($signed((wire99 <= wire90))) : reg118[(4'h9):(4'h8)])};
              reg142 <= {(((^(wire91 && (8'hb0))) || reg130[(2'h2):(2'h2)]) - reg126)};
              reg143 <= $unsigned(($signed(reg132[(2'h2):(1'h1)]) ?
                  $signed({$unsigned(reg141)}) : reg131[(4'hf):(4'hb)]));
            end
          else
            begin
              reg140 <= (+(^~$signed(reg113[(1'h0):(1'h0)])));
              reg141 <= ((~&($unsigned($unsigned(wire105)) + ($unsigned(reg108) ?
                      (wire101 || wire85) : (+(8'hb5))))) ?
                  ($signed($unsigned((+wire85))) ?
                      $unsigned(($signed(wire103) & wire105[(3'h6):(1'h0)])) : (|(^(reg110 ?
                          reg138 : (8'h9f))))) : reg131);
            end
          reg144 <= $signed($signed(reg114));
          if (reg108)
            begin
              reg145 <= $unsigned(wire105);
              reg146 <= {$unsigned({wire91[(1'h1):(1'h0)]})};
              reg147 <= (&$unsigned({(8'ha0)}));
            end
          else
            begin
              reg145 <= $unsigned(reg134[(4'h8):(3'h6)]);
              reg146 <= ($signed((reg136[(1'h0):(1'h0)] ?
                  $unsigned((reg135 ?
                      reg113 : (8'had))) : reg88[(2'h2):(1'h1)])) < $unsigned((wire100 < (reg133 ?
                  $signed(reg141) : $signed(wire99)))));
            end
        end
      else
        begin
          if ($signed(((!($signed(reg106) ^~ (wire86 ?
              (8'hae) : reg108))) >= (&reg147))))
            begin
              reg136 <= $unsigned(((~&{{reg118, (8'hbc)},
                      reg132[(1'h0):(1'h0)]}) ?
                  reg146[(1'h1):(1'h1)] : (-(reg132 ^ {wire90, reg113}))));
              reg137 <= reg137;
              reg138 <= ($unsigned((~&reg111)) <= {wire85,
                  ($unsigned((wire92 ?
                      reg115 : reg144)) && $signed((^~reg142)))});
            end
          else
            begin
              reg136 <= $unsigned(($unsigned($signed({wire99})) >>> (~&(~|$unsigned((8'had))))));
            end
          reg139 <= {($unsigned($signed($signed(reg129))) != reg124),
              $unsigned((wire83[(1'h0):(1'h0)] ?
                  $unsigned($signed(reg108)) : reg96))};
          reg140 <= reg88;
          reg141 <= {((reg94[(4'he):(2'h2)] <<< $unsigned((wire121 ^ reg116))) && (-reg108)),
              wire92};
        end
    end
  assign wire148 = (($signed($unsigned({wire104})) & reg130) >= reg95);
endmodule

module module36
#(parameter param65 = ({{{((8'hb8) ^~ (8'h9f))}}} ? (((((8'ha0) ^~ (8'hbf)) + ((8'hbd) ? (8'hb5) : (8'hb0))) ? ((~^(8'hbd)) >>> (|(8'hbd))) : (((8'ha3) | (8'ha0)) ? ((8'hae) - (8'haa)) : (|(8'ha6)))) <<< (8'haa)) : ((^~(+(~^(8'hbd)))) << ((|((8'hb1) ? (8'ha5) : (8'haf))) < (~(+(8'hac)))))))
(y, clk, wire40, wire39, wire38, wire37);
  output wire [(32'h10b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire40;
  input wire [(4'h8):(1'h0)] wire39;
  input wire [(5'h10):(1'h0)] wire38;
  input wire signed [(5'h15):(1'h0)] wire37;
  wire [(5'h11):(1'h0)] wire64;
  wire [(3'h4):(1'h0)] wire63;
  wire signed [(4'h9):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire61;
  wire [(5'h11):(1'h0)] wire60;
  wire [(4'hc):(1'h0)] wire59;
  wire [(5'h13):(1'h0)] wire58;
  wire [(4'h9):(1'h0)] wire57;
  wire [(5'h13):(1'h0)] wire56;
  wire [(4'ha):(1'h0)] wire51;
  wire signed [(4'h8):(1'h0)] wire50;
  wire [(4'he):(1'h0)] wire49;
  wire [(4'h9):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire [(4'hf):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire45;
  wire signed [(5'h10):(1'h0)] wire44;
  wire signed [(4'hb):(1'h0)] wire43;
  wire signed [(4'he):(1'h0)] wire42;
  wire signed [(4'ha):(1'h0)] wire41;
  reg [(3'h5):(1'h0)] reg55 = (1'h0);
  reg [(3'h7):(1'h0)] reg54 = (1'h0);
  reg signed [(4'he):(1'h0)] reg53 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg52 = (1'h0);
  assign y = {wire64,
                 wire63,
                 wire62,
                 wire61,
                 wire60,
                 wire59,
                 wire58,
                 wire57,
                 wire56,
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
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire41 = (^(wire40[(3'h4):(3'h4)] ? wire38[(1'h1):(1'h0)] : wire38));
  assign wire42 = ($unsigned($signed({$unsigned(wire39),
                          (wire38 ? wire37 : wire39)})) ?
                      $unsigned(wire39[(2'h2):(1'h1)]) : (^~wire38[(4'h8):(3'h6)]));
  assign wire43 = wire41[(4'h9):(3'h4)];
  assign wire44 = $signed((~|wire39));
  assign wire45 = $signed($unsigned($signed({(|wire40)})));
  assign wire46 = $signed((!wire40));
  assign wire47 = {(+$signed(wire44)), wire38};
  assign wire48 = {$unsigned($unsigned((+wire37)))};
  assign wire49 = $signed((($unsigned(wire47[(2'h2):(1'h1)]) ?
                          $signed(wire43[(3'h5):(1'h1)]) : {$signed(wire38)}) ?
                      ((-wire40[(3'h4):(3'h4)]) ?
                          (^$signed(wire38)) : ((&wire42) ?
                              (wire42 < wire47) : wire39)) : ({wire40,
                          wire42} ^~ $unsigned({wire37, (8'hae)}))));
  assign wire50 = $signed($unsigned($unsigned((wire44[(3'h6):(3'h5)] ?
                      $unsigned((8'hba)) : {wire40}))));
  assign wire51 = $signed($signed(wire42));
  always
    @(posedge clk) begin
      if ((wire40 + $unsigned((~wire37[(1'h1):(1'h0)]))))
        begin
          if ($unsigned((8'h9c)))
            begin
              reg52 <= (~&((-($signed(wire43) * {wire39})) ^ ((^~wire47[(2'h2):(2'h2)]) ?
                  wire39 : $unsigned(wire37))));
              reg53 <= $signed(wire48[(2'h3):(1'h1)]);
              reg54 <= $unsigned(((~|{{wire49, wire40}, (^~reg53)}) ?
                  {((wire43 ? wire45 : wire39) ?
                          wire40[(2'h2):(1'h0)] : (wire50 ?
                              reg53 : wire39))} : $unsigned(wire51)));
            end
          else
            begin
              reg52 <= $unsigned(wire47[(1'h0):(1'h0)]);
              reg53 <= wire40[(4'h9):(4'h9)];
              reg54 <= ((7'h44) == (8'hbe));
              reg55 <= (wire38 ?
                  reg54 : (~&((|$unsigned((8'ha5))) ?
                      wire50[(3'h4):(1'h1)] : {wire42[(4'hb):(4'ha)],
                          wire47})));
            end
        end
      else
        begin
          reg52 <= reg53[(3'h7):(3'h6)];
          reg53 <= ((&((7'h40) <= {((8'h9c) ? reg54 : wire45)})) ?
              $signed((reg52[(1'h1):(1'h1)] ?
                  (|$signed(wire46)) : wire42)) : wire49);
          reg54 <= $signed({$unsigned(((~(7'h41)) ?
                  (&wire49) : wire43[(3'h5):(3'h4)])),
              ($signed(wire49) >= wire38)});
        end
    end
  assign wire56 = wire47;
  assign wire57 = $signed($signed($unsigned(wire42[(1'h0):(1'h0)])));
  assign wire58 = $unsigned((reg52[(1'h0):(1'h0)] ?
                      wire39[(1'h0):(1'h0)] : reg53));
  assign wire59 = ({(|{(wire39 ? reg52 : wire44), {wire39}})} ?
                      $signed(({(wire58 ? wire40 : wire41), (wire40 - wire51)} ?
                          (&wire40) : ((!wire44) | reg54))) : (~{wire39}));
  assign wire60 = wire56[(4'hc):(4'hc)];
  assign wire61 = reg53;
  assign wire62 = $signed(wire40);
  assign wire63 = wire62;
  assign wire64 = (reg52[(2'h2):(1'h1)] ?
                      $signed(wire57) : $unsigned(($unsigned($signed(wire62)) < (^~$signed(reg54)))));
endmodule
