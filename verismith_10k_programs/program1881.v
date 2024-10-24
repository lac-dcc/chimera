module top
#(parameter param59 = (((((!(8'hbf)) != ((7'h44) ? (8'h9f) : (8'ha0))) ? (&(&(8'h9f))) : (^~((8'hb2) ? (7'h41) : (8'hb1)))) ? {{(+(8'ha5))}} : ((~|{(8'ha5), (8'hb1)}) & {((8'hbc) ? (8'hae) : (8'hb5))})) | ((((8'haa) ? (|(8'hbd)) : ((8'hb7) ? (8'hb0) : (8'h9f))) > (^((7'h40) == (8'hb0)))) <= ((((8'h9e) != (8'ha8)) ? (~|(8'ha0)) : (8'ha0)) ? (((8'had) <<< (8'hb7)) ^ (^~(8'hb8))) : (((8'hae) ? (7'h40) : (8'hbf)) ? ((8'hb6) >> (8'hb5)) : ((8'hb3) ~^ (8'hb7)))))), 
parameter param60 = param59)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h11c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire [(5'h12):(1'h0)] wire2;
  input wire [(2'h2):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire0;
  wire signed [(2'h2):(1'h0)] wire58;
  wire [(4'ha):(1'h0)] wire57;
  wire [(3'h4):(1'h0)] wire56;
  wire signed [(4'h8):(1'h0)] wire55;
  wire signed [(3'h6):(1'h0)] wire54;
  wire [(4'ha):(1'h0)] wire52;
  wire signed [(5'h15):(1'h0)] wire23;
  wire signed [(5'h10):(1'h0)] wire17;
  wire [(4'h9):(1'h0)] wire16;
  wire signed [(4'h9):(1'h0)] wire15;
  wire signed [(2'h3):(1'h0)] wire10;
  wire [(4'he):(1'h0)] wire9;
  wire signed [(5'h10):(1'h0)] wire5;
  wire [(3'h7):(1'h0)] wire4;
  reg signed [(4'hf):(1'h0)] reg22 = (1'h0);
  reg [(4'h9):(1'h0)] reg21 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg19 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg14 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg13 = (1'h0);
  reg [(5'h15):(1'h0)] reg12 = (1'h0);
  reg [(2'h3):(1'h0)] reg11 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg8 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg7 = (1'h0);
  reg [(5'h15):(1'h0)] reg6 = (1'h0);
  assign y = {wire58,
                 wire57,
                 wire56,
                 wire55,
                 wire54,
                 wire52,
                 wire23,
                 wire17,
                 wire16,
                 wire15,
                 wire10,
                 wire9,
                 wire5,
                 wire4,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire4 = wire0;
  assign wire5 = wire4[(3'h7):(1'h1)];
  always
    @(posedge clk) begin
      reg6 <= wire0[(3'h5):(1'h1)];
      reg7 <= ($unsigned(reg6[(4'hc):(4'h9)]) + wire4);
      reg8 <= {$signed((~|(-{wire0, (8'hac)}))),
          $unsigned($signed(((~wire0) ? {wire3} : wire4)))};
    end
  assign wire9 = $signed(($unsigned($unsigned((reg7 ?
                     wire5 : wire3))) > {$signed(reg6)}));
  assign wire10 = reg7;
  always
    @(posedge clk) begin
      if (wire2[(3'h5):(3'h4)])
        begin
          reg11 <= wire5[(4'ha):(3'h5)];
          reg12 <= $signed(wire5);
        end
      else
        begin
          reg11 <= (+($signed((reg7[(4'h9):(1'h1)] ?
              wire9[(4'hd):(4'ha)] : (-wire2))) || reg8[(3'h4):(2'h2)]));
          reg12 <= wire0;
          reg13 <= (+$signed(($unsigned(wire0) ?
              reg11[(2'h2):(1'h1)] : (+reg12[(5'h12):(1'h1)]))));
          reg14 <= (wire2 | wire0);
        end
    end
  assign wire15 = wire3;
  assign wire16 = $signed(({(reg13[(3'h6):(3'h4)] && (reg13 ?
                          reg6 : wire2))} << ({$unsigned(wire4),
                          reg6[(5'h14):(2'h3)]} ?
                      ($unsigned(wire0) ^~ (reg13 <= wire0)) : (wire1 ?
                          (reg11 ? wire0 : wire3) : {(8'ha8)}))));
  assign wire17 = $signed($unsigned($signed((~wire3[(4'hd):(3'h7)]))));
  always
    @(posedge clk) begin
      reg18 <= ((|$unsigned(($signed(reg8) && ((8'hb3) ^~ reg12)))) == wire9[(2'h2):(2'h2)]);
      reg19 <= (wire3[(5'h14):(4'h9)] >= reg11);
      reg20 <= $unsigned((wire3 ?
          wire4[(2'h3):(2'h3)] : ($unsigned(((8'ha4) <<< (8'hb3))) ?
              wire9[(4'hb):(4'h9)] : (8'hbe))));
      reg21 <= (($signed(wire17[(4'ha):(3'h4)]) >>> wire15) ?
          (~&(reg14[(4'h8):(1'h1)] - wire1)) : (8'haa));
      reg22 <= $unsigned(reg19);
    end
  assign wire23 = $unsigned((-$unsigned($unsigned({(8'h9e)}))));
  module24 #() modinst53 (wire52, clk, reg12, wire4, wire16, reg13);
  assign wire54 = $unsigned($signed((((&wire4) ?
                      $unsigned(reg7) : wire5) + {(reg11 >> reg8)})));
  assign wire55 = ($unsigned({$unsigned((wire54 < reg6)),
                          $unsigned(reg21[(2'h3):(1'h1)])}) ?
                      reg14 : {($unsigned($unsigned((8'h9d))) != reg7),
                          (($unsigned(reg20) ?
                              {(8'had), wire17} : {reg12}) > (7'h43))});
  assign wire56 = $signed($unsigned($unsigned(((reg6 ?
                      wire55 : wire5) ~^ {wire54, wire16}))));
  assign wire57 = wire16;
  assign wire58 = wire3[(4'hd):(4'h9)];
endmodule

module module24
#(parameter param50 = (((((~^(8'ha4)) & (~^(8'hb6))) ? (((8'hb3) >> (8'hac)) ? ((8'h9f) > (8'hb4)) : (-(7'h42))) : {{(8'hb7), (8'h9d)}, ((8'hb2) ? (8'hb8) : (8'ha1))}) >>> ({(8'ha4), ((8'hb6) ? (8'hab) : (8'h9e))} ~^ ((!(8'ha7)) ~^ ((8'hb5) > (8'h9c))))) ? ((((!(8'hb6)) ? (&(8'ha4)) : ((8'hb5) ? (8'ha6) : (8'h9f))) ? ((+(8'ha1)) == {(8'ha2)}) : (~|(|(8'ha3)))) ? ((((8'hab) ? (8'hbb) : (8'hb0)) + (|(8'h9c))) ? ((~|(8'h9f)) ? (8'h9e) : ((8'haa) || (8'hbd))) : ((8'ha8) ? ((8'hb6) <= (8'hb9)) : {(8'ha8)})) : {(^((8'h9e) ? (8'ha2) : (8'h9e))), (((8'hb0) != (8'hb7)) ? (-(7'h42)) : {(8'ha4), (8'hbc)})}) : (|(((~^(8'ha3)) ? (^~(7'h42)) : (~^(8'ha4))) * (((7'h40) ? (8'hb3) : (8'hb4)) ? ((8'ha9) || (7'h40)) : (&(8'h9c)))))), 
parameter param51 = (+(~&(param50 ? {(param50 ? param50 : param50), param50} : ((^~(8'haa)) ? (8'ha6) : {(8'ha5)})))))
(y, clk, wire28, wire27, wire26, wire25);
  output wire [(32'hf0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire28;
  input wire [(2'h2):(1'h0)] wire27;
  input wire signed [(4'h9):(1'h0)] wire26;
  input wire signed [(5'h15):(1'h0)] wire25;
  wire [(4'ha):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire43;
  wire [(4'hf):(1'h0)] wire42;
  wire [(3'h5):(1'h0)] wire41;
  wire [(4'hb):(1'h0)] wire40;
  wire signed [(4'h9):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire32;
  wire signed [(4'h8):(1'h0)] wire31;
  wire [(5'h10):(1'h0)] wire30;
  wire [(5'h10):(1'h0)] wire29;
  reg signed [(5'h14):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg48 = (1'h0);
  reg signed [(4'he):(1'h0)] reg47 = (1'h0);
  reg [(4'h8):(1'h0)] reg46 = (1'h0);
  reg [(4'hc):(1'h0)] reg45 = (1'h0);
  reg [(4'hc):(1'h0)] reg38 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg37 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(5'h15):(1'h0)] reg34 = (1'h0);
  reg [(2'h3):(1'h0)] reg33 = (1'h0);
  assign y = {wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire32,
                 wire31,
                 wire30,
                 wire29,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg38,
                 reg37,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
                 (1'h0)};
  assign wire29 = {(({wire26[(4'h8):(1'h1)], $unsigned(wire25)} ?
                              (~|wire28) : (wire28 <<< (wire27 ?
                                  wire28 : (8'h9f)))) ?
                          $signed(wire28) : $unsigned(((wire26 ?
                              wire26 : wire26) >> $signed(wire25))))};
  assign wire30 = (+($signed((&wire27)) && wire27[(2'h2):(1'h0)]));
  assign wire31 = (wire30 ? wire26[(3'h6):(1'h1)] : $signed(wire25));
  assign wire32 = (|{(^~(~&{wire31})), (8'had)});
  always
    @(posedge clk) begin
      if ((wire25[(3'h4):(1'h0)] < wire30))
        begin
          reg33 <= (^((8'h9f) ?
              ($signed(wire28) ?
                  $signed({wire27, (8'hac)}) : {((7'h40) + wire31),
                      (wire32 && wire32)}) : $unsigned(((wire25 * wire32) ?
                  (wire26 ? wire32 : wire27) : $signed(wire27)))));
          if (wire29)
            begin
              reg34 <= ($unsigned(wire31[(3'h4):(2'h2)]) & wire25);
              reg35 <= $signed((((-$unsigned(wire27)) ?
                  $unsigned(wire30) : wire31) >>> wire25[(3'h4):(3'h4)]));
              reg36 <= $unsigned(wire29[(1'h1):(1'h0)]);
            end
          else
            begin
              reg34 <= wire29;
              reg35 <= $unsigned(($unsigned(reg35) != ({(wire27 ?
                          wire26 : (8'h9d))} ?
                  $unsigned((reg33 < reg35)) : (~^wire28))));
              reg36 <= wire32[(2'h3):(2'h3)];
            end
          reg37 <= $unsigned($unsigned($signed((+$unsigned(reg35)))));
        end
      else
        begin
          reg33 <= $signed(reg35);
          if ((reg37 && (wire32 ~^ wire26)))
            begin
              reg34 <= wire32[(3'h7):(1'h1)];
              reg35 <= (wire31[(3'h4):(1'h1)] | {$unsigned($unsigned((wire26 ?
                      reg35 : wire32)))});
              reg36 <= (8'ha1);
            end
          else
            begin
              reg34 <= $signed(((!$signed($signed(wire27))) ?
                  (~&(reg35[(2'h3):(2'h2)] ?
                      (reg37 >>> reg34) : wire31[(3'h5):(1'h1)])) : (7'h44)));
              reg35 <= $signed(reg34[(1'h1):(1'h0)]);
            end
          reg37 <= wire28;
        end
      reg38 <= {$unsigned((wire31[(1'h1):(1'h0)] >>> (wire29 ?
              $unsigned(reg35) : (wire31 ? (8'ha5) : reg34))))};
    end
  assign wire39 = wire29[(4'hc):(4'h8)];
  assign wire40 = wire28;
  assign wire41 = (wire40[(4'ha):(3'h4)] ?
                      ($unsigned((~^wire28)) ?
                          $unsigned({$unsigned((8'haf))}) : $signed(reg33)) : (^wire25));
  assign wire42 = wire31;
  assign wire43 = $unsigned($signed((reg37[(1'h0):(1'h0)] ?
                      ($signed((8'ha7)) < reg34) : (^~$unsigned(wire27)))));
  assign wire44 = ((^wire30[(4'hc):(4'ha)]) ?
                      {(-$signed((^wire41)))} : $signed($signed((|((8'hbb) ?
                          wire31 : wire42)))));
  always
    @(posedge clk) begin
      reg45 <= {(~|{wire27, {reg34[(2'h2):(2'h2)], (~|reg37)}})};
      reg46 <= {wire29[(4'hd):(4'hd)]};
      reg47 <= wire41;
      reg48 <= {(((wire31 == reg47[(3'h6):(2'h2)]) | $signed((reg36 ?
              wire27 : reg36))) > ($unsigned($signed(wire26)) + ($signed(wire44) ?
              (wire26 ? (8'hb2) : wire31) : (wire39 - (8'hb9)))))};
      reg49 <= (($unsigned((wire39 ?
                  ((8'hbd) ? reg47 : reg37) : ((7'h43) ? reg45 : reg34))) ?
              ((^wire41) ? reg35 : reg33) : (^~(reg38 ?
                  wire29[(4'hb):(2'h3)] : (~|wire39)))) ?
          (&{({reg47} - $unsigned(reg35)), $signed((-reg36))}) : wire43);
    end
endmodule
