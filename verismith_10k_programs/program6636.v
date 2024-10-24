module top
#(parameter param42 = ((((~|((8'hbf) < (7'h44))) ? (!(~|(8'ha8))) : (^((8'hab) > (8'ha8)))) <<< {(((8'hbd) ? (8'had) : (8'hae)) != ((8'h9d) - (8'ha4)))}) ? {(-({(8'hbd)} | {(8'had)}))} : (((~^(|(8'hb5))) == (^((7'h42) ~^ (7'h42)))) >> (~|{((8'ha6) + (8'haf)), ((8'hb4) > (8'hb6))}))), 
parameter param43 = ((8'ha1) ? (8'hae) : param42))
(y, clk, wire0, wire1, wire2, wire3);
  output wire [(32'h7c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hf):(1'h0)] wire0;
  input wire [(5'h15):(1'h0)] wire1;
  input wire signed [(4'ha):(1'h0)] wire2;
  input wire [(4'hb):(1'h0)] wire3;
  wire [(5'h13):(1'h0)] wire41;
  wire [(4'hc):(1'h0)] wire40;
  wire [(4'hc):(1'h0)] wire4;
  wire signed [(5'h13):(1'h0)] wire5;
  wire signed [(4'he):(1'h0)] wire6;
  wire [(5'h11):(1'h0)] wire7;
  wire [(5'h10):(1'h0)] wire8;
  wire signed [(4'he):(1'h0)] wire38;
  assign y = {wire41,
                 wire40,
                 wire4,
                 wire5,
                 wire6,
                 wire7,
                 wire8,
                 wire38,
                 (1'h0)};
  assign wire4 = (!wire1[(5'h15):(3'h4)]);
  assign wire5 = ($signed(wire3[(4'h9):(2'h2)]) ?
                     ((^~(wire4[(2'h3):(1'h0)] <= wire4[(1'h0):(1'h0)])) ?
                         (((wire4 ? wire3 : wire2) ?
                             $signed((8'hab)) : (+wire1)) < ((wire0 * (8'ha3)) ?
                             ((8'haf) ? wire2 : wire1) : (wire0 ?
                                 wire4 : (8'ha4)))) : $signed((|wire4[(2'h2):(1'h1)]))) : (wire2[(3'h7):(1'h0)] ?
                         (((^wire1) ? wire4[(1'h1):(1'h1)] : $unsigned(wire2)) ?
                             ((wire3 ? wire1 : (8'hb6)) ?
                                 $unsigned(wire2) : $unsigned(wire2)) : $unsigned((7'h41))) : $signed($signed($signed(wire0)))));
  assign wire6 = $signed($signed($signed(($unsigned(wire5) <<< (wire4 ?
                     wire5 : wire2)))));
  assign wire7 = $unsigned((($unsigned(wire2) == (wire4[(2'h3):(2'h2)] ?
                         (-wire4) : (wire3 >> wire4))) ?
                     wire3 : (8'ha5)));
  assign wire8 = (8'hb8);
  module9 #() modinst39 (.wire14(wire8), .wire12(wire3), .y(wire38), .wire11(wire4), .wire13(wire5), .wire10(wire7), .clk(clk));
  assign wire40 = (wire4 <= ((&(wire7 != wire7[(4'hd):(1'h1)])) ?
                      wire1[(3'h7):(3'h7)] : (-$signed((wire38 << wire0)))));
  assign wire41 = ($unsigned(((wire7[(4'ha):(2'h3)] >= (wire4 ?
                      (8'hb9) : wire6)) * $signed(wire7[(1'h0):(1'h0)]))) + wire5[(3'h7):(3'h4)]);
endmodule

module module9
#(parameter param36 = ({((-((8'ha1) >>> (8'ha6))) ? {((8'hac) ? (8'hb2) : (7'h43)), (~|(7'h41))} : (((8'had) ? (8'hb8) : (8'hba)) >> ((8'haf) >> (8'haa)))), ((((8'hab) << (8'hb1)) ^ (8'h9e)) * (8'hbe))} ? (-((((8'hbd) ? (7'h43) : (8'hab)) ? ((8'haf) + (8'h9d)) : ((8'h9d) ? (8'ha4) : (7'h42))) | ((~&(7'h44)) + (~^(8'hac))))) : {(~|(+(&(8'ha8))))}), 
parameter param37 = param36)
(y, clk, wire14, wire13, wire12, wire11, wire10);
  output wire [(32'hd9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire14;
  input wire signed [(4'h9):(1'h0)] wire13;
  input wire [(4'hb):(1'h0)] wire12;
  input wire [(4'hc):(1'h0)] wire11;
  input wire [(2'h3):(1'h0)] wire10;
  wire signed [(4'ha):(1'h0)] wire35;
  wire [(2'h2):(1'h0)] wire34;
  wire [(4'hd):(1'h0)] wire33;
  wire [(4'h9):(1'h0)] wire32;
  wire signed [(4'hd):(1'h0)] wire23;
  wire signed [(4'hd):(1'h0)] wire22;
  wire signed [(3'h6):(1'h0)] wire21;
  wire [(2'h3):(1'h0)] wire20;
  wire signed [(4'hf):(1'h0)] wire19;
  wire signed [(2'h3):(1'h0)] wire18;
  wire signed [(5'h15):(1'h0)] wire17;
  wire [(4'he):(1'h0)] wire16;
  wire signed [(2'h3):(1'h0)] wire15;
  reg [(5'h12):(1'h0)] reg31 = (1'h0);
  reg [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'ha):(1'h0)] reg29 = (1'h0);
  reg [(3'h7):(1'h0)] reg28 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg27 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg26 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  assign y = {wire35,
                 wire34,
                 wire33,
                 wire32,
                 wire23,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 reg31,
                 reg30,
                 reg29,
                 reg28,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 (1'h0)};
  assign wire15 = ((+(((wire10 ?
                      wire11 : (8'haa)) < $signed(wire12)) << (~&$signed((8'ha4))))) - ((~^(8'hbb)) ?
                      wire11 : ($unsigned((wire11 ? wire11 : wire14)) ?
                          (wire13 ?
                              $unsigned(wire13) : (^wire13)) : (wire13 && (&(7'h40))))));
  assign wire16 = wire12;
  assign wire17 = $signed({wire11});
  assign wire18 = {$signed(wire15[(1'h0):(1'h0)]),
                      ((($unsigned(wire14) ?
                                  ((8'h9f) + wire13) : (wire11 ?
                                      (8'ha0) : (7'h40))) ?
                              $unsigned((wire17 - wire14)) : {{(8'hb5)},
                                  (wire17 ~^ wire12)}) ?
                          $signed($signed($signed(wire16))) : (((wire17 ~^ wire15) ?
                                  $signed(wire12) : (!wire13)) ?
                              wire17 : $unsigned(wire17[(1'h1):(1'h1)])))};
  assign wire19 = ($signed((8'hb5)) == ((wire11[(4'hc):(1'h1)] ?
                          $signed($unsigned(wire13)) : wire13[(2'h3):(2'h2)]) ?
                      $signed(wire14) : (wire14[(4'ha):(3'h4)] ^~ wire17[(5'h13):(5'h12)])));
  assign wire20 = (^$signed({{wire10[(2'h3):(1'h1)],
                          (wire12 ? wire12 : wire12)}}));
  assign wire21 = $signed(($signed((|(+wire20))) * (+$unsigned((wire18 ?
                      wire20 : wire14)))));
  assign wire22 = (~&(-wire15[(2'h3):(1'h0)]));
  assign wire23 = wire19[(4'he):(4'he)];
  always
    @(posedge clk) begin
      if ((~(|($signed($unsigned(wire13)) < (~wire13[(1'h0):(1'h0)])))))
        begin
          reg24 <= wire20[(1'h1):(1'h1)];
          if (wire13[(3'h5):(3'h4)])
            begin
              reg25 <= $unsigned((&wire17[(4'hf):(4'h8)]));
              reg26 <= $signed($unsigned((wire22 - $signed(wire15[(1'h0):(1'h0)]))));
              reg27 <= (reg24 ?
                  (|(|((wire18 ?
                      (8'had) : wire13) * wire18[(2'h3):(1'h1)]))) : reg24);
              reg28 <= wire12[(4'h9):(1'h1)];
              reg29 <= reg28[(3'h6):(3'h5)];
            end
          else
            begin
              reg25 <= $signed((-{$signed($signed(wire21)),
                  $unsigned((~^reg24))}));
              reg26 <= (((~|{(~^reg29), (~|wire23)}) <<< wire13) ?
                  {$signed($signed((wire19 ?
                          reg29 : reg24)))} : $unsigned(wire20));
              reg27 <= (((wire10[(2'h2):(2'h2)] ?
                      $signed(wire23[(3'h5):(1'h1)]) : wire14) ~^ {(reg27[(1'h1):(1'h0)] <= ((8'hbf) >>> reg25))}) ?
                  (!((^~$unsigned(wire17)) + wire22[(4'hb):(3'h4)])) : wire20[(1'h0):(1'h0)]);
              reg28 <= wire12;
            end
          reg30 <= (reg28[(2'h2):(1'h1)] ?
              $unsigned($unsigned(wire14)) : reg27);
        end
      else
        begin
          reg24 <= ((wire11[(4'ha):(4'h8)] << $unsigned($signed(wire14[(4'h9):(4'h9)]))) ?
              ((({reg27,
                      wire21} != $signed(wire23)) * ($unsigned(wire15) ~^ (wire21 ?
                      wire21 : wire17))) ?
                  $unsigned($signed(wire21)) : (^(~(~(8'hb3))))) : $signed(($signed({wire23,
                  wire13}) << ((wire15 ? (8'hbf) : (8'hb7)) ~^ {wire10,
                  wire23}))));
          reg25 <= {$unsigned($signed({$signed(wire17)}))};
          reg26 <= {((reg26 <<< reg24) ~^ wire18),
              (({(wire19 ? (8'ha2) : (8'hbe))} - (^~(reg24 ?
                  reg28 : wire12))) != wire20[(2'h2):(1'h1)])};
          reg27 <= $signed($unsigned($unsigned($signed((reg24 | wire11)))));
        end
      reg31 <= (($signed(($unsigned(wire18) && $unsigned(reg25))) | wire12) ?
          (-$signed(((!wire12) > (wire10 >>> reg29)))) : (reg27[(1'h0):(1'h0)] ^ (wire14 ?
              wire22[(2'h2):(1'h0)] : (~wire12))));
    end
  assign wire32 = (^(wire21 < (!(~^reg31))));
  assign wire33 = (~&(wire13[(3'h6):(1'h0)] & $signed(((wire32 ?
                          reg27 : (8'hb3)) ?
                      (8'hb0) : (reg26 > wire14)))));
  assign wire34 = $unsigned(((((wire10 ? reg28 : reg31) | wire17) & wire10) ?
                      wire20 : (~^$unsigned((wire13 <= wire12)))));
  assign wire35 = wire11[(1'h0):(1'h0)];
endmodule
