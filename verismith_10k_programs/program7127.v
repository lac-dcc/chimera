module top
#(parameter param53 = ((({((8'ha5) ? (8'hab) : (8'h9c)), (~|(8'hbc))} | (|(|(8'hb2)))) <<< (((8'hb5) && {(8'hac)}) ? (((8'h9e) > (7'h42)) <<< ((8'h9f) < (7'h43))) : (((8'ha6) ? (8'ha8) : (8'hbf)) ? ((8'hb1) == (8'hb2)) : (&(8'hbb))))) * (({((8'hb4) ^~ (8'hac))} ? (((8'ha4) * (8'hb0)) ? (7'h41) : ((7'h44) | (8'ha3))) : (~|((8'ha5) | (7'h40)))) ? ((8'ha0) ~^ {((8'ha3) ? (8'hba) : (8'hb2)), ((8'ha4) >>> (8'hb2))}) : (8'ha7))), 
parameter param54 = param53)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h91):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'hc):(1'h0)] wire3;
  input wire [(5'h15):(1'h0)] wire2;
  input wire signed [(4'hc):(1'h0)] wire1;
  input wire [(4'ha):(1'h0)] wire0;
  wire [(5'h11):(1'h0)] wire52;
  wire signed [(4'h8):(1'h0)] wire51;
  wire signed [(4'hf):(1'h0)] wire50;
  wire signed [(4'ha):(1'h0)] wire49;
  wire [(4'he):(1'h0)] wire48;
  wire [(3'h5):(1'h0)] wire47;
  wire signed [(5'h13):(1'h0)] wire46;
  wire signed [(5'h12):(1'h0)] wire44;
  wire [(5'h13):(1'h0)] wire42;
  reg [(5'h13):(1'h0)] reg45 = (1'h0);
  assign y = {wire52,
                 wire51,
                 wire50,
                 wire49,
                 wire48,
                 wire47,
                 wire46,
                 wire44,
                 wire42,
                 reg45,
                 (1'h0)};
  module4 #() modinst43 (.y(wire42), .clk(clk), .wire6(wire3), .wire7(wire1), .wire9(wire2), .wire5((8'hab)), .wire8(wire0));
  assign wire44 = $signed((~^({$signed(wire42), $signed(wire3)} ?
                      wire42 : {wire2})));
  always
    @(posedge clk) begin
      reg45 <= (-wire44[(3'h7):(1'h0)]);
    end
  assign wire46 = $unsigned(($signed((&$signed(wire1))) ?
                      $unsigned(wire44[(2'h3):(2'h3)]) : wire3[(2'h2):(1'h1)]));
  assign wire47 = wire2;
  assign wire48 = (~|$unsigned($signed(wire47)));
  assign wire49 = (((+(~^$unsigned(wire42))) > (8'ha8)) ?
                      $unsigned(($signed({wire1, wire1}) ?
                          wire2[(4'hf):(4'h8)] : $unsigned((^~wire44)))) : $unsigned(wire48[(3'h4):(1'h1)]));
  assign wire50 = wire0[(2'h2):(2'h2)];
  assign wire51 = ((wire48 ^ $signed($signed($signed(wire47)))) && ((~wire46) ?
                      {(wire0[(4'h9):(2'h3)] >> (wire49 ?
                              (7'h42) : wire49))} : wire46));
  assign wire52 = (|wire44[(4'hf):(3'h7)]);
endmodule

module module4
#(parameter param40 = {(({{(8'haa)}, {(8'h9d)}} ? {((8'haf) - (8'hb9)), ((8'ha8) ? (8'hb8) : (8'ha1))} : {(~(8'hbc)), (-(8'hbb))}) | ({(!(8'h9e)), {(8'ha7), (8'ha8)}} ? (~|(~|(8'hb0))) : {(~^(8'ha7)), ((8'hab) ? (8'ha4) : (8'hb4))})), (^((+((8'ha3) ? (8'hb7) : (8'hbb))) >> ((8'hb7) ? ((8'ha6) ? (8'hac) : (7'h42)) : ((7'h40) ? (7'h42) : (7'h40)))))}, 
parameter param41 = ((param40 ? (((param40 ? param40 : param40) ? (param40 ? param40 : (8'hae)) : ((8'hbf) ? param40 : param40)) ? (~&(param40 ? (8'h9f) : param40)) : (^(param40 ? param40 : param40))) : (((^param40) ? (8'ha5) : (~^param40)) ? (|(param40 ? param40 : param40)) : ((param40 ? param40 : param40) ? (param40 ? param40 : param40) : (param40 ? param40 : param40)))) ? (param40 ? param40 : (8'hbd)) : ((param40 ? ((&param40) >>> {param40, param40}) : ((~|param40) ? param40 : {param40})) ? (+(8'haa)) : (((param40 ? param40 : (8'ha5)) ? (param40 ? param40 : param40) : (param40 ? (8'hb0) : param40)) >= param40))))
(y, clk, wire9, wire8, wire7, wire6, wire5);
  output wire [(32'h152):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire9;
  input wire [(4'ha):(1'h0)] wire8;
  input wire [(3'h5):(1'h0)] wire7;
  input wire [(3'h5):(1'h0)] wire6;
  input wire [(5'h12):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire39;
  wire signed [(2'h3):(1'h0)] wire38;
  wire [(3'h4):(1'h0)] wire17;
  wire [(4'hf):(1'h0)] wire16;
  wire signed [(3'h5):(1'h0)] wire15;
  wire [(3'h7):(1'h0)] wire14;
  wire signed [(5'h14):(1'h0)] wire13;
  wire [(4'hd):(1'h0)] wire12;
  wire [(3'h6):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire10;
  reg [(5'h15):(1'h0)] reg37 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg36 = (1'h0);
  reg [(3'h7):(1'h0)] reg35 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg34 = (1'h0);
  reg signed [(4'he):(1'h0)] reg33 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg32 = (1'h0);
  reg [(4'hc):(1'h0)] reg31 = (1'h0);
  reg [(3'h5):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg29 = (1'h0);
  reg [(2'h3):(1'h0)] reg28 = (1'h0);
  reg [(4'ha):(1'h0)] reg27 = (1'h0);
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg [(5'h11):(1'h0)] reg25 = (1'h0);
  reg [(5'h14):(1'h0)] reg24 = (1'h0);
  reg [(3'h6):(1'h0)] reg23 = (1'h0);
  reg [(4'he):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg [(2'h3):(1'h0)] reg20 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg19 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  assign y = {wire39,
                 wire38,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg18,
                 (1'h0)};
  assign wire10 = (+(^$unsigned({(wire5 ? wire6 : wire7),
                      (wire8 ? wire6 : wire7)})));
  assign wire11 = $signed(($signed(((7'h42) ? $unsigned(wire9) : wire5)) ?
                      {wire10[(2'h3):(1'h1)]} : wire6));
  assign wire12 = wire6[(2'h2):(2'h2)];
  assign wire13 = $unsigned($signed(wire11));
  assign wire14 = (&(($unsigned((^(8'ha8))) ?
                          $signed((wire9 ? (8'hb5) : wire13)) : (~^(wire8 ?
                              (8'hb0) : wire7))) ?
                      {{(wire8 ? (8'haa) : wire6), (wire13 ? wire8 : wire10)},
                          wire8} : (wire9 ?
                          $unsigned((wire12 ?
                              wire11 : (8'hb5))) : $signed(wire12))));
  assign wire15 = (((({wire6} <= {wire12}) ?
                              wire11[(3'h4):(3'h4)] : (~wire10[(4'h9):(4'h8)])) ?
                          ($unsigned((~(8'ha2))) * (wire6[(3'h5):(1'h1)] ?
                              wire7 : (wire12 <= (8'ha1)))) : $unsigned((wire12 - (wire9 != wire6)))) ?
                      {(((~wire10) ?
                              (wire5 * wire14) : (wire14 & wire13)) >>> ((wire7 ?
                                  wire9 : wire7) ?
                              $signed((8'haa)) : wire13)),
                          $signed(((wire13 > (7'h41)) >> (8'hae)))} : (wire12 ^~ (8'hb4)));
  assign wire16 = wire11;
  assign wire17 = $signed({wire11[(3'h4):(2'h2)], wire15[(2'h2):(2'h2)]});
  always
    @(posedge clk) begin
      if ({(^(wire17[(1'h0):(1'h0)] << ((wire6 ? wire13 : wire13) ?
              (~&wire14) : wire16)))})
        begin
          if (((wire12[(1'h0):(1'h0)] ?
              $signed((&(!wire11))) : (7'h42)) <= (8'hb4)))
            begin
              reg18 <= {{wire11[(3'h5):(1'h1)]}};
            end
          else
            begin
              reg18 <= {$unsigned((+$signed((~^wire10)))),
                  (wire6 ?
                      ((wire5[(3'h6):(2'h3)] - (wire15 || wire5)) ?
                          (((7'h44) ? wire5 : wire7) <<< (wire17 ?
                              wire13 : wire10)) : ((wire5 ? wire6 : wire6) ?
                              wire5[(2'h2):(1'h1)] : $signed((8'hb7)))) : {{$unsigned((8'hb4)),
                              (~|wire7)},
                          wire16})};
              reg19 <= $signed(wire17);
              reg20 <= {wire8, $unsigned(wire7)};
              reg21 <= ((((~^(reg19 ?
                  reg18 : reg18)) >= {(|wire14)}) >>> wire9) <<< (8'hb5));
            end
          reg22 <= $unsigned($signed(((+(wire10 <= wire5)) ?
              wire12[(2'h2):(1'h0)] : {wire7, {wire8, wire11}})));
          reg23 <= reg22;
          reg24 <= reg22;
          reg25 <= $unsigned((($unsigned(wire8[(3'h5):(2'h2)]) ?
                  (8'hb2) : wire13) ?
              ($signed($signed((8'hb1))) ?
                  wire12[(4'hb):(2'h2)] : (~|reg22[(4'h9):(3'h7)])) : reg20));
        end
      else
        begin
          reg18 <= wire15[(3'h4):(2'h3)];
          reg19 <= $unsigned($signed($signed(($unsigned(reg22) && {reg19,
              wire6}))));
          reg20 <= {wire11};
          reg21 <= ({reg25,
              ($signed(((8'hb3) ?
                  (8'ha8) : (8'h9f))) * reg22)} || ($unsigned(((8'haf) <<< $signed(wire15))) <= (wire7 | wire12[(4'hd):(1'h1)])));
          reg22 <= {(|wire10), (~&reg25[(3'h5):(1'h1)])};
        end
      if ($signed((wire14 ?
          {(~&((8'ha8) ? wire12 : (8'hb9)))} : (wire10 == (~^((8'h9d) ?
              wire12 : wire7))))))
        begin
          reg26 <= ((reg19[(2'h2):(2'h2)] ?
              wire14[(2'h3):(2'h3)] : reg19[(1'h1):(1'h0)]) <<< $signed(({$unsigned(wire8)} ?
              wire7[(3'h5):(2'h3)] : wire7)));
          reg27 <= {$unsigned((8'ha0))};
          if ({$signed(wire8)})
            begin
              reg28 <= $unsigned(($unsigned(({wire12} ?
                      {reg21, reg18} : wire17[(1'h0):(1'h0)])) ?
                  $signed((!wire11[(2'h2):(1'h1)])) : (({reg19,
                          wire16} << (reg25 * reg20)) ?
                      (wire15 * wire6[(1'h1):(1'h0)]) : ((8'h9e) >= (wire5 >= reg19)))));
              reg29 <= $unsigned(($signed(wire14[(1'h0):(1'h0)]) + ((-(reg25 ?
                  wire13 : reg23)) ~^ $unsigned((-wire7)))));
              reg30 <= (reg22 >= reg25[(4'hb):(3'h5)]);
              reg31 <= $unsigned($unsigned((~^(~^(8'hac)))));
            end
          else
            begin
              reg28 <= $unsigned($unsigned((reg21 ?
                  $signed(((8'hbe) == reg23)) : $signed(reg30))));
              reg29 <= $signed(reg21[(2'h2):(1'h0)]);
              reg30 <= ($signed(reg31[(4'ha):(3'h6)]) ?
                  ((&$signed((|(8'hbb)))) + ($unsigned((reg21 && reg18)) >> $signed((8'had)))) : (8'hb9));
              reg31 <= ($signed(wire15[(3'h4):(2'h3)]) + $unsigned($signed($signed(reg31[(2'h2):(1'h1)]))));
              reg32 <= (^~$unsigned((~&(&$unsigned(wire14)))));
            end
          reg33 <= reg24;
          reg34 <= (((!(reg33[(4'h9):(3'h4)] != ((8'h9d) > wire7))) ?
              $unsigned({reg26}) : $signed((reg18 <= (~reg28)))) - $signed((($signed((8'hbd)) <= {reg26}) ?
              {(reg27 + reg25)} : reg24[(5'h11):(4'h9)])));
        end
      else
        begin
          reg26 <= ($signed((wire8[(3'h5):(1'h0)] ^ reg31[(1'h1):(1'h1)])) ?
              wire16[(3'h5):(1'h0)] : $signed(wire5[(3'h7):(2'h2)]));
          reg27 <= wire12[(4'h8):(1'h0)];
          reg28 <= (reg18 == (wire7 << $signed((+(wire12 <= reg31)))));
        end
      reg35 <= (~(|(^~wire5)));
      reg36 <= (&($unsigned({reg22,
          $unsigned(reg26)}) ^~ $signed($signed($signed(reg28)))));
      reg37 <= (+$signed({(reg21 ? (^~(8'hb8)) : reg21[(4'h9):(4'h8)]),
          (-$signed((8'hb7)))}));
    end
  assign wire38 = reg33;
  assign wire39 = reg20[(2'h3):(2'h2)];
endmodule
