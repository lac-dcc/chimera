module top
#(parameter param62 = (((-(~|(~&(8'hbf)))) ? {((8'ha7) ? {(8'hab), (8'ha9)} : ((8'haf) ? (8'ha4) : (7'h41))), ({(8'ha8)} ? ((8'h9f) ? (8'hba) : (8'ha2)) : (~|(8'hbc)))} : (((^(7'h40)) ? ((8'hb7) == (8'hac)) : {(8'ha3)}) >> ({(7'h40)} ? ((8'had) ? (8'hb1) : (8'hb1)) : (~|(8'hb3))))) ? (({((8'hb3) == (8'hbd)), (~&(8'hb2))} ? (-((8'ha1) <= (7'h44))) : ({(8'ha4)} ? {(8'hb1), (8'ha9)} : ((8'hbf) ^~ (8'hbb)))) ? {{((8'hbb) ? (8'hbb) : (8'ha9))}, (!((8'hbb) ? (8'ha8) : (8'hbe)))} : ({((7'h44) ? (8'hb5) : (8'h9e)), ((7'h43) == (8'hb1))} ? (((8'h9e) * (8'hbc)) - ((8'h9d) ~^ (8'ha4))) : {((8'hbc) ? (8'hb5) : (8'ha9)), (-(8'ha3))})) : (((((7'h41) ? (8'hba) : (8'h9d)) ? ((8'ha6) ? (8'ha8) : (8'hab)) : (8'ha5)) == (((7'h43) ^~ (8'hbb)) << ((8'hb5) | (8'hb6)))) && ((((8'hb3) ? (8'h9d) : (8'hbb)) ? (&(8'hbe)) : ((8'ha7) ? (8'hbd) : (7'h43))) ? (8'hbb) : (((8'ha3) ? (8'hae) : (8'had)) < ((7'h42) ? (8'hae) : (8'hb3)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hd0):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(4'he):(1'h0)] wire0;
  wire signed [(4'h8):(1'h0)] wire61;
  wire signed [(5'h14):(1'h0)] wire60;
  wire [(5'h12):(1'h0)] wire59;
  wire [(4'ha):(1'h0)] wire49;
  wire [(3'h6):(1'h0)] wire48;
  wire [(3'h4):(1'h0)] wire47;
  wire signed [(2'h3):(1'h0)] wire45;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(3'h6):(1'h0)] reg58 = (1'h0);
  reg [(5'h10):(1'h0)] reg57 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg56 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg55 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg54 = (1'h0);
  reg [(4'hf):(1'h0)] reg53 = (1'h0);
  reg [(5'h10):(1'h0)] reg52 = (1'h0);
  reg [(5'h15):(1'h0)] reg51 = (1'h0);
  reg [(4'ha):(1'h0)] reg50 = (1'h0);
  assign y = {wire61,
                 wire60,
                 wire59,
                 wire49,
                 wire48,
                 wire47,
                 wire45,
                 wire4,
                 reg58,
                 reg57,
                 reg56,
                 reg55,
                 reg54,
                 reg53,
                 reg52,
                 reg51,
                 reg50,
                 (1'h0)};
  assign wire4 = (8'ha1);
  module5 #() modinst46 (wire45, clk, wire3, wire4, wire1, wire2);
  assign wire47 = $signed(((|(((8'ha9) <<< wire1) ?
                          $unsigned(wire2) : (+wire1))) ?
                      $signed((wire3[(4'h9):(1'h1)] || $unsigned((8'hba)))) : ((~|wire4) ?
                          (~|wire2[(5'h10):(4'ha)]) : $signed($unsigned(wire2)))));
  assign wire48 = $unsigned($unsigned((((~|wire3) ?
                          (~wire2) : $unsigned(wire2)) ?
                      {(-wire3),
                          wire45[(1'h0):(1'h0)]} : $signed(wire2[(4'hd):(4'hb)]))));
  assign wire49 = ({($unsigned((wire1 || wire3)) || ({(8'hbe), wire48} ?
                              (wire48 ? wire2 : wire47) : (wire4 <<< wire1))),
                          $signed($signed(wire47[(2'h3):(1'h1)]))} ?
                      ((wire48 | {$unsigned(wire4)}) ?
                          wire1 : wire0[(4'hc):(3'h7)]) : (~^$signed(wire4)));
  always
    @(posedge clk) begin
      reg50 <= ((wire4 ?
              ((wire2 > wire3[(1'h1):(1'h1)]) <<< $signed((wire3 ?
                  wire49 : wire0))) : (!((+wire49) ?
                  (wire48 ? (8'hb8) : (8'h9e)) : (~|wire49)))) ?
          wire45[(2'h3):(1'h0)] : $signed($signed($signed({wire0, wire0}))));
      if (wire49[(3'h7):(3'h6)])
        begin
          if ($unsigned((8'ha5)))
            begin
              reg51 <= wire48;
              reg52 <= {{{($signed(wire48) ? (-wire2) : (~wire45)),
                          {(reg50 ? wire1 : wire47)}},
                      ($unsigned(((8'haf) ^~ wire1)) ?
                          ((8'ha0) ?
                              $signed(wire0) : $unsigned(wire45)) : ($unsigned(wire2) ?
                              wire1[(4'h8):(4'h8)] : (reg51 - wire0)))},
                  (!((!reg51) ?
                      (wire0 ?
                          wire4[(4'h8):(3'h6)] : wire49[(2'h2):(2'h2)]) : $signed((8'hae))))};
              reg53 <= wire45[(1'h0):(1'h0)];
              reg54 <= wire45[(1'h1):(1'h0)];
            end
          else
            begin
              reg51 <= reg52[(4'h8):(3'h4)];
              reg52 <= (!$unsigned($unsigned(((~^reg50) ?
                  reg51 : (reg53 ? reg50 : reg50)))));
            end
          reg55 <= reg53;
          reg56 <= {wire45};
          reg57 <= reg52;
        end
      else
        begin
          if ($unsigned((~^wire48)))
            begin
              reg51 <= $signed(reg53);
              reg52 <= (!reg54);
              reg53 <= wire48[(3'h6):(3'h6)];
              reg54 <= $signed($signed(((8'hb7) ?
                  reg55 : (((8'ha3) >= wire47) ?
                      (wire0 ? reg56 : reg51) : wire49))));
            end
          else
            begin
              reg51 <= reg57[(4'hd):(3'h7)];
              reg52 <= {((^(~(reg56 ? wire3 : wire2))) != reg56),
                  $signed($signed((!(reg57 ? reg53 : reg55))))};
              reg53 <= (~|$unsigned(((reg54 < (wire0 * wire0)) <= $unsigned(reg52))));
              reg54 <= {wire2[(5'h10):(4'h9)]};
              reg55 <= $unsigned($signed((^~{(~&reg52)})));
            end
          reg56 <= wire45;
          reg57 <= reg53[(4'he):(3'h7)];
        end
      reg58 <= $unsigned($unsigned($unsigned({$unsigned(reg54), (8'hb8)})));
    end
  assign wire59 = (wire0[(3'h4):(1'h0)] ?
                      $unsigned(((~^(8'hb5)) ?
                          (~&reg53[(4'ha):(4'h8)]) : {$signed(wire4),
                              (reg53 ? (8'hb3) : wire4)})) : (+(~|(~&((8'hbc) ?
                          (8'ha4) : reg57)))));
  assign wire60 = (~&(wire59 & {$unsigned($signed((8'hb6)))}));
  assign wire61 = $unsigned($unsigned($signed(wire47[(2'h3):(2'h3)])));
endmodule

module module5
#(parameter param43 = (((~|(((7'h44) || (7'h40)) <= (~&(8'hbb)))) || (^~(((7'h43) << (8'ha3)) || ((7'h42) + (8'hbb))))) ? ((~^({(8'h9d)} ? ((7'h41) && (8'hbc)) : ((8'hb2) ? (8'hac) : (8'hb8)))) | ((((8'h9c) ? (8'ha9) : (8'hb7)) ? ((7'h43) ~^ (8'ha4)) : ((8'hb3) << (8'ha0))) - (((7'h41) >>> (8'hb0)) ? {(8'h9e)} : ((8'hae) <<< (8'hab))))) : ({(+((8'hba) == (8'hbe)))} ? (!(((8'ha7) ? (8'hab) : (8'hb5)) * ((8'h9d) ? (8'hb3) : (8'hbd)))) : (({(8'h9e)} & (8'ha9)) ~^ (-{(8'ha7)})))), 
parameter param44 = (8'hbd))
(y, clk, wire6, wire7, wire8, wire9);
  output wire [(32'h3e):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hb):(1'h0)] wire6;
  input wire signed [(5'h12):(1'h0)] wire7;
  input wire signed [(5'h15):(1'h0)] wire8;
  input wire [(5'h13):(1'h0)] wire9;
  wire signed [(3'h4):(1'h0)] wire42;
  wire signed [(5'h12):(1'h0)] wire41;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire39;
  assign y = {wire42, wire41, wire10, wire39, (1'h0)};
  assign wire10 = $unsigned((8'h9c));
  module11 #() modinst40 (wire39, clk, wire9, wire6, wire8, wire10, wire7);
  assign wire41 = wire6;
  assign wire42 = (^wire9[(4'h8):(3'h7)]);
endmodule

module module11  (y, clk, wire16, wire15, wire14, wire13, wire12);
  output wire [(32'hdd):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h13):(1'h0)] wire16;
  input wire [(4'hb):(1'h0)] wire15;
  input wire signed [(4'hf):(1'h0)] wire14;
  input wire [(4'hc):(1'h0)] wire13;
  input wire [(4'h9):(1'h0)] wire12;
  wire signed [(3'h4):(1'h0)] wire23;
  wire signed [(4'hf):(1'h0)] wire22;
  wire signed [(5'h11):(1'h0)] wire21;
  wire [(4'hf):(1'h0)] wire20;
  wire signed [(3'h4):(1'h0)] wire19;
  wire [(4'he):(1'h0)] wire18;
  wire signed [(5'h10):(1'h0)] wire17;
  reg signed [(2'h2):(1'h0)] reg38 = (1'h0);
  reg [(4'h9):(1'h0)] reg37 = (1'h0);
  reg [(4'hc):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg34 = (1'h0);
  reg [(2'h2):(1'h0)] reg33 = (1'h0);
  reg [(3'h6):(1'h0)] reg32 = (1'h0);
  reg [(4'hf):(1'h0)] reg31 = (1'h0);
  reg [(4'h9):(1'h0)] reg30 = (1'h0);
  reg [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(3'h5):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg27 = (1'h0);
  reg [(2'h3):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg25 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg24 = (1'h0);
  assign y = {wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 reg38,
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
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire17 = (wire14[(2'h2):(2'h2)] && (~(~^(wire14[(1'h0):(1'h0)] ?
                      $signed(wire14) : wire13[(1'h1):(1'h0)]))));
  assign wire18 = wire12[(1'h1):(1'h1)];
  assign wire19 = wire18[(1'h0):(1'h0)];
  assign wire20 = $signed(($signed(((8'ha3) ?
                      $signed(wire18) : wire15)) >= $signed(wire15)));
  assign wire21 = wire17;
  assign wire22 = wire18;
  assign wire23 = wire17[(4'h8):(4'h8)];
  always
    @(posedge clk) begin
      reg24 <= wire21;
      reg25 <= $signed(reg24);
      if ((!$signed(wire18)))
        begin
          reg26 <= (((-wire21[(4'hf):(3'h6)]) ?
              {{(^wire20)}, ((~&(8'ha6)) ~^ (&wire17))} : ({(wire17 == wire19),
                  reg24} - $signed((!wire13)))) << ($unsigned(reg24) < ($signed(wire15[(3'h4):(3'h4)]) ?
              $unsigned($signed(wire16)) : ((wire15 ^ (8'hb2)) ?
                  $signed(wire12) : {wire14}))));
          reg27 <= ($unsigned(reg26[(2'h2):(2'h2)]) ?
              ((~^$unsigned($unsigned(reg26))) ?
                  ($unsigned($unsigned((7'h43))) && (~&(|wire17))) : wire12[(4'h9):(2'h3)]) : (wire14 && $unsigned(wire16)));
          reg28 <= wire15[(4'h8):(3'h6)];
          reg29 <= $signed(wire22[(4'hf):(2'h2)]);
          reg30 <= (($unsigned(reg26[(1'h0):(1'h0)]) ?
              $signed({(wire12 ?
                      reg28 : wire18)}) : $unsigned((!$unsigned(wire17)))) <= ((((~&reg26) >> $signed((8'ha1))) <<< $signed((+wire13))) == wire20[(3'h6):(1'h0)]));
        end
      else
        begin
          reg26 <= wire20[(4'ha):(3'h7)];
        end
      if (wire20[(4'hf):(4'hf)])
        begin
          reg31 <= $signed(reg24[(4'hb):(3'h6)]);
          reg32 <= wire23;
          reg33 <= (wire21 || ((^reg32) <= $unsigned($unsigned(wire20[(4'hd):(4'hc)]))));
          reg34 <= reg26;
        end
      else
        begin
          if (wire23[(3'h4):(3'h4)])
            begin
              reg31 <= (8'haa);
              reg32 <= {(($signed($unsigned((8'hb8))) == $signed((|wire18))) > (|$signed($signed(reg30))))};
              reg33 <= $signed($unsigned((^((reg33 >= reg33) <= reg28))));
              reg34 <= $unsigned(wire19[(3'h4):(1'h1)]);
            end
          else
            begin
              reg31 <= $signed((^{((-reg27) ?
                      (reg26 & wire14) : $signed((7'h44)))}));
              reg32 <= reg28;
              reg33 <= $signed($unsigned({wire18}));
            end
          reg35 <= (~{$signed((8'hbe)),
              $signed($unsigned(reg34[(2'h3):(2'h3)]))});
          reg36 <= ($signed((+$unsigned(wire17[(4'hb):(3'h7)]))) || $unsigned($signed(((7'h44) ?
              wire15 : reg30[(2'h3):(2'h2)]))));
          reg37 <= (~^wire13);
          reg38 <= (!wire19);
        end
    end
endmodule
