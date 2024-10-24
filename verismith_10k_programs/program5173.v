module top
#(parameter param55 = {(^~((((8'hbb) ? (8'h9c) : (8'ha5)) ? ((7'h42) ? (8'ha6) : (8'h9e)) : ((8'hab) == (8'ha5))) ? ({(7'h41), (8'ha5)} > ((7'h43) ? (8'hb6) : (7'h43))) : (~|{(8'hac)}))), {(~^(((8'hb4) ? (8'ha8) : (8'ha2)) < ((8'hb1) & (8'hab))))}}, 
parameter param56 = {((~^(~(param55 ? param55 : param55))) ? ({(param55 != param55), (+param55)} ? ((param55 - (8'had)) << (+param55)) : (+(param55 * param55))) : {((param55 ? param55 : (8'ha9)) ? param55 : ((7'h40) - (8'hbd)))})})
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire4;
  input wire signed [(3'h7):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(2'h2):(1'h0)] wire54;
  wire signed [(5'h13):(1'h0)] wire53;
  wire signed [(4'he):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire39;
  wire signed [(3'h4):(1'h0)] wire37;
  wire signed [(5'h14):(1'h0)] wire5;
  reg signed [(5'h13):(1'h0)] reg51 = (1'h0);
  reg [(5'h14):(1'h0)] reg50 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg49 = (1'h0);
  reg [(4'he):(1'h0)] reg48 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg47 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg46 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg45 = (1'h0);
  reg [(4'ha):(1'h0)] reg44 = (1'h0);
  reg [(4'hc):(1'h0)] reg43 = (1'h0);
  reg [(4'h9):(1'h0)] reg42 = (1'h0);
  reg [(3'h4):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg40 = (1'h0);
  assign y = {wire54,
                 wire53,
                 wire52,
                 wire39,
                 wire37,
                 wire5,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg40,
                 (1'h0)};
  assign wire5 = (^$signed({wire4[(4'h8):(1'h0)]}));
  module6 #() modinst38 (.wire8(wire1), .wire9(wire4), .wire7(wire2), .y(wire37), .wire10(wire0), .clk(clk));
  assign wire39 = (|$unsigned(wire2[(5'h13):(1'h0)]));
  always
    @(posedge clk) begin
      reg40 <= (+($signed(wire0[(3'h5):(1'h0)]) ?
          {wire0[(1'h1):(1'h0)],
              wire2} : ((~(&wire2)) <<< (wire1 <= (~^wire3)))));
      if ($signed($unsigned({((wire2 ^ wire0) ^~ $signed(wire1)),
          wire39[(1'h1):(1'h0)]})))
        begin
          reg41 <= wire1;
          reg42 <= {wire1, (8'hba)};
          reg43 <= (wire37 == (~{($signed(wire1) > wire2), wire37}));
        end
      else
        begin
          reg41 <= wire39;
          if ($signed($unsigned($signed(wire37[(3'h4):(1'h0)]))))
            begin
              reg42 <= {$signed(wire0[(3'h6):(1'h0)])};
              reg43 <= (wire37[(1'h1):(1'h0)] ?
                  $signed((-wire3[(2'h2):(2'h2)])) : ($signed($signed((reg41 - reg43))) > (!{wire5})));
              reg44 <= wire37[(2'h3):(1'h1)];
            end
          else
            begin
              reg42 <= {wire5, reg44};
            end
          reg45 <= (((|wire37[(2'h2):(1'h1)]) ?
              reg44 : reg44[(1'h1):(1'h1)]) & $signed($unsigned(wire37)));
          if ((&$unsigned(reg40[(4'h9):(1'h0)])))
            begin
              reg46 <= $signed(($signed(reg45) ?
                  (({wire5} != (wire3 - wire0)) < (wire4[(5'h12):(4'h8)] << (8'h9f))) : wire37));
              reg47 <= ($unsigned($signed(wire37)) < ({$unsigned((|(7'h44))),
                      (wire3 ? (~&reg43) : (~&wire2))} ?
                  (reg41[(1'h1):(1'h1)] ?
                      $signed((reg46 ?
                          wire5 : reg46)) : (reg43[(4'h8):(3'h6)] + (wire37 ?
                          reg46 : reg41))) : $unsigned(wire39[(3'h6):(1'h1)])));
              reg48 <= (&(reg47[(1'h0):(1'h0)] ? (8'hbc) : wire2));
              reg49 <= (^reg42);
            end
          else
            begin
              reg46 <= reg44[(1'h1):(1'h0)];
              reg47 <= wire5;
            end
        end
      reg50 <= reg48;
      reg51 <= $signed($unsigned((~|({reg49} ? ((8'hbb) + reg50) : reg45))));
    end
  assign wire52 = {({reg44, ((!wire37) != (wire5 ? reg46 : reg43))} ?
                          (((reg49 < reg44) ?
                              $signed(reg45) : (wire37 - reg41)) >>> {{reg50}}) : $unsigned($signed({(8'haf)})))};
  assign wire53 = (~&(reg41 ~^ (reg43 <<< wire52[(3'h4):(1'h1)])));
  assign wire54 = wire52[(4'h8):(1'h1)];
endmodule

module module6  (y, clk, wire10, wire9, wire8, wire7);
  output wire [(32'h156):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire10;
  input wire signed [(5'h11):(1'h0)] wire9;
  input wire [(5'h14):(1'h0)] wire8;
  input wire [(5'h15):(1'h0)] wire7;
  wire [(3'h6):(1'h0)] wire16;
  wire signed [(3'h6):(1'h0)] wire15;
  wire [(4'hc):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire [(5'h11):(1'h0)] wire12;
  wire [(4'hb):(1'h0)] wire11;
  reg [(3'h6):(1'h0)] reg36 = (1'h0);
  reg [(5'h15):(1'h0)] reg35 = (1'h0);
  reg [(2'h3):(1'h0)] reg34 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(4'hb):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg28 = (1'h0);
  reg [(5'h14):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(4'ha):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg17 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 reg36,
                 reg35,
                 reg34,
                 reg33,
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
                 reg17,
                 (1'h0)};
  assign wire11 = (~|(wire8[(5'h11):(3'h7)] ? (+wire9) : (8'hb1)));
  assign wire12 = (wire8 && ($unsigned($signed(wire7[(3'h4):(2'h3)])) || $unsigned((wire7 ?
                      $unsigned((8'hb0)) : (^wire9)))));
  assign wire13 = $signed((((^wire7[(5'h15):(3'h7)]) ?
                      {$signed((8'h9e))} : ((-wire9) <<< wire10)) || wire8[(2'h3):(2'h2)]));
  assign wire14 = {((^$signed($unsigned(wire8))) ^~ (7'h40)),
                      wire12[(3'h5):(1'h0)]};
  assign wire15 = ((wire7[(4'hc):(3'h6)] ^ wire8) ?
                      wire7[(3'h7):(2'h2)] : ({($unsigned(wire8) ^~ {wire8,
                              (8'hb1)}),
                          wire11} ~^ (-wire8[(4'hb):(3'h4)])));
  assign wire16 = ((!$unsigned(wire10)) <= wire10);
  always
    @(posedge clk) begin
      if ($unsigned($signed($unsigned(wire15))))
        begin
          reg17 <= ($signed((wire12 ?
              wire14 : ((wire7 ? wire7 : (8'ha4)) ?
                  ((8'ha5) ?
                      wire7 : wire7) : $unsigned(wire12)))) && $unsigned(wire15[(1'h1):(1'h0)]));
        end
      else
        begin
          if (wire13)
            begin
              reg17 <= ((wire8 >> (&{wire12[(5'h10):(4'hf)]})) ?
                  ($unsigned((~((8'hbc) == (8'hb8)))) ?
                      (wire13[(3'h4):(2'h3)] ?
                          (8'hb0) : wire9[(4'ha):(3'h4)]) : {(^~{wire14})}) : $unsigned($unsigned($signed(wire15))));
            end
          else
            begin
              reg17 <= {(8'ha8), (+wire9)};
              reg18 <= (+$signed(((8'ha0) ?
                  (&reg17) : $signed((wire7 < wire9)))));
              reg19 <= (wire16[(1'h0):(1'h0)] ?
                  (|(($signed((7'h44)) ?
                          (reg18 ^ wire7) : wire15[(1'h1):(1'h1)]) ?
                      wire11[(1'h0):(1'h0)] : ((wire12 ^ reg18) * (wire8 ?
                          wire8 : (8'ha3))))) : wire12[(3'h4):(1'h0)]);
            end
        end
      reg20 <= (~&((wire9 - ((&wire16) ? (&wire13) : (!(8'haf)))) >>> wire9));
      reg21 <= (-(wire10 ?
          ($unsigned((wire10 < reg20)) ?
              {wire8} : $signed(((8'ha4) ^ wire11))) : wire12[(2'h3):(1'h1)]));
      if ({{{$signed(reg21)}, wire7[(4'ha):(4'h8)]}})
        begin
          reg22 <= (8'hb9);
          reg23 <= (|((~$unsigned($signed(reg18))) << $unsigned((7'h40))));
          reg24 <= wire10;
          reg25 <= wire11;
          reg26 <= (-($signed($signed({wire13,
              (8'h9f)})) << reg23[(1'h1):(1'h0)]));
        end
      else
        begin
          if (reg26)
            begin
              reg22 <= $signed($signed($unsigned($signed(reg21))));
              reg23 <= reg21[(4'hb):(2'h2)];
              reg24 <= (^~(~reg21[(2'h2):(1'h1)]));
              reg25 <= (!$signed($unsigned((reg20[(4'ha):(3'h7)] >> reg17))));
              reg26 <= (reg26[(4'hc):(4'h9)] > $signed((reg21[(2'h2):(1'h1)] < $unsigned((reg19 ?
                  reg18 : wire9)))));
            end
          else
            begin
              reg22 <= (!({$signed({reg23, reg24})} ?
                  (~|reg26[(5'h10):(1'h1)]) : (~|wire16[(2'h3):(1'h1)])));
              reg23 <= {(|wire11)};
              reg24 <= $unsigned(((reg22 || {reg19,
                      (wire10 ? reg20 : wire10)}) ?
                  $signed(wire7) : ($unsigned({(8'haa)}) >> (~|{wire13}))));
            end
          if ((($unsigned(reg20[(5'h11):(4'h9)]) ?
              wire7[(4'hb):(3'h4)] : reg21) > $unsigned((~^{$signed((8'ha6)),
              $signed(reg22)}))))
            begin
              reg27 <= $signed(wire13);
              reg28 <= $signed((^wire14));
              reg29 <= ($unsigned($signed(reg19[(1'h0):(1'h0)])) ~^ $unsigned(reg27));
            end
          else
            begin
              reg27 <= {reg26};
              reg28 <= $unsigned((((^reg19) >> $signed($signed(reg23))) ?
                  $signed(reg23[(4'h9):(1'h1)]) : (^reg26)));
              reg29 <= $unsigned((8'ha7));
              reg30 <= reg27[(5'h12):(3'h6)];
            end
          reg31 <= ($unsigned((reg26[(3'h6):(2'h3)] ?
                  $unsigned(reg24) : (~^(^(8'hb1))))) ?
              ($unsigned($unsigned(wire12)) ?
                  (wire11 == $unsigned((+reg26))) : (&{(reg21 ?
                          wire9 : wire8)})) : {(reg21 >> $signed((wire8 ?
                      reg24 : wire16)))});
          if (($signed(((~^(reg31 ? reg18 : reg18)) >>> reg23[(4'h9):(3'h6)])) ?
              (!$unsigned($signed((wire8 & reg29)))) : ($unsigned((reg18[(4'h9):(4'h8)] ?
                  (wire14 >>> (8'h9d)) : $unsigned((8'hb4)))) ^~ (~reg29[(4'h8):(1'h0)]))))
            begin
              reg32 <= reg17;
              reg33 <= $unsigned($unsigned((+reg21)));
            end
          else
            begin
              reg32 <= ($unsigned($signed($signed($signed(reg33)))) ?
                  ($signed(wire15) ?
                      ({(reg29 <= reg32), $signed(wire8)} ?
                          $unsigned((!reg22)) : ((reg29 < reg32) ?
                              (wire12 >> wire12) : reg21[(1'h0):(1'h0)])) : {reg18,
                          $unsigned(reg31[(4'h8):(2'h2)])}) : $unsigned((|((reg17 ?
                          (8'ha2) : (8'hbb)) ?
                      reg27[(4'h8):(1'h1)] : (reg22 ? reg32 : (8'haa))))));
              reg33 <= ($signed($unsigned((&(8'hab)))) ^ (wire13 ?
                  reg24 : $unsigned({reg21})));
              reg34 <= wire14;
              reg35 <= (~(wire8 ?
                  $signed(((~|wire12) != (~wire11))) : {$unsigned($unsigned(reg30)),
                      (&(wire7 ? reg31 : wire15))}));
            end
        end
      reg36 <= reg20[(4'hd):(2'h2)];
    end
endmodule
