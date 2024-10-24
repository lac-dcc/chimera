module top
#(parameter param85 = ({({{(8'hba)}, (7'h41)} ? (!{(8'hb5), (7'h42)}) : (|((8'h9e) & (8'hb6)))), ((((8'hb6) ? (8'hbf) : (8'haf)) ? ((8'ha8) << (8'ha2)) : ((8'hbf) ~^ (8'ha0))) > (&(|(8'haa))))} != ((|(~|(-(8'hbd)))) ? ((!{(8'ha3), (8'hb0)}) ? ((|(7'h42)) ? ((8'hbe) ? (8'ha4) : (8'hb3)) : (~^(8'had))) : {(8'ha6)}) : ((+((7'h44) <<< (8'hb3))) ? {((8'ha4) & (8'hba)), {(8'hb7), (8'ha2)}} : (((8'h9c) >= (8'ha7)) ? ((8'hac) - (8'hbe)) : (^(8'haf)))))))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'hc4):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire0;
  input wire signed [(5'h12):(1'h0)] wire1;
  input wire signed [(5'h15):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire3;
  wire signed [(3'h7):(1'h0)] wire84;
  wire [(2'h3):(1'h0)] wire83;
  wire [(4'hc):(1'h0)] wire82;
  wire signed [(2'h2):(1'h0)] wire81;
  wire signed [(2'h3):(1'h0)] wire80;
  wire [(5'h15):(1'h0)] wire79;
  wire [(5'h12):(1'h0)] wire78;
  wire [(5'h13):(1'h0)] wire77;
  wire [(4'ha):(1'h0)] wire76;
  wire signed [(5'h10):(1'h0)] wire75;
  wire [(3'h6):(1'h0)] wire74;
  wire [(3'h5):(1'h0)] wire4;
  wire signed [(5'h10):(1'h0)] wire5;
  wire signed [(4'h9):(1'h0)] wire6;
  wire signed [(3'h5):(1'h0)] wire7;
  wire [(5'h12):(1'h0)] wire8;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(3'h6):(1'h0)] wire72;
  assign y = {wire84,
                 wire83,
                 wire82,
                 wire81,
                 wire80,
                 wire79,
                 wire78,
                 wire77,
                 wire76,
                 wire75,
                 wire74,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire9,
                 wire72,
                 (1'h0)};
  assign wire4 = wire3;
  assign wire5 = wire4[(2'h3):(2'h3)];
  assign wire6 = wire5;
  assign wire7 = (($signed((~&$unsigned(wire1))) ?
                         $unsigned({wire6[(3'h6):(2'h2)], wire6}) : wire1) ?
                     wire5[(3'h4):(1'h0)] : (~&(-(7'h41))));
  assign wire8 = wire3;
  assign wire9 = {{$unsigned(wire7),
                         (((~^(8'hbd)) ?
                             {wire8} : ((8'had) != (8'ha8))) ^~ $signed((+wire6)))},
                     (-$signed($unsigned($signed(wire1))))};
  module10 #() modinst73 (.clk(clk), .wire15(wire5), .wire11(wire1), .wire14(wire3), .wire12(wire9), .wire13(wire0), .y(wire72));
  assign wire74 = $unsigned(wire9);
  assign wire75 = wire7;
  assign wire76 = $signed($unsigned({$signed($signed((8'hb0)))}));
  assign wire77 = wire2;
  assign wire78 = {(~&wire7[(2'h3):(1'h0)]), wire5[(4'he):(3'h4)]};
  assign wire79 = $signed(wire74);
  assign wire80 = (wire79 ?
                      $signed(($unsigned((wire72 ?
                          wire74 : wire77)) == $unsigned(wire74))) : (8'hb3));
  assign wire81 = (~wire1[(1'h0):(1'h0)]);
  assign wire82 = wire78;
  assign wire83 = $signed({($signed($unsigned(wire8)) ?
                          (~|(wire5 * wire74)) : $unsigned($signed(wire82)))});
  assign wire84 = wire6[(3'h7):(3'h5)];
endmodule

module module10
#(parameter param71 = (((+(((8'hac) ~^ (7'h44)) || (!(8'hb6)))) ? {(7'h42)} : (^~(((8'haf) ? (8'ha5) : (8'ha3)) <= ((8'hae) != (8'had))))) ? (((((8'ha5) >= (8'hba)) ~^ ((8'hb8) ? (8'hae) : (8'ha5))) ? {{(8'hae), (8'hb9)}} : (+(+(7'h40)))) >> {(((7'h40) ? (8'hbc) : (8'ha4)) <<< {(8'hba), (8'hbb)})}) : (8'hbd)))
(y, clk, wire15, wire14, wire13, wire12, wire11);
  output wire [(32'h3f):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h10):(1'h0)] wire15;
  input wire [(4'ha):(1'h0)] wire14;
  input wire [(5'h15):(1'h0)] wire13;
  input wire signed [(5'h13):(1'h0)] wire12;
  input wire [(4'hf):(1'h0)] wire11;
  wire [(4'hb):(1'h0)] wire70;
  wire [(4'hb):(1'h0)] wire68;
  wire signed [(4'hd):(1'h0)] wire56;
  wire [(3'h7):(1'h0)] wire54;
  wire [(5'h14):(1'h0)] wire16;
  assign y = {wire70, wire68, wire56, wire54, wire16, (1'h0)};
  assign wire16 = (wire13[(2'h3):(1'h0)] ?
                      ($unsigned(($signed(wire14) ?
                              (wire11 ^ wire11) : (wire13 ? wire15 : wire13))) ?
                          (8'haa) : $signed($signed((wire14 ?
                              wire12 : (8'ha1))))) : wire11[(3'h5):(2'h2)]);
  module17 #() modinst55 (wire54, clk, wire13, wire14, wire12, wire11);
  assign wire56 = (wire11 && (8'ha3));
  module57 #() modinst69 (wire68, clk, wire16, wire11, wire13, wire56);
  assign wire70 = (wire15 == ($unsigned($unsigned(wire14[(1'h0):(1'h0)])) << wire12[(5'h11):(3'h5)]));
endmodule

module module57  (y, clk, wire61, wire60, wire59, wire58);
  output wire [(32'h39):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h14):(1'h0)] wire61;
  input wire signed [(3'h5):(1'h0)] wire60;
  input wire [(5'h15):(1'h0)] wire59;
  input wire [(4'ha):(1'h0)] wire58;
  wire signed [(2'h2):(1'h0)] wire64;
  wire [(4'h9):(1'h0)] wire63;
  wire signed [(4'h8):(1'h0)] wire62;
  reg signed [(4'ha):(1'h0)] reg67 = (1'h0);
  reg [(4'h8):(1'h0)] reg66 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg65 = (1'h0);
  assign y = {wire64, wire63, wire62, reg67, reg66, reg65, (1'h0)};
  assign wire62 = wire61;
  assign wire63 = $signed(wire61);
  assign wire64 = wire63[(3'h6):(3'h4)];
  always
    @(posedge clk) begin
      reg65 <= $unsigned(wire60);
      reg66 <= ((^wire63) ^~ $signed(wire60));
      reg67 <= (wire58[(2'h3):(2'h3)] ?
          wire64[(1'h0):(1'h0)] : (wire63[(3'h4):(1'h0)] ?
              wire63[(2'h3):(1'h0)] : (^wire61)));
    end
endmodule

module module17  (y, clk, wire21, wire20, wire19, wire18);
  output wire [(32'h185):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire21;
  input wire signed [(4'ha):(1'h0)] wire20;
  input wire signed [(5'h10):(1'h0)] wire19;
  input wire signed [(3'h6):(1'h0)] wire18;
  wire signed [(4'hf):(1'h0)] wire53;
  wire [(3'h7):(1'h0)] wire52;
  wire [(5'h13):(1'h0)] wire44;
  wire signed [(5'h10):(1'h0)] wire43;
  wire [(4'ha):(1'h0)] wire42;
  wire [(5'h15):(1'h0)] wire41;
  wire [(4'he):(1'h0)] wire40;
  wire signed [(5'h13):(1'h0)] wire39;
  wire signed [(3'h6):(1'h0)] wire38;
  wire [(4'h9):(1'h0)] wire22;
  reg signed [(4'hd):(1'h0)] reg51 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg50 = (1'h0);
  reg signed [(4'he):(1'h0)] reg49 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg48 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg47 = (1'h0);
  reg [(4'hc):(1'h0)] reg46 = (1'h0);
  reg [(4'hf):(1'h0)] reg45 = (1'h0);
  reg [(4'h8):(1'h0)] reg37 = (1'h0);
  reg [(4'ha):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg35 = (1'h0);
  reg [(5'h14):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg32 = (1'h0);
  reg [(4'ha):(1'h0)] reg31 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  assign y = {wire53,
                 wire52,
                 wire44,
                 wire43,
                 wire42,
                 wire41,
                 wire40,
                 wire39,
                 wire38,
                 wire22,
                 reg51,
                 reg50,
                 reg49,
                 reg48,
                 reg47,
                 reg46,
                 reg45,
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
                 reg23,
                 (1'h0)};
  assign wire22 = $signed(wire21);
  always
    @(posedge clk) begin
      reg23 <= $signed(($unsigned(wire18[(2'h3):(1'h0)]) > (~|{{(8'hae)}})));
      reg24 <= (+wire22);
      reg25 <= ((~&{(8'ha9)}) >> wire19);
      reg26 <= (|((!(reg25 << $signed(wire18))) ? wire21 : wire21));
      if ((-$signed($unsigned($unsigned((wire18 ? reg26 : wire19))))))
        begin
          if ((wire21[(3'h7):(2'h3)] ?
              $unsigned((^~($signed(reg24) ?
                  $signed(reg23) : reg26[(4'hf):(4'hb)]))) : ((^(reg23 >= (wire19 ?
                      reg26 : wire22))) ?
                  $unsigned(((wire18 ^~ reg23) <= $unsigned((8'had)))) : wire22[(3'h4):(2'h3)])))
            begin
              reg27 <= $signed(reg24[(3'h4):(1'h1)]);
              reg28 <= wire19;
            end
          else
            begin
              reg27 <= reg27[(3'h6):(3'h6)];
              reg28 <= ($signed(reg25) >= $unsigned($signed((~|reg28[(4'hb):(2'h2)]))));
              reg29 <= {$signed(($signed(wire19) ?
                      $signed(wire20[(4'h8):(2'h3)]) : {reg23})),
                  (-wire18)};
            end
          if (wire18)
            begin
              reg30 <= ({wire19} ?
                  (reg28[(4'h9):(1'h0)] * wire20) : (+(reg25 ?
                      $unsigned((reg27 > wire19)) : $signed({wire21, reg23}))));
              reg31 <= $unsigned((-(8'hb5)));
            end
          else
            begin
              reg30 <= (8'hb3);
              reg31 <= {($unsigned((reg23[(4'h8):(4'h8)] ?
                      {wire21} : ((8'haf) && reg27))) + reg24[(1'h1):(1'h1)])};
              reg32 <= $signed($unsigned(reg23[(4'h9):(3'h6)]));
              reg33 <= ({{({reg25} ? (~&reg27) : reg26)}} ?
                  $unsigned(wire19[(4'h9):(3'h7)]) : wire22[(3'h7):(3'h6)]);
              reg34 <= (~$signed((&wire22[(3'h4):(2'h2)])));
            end
          reg35 <= (~(^~$signed(((reg33 ^ reg26) ?
              (~|wire21) : (reg23 < reg31)))));
          reg36 <= $signed((8'h9d));
          reg37 <= (wire22[(2'h3):(1'h1)] ?
              ({$signed(reg35[(1'h1):(1'h0)]), reg32} ?
                  (~^reg29) : $signed((~^(reg23 != reg26)))) : $unsigned((~((wire20 ?
                      reg23 : wire18) ?
                  (reg29 ? reg31 : reg34) : $signed((8'hba))))));
        end
      else
        begin
          reg27 <= $signed((~$unsigned($unsigned((reg34 ? reg30 : reg35)))));
          if (reg31)
            begin
              reg28 <= reg31[(3'h4):(3'h4)];
              reg29 <= (($unsigned(($unsigned(reg33) ^~ reg25[(2'h2):(2'h2)])) ?
                  (reg34[(2'h3):(2'h2)] ?
                      (~$unsigned(reg34)) : $unsigned((reg26 && reg32))) : $signed(reg32)) >>> (+$unsigned(((~&reg27) ?
                  reg25 : (reg30 ? (8'hb0) : wire18)))));
            end
          else
            begin
              reg28 <= (($signed($signed($unsigned(reg28))) < ((~$unsigned(reg25)) ?
                  (!{reg26}) : ((wire22 ? (8'hbf) : (8'hb9)) * ((8'ha0) ?
                      (8'haa) : reg31)))) * wire21);
            end
          reg30 <= reg30;
        end
    end
  assign wire38 = ((8'hb1) ^~ (reg30 <<< ($unsigned($signed(reg35)) ^ {$signed(reg35)})));
  assign wire39 = reg29;
  assign wire40 = (reg37[(3'h5):(3'h4)] ?
                      $signed(reg27[(1'h1):(1'h0)]) : (+reg32));
  assign wire41 = (($signed(($signed(wire38) > (reg24 > reg35))) && $unsigned({(-(8'hb6))})) ?
                      reg36 : $unsigned(((~&reg28) > $signed((wire39 >>> wire22)))));
  assign wire42 = (reg37[(1'h1):(1'h1)] >>> wire39[(2'h2):(2'h2)]);
  assign wire43 = (8'ha8);
  assign wire44 = $unsigned($signed(reg36[(2'h2):(1'h0)]));
  always
    @(posedge clk) begin
      if ((8'ha2))
        begin
          reg45 <= (reg36 ?
              $unsigned((wire43[(1'h1):(1'h0)] ?
                  (8'ha6) : (8'hba))) : $signed($unsigned($signed((wire19 ?
                  wire21 : (8'ha3))))));
          reg46 <= $signed(((7'h43) | $unsigned(((reg25 >> wire20) >> $unsigned(reg35)))));
          reg47 <= reg31[(4'h9):(3'h5)];
        end
      else
        begin
          reg45 <= (~{reg33[(2'h2):(1'h1)]});
        end
      reg48 <= $signed({wire39[(4'ha):(2'h2)], reg46[(1'h0):(1'h0)]});
    end
  always
    @(posedge clk) begin
      reg49 <= $signed((wire18 && ($unsigned($unsigned((8'ha6))) >>> ({reg29} ?
          (~^reg29) : reg32))));
      reg50 <= $signed({reg49,
          $signed(($unsigned((7'h44)) ? {wire38} : (!reg49)))});
      reg51 <= $signed(($unsigned({$signed(wire43),
          (reg31 - wire20)}) <<< {wire21[(3'h7):(1'h1)],
          (reg37 <= $signed(reg26))}));
    end
  assign wire52 = wire22;
  assign wire53 = {reg51[(4'hb):(2'h3)], wire22};
endmodule
