module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h3c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h10):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(4'hf):(1'h0)] wire47;
  wire signed [(5'h12):(1'h0)] wire46;
  wire signed [(3'h4):(1'h0)] wire45;
  wire signed [(3'h4):(1'h0)] wire44;
  wire [(5'h12):(1'h0)] wire42;
  assign y = {wire47, wire46, wire45, wire44, wire42, (1'h0)};
  module4 #() modinst43 (.clk(clk), .wire7(wire2), .wire9(wire1), .wire8(wire0), .wire6(wire3), .y(wire42), .wire5((8'hbd)));
  assign wire44 = $unsigned(wire1[(3'h4):(2'h3)]);
  assign wire45 = (wire42 ?
                      ((wire42[(4'h8):(3'h6)] - $signed((~^wire0))) ^ (wire0 == {wire3[(4'he):(4'ha)],
                          {(8'hba)}})) : ((+$signed(wire2[(4'hc):(4'h9)])) >> (^(^(wire1 >= wire2)))));
  assign wire46 = ({((~|wire44) ?
                          wire2[(3'h6):(3'h5)] : ((wire2 | wire2) + wire1)),
                      (8'hb1)} != wire44);
  assign wire47 = ($unsigned(((((8'hb6) && wire45) >= (wire45 > wire3)) ?
                      wire45 : wire45[(1'h0):(1'h0)])) & ($signed(((wire2 ?
                          wire1 : wire46) & wire45)) ?
                      ((!$unsigned(wire1)) ?
                          ($signed(wire3) ?
                              $signed(wire0) : $unsigned(wire0)) : (|$unsigned(wire3))) : wire46));
endmodule

module module4
#(parameter param40 = ({({((8'ha5) >>> (8'hb4)), ((8'hb9) ^ (8'haa))} ? (((8'hb4) ? (7'h41) : (8'ha9)) != {(8'hbc)}) : {((7'h43) - (8'hb1)), ((8'hb4) ? (8'ha2) : (8'hb9))})} == {((-((8'ha1) && (8'hb0))) ? (((7'h44) ? (8'ha8) : (8'ha0)) ? ((8'hb9) ? (8'hab) : (8'ha9)) : {(8'ha4), (8'hbc)}) : ({(8'ha3), (8'ha8)} * (^~(8'hbb)))), {{(8'haf), ((7'h44) * (8'hb5))}}}), 
parameter param41 = (((param40 ? ((param40 ^ param40) << (param40 + param40)) : param40) ? (param40 ? ((!param40) & (~&param40)) : ((param40 ? param40 : param40) >= (~param40))) : {((param40 > (8'hb9)) ^~ (&param40))}) ? (param40 != {(param40 || (8'hb8)), (&(~&param40))}) : (&(~^param40))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h192):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire9;
  input wire [(4'hd):(1'h0)] wire8;
  input wire signed [(5'h13):(1'h0)] wire7;
  input wire [(5'h10):(1'h0)] wire6;
  input wire [(4'hd):(1'h0)] wire5;
  wire [(4'h9):(1'h0)] wire18;
  wire signed [(3'h6):(1'h0)] wire17;
  wire signed [(4'ha):(1'h0)] wire16;
  wire signed [(4'hc):(1'h0)] wire15;
  wire signed [(5'h14):(1'h0)] wire14;
  wire signed [(5'h10):(1'h0)] wire13;
  wire [(3'h4):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire10;
  reg [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(3'h6):(1'h0)] reg38 = (1'h0);
  reg [(3'h7):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg35 = (1'h0);
  reg [(5'h10):(1'h0)] reg34 = (1'h0);
  reg [(5'h15):(1'h0)] reg33 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg32 = (1'h0);
  reg signed [(4'he):(1'h0)] reg31 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg30 = (1'h0);
  reg [(4'hc):(1'h0)] reg29 = (1'h0);
  reg [(4'hf):(1'h0)] reg28 = (1'h0);
  reg [(5'h10):(1'h0)] reg27 = (1'h0);
  reg [(5'h13):(1'h0)] reg26 = (1'h0);
  reg [(4'hb):(1'h0)] reg25 = (1'h0);
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg23 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg22 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg19 = (1'h0);
  reg [(5'h13):(1'h0)] reg11 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire10,
                 reg39,
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
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg11,
                 (1'h0)};
  assign wire10 = $signed((~|(~&wire6[(1'h1):(1'h0)])));
  always
    @(posedge clk) begin
      reg11 <= ($unsigned((~&wire10[(3'h4):(1'h1)])) > wire10[(2'h3):(1'h1)]);
    end
  assign wire12 = $unsigned($unsigned({($unsigned(wire10) && ((8'hba) != wire7)),
                      $unsigned((8'h9d))}));
  assign wire13 = $signed($signed(wire8));
  assign wire14 = $unsigned($signed(wire12[(2'h3):(1'h1)]));
  assign wire15 = $signed($unsigned((!wire14)));
  assign wire16 = $unsigned(((wire8 ?
                          $unsigned(wire9) : (~|wire8[(4'hd):(4'ha)])) ?
                      (wire14[(2'h3):(2'h2)] == $signed(reg11[(3'h4):(1'h0)])) : wire8));
  assign wire17 = $unsigned((~&wire16[(1'h0):(1'h0)]));
  assign wire18 = (-(+(($unsigned((8'hb7)) ~^ $unsigned(wire12)) <= $unsigned(wire8))));
  always
    @(posedge clk) begin
      if ($signed($unsigned(({$signed(wire16)} ?
          $signed(wire16[(4'h9):(1'h1)]) : (wire14 >> (~wire9))))))
        begin
          reg19 <= ($signed(($unsigned(wire13[(4'he):(4'hb)]) && wire5[(3'h5):(1'h1)])) & (wire5[(3'h5):(2'h2)] ^ (wire18 ?
              wire14[(4'h8):(3'h4)] : $signed($unsigned(wire16)))));
          reg20 <= (($unsigned({$signed(wire14), (wire9 >>> wire18)}) ?
              $signed((&$signed(wire9))) : ((!{wire12, wire7}) ?
                  wire10 : wire6)) <<< ((~(+wire13[(4'ha):(3'h6)])) || $signed(wire16[(4'h8):(3'h5)])));
          reg21 <= wire10;
          reg22 <= (($signed(((^(7'h42)) < $unsigned(wire14))) + wire5[(4'ha):(4'h8)]) ?
              (|$signed(($signed(wire12) ?
                  {reg19, wire7} : {(8'h9f),
                      (7'h42)}))) : $unsigned($unsigned(wire8)));
          if ({reg21[(3'h7):(2'h3)]})
            begin
              reg23 <= ((~wire15) ?
                  $unsigned(wire6) : $signed($unsigned((~|(~|wire7)))));
              reg24 <= (reg22 ?
                  wire9 : (((8'h9d) ?
                      reg11 : $unsigned(reg21)) >>> $signed({(reg11 & wire6)})));
              reg25 <= $unsigned((~|$unsigned(reg11[(1'h1):(1'h0)])));
              reg26 <= $signed((~$signed(reg19[(4'ha):(4'h8)])));
              reg27 <= (~^wire18);
            end
          else
            begin
              reg23 <= $unsigned((8'haa));
              reg24 <= {$unsigned((reg26 > $unsigned({(7'h41)}))),
                  ((8'hb5) ?
                      ($unsigned((reg27 - (8'hbd))) + {wire13[(4'hb):(3'h6)]}) : ((^~$unsigned(reg22)) == ($signed(reg24) + $signed((8'ha1)))))};
              reg25 <= reg21[(4'hf):(2'h3)];
              reg26 <= wire5[(4'hc):(4'hb)];
              reg27 <= $unsigned(reg11[(4'hb):(1'h1)]);
            end
        end
      else
        begin
          reg19 <= wire17[(2'h2):(1'h0)];
          reg20 <= $signed(wire15[(1'h0):(1'h0)]);
          if (((reg27[(4'ha):(3'h6)] ?
              reg20[(1'h1):(1'h1)] : $unsigned((((7'h44) ? wire18 : wire5) ?
                  (reg25 >>> reg24) : $signed(reg20)))) != (reg26 & ((((8'ha2) ?
              wire8 : (8'hbe)) < (~|wire17)) < (+((8'hab) ^ wire8))))))
            begin
              reg21 <= wire18;
            end
          else
            begin
              reg21 <= wire12[(1'h0):(1'h0)];
              reg22 <= reg25[(3'h4):(2'h2)];
              reg23 <= $unsigned({$unsigned((!reg21)), wire9[(2'h2):(1'h0)]});
            end
          reg24 <= $signed($unsigned((({wire7} > ((7'h43) >> reg27)) + $unsigned(wire7[(5'h11):(3'h5)]))));
          reg25 <= (($unsigned($signed((wire7 ? wire8 : reg25))) ?
              $unsigned(((reg21 >> reg20) ?
                  (wire12 ?
                      wire13 : (8'hb9)) : $signed(wire8))) : (8'h9e)) == (~&reg11));
        end
      if ($unsigned((8'h9d)))
        begin
          reg28 <= ($unsigned($signed(wire10)) ?
              (8'ha1) : $signed(((^~wire12) ?
                  ((reg27 ? reg27 : wire16) ?
                      (~|wire10) : (!wire9)) : $unsigned(wire15[(4'h8):(2'h3)]))));
          reg29 <= wire9[(3'h7):(3'h4)];
          if (wire12[(3'h4):(1'h0)])
            begin
              reg30 <= ($unsigned((wire9[(2'h3):(1'h1)] ?
                  (!wire13) : $signed((+reg27)))) | (~(8'ha5)));
              reg31 <= reg20;
              reg32 <= $signed({(~^(^reg27)),
                  (wire8[(4'hd):(4'h9)] ?
                      $signed((+reg24)) : {(^~wire14), wire6[(2'h3):(2'h3)]})});
            end
          else
            begin
              reg30 <= (|(!(|$unsigned($signed(reg28)))));
            end
          reg33 <= ($unsigned((^wire12)) - reg21);
          reg34 <= reg33;
        end
      else
        begin
          if (({($signed((reg29 <= wire17)) ? (8'hac) : reg25[(3'h4):(2'h2)]),
              wire8[(2'h3):(2'h3)]} - ((~^wire17) ?
              $signed((!(+reg23))) : $unsigned($signed(reg21[(4'h8):(4'h8)])))))
            begin
              reg28 <= (|$unsigned(wire16));
              reg29 <= reg25;
              reg30 <= ($signed((reg28 ?
                  wire5[(3'h7):(3'h7)] : reg32)) > reg34[(4'hc):(3'h6)]);
              reg31 <= (-(8'ha5));
              reg32 <= (~&(!(8'ha5)));
            end
          else
            begin
              reg28 <= $signed(reg19);
            end
          if ((~&({(^((8'ha3) ? reg20 : reg29)),
              $unsigned($unsigned(wire7))} <= $unsigned((8'ha5)))))
            begin
              reg33 <= (^{$unsigned(reg21),
                  (reg33[(4'hb):(1'h0)] >>> $signed($unsigned(reg24)))});
              reg34 <= ($unsigned((8'haf)) ?
                  $signed($unsigned((wire12 >> wire12))) : ($unsigned({reg26[(2'h3):(2'h3)]}) == $signed($unsigned((~^reg23)))));
              reg35 <= {wire7};
            end
          else
            begin
              reg33 <= wire13[(1'h1):(1'h0)];
              reg34 <= reg32;
              reg35 <= wire9;
            end
          reg36 <= ($signed({($signed(wire10) & wire7[(5'h11):(5'h10)]),
                  {(|reg19), wire15[(1'h0):(1'h0)]}}) ?
              (^(reg34 > $signed(reg32))) : $signed((^~reg20)));
          reg37 <= reg19;
        end
      reg38 <= (reg22 ?
          reg35 : {wire9[(4'ha):(2'h2)],
              (reg19[(4'ha):(3'h4)] ^ reg20[(2'h3):(2'h3)])});
      reg39 <= wire15[(1'h1):(1'h1)];
    end
endmodule
