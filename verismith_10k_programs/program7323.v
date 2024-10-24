module top
#(parameter param58 = (^((~|(~|((8'hbf) - (8'ha1)))) ? (&(!((7'h41) ? (8'hb3) : (8'ha2)))) : (7'h41))), 
parameter param59 = ({{((param58 ? param58 : param58) + (8'had))}} | (~&param58)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire4;
  input wire [(5'h15):(1'h0)] wire3;
  input wire [(5'h13):(1'h0)] wire2;
  input wire [(5'h15):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(5'h14):(1'h0)] wire43;
  wire [(3'h4):(1'h0)] wire41;
  wire signed [(3'h7):(1'h0)] wire7;
  wire signed [(5'h11):(1'h0)] wire6;
  wire [(4'hc):(1'h0)] wire5;
  reg signed [(5'h14):(1'h0)] reg57 = (1'h0);
  reg [(3'h5):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg55 = (1'h0);
  reg [(4'he):(1'h0)] reg54 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg52 = (1'h0);
  reg [(4'hb):(1'h0)] reg51 = (1'h0);
  reg [(4'hb):(1'h0)] reg50 = (1'h0);
  reg [(3'h7):(1'h0)] reg49 = (1'h0);
  reg [(3'h6):(1'h0)] reg48 = (1'h0);
  reg [(5'h12):(1'h0)] reg47 = (1'h0);
  reg [(4'ha):(1'h0)] reg46 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg45 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg44 = (1'h0);
  assign y = {wire43,
                 wire41,
                 wire7,
                 wire6,
                 wire5,
                 reg57,
                 reg56,
                 reg55,
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
                 (1'h0)};
  assign wire5 = $unsigned($signed((wire4 ?
                     ((+wire2) && $signed(wire2)) : $signed((~&wire3)))));
  assign wire6 = wire5[(2'h3):(2'h2)];
  assign wire7 = {(!$unsigned($unsigned((~^wire4)))),
                     (+((wire1 ? wire5 : {(8'hb0), wire0}) ?
                         $unsigned((wire6 ? wire1 : (8'ha9))) : ({wire0,
                                 wire4} ?
                             {(8'ha4), (8'ha6)} : ((8'haf) < wire3))))};
  module8 #() modinst42 (wire41, clk, wire1, wire5, wire6, wire4);
  assign wire43 = (wire7 ~^ $signed(wire0));
  always
    @(posedge clk) begin
      if ($unsigned($unsigned(($signed({wire6, wire43}) && $signed({wire3,
          wire1})))))
        begin
          reg44 <= wire5[(4'hb):(3'h6)];
          reg45 <= $signed((((wire3 ^ ((8'hba) ? (8'ha4) : wire2)) ?
                  (+{wire0}) : (|wire6)) ?
              $unsigned({(~&wire41),
                  wire1[(4'ha):(1'h1)]}) : $signed($signed($signed(reg44)))));
          reg46 <= (~($signed((~^wire2)) ?
              ((|wire4[(5'h12):(2'h3)]) ?
                  (wire0[(5'h11):(3'h5)] ?
                      ((8'had) + wire43) : {reg45}) : (^~((8'hbf) << wire6))) : ($unsigned((-wire1)) ?
                  wire2[(3'h4):(2'h2)] : $signed((wire6 ? wire4 : wire5)))));
          reg47 <= reg46[(4'ha):(1'h1)];
        end
      else
        begin
          reg44 <= {(~&wire41)};
          reg45 <= ({$signed(((^wire3) ?
                      wire0[(4'he):(4'hd)] : $unsigned(wire43)))} ?
              {wire6} : {$unsigned(({wire6} ?
                      $signed(wire43) : $signed(wire0))),
                  $signed(($signed(wire5) ?
                      $unsigned(reg44) : (wire0 ? reg47 : (8'hb7))))});
          reg46 <= wire0[(3'h4):(3'h4)];
          if (wire5[(4'ha):(4'ha)])
            begin
              reg47 <= wire41[(1'h0):(1'h0)];
              reg48 <= (^~$signed({wire6[(2'h3):(1'h0)]}));
            end
          else
            begin
              reg47 <= ((wire1 && $signed({(reg46 + reg45),
                      $unsigned(reg47)})) ?
                  $unsigned($unsigned(wire7[(2'h2):(1'h0)])) : wire41[(2'h3):(1'h1)]);
              reg48 <= wire43[(3'h6):(3'h6)];
            end
          reg49 <= $signed((8'hb0));
        end
      reg50 <= (-$signed((((&reg47) || reg45[(1'h1):(1'h1)]) - wire41[(2'h2):(2'h2)])));
      if ((wire6[(4'hb):(2'h2)] ?
          ((^~$unsigned(reg50)) ? wire2 : wire6) : wire7[(3'h7):(2'h2)]))
        begin
          reg51 <= $unsigned(reg47[(3'h6):(1'h0)]);
          reg52 <= reg45[(1'h1):(1'h0)];
          reg53 <= reg46;
          if ((~|$unsigned({$unsigned(wire0[(5'h12):(4'h9)]),
              $unsigned(reg46[(1'h1):(1'h1)])})))
            begin
              reg54 <= wire43;
              reg55 <= {reg50, (+(|(8'ha4)))};
              reg56 <= (~^$unsigned(wire5));
            end
          else
            begin
              reg54 <= (~&$signed(((wire1[(3'h7):(2'h3)] ?
                  (reg45 ?
                      reg50 : (8'ha8)) : reg51[(2'h3):(1'h1)]) && reg51[(3'h7):(1'h1)])));
            end
          reg57 <= ($unsigned($signed($unsigned((wire1 ~^ (8'hb2))))) ?
              reg47[(4'hc):(3'h7)] : {{$unsigned((wire2 > wire0))},
                  (reg47 * (~{reg56}))});
        end
      else
        begin
          reg51 <= (reg55 << ((8'hb1) && ($signed($signed(reg49)) ?
              wire6[(4'hd):(4'h8)] : (8'hb6))));
          reg52 <= {reg44};
          reg53 <= {wire3, reg44[(4'hf):(3'h5)]};
          reg54 <= $unsigned(reg52);
        end
    end
endmodule

module module8  (y, clk, wire12, wire11, wire10, wire9);
  output wire [(32'hb6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire12;
  input wire [(4'hb):(1'h0)] wire11;
  input wire signed [(5'h11):(1'h0)] wire10;
  input wire signed [(5'h14):(1'h0)] wire9;
  wire signed [(4'ha):(1'h0)] wire40;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(4'he):(1'h0)] wire38;
  wire [(2'h3):(1'h0)] wire36;
  wire signed [(2'h3):(1'h0)] wire22;
  wire signed [(5'h15):(1'h0)] wire21;
  wire signed [(5'h11):(1'h0)] wire20;
  wire [(5'h12):(1'h0)] wire19;
  wire [(5'h13):(1'h0)] wire18;
  wire signed [(5'h11):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  wire signed [(4'he):(1'h0)] wire15;
  wire [(4'h8):(1'h0)] wire14;
  wire [(4'ha):(1'h0)] wire13;
  assign y = {wire40,
                 wire39,
                 wire38,
                 wire36,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 (1'h0)};
  assign wire13 = (+(&$unsigned($signed($unsigned(wire11)))));
  assign wire14 = ($unsigned(wire9) & $unsigned(wire12[(4'he):(3'h5)]));
  assign wire15 = wire11;
  assign wire16 = (wire12[(3'h7):(3'h7)] ?
                      (wire11[(3'h4):(1'h1)] ^ wire9) : wire10[(2'h2):(1'h0)]);
  assign wire17 = (+((^$signed(wire9[(2'h2):(2'h2)])) ?
                      (8'ha5) : $unsigned(wire15[(4'hc):(2'h3)])));
  assign wire18 = $signed(wire16[(5'h13):(1'h1)]);
  assign wire19 = wire10[(4'h8):(3'h4)];
  assign wire20 = (^wire11);
  assign wire21 = (~^wire11);
  assign wire22 = wire19;
  module23 #() modinst37 (wire36, clk, wire20, wire15, wire21, wire9);
  assign wire38 = ($signed($unsigned($signed(wire14[(3'h6):(2'h2)]))) >> wire20);
  assign wire39 = ($unsigned($unsigned($unsigned(wire17))) ?
                      $signed(wire22) : ($unsigned($signed((^~wire11))) ?
                          ($unsigned($unsigned((8'hb4))) < {((8'hbb) ?
                                  wire21 : (8'hb6)),
                              $unsigned(wire15)}) : $signed(wire21)));
  assign wire40 = ((~^$unsigned((!(+wire36)))) ?
                      (~(~{(!wire9),
                          (wire20 ?
                              wire13 : wire13)})) : (+$unsigned((8'h9d))));
endmodule

module module23
#(parameter param34 = (({(|((8'ha7) >>> (8'hb6))), (((8'hb8) ? (8'hb5) : (8'h9e)) ? (|(8'hac)) : ((8'hb1) << (8'h9d)))} ^ (8'hae)) & {({((8'hb9) == (8'ha6)), ((8'hab) ^ (8'h9e))} ? {((8'ha2) && (8'ha4))} : (^((8'had) & (8'hb1)))), ((&(-(8'hbf))) ? (((8'ha6) ? (8'had) : (8'haf)) != ((8'had) ? (8'ha2) : (8'hac))) : ((^(8'hab)) && (8'hb1)))}), 
parameter param35 = (~(param34 ? ({((7'h43) || param34), {param34}} > (~^((8'hb8) ? param34 : param34))) : ((~&param34) ? (8'had) : ((param34 | param34) < (+(8'h9e)))))))
(y, clk, wire27, wire26, wire25, wire24);
  output wire [(32'h5e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire27;
  input wire [(4'h8):(1'h0)] wire26;
  input wire signed [(4'ha):(1'h0)] wire25;
  input wire [(5'h14):(1'h0)] wire24;
  wire signed [(5'h11):(1'h0)] wire33;
  wire signed [(5'h15):(1'h0)] wire32;
  wire signed [(5'h14):(1'h0)] wire31;
  wire [(4'hf):(1'h0)] wire30;
  wire [(2'h2):(1'h0)] wire29;
  wire [(5'h12):(1'h0)] wire28;
  assign y = {wire33, wire32, wire31, wire30, wire29, wire28, (1'h0)};
  assign wire28 = $unsigned(($signed($unsigned(wire24[(4'ha):(3'h7)])) ?
                      $signed(wire27[(2'h2):(2'h2)]) : (-wire24[(4'hb):(4'ha)])));
  assign wire29 = $signed(wire27[(2'h2):(1'h1)]);
  assign wire30 = ((^(((wire27 != wire26) == wire27) <= ((wire24 ?
                          wire26 : wire25) - {wire25, (8'hbb)}))) ?
                      {wire25[(3'h5):(2'h2)]} : ((8'h9f) | (-wire24)));
  assign wire31 = (^~$unsigned(((~wire26[(1'h1):(1'h0)]) ?
                      $unsigned(wire30[(3'h7):(3'h4)]) : (!(wire29 - wire30)))));
  assign wire32 = $unsigned($signed(wire28));
  assign wire33 = wire32[(3'h4):(2'h2)];
endmodule
