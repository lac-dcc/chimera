module top
#(parameter param56 = ((~|((^~(~^(8'ha1))) ? (~^(&(8'hbe))) : ((~(8'hb6)) ^~ ((8'h9f) <= (8'hb3))))) ? (((((8'ha4) ? (7'h40) : (8'ha3)) <<< (&(8'hb6))) ? (((8'hae) <<< (8'hab)) >= ((8'ha9) ? (8'ha6) : (8'hae))) : (+{(8'hae), (8'hb4)})) ? (&((~(8'hb4)) <= ((8'ha2) ? (8'ha6) : (7'h42)))) : {{{(8'ha7), (8'hbe)}}, (((8'hb9) ? (8'hb1) : (8'had)) << ((7'h43) ? (8'hbe) : (8'hba)))}) : {(&((+(8'h9d)) ? (8'hb7) : {(8'hae), (8'hba)})), (({(8'h9f), (8'h9f)} ? ((8'ha3) ? (8'hb6) : (7'h42)) : ((8'h9e) ? (8'hb6) : (8'ha0))) <<< (^~{(7'h40)}))}), 
parameter param57 = (param56 > (({{param56, (8'ha9)}} ? (~&{param56, param56}) : ({(8'hbb), param56} | (param56 * param56))) ? (|(~^(param56 <= param56))) : ({(param56 ? param56 : param56), (param56 ? param56 : param56)} && ((8'hb9) & param56)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire3;
  input wire signed [(5'h10):(1'h0)] wire2;
  input wire [(5'h11):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire [(4'he):(1'h0)] wire55;
  wire [(3'h6):(1'h0)] wire54;
  wire [(4'h8):(1'h0)] wire53;
  wire [(5'h13):(1'h0)] wire52;
  wire signed [(4'hd):(1'h0)] wire50;
  assign y = {wire55, wire54, wire53, wire52, wire50, (1'h0)};
  module4 #() modinst51 (wire50, clk, wire0, wire2, wire3, wire1, (8'ha2));
  assign wire52 = wire0[(4'hb):(1'h1)];
  assign wire53 = wire2[(2'h2):(1'h1)];
  assign wire54 = {wire52[(4'h9):(3'h5)],
                      $signed($unsigned((wire52[(3'h4):(2'h3)] ?
                          wire52[(1'h0):(1'h0)] : wire3[(3'h6):(3'h4)])))};
  assign wire55 = (wire54[(2'h2):(1'h0)] <<< $signed($unsigned((wire50 ?
                      (wire3 <= wire52) : $unsigned(wire3)))));
endmodule

module module4
#(parameter param49 = (!(^(8'had))))
(y, clk, wire5, wire6, wire7, wire8, wire9);
  output wire [(32'h53):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire5;
  input wire signed [(4'h8):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire7;
  input wire [(4'hf):(1'h0)] wire8;
  input wire signed [(4'hc):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire48;
  wire [(2'h3):(1'h0)] wire44;
  wire signed [(4'h8):(1'h0)] wire43;
  wire signed [(5'h12):(1'h0)] wire42;
  wire signed [(4'h8):(1'h0)] wire40;
  reg signed [(5'h10):(1'h0)] reg47 = (1'h0);
  reg [(5'h10):(1'h0)] reg46 = (1'h0);
  reg [(4'h9):(1'h0)] reg45 = (1'h0);
  assign y = {wire48,
                 wire44,
                 wire43,
                 wire42,
                 wire40,
                 reg47,
                 reg46,
                 reg45,
                 (1'h0)};
  module10 #() modinst41 (wire40, clk, wire7, wire9, wire6, wire8, wire5);
  assign wire42 = (wire6 ?
                      ($unsigned($signed((wire40 ^ (7'h42)))) ?
                          wire9[(4'ha):(3'h4)] : (((-wire8) ?
                              (-wire7) : (wire5 <<< wire5)) ^~ ((&wire8) > {(7'h43)}))) : wire7[(4'hc):(2'h3)]);
  assign wire43 = $signed(wire9);
  assign wire44 = wire40[(3'h4):(3'h4)];
  always
    @(posedge clk) begin
      reg45 <= wire6;
    end
  always
    @(posedge clk) begin
      reg46 <= (|{$signed((wire5 ? (-wire9) : $signed((8'ha1)))),
          (wire40[(1'h1):(1'h0)] ? {wire43} : (reg45 ? (!wire5) : {(8'hb1)}))});
      reg47 <= wire42[(5'h10):(4'ha)];
    end
  assign wire48 = wire5[(5'h12):(4'ha)];
endmodule

module module10
#(parameter param38 = ((({((8'ha6) ? (8'h9d) : (8'ha9)), (~(8'ha4))} <<< (~|{(8'hbe), (8'h9d)})) ? (^(((8'hbd) > (8'hbb)) ? {(8'ha4)} : (~(8'hb3)))) : (-(((8'hb7) ? (8'hb0) : (8'hae)) ? (^(8'ha5)) : ((8'hb0) ? (8'hba) : (7'h44))))) && (((((8'ha3) ? (8'ha9) : (8'ha7)) > ((7'h41) ? (8'hb4) : (8'ha2))) ? (|((8'h9e) ? (8'hb1) : (8'hac))) : (((8'hbb) ? (8'h9e) : (8'h9e)) - ((8'hb3) ? (8'haf) : (8'hb3)))) > {((~(8'ha9)) < (^(8'hb1)))})), 
parameter param39 = (param38 ? param38 : {(((param38 ? param38 : param38) || {(8'hbd)}) ? (8'hb1) : param38), (param38 ? ((param38 && param38) ? (param38 ? param38 : param38) : (param38 ? param38 : param38)) : (&(~&(8'hbd))))}))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'hc8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hd):(1'h0)] wire15;
  input wire signed [(4'h9):(1'h0)] wire14;
  input wire signed [(4'h8):(1'h0)] wire13;
  input wire signed [(4'he):(1'h0)] wire12;
  input wire signed [(5'h12):(1'h0)] wire11;
  wire [(3'h5):(1'h0)] wire26;
  wire [(4'hb):(1'h0)] wire20;
  wire [(2'h2):(1'h0)] wire19;
  wire [(5'h14):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  wire signed [(5'h11):(1'h0)] wire16;
  reg signed [(5'h12):(1'h0)] reg37 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg36 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg35 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg34 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg33 = (1'h0);
  reg [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(2'h3):(1'h0)] reg31 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg30 = (1'h0);
  reg [(4'hf):(1'h0)] reg29 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg28 = (1'h0);
  reg [(3'h6):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg25 = (1'h0);
  reg [(4'hf):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(2'h2):(1'h0)] reg22 = (1'h0);
  reg [(3'h7):(1'h0)] reg21 = (1'h0);
  assign y = {wire26,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 reg37,
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
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 (1'h0)};
  assign wire16 = ($signed({wire13[(1'h0):(1'h0)], {wire14}}) ?
                      ((((wire12 ? wire12 : (8'ha4)) || wire15) ?
                          wire12 : wire13[(3'h5):(3'h4)]) >> $signed(wire11[(3'h7):(3'h6)])) : wire12);
  assign wire17 = ({{wire12[(4'hb):(4'ha)], wire15[(4'h9):(4'h8)]}} * (7'h41));
  assign wire18 = {(8'hbe), $unsigned(wire13[(3'h7):(2'h2)])};
  assign wire19 = wire13[(2'h3):(2'h3)];
  assign wire20 = $unsigned((&(($signed(wire14) >= $signed(wire18)) ?
                      $unsigned(wire12[(3'h5):(1'h1)]) : (((8'hb2) ?
                              wire14 : wire17) ?
                          wire16 : (^wire11)))));
  always
    @(posedge clk) begin
      reg21 <= wire13;
      if ($signed($unsigned(((wire20 ? (wire19 & (8'ha9)) : wire11) ?
          (((8'ha8) < wire19) ? (~|(8'ha3)) : (reg21 != wire17)) : ((wire17 ?
                  reg21 : wire16) ?
              $signed((8'haa)) : ((8'ha7) == (8'hb7)))))))
        begin
          reg22 <= wire19;
          reg23 <= wire19[(1'h1):(1'h1)];
          reg24 <= wire19[(1'h0):(1'h0)];
          reg25 <= (~|(~&$signed(wire18[(4'hb):(3'h6)])));
        end
      else
        begin
          reg22 <= ($signed($unsigned($unsigned((wire12 & wire18)))) << ((wire19[(1'h0):(1'h0)] ?
                  $signed($unsigned(wire12)) : wire13[(2'h3):(1'h1)]) ?
              (!$unsigned($unsigned(reg25))) : (~(|reg23))));
          reg23 <= ($unsigned((+(wire13 ?
                  wire20 : ((8'h9c) ? reg22 : wire16)))) ?
              wire18[(4'hc):(4'ha)] : $unsigned(($unsigned(wire12[(4'h8):(2'h3)]) ?
                  reg23 : reg22[(1'h0):(1'h0)])));
        end
    end
  assign wire26 = reg22;
  always
    @(posedge clk) begin
      if (($unsigned($unsigned(((8'ha4) <<< (|wire15)))) ?
          {wire13[(4'h8):(2'h2)]} : wire26[(1'h1):(1'h1)]))
        begin
          reg27 <= reg21[(2'h2):(1'h0)];
          reg28 <= $unsigned($signed((($unsigned(wire20) + (wire12 & reg27)) ?
              {((8'hb6) ? (7'h44) : wire12)} : (!reg25))));
          reg29 <= wire17[(2'h2):(1'h0)];
          reg30 <= {wire19, wire17[(1'h0):(1'h0)]};
          reg31 <= $unsigned(reg22[(1'h0):(1'h0)]);
        end
      else
        begin
          reg27 <= reg24[(4'hd):(4'ha)];
          if ((&wire11))
            begin
              reg28 <= wire15[(3'h5):(3'h4)];
              reg29 <= $signed(wire14);
              reg30 <= (!({{$unsigned(wire12), ((8'hbd) ? reg22 : reg24)}} ?
                  {$signed(reg27[(1'h1):(1'h1)])} : $signed(reg24[(4'h8):(3'h5)])));
              reg31 <= wire20[(4'hb):(1'h0)];
              reg32 <= reg24[(3'h4):(3'h4)];
            end
          else
            begin
              reg28 <= $signed((|wire17));
              reg29 <= $signed((|(!$signed($unsigned(reg30)))));
              reg30 <= reg29;
            end
        end
      if ((~$unsigned({$unsigned($unsigned(wire18))})))
        begin
          reg33 <= ({((((8'ha7) ^ wire20) <= $unsigned(wire12)) ?
                      $signed((reg29 | reg23)) : ($unsigned(reg22) ?
                          $unsigned(reg22) : {reg22, wire19}))} ?
              (wire16 + (reg23 ?
                  wire11 : wire13[(3'h5):(3'h4)])) : (~|$unsigned({wire11,
                  wire13[(2'h3):(1'h0)]})));
          reg34 <= {(~wire26), wire16};
          reg35 <= ({$signed((!reg32[(4'h8):(1'h1)]))} ?
              (^~$signed(((^wire17) ^~ (reg22 + wire19)))) : $unsigned(reg31));
          reg36 <= reg34;
        end
      else
        begin
          reg33 <= reg23;
          reg34 <= ((({(reg24 * wire18)} ?
                      (7'h40) : (~&(wire14 ? (8'h9d) : reg35))) ?
                  {($unsigned(reg33) & (8'hb7)),
                      ($unsigned(reg35) & (reg34 ?
                          reg35 : (8'hb0)))} : (|reg34)) ?
              ((((wire11 < reg28) == $unsigned(wire13)) >>> $signed({wire12})) < (~^{(8'hac)})) : $unsigned((wire11[(4'hb):(3'h5)] >> (+(reg33 ~^ wire11)))));
          reg35 <= (reg32[(4'h9):(4'h9)] == reg27[(3'h5):(2'h3)]);
        end
      reg37 <= (wire11[(4'he):(1'h1)] ^ $unsigned(reg25));
    end
endmodule
