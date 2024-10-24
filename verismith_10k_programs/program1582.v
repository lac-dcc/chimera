module top
#(parameter param85 = (^{(~^(|{(8'ha8)}))}))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h11):(1'h0)] wire3;
  input wire signed [(5'h12):(1'h0)] wire2;
  input wire [(5'h12):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire84;
  wire signed [(5'h15):(1'h0)] wire83;
  wire [(3'h5):(1'h0)] wire81;
  wire signed [(5'h15):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire4;
  assign y = {wire84, wire83, wire81, wire5, wire4, (1'h0)};
  assign wire4 = ((~(wire2 && $signed((wire0 >= wire1)))) && wire3[(2'h3):(2'h3)]);
  assign wire5 = wire2;
  module6 #() modinst82 (.y(wire81), .wire8(wire4), .wire9(wire5), .wire10(wire1), .wire7(wire3), .clk(clk));
  assign wire83 = $unsigned(wire5);
  assign wire84 = {$signed({wire1})};
endmodule

module module6
#(parameter param80 = ({((((8'ha8) ? (8'ha5) : (8'h9e)) >> ((8'ha5) ? (8'ha2) : (8'hba))) > (8'h9d)), ((+((8'hab) ? (8'haa) : (8'h9f))) ? ({(8'haf), (8'ha7)} == {(8'ha9), (8'ha8)}) : {((7'h41) <= (8'hab)), (^(8'hb0))})} ? (~{(-(~(8'hb3)))}) : (~^((~{(7'h41), (8'ha2)}) ~^ (((8'had) == (8'ha1)) - (~(8'hb2)))))))
(y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire10;
  input wire [(5'h15):(1'h0)] wire9;
  input wire signed [(5'h10):(1'h0)] wire8;
  input wire [(5'h11):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire79;
  wire [(4'hd):(1'h0)] wire78;
  wire [(5'h12):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire64;
  wire signed [(2'h2):(1'h0)] wire62;
  wire [(2'h3):(1'h0)] wire28;
  wire signed [(4'he):(1'h0)] wire27;
  wire signed [(4'hd):(1'h0)] wire25;
  reg signed [(3'h7):(1'h0)] reg77 = (1'h0);
  reg [(4'hf):(1'h0)] reg75 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg74 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg73 = (1'h0);
  reg [(5'h14):(1'h0)] reg72 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg71 = (1'h0);
  reg [(2'h3):(1'h0)] reg70 = (1'h0);
  reg [(2'h3):(1'h0)] reg69 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg68 = (1'h0);
  reg [(4'hf):(1'h0)] reg67 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg66 = (1'h0);
  reg [(5'h12):(1'h0)] reg65 = (1'h0);
  assign y = {wire79,
                 wire78,
                 wire76,
                 wire64,
                 wire62,
                 wire28,
                 wire27,
                 wire25,
                 reg77,
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
                 (1'h0)};
  module11 #() modinst26 (.wire15(wire10), .wire14(wire8), .y(wire25), .wire12(wire7), .clk(clk), .wire13(wire9));
  assign wire27 = wire8;
  assign wire28 = {((wire7 ?
                          wire8[(4'hc):(4'ha)] : (~^(wire8 < wire8))) >= (^$unsigned($signed(wire7))))};
  module29 #() modinst63 (.wire33(wire9), .clk(clk), .wire32(wire27), .y(wire62), .wire31(wire10), .wire30(wire25));
  assign wire64 = {{wire9[(2'h2):(1'h1)],
                          $unsigned(((+wire25) ?
                              wire28[(1'h1):(1'h0)] : $unsigned(wire10)))},
                      ((($signed(wire7) != (wire9 >= (8'hbd))) ?
                          $signed(wire27[(3'h7):(3'h7)]) : ($signed(wire28) * {wire27})) > $signed($signed((wire8 * wire9))))};
  always
    @(posedge clk) begin
      reg65 <= $signed((wire64 ?
          ((wire10[(3'h4):(1'h0)] ? wire64[(1'h1):(1'h1)] : {wire27}) ?
              wire27 : wire8[(4'hd):(3'h5)]) : (7'h42)));
      reg66 <= $unsigned((8'hb1));
      if ($unsigned(wire64[(4'h8):(2'h2)]))
        begin
          if (wire25[(2'h3):(2'h2)])
            begin
              reg67 <= $signed($unsigned($signed($unsigned($signed((8'hbc))))));
              reg68 <= (~|($unsigned(((wire25 ? wire27 : (8'hb4)) >= (wire7 ?
                  wire62 : reg67))) <<< reg66));
              reg69 <= (((!((wire27 ? reg66 : wire9) ?
                      {(7'h42),
                          wire25} : (wire10 ^~ reg65))) & wire28[(1'h0):(1'h0)]) ?
                  wire28 : $unsigned($unsigned(wire10[(4'ha):(1'h1)])));
              reg70 <= wire8[(3'h4):(1'h0)];
              reg71 <= reg67;
            end
          else
            begin
              reg67 <= ((8'ha0) || (^wire27));
              reg68 <= reg69[(1'h1):(1'h1)];
            end
          if (((!$unsigned($unsigned($signed(reg68)))) ?
              reg69[(1'h0):(1'h0)] : $signed({($signed(reg66) ^~ (+reg66)),
                  (~^reg71)})))
            begin
              reg72 <= wire25;
              reg73 <= $unsigned(wire28[(1'h1):(1'h1)]);
            end
          else
            begin
              reg72 <= wire62[(1'h0):(1'h0)];
              reg73 <= reg68;
              reg74 <= (~|$unsigned((~|$signed(reg69))));
              reg75 <= {wire27[(4'ha):(3'h7)]};
            end
        end
      else
        begin
          if ((^$unsigned(wire25[(4'hd):(4'hb)])))
            begin
              reg67 <= ((&((wire9 >= $signed(reg74)) ?
                      $unsigned(wire25) : wire28)) ?
                  reg74 : reg72);
              reg68 <= wire62;
              reg69 <= $signed($unsigned($signed(reg65[(4'hc):(4'ha)])));
              reg70 <= (8'hb3);
              reg71 <= (!(^{{(reg65 ? wire8 : reg71)}}));
            end
          else
            begin
              reg67 <= (+{(wire25 ?
                      ((wire7 + (8'hb0)) != reg67) : {(reg66 ^ reg66),
                          (wire9 - reg68)})});
            end
          reg72 <= (((reg65 ?
              (~^$signed(reg69)) : $unsigned($signed(wire8))) & reg65[(4'hc):(3'h7)]) == reg70);
          reg73 <= {$unsigned($unsigned(reg74)), reg75[(1'h1):(1'h1)]};
        end
    end
  assign wire76 = ({(|$unsigned($unsigned((8'ha7))))} + reg73);
  always
    @(posedge clk) begin
      reg77 <= reg69[(2'h2):(1'h1)];
    end
  assign wire78 = (($unsigned({reg67, $signed((7'h40))}) ?
                          (((^wire62) ^~ $signed((7'h43))) ?
                              (((8'ha9) ~^ reg68) >= $signed(wire9)) : $signed(((8'h9c) ?
                                  (8'hb2) : (8'hb5)))) : $unsigned(((wire8 >> reg66) ?
                              reg67 : wire8))) ?
                      wire25[(3'h4):(2'h2)] : wire62[(1'h0):(1'h0)]);
  assign wire79 = reg69;
endmodule

module module29
#(parameter param61 = ((((~|{(8'hb4), (8'hb2)}) >> {(!(8'ha0)), ((8'hbc) ? (8'hbc) : (8'haa))}) >>> ((((8'ha9) * (8'ha0)) ? ((8'ha4) * (8'hb5)) : ((8'h9e) || (8'had))) ? {((8'hb7) ? (8'hb3) : (8'hb8)), ((7'h44) ? (8'hab) : (7'h42))} : (((8'haf) ? (8'hb7) : (7'h40)) >>> (-(8'ha6))))) ? (((~|(~(8'ha5))) ? ((8'hb9) ? {(8'haa)} : {(8'ha1)}) : (((8'ha1) >>> (8'hb4)) ? ((8'hb7) <<< (8'hac)) : (~^(8'hb9)))) || (^~{((8'ha9) << (8'ha9)), ((8'hbd) | (7'h41))})) : {((((8'hb0) < (8'h9f)) >>> (8'hb0)) ? (((7'h41) ? (7'h41) : (8'hbb)) >= ((8'hb7) <<< (8'had))) : (^~((8'ha8) ? (8'hb4) : (8'ha8))))}))
(y, clk, wire33, wire32, wire31, wire30);
  output wire [(32'h164):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire33;
  input wire [(4'he):(1'h0)] wire32;
  input wire signed [(3'h5):(1'h0)] wire31;
  input wire [(3'h5):(1'h0)] wire30;
  wire signed [(3'h5):(1'h0)] wire60;
  wire signed [(2'h3):(1'h0)] wire59;
  wire signed [(4'hc):(1'h0)] wire58;
  wire signed [(5'h10):(1'h0)] wire52;
  wire [(3'h6):(1'h0)] wire51;
  wire [(4'ha):(1'h0)] wire50;
  wire signed [(5'h10):(1'h0)] wire49;
  wire [(4'hd):(1'h0)] wire44;
  wire signed [(5'h14):(1'h0)] wire43;
  wire signed [(3'h4):(1'h0)] wire42;
  wire [(5'h13):(1'h0)] wire41;
  wire [(5'h15):(1'h0)] wire40;
  wire signed [(5'h15):(1'h0)] wire39;
  wire [(5'h11):(1'h0)] wire38;
  wire signed [(4'h9):(1'h0)] wire34;
  reg signed [(5'h15):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg [(5'h15):(1'h0)] reg55 = (1'h0);
  reg [(5'h11):(1'h0)] reg54 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg53 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg48 = (1'h0);
  reg [(3'h6):(1'h0)] reg47 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg46 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg45 = (1'h0);
  reg [(4'hf):(1'h0)] reg37 = (1'h0);
  reg [(5'h12):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  assign y = {wire60,
                 wire59,
                 wire58,
                 wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire34,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg37,
                 reg36,
                 reg35,
                 (1'h0)};
  assign wire34 = (8'hb7);
  always
    @(posedge clk) begin
      reg35 <= wire34[(4'h8):(4'h8)];
      reg36 <= ($unsigned((~^wire32)) && ($signed(wire31) * reg35[(1'h1):(1'h0)]));
      reg37 <= (wire33 ^~ ((|reg35[(1'h1):(1'h1)]) && wire33));
    end
  assign wire38 = $signed($unsigned((wire32[(3'h7):(3'h5)] ?
                      $signed($signed(wire33)) : wire33[(4'he):(2'h3)])));
  assign wire39 = {$unsigned(({(wire38 <<< (8'ha2)),
                              ((8'ha2) ? wire34 : wire32)} ?
                          reg37 : wire30)),
                      wire38};
  assign wire40 = (-reg36[(4'hd):(1'h0)]);
  assign wire41 = {wire39[(1'h0):(1'h0)], $unsigned(wire33[(1'h0):(1'h0)])};
  assign wire42 = $unsigned((wire34[(3'h7):(3'h5)] ^ $signed(wire34)));
  assign wire43 = reg35;
  assign wire44 = $unsigned($unsigned($unsigned({wire40[(3'h4):(1'h1)]})));
  always
    @(posedge clk) begin
      reg45 <= $signed({(+(wire43[(1'h0):(1'h0)] ?
              (reg36 + wire43) : wire39))});
      reg46 <= wire42;
      reg47 <= $unsigned($unsigned((-($signed(wire41) ?
          $signed(reg37) : (wire33 >>> wire32)))));
      reg48 <= wire39;
    end
  assign wire49 = $unsigned((+{wire41[(4'ha):(3'h7)]}));
  assign wire50 = wire31;
  assign wire51 = (!(!(&$signed((-wire30)))));
  assign wire52 = $unsigned((wire50 ?
                      (reg36 != ((~|wire42) >> wire42[(3'h4):(1'h1)])) : wire44));
  always
    @(posedge clk) begin
      reg53 <= ($unsigned((wire41 ?
          {(~wire44),
              (reg36 ?
                  reg37 : (8'hb7))} : ((wire50 && wire30) <= (~(8'hb9))))) >>> {(8'ha7)});
      reg54 <= ($signed($unsigned(((8'hb6) >= $unsigned(reg48)))) & $unsigned(wire41));
      reg55 <= $unsigned((|(8'haf)));
      reg56 <= (-({{$signed(wire38)},
          (reg54[(4'hd):(3'h6)] ~^ (wire32 ?
              wire32 : wire50))} ~^ ($unsigned((reg45 || wire44)) ?
          ((~&wire32) ? reg53 : wire40) : reg55)));
      reg57 <= reg35[(1'h0):(1'h0)];
    end
  assign wire58 = wire33;
  assign wire59 = {$signed(((wire33[(4'h8):(2'h3)] ? reg57 : (~^reg35)) ?
                          ($unsigned(wire30) * $signed(wire30)) : (wire34[(3'h4):(2'h3)] ^~ $unsigned((8'hb1)))))};
  assign wire60 = wire58[(4'h9):(3'h4)];
endmodule

module module11  (y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h78):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire15;
  input wire signed [(3'h4):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire [(2'h2):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire24;
  wire [(5'h12):(1'h0)] wire20;
  wire [(4'h9):(1'h0)] wire19;
  wire [(4'hf):(1'h0)] wire18;
  wire [(5'h12):(1'h0)] wire17;
  wire signed [(4'hf):(1'h0)] wire16;
  reg [(4'h9):(1'h0)] reg23 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg21 = (1'h0);
  assign y = {wire24,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire16 = $signed($unsigned($signed(wire13[(4'hb):(2'h3)])));
  assign wire17 = ($signed(((-(-wire15)) ?
                          (wire16[(4'ha):(3'h7)] ~^ wire16[(4'ha):(1'h1)]) : (wire16 < $signed((7'h44))))) ?
                      wire12[(1'h1):(1'h1)] : ((~^(+(8'ha4))) && {{$unsigned(wire12)},
                          $unsigned(wire13)}));
  assign wire18 = wire13[(4'hf):(3'h6)];
  assign wire19 = (wire12 ?
                      ((|wire16[(2'h2):(1'h1)]) >= wire18[(4'h8):(3'h7)]) : wire17[(3'h4):(2'h3)]);
  assign wire20 = $signed(wire16[(1'h1):(1'h0)]);
  always
    @(posedge clk) begin
      reg21 <= (!wire19[(1'h1):(1'h0)]);
      reg22 <= ($unsigned($unsigned(({wire12, wire14} ?
              (reg21 ? wire13 : (8'ha7)) : wire20[(4'ha):(4'ha)]))) ?
          ({wire16[(1'h0):(1'h0)], $unsigned({wire16, wire19})} ?
              $signed((&(wire13 ^~ reg21))) : (($unsigned(wire14) ?
                      ((7'h44) ? wire12 : wire17) : (wire14 ?
                          wire18 : wire16)) ?
                  wire13[(3'h6):(2'h2)] : ($unsigned((8'hb5)) ?
                      (7'h44) : (wire19 ?
                          wire19 : wire18)))) : $signed((^(+(wire15 ?
              wire20 : wire12)))));
      reg23 <= wire19[(3'h7):(2'h3)];
    end
  assign wire24 = ($signed($unsigned(wire12[(1'h0):(1'h0)])) & reg22[(4'h9):(3'h7)]);
endmodule
