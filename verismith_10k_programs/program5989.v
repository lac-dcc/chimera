module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h21d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h15):(1'h0)] wire0;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire3;
  wire [(3'h6):(1'h0)] wire85;
  wire [(4'he):(1'h0)] wire10;
  wire [(3'h7):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire13;
  wire [(3'h6):(1'h0)] wire14;
  wire signed [(4'hd):(1'h0)] wire25;
  wire [(5'h11):(1'h0)] wire26;
  wire [(4'h9):(1'h0)] wire27;
  wire [(3'h5):(1'h0)] wire28;
  wire signed [(5'h13):(1'h0)] wire29;
  wire signed [(4'hf):(1'h0)] wire61;
  reg [(3'h4):(1'h0)] reg84 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg83 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg82 = (1'h0);
  reg signed [(4'he):(1'h0)] reg81 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg80 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg79 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg78 = (1'h0);
  reg [(4'h9):(1'h0)] reg77 = (1'h0);
  reg [(2'h3):(1'h0)] reg76 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg75 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg73 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg72 = (1'h0);
  reg [(4'hd):(1'h0)] reg71 = (1'h0);
  reg [(4'ha):(1'h0)] reg70 = (1'h0);
  reg [(3'h7):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg68 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg67 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg66 = (1'h0);
  reg [(4'h8):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg64 = (1'h0);
  reg [(3'h7):(1'h0)] reg63 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg24 = (1'h0);
  reg [(5'h10):(1'h0)] reg23 = (1'h0);
  reg [(5'h12):(1'h0)] reg22 = (1'h0);
  reg [(5'h12):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg20 = (1'h0);
  reg [(4'ha):(1'h0)] reg19 = (1'h0);
  reg [(3'h7):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg17 = (1'h0);
  reg [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg15 = (1'h0);
  reg [(2'h3):(1'h0)] reg9 = (1'h0);
  reg [(4'he):(1'h0)] reg8 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg7 = (1'h0);
  reg [(4'h8):(1'h0)] reg6 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg4 = (1'h0);
  assign y = {wire85,
                 wire10,
                 wire11,
                 wire12,
                 wire13,
                 wire14,
                 wire25,
                 wire26,
                 wire27,
                 wire28,
                 wire29,
                 wire61,
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
                 reg67,
                 reg66,
                 reg65,
                 reg64,
                 reg63,
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
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= {(-($signed((~|wire3)) <= wire2[(4'h8):(1'h1)])),
          (^$signed((((8'hb7) ? (8'ha2) : wire2) > (~wire3))))};
      reg5 <= (wire2 ?
          $unsigned((wire2 ?
              (!wire3[(3'h5):(3'h4)]) : ($unsigned((8'ha6)) | $unsigned(reg4)))) : $signed((((^~reg4) <= {wire0}) | (&(wire2 ?
              reg4 : reg4)))));
    end
  always
    @(posedge clk) begin
      reg6 <= $unsigned({{$unsigned((wire3 ? wire0 : wire3)),
              {(-wire2), $signed(wire3)}}});
      reg7 <= wire3;
      reg8 <= wire0;
      reg9 <= ($unsigned((|reg8[(1'h1):(1'h0)])) ?
          ($unsigned((|(reg8 ?
              (8'hab) : reg5))) && $signed({wire2[(4'h8):(1'h1)],
              (reg5 ? reg6 : reg6)})) : $signed(wire2[(4'h8):(3'h4)]));
    end
  assign wire10 = $signed(wire2);
  assign wire11 = ((^($signed($signed(reg8)) <= {(wire3 ? reg6 : reg9),
                      wire1})) != (~&({reg8[(2'h3):(1'h1)], $signed((8'hb8))} ?
                      ($signed(reg7) ?
                          (^~reg4) : reg6) : $signed($signed((8'hbe))))));
  assign wire12 = {(($signed($unsigned(wire3)) * reg9[(2'h3):(2'h3)]) ?
                          {$unsigned(wire3[(4'hb):(3'h4)])} : (~(reg7[(3'h5):(3'h5)] ^~ $signed(reg4)))),
                      $signed(((~^(reg8 ?
                          reg4 : reg5)) ~^ $unsigned($signed(reg8))))};
  assign wire13 = $unsigned({(wire12[(4'h9):(1'h0)] ? {(~wire10)} : wire10),
                      $signed($unsigned(reg5))});
  assign wire14 = $unsigned((!{$signed((wire12 < wire10))}));
  always
    @(posedge clk) begin
      reg15 <= (~&(wire14[(3'h4):(3'h4)] - (8'ha1)));
      reg16 <= wire1[(1'h1):(1'h0)];
      reg17 <= $signed($signed((!{$signed(wire0), ((8'hae) <= wire3)})));
      reg18 <= ((+(wire0 ^~ {wire13, reg9})) << (({(wire12 ?
                  reg4 : wire3)} + $unsigned((^wire13))) ?
          (8'ha7) : wire12));
      if ($unsigned($signed(reg6[(3'h6):(1'h0)])))
        begin
          if (({(+$unsigned((~|reg4))),
              $unsigned($unsigned(wire3))} == ((wire14 ?
              ((reg9 >>> reg7) >> (wire14 ?
                  (8'h9e) : reg5)) : (8'hb2)) ~^ (~$signed((wire1 ^~ wire0))))))
            begin
              reg19 <= wire2;
            end
          else
            begin
              reg19 <= wire3[(4'he):(3'h7)];
              reg20 <= (|(reg5[(4'h9):(3'h4)] ?
                  $signed((|wire3[(3'h6):(1'h0)])) : {reg16}));
              reg21 <= $signed($signed($unsigned($unsigned({wire3, wire0}))));
              reg22 <= ($unsigned((!reg16[(2'h2):(1'h1)])) << ($signed(reg18[(1'h0):(1'h0)]) ?
                  reg8[(2'h3):(2'h2)] : $unsigned({reg9[(1'h0):(1'h0)],
                      reg17[(4'hb):(2'h2)]})));
              reg23 <= ((($unsigned(wire2) ?
                  reg18[(2'h3):(1'h0)] : (reg16 ?
                      (wire11 ?
                          wire10 : reg9) : (|reg4))) <<< ($unsigned((~&reg7)) >= reg7)) - (~$unsigned($unsigned((~|wire2)))));
            end
          reg24 <= $unsigned((((~&reg20[(4'h8):(2'h3)]) ?
              reg15[(4'he):(3'h7)] : ($unsigned(reg15) ?
                  (wire1 ? wire2 : reg7) : (!wire13))) | $unsigned((^~(reg17 ?
              reg22 : wire1)))));
        end
      else
        begin
          reg19 <= {$signed($signed(wire3[(4'hd):(3'h5)])),
              (reg5[(4'he):(1'h0)] ^ (reg9 ?
                  (+(reg16 ? reg23 : (8'hae))) : reg7))};
          reg20 <= $signed($signed((8'hac)));
        end
    end
  assign wire25 = ({reg5,
                          {((reg16 ? reg18 : reg17) ?
                                  (&(8'hbc)) : (wire2 ? reg16 : (8'hbb)))}} ?
                      $signed((wire0 - ($unsigned(reg5) << (|(8'hb6))))) : reg20[(4'h8):(1'h1)]);
  assign wire26 = (!$signed($unsigned($signed($signed((8'h9c))))));
  assign wire27 = ($signed($signed(wire12)) != (&((wire11 >= wire11[(3'h6):(1'h1)]) ^~ (~^(~reg16)))));
  assign wire28 = wire14[(3'h5):(2'h2)];
  assign wire29 = wire14[(3'h4):(1'h0)];
  module30 #() modinst62 (.wire33(wire26), .wire32(reg8), .y(wire61), .wire31(wire2), .wire35(reg23), .wire34(wire25), .clk(clk));
  always
    @(posedge clk) begin
      if (((&(((reg9 ?
              reg23 : reg23) >> $unsigned(reg8)) <<< (reg6[(1'h0):(1'h0)] ?
              $signed(reg20) : $signed(wire25)))) ?
          (reg24 + $signed(reg21)) : wire2))
        begin
          reg63 <= {(reg5 ?
                  (reg16[(1'h0):(1'h0)] == $signed($signed(reg17))) : reg22),
              wire14};
          if (wire29[(4'ha):(3'h4)])
            begin
              reg64 <= (~|(((wire13[(2'h3):(2'h3)] ?
                      $signed((8'hbe)) : (reg7 ?
                          (8'ha2) : reg16)) <= ($signed(wire10) ?
                      (reg20 != reg8) : ((8'hbe) ? reg5 : wire61))) ?
                  reg6 : reg63[(1'h0):(1'h0)]));
              reg65 <= ((wire61[(2'h3):(2'h3)] ~^ (~((reg5 > reg16) << {wire61,
                      reg21}))) ?
                  ((8'ha4) ?
                      $unsigned({{reg5,
                              wire14}}) : ((~{reg20}) <= $unsigned((reg8 ^ reg6)))) : ((wire12 >> $unsigned($signed(reg8))) ?
                      reg20 : reg18));
            end
          else
            begin
              reg64 <= wire26[(5'h10):(4'hd)];
              reg65 <= $signed(reg24[(1'h0):(1'h0)]);
              reg66 <= reg20;
              reg67 <= $signed(reg66);
              reg68 <= wire12[(3'h6):(3'h5)];
            end
          reg69 <= ((|(~|(^~((8'hb6) * reg23)))) ?
              (($signed(reg18[(3'h7):(2'h3)]) ?
                  reg19 : (~|$signed(reg15))) >>> (reg17[(3'h7):(1'h0)] <<< $unsigned($signed(wire25)))) : reg64[(4'h8):(2'h3)]);
          reg70 <= reg22;
          reg71 <= (^(($unsigned(reg16) >>> ((wire1 == reg65) >>> (-(7'h41)))) ?
              ({(!reg20)} <= $unsigned($signed(reg17))) : reg65));
        end
      else
        begin
          reg63 <= (~&(($signed((reg9 >> reg66)) ?
              (^(wire13 ? reg66 : (8'h9e))) : ($unsigned(wire61) ?
                  ((8'hba) ? reg68 : wire25) : (wire2 ?
                      wire10 : wire1))) + (~reg15[(4'h9):(1'h1)])));
          reg64 <= reg15;
          reg65 <= $signed((~$signed($signed(reg63))));
          reg66 <= ($signed(reg65) ?
              wire3 : ((((-reg19) ? reg68[(5'h15):(5'h10)] : reg5) ?
                  wire12[(5'h11):(5'h11)] : ((~|reg18) | wire3)) != reg22[(2'h2):(1'h1)]));
        end
      if (wire14)
        begin
          reg72 <= ($unsigned($unsigned((~(reg71 >> reg20)))) != ((8'hab) && $unsigned($signed(reg24))));
          reg73 <= wire27[(1'h1):(1'h1)];
          reg74 <= $unsigned((wire14[(3'h4):(3'h4)] > (reg4 ^ reg72[(3'h6):(1'h1)])));
        end
      else
        begin
          if ($unsigned((^(wire12 << {(reg4 ? reg70 : reg22), wire13}))))
            begin
              reg72 <= (((((&wire14) ?
                      (~|(8'ha1)) : {reg73}) ~^ ($unsigned(wire61) - (reg5 <<< reg19))) ?
                  (~^$unsigned((&wire2))) : (7'h43)) >>> $signed(((|{wire28}) * reg7[(2'h2):(1'h0)])));
            end
          else
            begin
              reg72 <= reg7[(3'h5):(2'h3)];
              reg73 <= ((~|((8'ha3) >> wire27)) < ((reg5[(3'h4):(2'h3)] ?
                      (wire12 ?
                          $signed(wire28) : $unsigned(wire12)) : wire0[(4'h8):(1'h0)]) ?
                  (-($signed((8'h9e)) ~^ $unsigned(wire12))) : (({reg70, reg9} ?
                          $signed(reg4) : (reg21 <= reg65)) ?
                      (|wire10[(3'h4):(1'h1)]) : $unsigned((wire12 >> reg6)))));
              reg74 <= (wire11[(1'h0):(1'h0)] ~^ (+(~wire3)));
              reg75 <= $unsigned(wire26[(2'h2):(2'h2)]);
            end
        end
      reg76 <= $signed((reg21[(5'h10):(3'h5)] && $unsigned({$unsigned(wire28)})));
      if ($unsigned((!($signed($signed(wire26)) ?
          ($signed((8'haa)) ? reg18 : (^~wire26)) : $signed((8'had))))))
        begin
          reg77 <= (reg16 ?
              ((reg76 - ((~reg19) ?
                      (reg9 ? (7'h41) : reg23) : (reg72 + reg5))) ?
                  wire3[(1'h0):(1'h0)] : $signed((-reg15[(2'h2):(1'h0)]))) : $unsigned(reg66[(1'h0):(1'h0)]));
          reg78 <= ($signed($unsigned($signed(reg76[(1'h0):(1'h0)]))) ?
              $signed($signed({reg67})) : $signed(reg73));
          reg79 <= reg77[(3'h5):(3'h4)];
          if (wire27)
            begin
              reg80 <= $signed(reg75);
              reg81 <= wire28;
              reg82 <= $signed($unsigned(reg75[(1'h0):(1'h0)]));
              reg83 <= $signed($signed(((reg64[(5'h13):(4'ha)] ?
                  (reg21 >> (8'hae)) : reg76[(1'h0):(1'h0)]) ^ ($unsigned(reg67) ?
                  ((8'ha6) ^~ reg18) : {reg78, (8'hac)}))));
              reg84 <= reg16[(2'h2):(1'h0)];
            end
          else
            begin
              reg80 <= (reg81[(3'h7):(3'h7)] ?
                  reg71[(4'h9):(2'h2)] : $signed($unsigned({wire27,
                      $unsigned(reg70)})));
            end
        end
      else
        begin
          if ((+reg76[(2'h2):(1'h0)]))
            begin
              reg77 <= reg84;
            end
          else
            begin
              reg77 <= (8'hb9);
              reg78 <= reg19;
            end
        end
    end
  assign wire85 = ((~|$signed(reg74)) + wire11[(3'h7):(2'h2)]);
endmodule

module module30
#(parameter param60 = (((~&(-((8'had) ? (7'h40) : (8'hbd)))) - (|((!(8'h9d)) ? ((8'hbe) ~^ (7'h43)) : (~(8'hb3))))) ? ((~|(~&(|(8'ha0)))) ~^ (8'hb1)) : ({{{(8'ha9), (8'ha3)}, (!(8'ha1))}} == {((|(7'h40)) ? {(8'hb8), (8'ha8)} : ((8'ha8) <= (8'hbe)))})))
(y, clk, wire31, wire32, wire33, wire34, wire35);
  output wire [(32'h49):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire31;
  input wire [(4'he):(1'h0)] wire32;
  input wire signed [(4'hc):(1'h0)] wire33;
  input wire [(4'hc):(1'h0)] wire34;
  input wire signed [(5'h10):(1'h0)] wire35;
  wire signed [(4'hf):(1'h0)] wire59;
  wire signed [(4'hf):(1'h0)] wire57;
  wire signed [(2'h3):(1'h0)] wire56;
  wire [(5'h10):(1'h0)] wire36;
  wire [(5'h12):(1'h0)] wire54;
  reg [(3'h5):(1'h0)] reg58 = (1'h0);
  assign y = {wire59, wire57, wire56, wire36, wire54, reg58, (1'h0)};
  assign wire36 = (wire33 ?
                      ($unsigned((!$signed(wire31))) && wire31[(3'h5):(1'h1)]) : wire31[(3'h7):(1'h0)]);
  module37 #() modinst55 (.wire39(wire35), .clk(clk), .y(wire54), .wire38(wire31), .wire42(wire32), .wire41(wire36), .wire40(wire34));
  assign wire56 = $signed((~^$unsigned(({wire34} ?
                      (wire54 ? wire32 : wire36) : $unsigned(wire32)))));
  assign wire57 = wire35[(3'h7):(2'h3)];
  always
    @(posedge clk) begin
      reg58 <= wire36;
    end
  assign wire59 = {wire54[(4'ha):(4'h8)], $signed(wire35)};
endmodule

module module37
#(parameter param52 = ((((((8'ha1) ^~ (8'hb7)) - ((8'hbb) ? (7'h40) : (8'ha6))) & {(^~(8'hb9)), (~&(8'hbb))}) * ((((8'hb2) ? (8'hb9) : (8'ha3)) - ((8'hb9) <<< (8'ha1))) <<< {((8'hb5) ? (8'ha4) : (8'hb9))})) ? (((8'ha9) ? (^{(8'hab)}) : (~|((7'h44) ? (8'ha8) : (8'haf)))) ? ({(~(8'ha3))} ? ((-(8'hb9)) ? ((7'h42) ? (8'ha0) : (8'h9c)) : ((8'hb2) ^ (8'hbd))) : ((8'hb1) ? ((7'h44) ? (8'h9c) : (8'ha2)) : ((8'ha0) >>> (8'haa)))) : {(((8'haf) >> (8'hbf)) ? (^(7'h42)) : (8'h9f)), (8'ha3)}) : ((!(~^(&(8'hb6)))) ? (|(((8'ha4) ^ (8'haf)) ^ (^(8'hbe)))) : ((((8'ha2) ~^ (8'ha7)) <= ((8'hb5) ? (8'had) : (8'ha1))) ? ((~|(8'had)) ? ((8'ha4) ? (8'ha5) : (8'hbc)) : ((8'ha6) ? (7'h41) : (8'hb0))) : (((8'hb1) && (8'hbf)) ^ (8'had))))), 
parameter param53 = (((-(~^param52)) >= (&(8'ha4))) ? param52 : param52))
(y, clk, wire42, wire41, wire40, wire39, wire38);
  output wire [(32'h67):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire42;
  input wire [(2'h3):(1'h0)] wire41;
  input wire [(3'h5):(1'h0)] wire40;
  input wire [(4'he):(1'h0)] wire39;
  input wire signed [(5'h15):(1'h0)] wire38;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(5'h14):(1'h0)] wire50;
  wire [(5'h10):(1'h0)] wire49;
  wire signed [(4'he):(1'h0)] wire48;
  wire signed [(5'h14):(1'h0)] wire47;
  wire signed [(3'h7):(1'h0)] wire46;
  wire signed [(4'hc):(1'h0)] wire45;
  wire signed [(2'h2):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire43;
  assign y = {wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire45,
                 wire44,
                 wire43,
                 (1'h0)};
  assign wire43 = ($signed(($unsigned($signed((8'hb9))) ?
                      wire39[(4'h9):(3'h6)] : wire42[(1'h1):(1'h0)])) - $signed(wire39[(3'h6):(3'h4)]));
  assign wire44 = $signed((+((|$unsigned(wire38)) <= wire41[(2'h3):(2'h3)])));
  assign wire45 = wire41;
  assign wire46 = ((|wire45[(4'hc):(1'h1)]) ?
                      ($signed($unsigned((wire45 ^~ (8'hb4)))) || (|$signed($signed(wire41)))) : wire44);
  assign wire47 = (+wire46[(3'h4):(2'h2)]);
  assign wire48 = (((~$signed(wire46[(1'h0):(1'h0)])) ?
                      {({wire46} ?
                              wire45[(1'h0):(1'h0)] : (+wire43))} : ((^(wire47 < (8'ha9))) ?
                          $unsigned($unsigned(wire46)) : {$signed(wire41),
                              (wire38 ? (8'ha8) : wire46)})) > wire47);
  assign wire49 = $signed((~&$signed($unsigned(wire43))));
  assign wire50 = (wire39[(2'h2):(2'h2)] == $unsigned({(+$signed((8'hbf)))}));
  assign wire51 = $signed(wire47);
endmodule
