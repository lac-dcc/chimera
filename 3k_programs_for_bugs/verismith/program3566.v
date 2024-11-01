module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire0;
  input wire [(5'h11):(1'h0)] wire1;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire3;
  wire [(4'h8):(1'h0)] wire53;
  wire [(4'hf):(1'h0)] wire52;
  wire signed [(4'hf):(1'h0)] wire4;
  wire [(5'h15):(1'h0)] wire50;
  assign y = {wire53, wire52, wire4, wire50, (1'h0)};
  assign wire4 = ((~{$unsigned((!wire0))}) ?
                     $signed(((~^wire3) <= ($signed(wire0) > $unsigned(wire1)))) : {(&((wire2 >> wire0) > {wire3,
                             wire3})),
                         $signed(wire3)});
  module5 #() modinst51 (wire50, clk, wire2, wire1, wire0, wire4, wire3);
  assign wire52 = $signed(wire3[(3'h5):(1'h1)]);
  assign wire53 = wire3;
endmodule

module module5
#(parameter param49 = ({((((8'hbb) || (7'h43)) ? (|(8'hbe)) : {(8'h9c), (8'ha7)}) - {((8'hbb) ? (8'h9e) : (8'hb9))})} ? (({((8'haa) ? (8'hb0) : (8'hab)), ((8'haf) ? (8'h9c) : (8'ha3))} ? (&{(8'hab), (8'ha6)}) : (^~{(8'hb3), (7'h42)})) >> ({((8'hb7) ? (8'h9c) : (7'h40))} ? (((8'hbf) ? (8'ha5) : (8'hb5)) ? ((8'hae) ? (8'ha2) : (8'hbb)) : ((8'hac) ? (8'ha4) : (8'ha4))) : (~&(~|(8'haf))))) : (-(8'hab))))
(y, clk, wire10, wire9, wire8, wire7, wire6);
  output wire [(32'he6):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(5'h11):(1'h0)] wire8;
  input wire [(4'hb):(1'h0)] wire7;
  input wire [(5'h13):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire47;
  wire [(3'h7):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire31;
  wire signed [(4'h9):(1'h0)] wire30;
  wire [(3'h7):(1'h0)] wire29;
  wire signed [(4'h9):(1'h0)] wire27;
  reg signed [(4'hf):(1'h0)] reg46 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg45 = (1'h0);
  reg [(5'h14):(1'h0)] reg44 = (1'h0);
  reg [(5'h12):(1'h0)] reg43 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg42 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg41 = (1'h0);
  reg [(3'h6):(1'h0)] reg40 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg39 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg38 = (1'h0);
  reg [(4'hd):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg36 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg35 = (1'h0);
  reg [(3'h7):(1'h0)] reg34 = (1'h0);
  reg [(5'h14):(1'h0)] reg33 = (1'h0);
  assign y = {wire48,
                 wire47,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 wire27,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 reg39,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  module11 #() modinst28 (.y(wire27), .wire13(wire9), .wire12(wire7), .wire14(wire8), .wire15(wire6), .clk(clk));
  assign wire29 = $unsigned(wire27[(2'h2):(1'h0)]);
  assign wire30 = ((+wire9[(2'h3):(1'h0)]) ?
                      (wire8[(4'hd):(3'h6)] ~^ (($unsigned((8'ha9)) ?
                          $unsigned(wire9) : $signed((8'h9e))) + wire8)) : (wire7[(2'h2):(1'h0)] ?
                          wire6[(4'hb):(3'h5)] : $signed($unsigned($unsigned(wire7)))));
  assign wire31 = (8'hb3);
  assign wire32 = ($unsigned((&$signed(wire7[(3'h6):(3'h5)]))) <= $unsigned($unsigned($signed((&wire10)))));
  always
    @(posedge clk) begin
      if (wire31)
        begin
          if ((wire31[(2'h3):(1'h1)] * wire31[(2'h2):(2'h2)]))
            begin
              reg33 <= (~|((!{(&wire6)}) <<< $unsigned(((~|wire32) & (wire8 ?
                  wire29 : wire6)))));
              reg34 <= $signed($unsigned((($signed(wire7) ?
                  $signed(wire30) : (+wire29)) | (wire29[(3'h6):(3'h6)] == (wire9 ?
                  wire31 : wire7)))));
              reg35 <= {$signed(reg34),
                  ({$unsigned(wire27[(1'h1):(1'h1)])} ?
                      ({((8'haf) ? wire10 : wire8)} ?
                          wire8 : $signed((~wire32))) : wire10[(2'h2):(2'h2)])};
              reg36 <= wire6;
            end
          else
            begin
              reg33 <= ($unsigned(wire7) >= ({$unsigned(reg36[(1'h1):(1'h0)]),
                      (^~wire8[(4'hf):(2'h2)])} ?
                  (8'hb7) : (((reg35 * wire30) ?
                          wire32[(1'h1):(1'h0)] : reg33) ?
                      (reg34[(3'h4):(1'h1)] ?
                          wire10[(4'hf):(1'h0)] : $signed(reg33)) : (^~$unsigned(reg36)))));
            end
          if (wire29)
            begin
              reg37 <= ($unsigned(wire29[(3'h6):(3'h5)]) ?
                  reg36 : reg33[(1'h0):(1'h0)]);
            end
          else
            begin
              reg37 <= wire10;
              reg38 <= reg36[(3'h6):(1'h0)];
              reg39 <= {wire29[(2'h3):(1'h0)], wire7};
              reg40 <= (reg36 ? (8'ha4) : $signed(reg35));
              reg41 <= ($signed($signed(wire31)) && $unsigned((~^$unsigned({reg35}))));
            end
        end
      else
        begin
          if ((8'ha2))
            begin
              reg33 <= {(^reg41),
                  (~&(|{reg38[(3'h6):(3'h5)], (reg41 ^~ (7'h40))}))};
              reg34 <= {($signed(reg35[(3'h4):(1'h0)]) * {$unsigned((reg38 ?
                          reg39 : wire31))}),
                  reg34};
              reg35 <= $signed($unsigned((($unsigned(reg34) << $signed(wire32)) >= $unsigned((^~reg34)))));
            end
          else
            begin
              reg33 <= ($unsigned(($unsigned(wire29[(3'h7):(1'h0)]) ?
                      (^reg35) : {(-(8'ha0)), $unsigned(reg36)})) ?
                  $unsigned((8'hb3)) : $unsigned(wire29[(3'h4):(3'h4)]));
              reg34 <= wire9[(4'hd):(4'hd)];
              reg35 <= $unsigned($signed(wire9[(5'h11):(4'hd)]));
              reg36 <= {($signed(wire29[(3'h5):(2'h3)]) ?
                      ($signed(wire27) ?
                          (~&{wire6}) : ((wire27 << reg35) ?
                              (&(8'hb3)) : {(8'hb5),
                                  reg33})) : ((~|reg34[(3'h5):(1'h0)]) * reg38)),
                  $unsigned((~&wire27))};
            end
          reg37 <= ($unsigned(({$signed(wire9)} ?
                  wire29 : ($unsigned(wire27) ?
                      (wire10 ^ (8'ha7)) : {wire6, wire31}))) ?
              (wire30 ?
                  (-wire6[(4'h8):(3'h7)]) : $unsigned((^~(&wire6)))) : {(^~$unsigned(wire10[(4'h9):(1'h0)]))});
        end
      if ($unsigned(((~&wire9[(3'h6):(3'h6)]) ~^ $unsigned(reg41))))
        begin
          if ($unsigned($signed(reg33[(4'hb):(2'h3)])))
            begin
              reg42 <= $unsigned(({{(~&reg35)}} ?
                  (~wire32[(3'h7):(1'h0)]) : (($signed(wire32) ?
                          wire9 : wire8) ?
                      {$signed(reg34), (8'ha1)} : $signed(reg37))));
              reg43 <= (+wire31);
              reg44 <= wire9;
              reg45 <= (+(^~((^reg37[(3'h6):(2'h3)]) & ($signed(reg43) ?
                  $signed(reg34) : (^wire32)))));
              reg46 <= ($signed({$unsigned($signed(wire27)),
                  $unsigned((reg42 ?
                      reg33 : (8'hb1)))}) <= (+($unsigned((reg41 ?
                  reg33 : wire29)) <<< reg40[(1'h1):(1'h1)])));
            end
          else
            begin
              reg42 <= $unsigned(wire7[(3'h7):(2'h2)]);
              reg43 <= $signed($signed(reg45));
              reg44 <= $signed($signed($unsigned($signed((wire30 ?
                  wire8 : (8'ha8))))));
              reg45 <= $signed((+$unsigned(reg33[(1'h0):(1'h0)])));
            end
        end
      else
        begin
          if (wire29)
            begin
              reg42 <= $signed($signed($unsigned((reg45 ?
                  wire6 : {wire7, wire32}))));
              reg43 <= wire27;
            end
          else
            begin
              reg42 <= (~reg38[(4'ha):(3'h5)]);
              reg43 <= $unsigned(reg42);
            end
        end
    end
  assign wire47 = $unsigned((~|wire29));
  assign wire48 = $unsigned((wire6[(5'h10):(4'hc)] ?
                      reg37 : $signed(wire29[(3'h7):(3'h7)])));
endmodule

module module11
#(parameter param25 = ((~(({(8'h9f), (7'h41)} ? (8'ha0) : (~(8'hba))) <<< (~((8'hbf) ? (7'h42) : (8'ha9))))) ? ((~&(~^(8'hb7))) ? (8'hbc) : ((+((8'ha0) <= (8'hb8))) ? ((~|(8'hb8)) + (~^(8'h9d))) : (((8'hb9) <<< (8'hb8)) ? (!(8'had)) : (^~(8'hb0))))) : {(-(((8'hac) && (8'ha6)) | (-(8'hbe))))}), 
parameter param26 = param25)
(y, clk, wire15, wire14, wire13, wire12);
  output wire [(32'h76):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire15;
  input wire signed [(3'h5):(1'h0)] wire14;
  input wire signed [(5'h11):(1'h0)] wire13;
  input wire [(4'h8):(1'h0)] wire12;
  wire signed [(5'h10):(1'h0)] wire24;
  wire [(5'h13):(1'h0)] wire23;
  wire signed [(4'h8):(1'h0)] wire22;
  wire signed [(4'ha):(1'h0)] wire21;
  wire [(4'h8):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire [(3'h5):(1'h0)] wire18;
  wire [(5'h11):(1'h0)] wire17;
  wire [(5'h13):(1'h0)] wire16;
  assign y = {wire24,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 (1'h0)};
  assign wire16 = (-(wire13 > wire12));
  assign wire17 = ((^wire12[(3'h6):(3'h6)]) > wire13);
  assign wire18 = $signed($signed((wire15 << wire17[(3'h5):(1'h1)])));
  assign wire19 = wire17;
  assign wire20 = {wire16[(1'h0):(1'h0)], (8'hbd)};
  assign wire21 = (~^(~^wire15));
  assign wire22 = {$signed(($unsigned({wire21}) ?
                          $signed((wire13 || wire12)) : {(^~wire13),
                              ((8'ha8) ? wire19 : wire19)}))};
  assign wire23 = $unsigned(($signed(wire19[(4'h8):(3'h6)]) ?
                      wire17[(3'h5):(1'h1)] : ({(wire15 >>> wire22),
                          (wire16 >> wire14)} ^ ($unsigned(wire17) ?
                          (!(8'had)) : (|wire19)))));
  assign wire24 = $unsigned($unsigned({(^~wire15[(4'ha):(2'h3)]),
                      $signed($unsigned((8'hb4)))}));
endmodule
