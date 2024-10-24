module top  (y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h142):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire [(5'h10):(1'h0)] wire1;
  input wire signed [(4'hb):(1'h0)] wire2;
  input wire signed [(4'h9):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire51;
  wire signed [(3'h6):(1'h0)] wire50;
  wire signed [(5'h15):(1'h0)] wire4;
  wire [(3'h7):(1'h0)] wire5;
  wire signed [(5'h10):(1'h0)] wire6;
  wire [(5'h15):(1'h0)] wire7;
  wire signed [(3'h5):(1'h0)] wire48;
  reg signed [(4'h9):(1'h0)] reg71 = (1'h0);
  reg [(2'h2):(1'h0)] reg70 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg69 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg68 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg67 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg66 = (1'h0);
  reg [(4'hc):(1'h0)] reg65 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg64 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg63 = (1'h0);
  reg [(2'h2):(1'h0)] reg62 = (1'h0);
  reg [(5'h14):(1'h0)] reg61 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg60 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg59 = (1'h0);
  reg [(4'hd):(1'h0)] reg58 = (1'h0);
  reg [(5'h11):(1'h0)] reg57 = (1'h0);
  reg [(4'hb):(1'h0)] reg56 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg55 = (1'h0);
  reg [(5'h12):(1'h0)] reg54 = (1'h0);
  reg [(2'h3):(1'h0)] reg53 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg52 = (1'h0);
  assign y = {wire51,
                 wire50,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire48,
                 reg71,
                 reg70,
                 reg69,
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
                 reg53,
                 reg52,
                 (1'h0)};
  assign wire4 = (8'ha8);
  assign wire5 = $unsigned(wire2);
  assign wire6 = wire5;
  assign wire7 = $signed(wire0);
  module8 #() modinst49 (wire48, clk, wire2, wire4, wire1, wire7, wire6);
  assign wire50 = $unsigned((8'ha8));
  assign wire51 = {wire4[(4'hd):(2'h2)]};
  always
    @(posedge clk) begin
      if ((|wire4[(4'hb):(1'h1)]))
        begin
          if (wire2[(4'h9):(3'h7)])
            begin
              reg52 <= ($signed({wire48,
                  ((-wire48) <= (wire1 ?
                      (7'h44) : wire0))}) - $signed({{$signed((8'hbf))}}));
              reg53 <= (8'ha0);
              reg54 <= ($unsigned($unsigned($unsigned($unsigned((8'hb5))))) >> (((+(wire0 << wire6)) ?
                  $unsigned((wire0 + wire48)) : ((+reg53) <<< wire3[(3'h4):(1'h0)])) - (((wire2 << reg52) - {wire48}) != {(reg52 && (8'hae)),
                  (wire4 >>> wire0)})));
              reg55 <= ((wire2 ?
                  reg54 : ((|(|wire6)) ^~ wire1)) - (~|$signed($unsigned((wire51 ^~ wire5)))));
            end
          else
            begin
              reg52 <= wire50;
            end
          if (({($unsigned((+wire5)) >= (!((8'hb3) ? reg54 : reg55))),
                  (((wire0 ?
                      (8'hbf) : wire1) ^ wire7[(2'h2):(2'h2)]) * ($unsigned(wire7) ?
                      wire5[(2'h2):(1'h1)] : {(8'ha5), wire51}))} ?
              ((8'hb3) ?
                  wire0 : ((!$unsigned(wire5)) * (~^(~&wire2)))) : (^(~|(wire5[(1'h0):(1'h0)] ?
                  (wire5 ? wire5 : (8'hbb)) : $signed(reg52))))))
            begin
              reg56 <= wire3;
              reg57 <= (($signed(wire1) | (~|$signed(wire5[(3'h7):(2'h3)]))) >> $signed($signed(wire3)));
            end
          else
            begin
              reg56 <= (+$unsigned(reg52[(2'h3):(2'h2)]));
              reg57 <= ((wire7[(4'hd):(3'h6)] ^ $unsigned(($signed(wire1) ?
                      {wire51, wire2} : $signed(reg54)))) ?
                  (^~(~|($unsigned(wire4) ~^ $unsigned(reg54)))) : ({(reg54 <= {(8'hb9)})} <= $signed(($signed(wire0) * $signed(wire48)))));
              reg58 <= {(8'haa)};
              reg59 <= $signed(wire2);
              reg60 <= $signed($signed(($signed($unsigned(wire3)) > wire1)));
            end
          if (($unsigned(($unsigned((reg52 ?
              reg55 : (8'ha6))) ^~ ($unsigned(wire3) ?
              (wire0 > reg54) : $signed(wire5)))) < $signed($unsigned($unsigned(reg59)))))
            begin
              reg61 <= $signed($unsigned($signed(($signed(reg57) ?
                  {wire5, reg53} : $unsigned(wire6)))));
            end
          else
            begin
              reg61 <= $unsigned(wire3);
              reg62 <= ({(7'h44)} ?
                  {(reg57[(4'ha):(1'h0)] ^~ (wire0 + $signed(reg59))),
                      {wire50}} : $signed($unsigned(((8'hbe) ?
                      $signed(reg52) : (reg61 ^~ wire48)))));
              reg63 <= ($signed((~&((^~wire5) ?
                  (wire50 < wire7) : wire3))) ~^ (reg60 <<< wire1));
              reg64 <= {reg53,
                  {({(wire0 ~^ wire51)} ? wire3 : wire6[(1'h0):(1'h0)]),
                      ((8'ha8) || (~&reg59[(4'hc):(2'h2)]))}};
            end
          reg65 <= (reg60[(4'h9):(4'h9)] | wire51[(4'h9):(2'h2)]);
          reg66 <= $unsigned(wire5[(3'h5):(3'h4)]);
        end
      else
        begin
          reg52 <= ({(wire3[(3'h4):(2'h2)] ?
                  wire6[(3'h5):(1'h0)] : (^~wire51[(4'hb):(2'h2)])),
              wire0} < (!(+$signed(reg63[(3'h4):(2'h2)]))));
        end
      reg67 <= reg53[(1'h0):(1'h0)];
      reg68 <= reg59[(4'hc):(1'h0)];
      if ((reg62[(1'h1):(1'h1)] <= $signed(($unsigned({reg64}) ?
          {$unsigned(wire7)} : reg60))))
        begin
          reg69 <= (($signed($signed(reg66[(1'h0):(1'h0)])) < reg53[(2'h3):(2'h3)]) ^~ wire50);
        end
      else
        begin
          reg69 <= reg59[(4'hd):(3'h4)];
          reg70 <= $unsigned({$signed(($unsigned(wire0) * (wire50 ?
                  (8'hba) : reg62))),
              $signed(((reg58 ? wire1 : reg60) ? wire7 : reg55))});
        end
      reg71 <= ((~&(((reg65 || wire48) ?
                  $unsigned(reg62) : ((8'hb0) ~^ (8'hab))) ?
              reg67[(1'h1):(1'h0)] : (&(+reg67)))) ?
          (((reg68[(4'ha):(3'h6)] ?
                  $unsigned((8'hab)) : wire48[(3'h5):(1'h1)]) && ($signed((8'hbf)) >>> (reg54 << reg68))) ?
              (&{$unsigned((8'hbd)),
                  $unsigned(wire50)}) : reg54[(4'hc):(4'hb)]) : (reg59[(4'hc):(3'h5)] ^~ (|{$signed(wire5)})));
    end
endmodule

module module8
#(parameter param47 = ((+(~^(((8'hb5) ? (7'h44) : (8'hb5)) + ((8'hae) && (8'ha4))))) > (((^((8'hb5) || (8'hae))) ? (^((8'hac) >= (8'ha3))) : (((8'ha9) <= (8'hb3)) ? ((8'hbd) || (8'haa)) : (^~(8'hb4)))) ? (({(8'h9c), (8'hae)} ? ((7'h43) ? (8'h9f) : (8'haa)) : {(8'ha3)}) - ((~&(8'ha6)) - {(8'hb6), (7'h42)})) : (({(8'hba)} != (8'hac)) > (((8'had) ? (8'hac) : (8'had)) ? {(7'h40)} : ((7'h40) & (8'ha8)))))))
(y, clk, wire13, wire12, wire11, wire10, wire9);
  output wire [(32'haf):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire signed [(5'h15):(1'h0)] wire12;
  input wire [(5'h10):(1'h0)] wire11;
  input wire signed [(5'h15):(1'h0)] wire10;
  input wire signed [(5'h10):(1'h0)] wire9;
  wire [(5'h13):(1'h0)] wire46;
  wire [(3'h4):(1'h0)] wire44;
  wire [(2'h3):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire signed [(4'hd):(1'h0)] wire25;
  wire signed [(3'h5):(1'h0)] wire14;
  reg [(4'h8):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg23 = (1'h0);
  reg [(2'h3):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg21 = (1'h0);
  reg [(5'h13):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h12):(1'h0)] reg18 = (1'h0);
  reg [(4'hf):(1'h0)] reg17 = (1'h0);
  reg [(5'h13):(1'h0)] reg16 = (1'h0);
  reg [(4'h9):(1'h0)] reg15 = (1'h0);
  assign y = {wire46,
                 wire44,
                 wire27,
                 wire26,
                 wire25,
                 wire14,
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
                 (1'h0)};
  assign wire14 = wire11[(3'h5):(2'h3)];
  always
    @(posedge clk) begin
      if (wire9[(2'h2):(1'h1)])
        begin
          reg15 <= wire11;
          if ($signed($unsigned((7'h40))))
            begin
              reg16 <= ($unsigned((wire12[(5'h12):(4'h8)] + (-(!wire11)))) - wire11);
              reg17 <= (({wire9[(1'h1):(1'h1)]} ?
                      $unsigned($unsigned((~^wire9))) : {$unsigned($unsigned((8'haa)))}) ?
                  (!((wire11[(1'h0):(1'h0)] ^ (8'hb9)) ?
                      (wire14[(3'h4):(2'h3)] < (wire9 ?
                          reg16 : wire13)) : wire11)) : (8'hb1));
              reg18 <= (reg16 ?
                  $unsigned(wire13[(4'hb):(1'h1)]) : $signed(wire14));
            end
          else
            begin
              reg16 <= wire9;
              reg17 <= $signed(reg18[(5'h10):(4'hb)]);
              reg18 <= (|wire10);
            end
          if ($signed((|(^(^~$unsigned(wire14))))))
            begin
              reg19 <= $signed($unsigned((((reg15 ?
                      wire12 : wire13) || (|(8'ha3))) ?
                  reg17 : $signed((&wire13)))));
              reg20 <= $unsigned(($unsigned($signed(wire12[(4'hf):(4'h9)])) ?
                  (~$signed(wire9)) : {reg19}));
              reg21 <= $signed({wire14});
            end
          else
            begin
              reg19 <= ($signed($signed($signed($signed(reg17)))) ?
                  $signed($signed($unsigned(wire13))) : reg21);
              reg20 <= (8'ha3);
              reg21 <= reg16;
            end
        end
      else
        begin
          reg15 <= wire14;
          reg16 <= (^wire12);
        end
      if ((-(7'h42)))
        begin
          reg22 <= wire14[(2'h3):(1'h1)];
          reg23 <= ($unsigned((~&(+wire14[(3'h4):(2'h2)]))) || $unsigned((wire11[(2'h2):(1'h1)] ?
              ((wire9 ? reg17 : reg21) ?
                  (reg22 ? (8'hb8) : reg22) : (reg18 == reg22)) : wire9)));
        end
      else
        begin
          reg22 <= wire11;
        end
      reg24 <= ({$signed(wire12)} << ($signed((reg15[(3'h5):(3'h5)] == reg17)) ~^ $signed($unsigned($unsigned(reg20)))));
    end
  assign wire25 = (($unsigned(((~^reg23) ?
                              reg16[(4'hb):(4'ha)] : $signed(reg22))) ?
                          (~&({reg22, wire13} ?
                              (reg19 ~^ (8'ha8)) : $signed(wire11))) : ($unsigned((wire12 ?
                              wire13 : (8'ha4))) == {(wire11 ? reg16 : wire14),
                              reg15[(4'h8):(1'h1)]})) ?
                      (((~|(8'hbc)) ?
                          ((reg19 >= wire13) != $signed(reg23)) : $unsigned($unsigned((7'h43)))) < $signed((+(reg16 - reg19)))) : (($signed($signed(reg19)) ?
                              ($signed(reg24) + ((8'h9e) ?
                                  wire14 : wire13)) : $signed($signed(reg16))) ?
                          $unsigned((|(reg19 ? wire12 : reg22))) : reg15));
  assign wire26 = ({reg16[(5'h13):(5'h12)],
                      (^~$unsigned((wire25 ?
                          reg19 : reg21)))} != (&($signed((~^wire12)) ^ $unsigned(wire13))));
  assign wire27 = (reg22 >> $unsigned(wire10));
  module28 #() modinst45 (.wire29(reg23), .clk(clk), .wire32(wire11), .y(wire44), .wire31(wire10), .wire30(reg19));
  assign wire46 = wire9[(4'he):(1'h0)];
endmodule

module module28
#(parameter param42 = (({{((8'h9c) * (8'ha9)), ((8'ha2) ? (8'ha9) : (8'hb5))}, (!((8'ha5) >> (8'hbb)))} ? ((^~((8'hbb) ? (8'hbc) : (8'ha1))) | ({(8'hbc)} ? (~(7'h43)) : ((8'ha5) ? (8'ha7) : (8'h9c)))) : {(+((8'hb7) & (8'hbb))), (((7'h40) ? (8'ha9) : (8'haa)) & (-(8'h9f)))}) | ((&(~|{(8'ha0), (8'hb2)})) > (~&{(8'ha4), ((7'h43) && (8'ha7))}))), 
parameter param43 = (^(((~&(|(8'hbe))) ? (8'ha6) : {(param42 >>> (8'hb2)), param42}) || {{(param42 ? param42 : param42)}})))
(y, clk, wire32, wire31, wire30, wire29);
  output wire [(32'h63):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire32;
  input wire [(5'h11):(1'h0)] wire31;
  input wire signed [(3'h7):(1'h0)] wire30;
  input wire signed [(5'h14):(1'h0)] wire29;
  wire signed [(5'h15):(1'h0)] wire41;
  wire signed [(3'h4):(1'h0)] wire40;
  wire signed [(4'hd):(1'h0)] wire39;
  wire signed [(4'hf):(1'h0)] wire38;
  wire [(3'h5):(1'h0)] wire37;
  wire [(4'h8):(1'h0)] wire36;
  wire signed [(4'h9):(1'h0)] wire35;
  wire [(5'h15):(1'h0)] wire34;
  wire [(2'h2):(1'h0)] wire33;
  assign y = {wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire37,
                 wire36,
                 wire35,
                 wire34,
                 wire33,
                 (1'h0)};
  assign wire33 = (~{($signed((wire31 ?
                          (8'hbd) : wire31)) <= $unsigned((wire29 | wire32))),
                      ($unsigned(wire30) - $unsigned((8'h9f)))});
  assign wire34 = (8'ha1);
  assign wire35 = $signed(wire29);
  assign wire36 = ($unsigned((~$signed($signed(wire30)))) ?
                      (-$signed(wire34)) : (-((8'h9c) < wire33[(1'h0):(1'h0)])));
  assign wire37 = ((8'ha1) ? wire34 : wire34);
  assign wire38 = $signed(({wire32[(4'h9):(4'h9)], wire33} ?
                      $signed($signed($unsigned(wire33))) : wire32));
  assign wire39 = ((((~|wire31) && (wire31 << (~^wire31))) * $signed($unsigned((&wire29)))) && {((-$unsigned(wire29)) ?
                          wire34 : wire34[(3'h5):(3'h5)])});
  assign wire40 = (({wire32[(4'hc):(4'hc)],
                      (wire37 ?
                          {wire39,
                              (8'haf)} : wire30[(2'h3):(1'h1)])} >> (((wire35 ^ wire38) ?
                      wire37[(2'h2):(1'h1)] : (^~wire38)) - (wire35 ?
                      wire36[(1'h0):(1'h0)] : wire35[(4'h9):(4'h8)]))) + wire36);
  assign wire41 = wire39[(4'h9):(2'h2)];
endmodule
