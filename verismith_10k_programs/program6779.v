module top
#(parameter param29 = ((({(!(8'ha1))} > {{(8'h9e)}}) ^~ {((&(8'hbc)) ? (~|(8'hb7)) : (-(8'hab)))}) ? (-({((8'hae) ? (8'hb5) : (8'hbe))} ? (((8'hbb) < (8'hb3)) <= ((8'hba) >= (8'ha8))) : {((8'ha1) ? (8'hbc) : (8'hac))})) : (({((8'h9d) ^ (8'ha7))} <= (((8'hbf) ? (8'hb2) : (8'hac)) + ((8'hb4) || (7'h44)))) + ({((7'h42) && (8'hb9)), ((8'ha5) < (8'hbe))} ? {((8'ha8) ? (8'had) : (7'h41))} : (((8'hbb) | (8'hb4)) - (&(8'hac)))))), 
parameter param30 = (~&(-(param29 >= (8'haa)))))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h107):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h2):(1'h0)] wire4;
  input wire [(4'h9):(1'h0)] wire3;
  input wire [(3'h7):(1'h0)] wire2;
  input wire [(4'ha):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire [(4'hd):(1'h0)] wire28;
  wire [(4'hb):(1'h0)] wire27;
  wire signed [(4'h8):(1'h0)] wire26;
  wire [(4'hc):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire22;
  wire [(3'h6):(1'h0)] wire21;
  wire [(5'h10):(1'h0)] wire20;
  wire [(2'h3):(1'h0)] wire19;
  wire [(5'h11):(1'h0)] wire18;
  wire signed [(2'h2):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(3'h4):(1'h0)] wire15;
  wire [(3'h5):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(4'hf):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire [(4'ha):(1'h0)] wire6;
  wire signed [(2'h3):(1'h0)] wire5;
  reg [(4'ha):(1'h0)] reg24 = (1'h0);
  reg [(5'h15):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h6):(1'h0)] reg12 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg11 = (1'h0);
  reg [(5'h10):(1'h0)] reg10 = (1'h0);
  reg [(5'h15):(1'h0)] reg9 = (1'h0);
  assign y = {wire28,
                 wire27,
                 wire26,
                 wire25,
                 wire22,
                 wire21,
                 wire20,
                 wire19,
                 wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg24,
                 reg23,
                 reg12,
                 reg11,
                 reg10,
                 reg9,
                 (1'h0)};
  assign wire5 = (((((wire1 && wire2) >> $unsigned(wire4)) ?
                     $unsigned({wire0, (8'haa)}) : ({wire2} ?
                         $unsigned(wire3) : $signed((8'had)))) >>> wire4) ^~ wire1);
  assign wire6 = {(|$unsigned(((wire1 ^ wire1) < wire1[(4'h9):(2'h2)])))};
  assign wire7 = ((~($unsigned($unsigned(wire4)) <= (~&$signed(wire6)))) << wire4);
  assign wire8 = {wire7};
  always
    @(posedge clk) begin
      if (wire4[(1'h0):(1'h0)])
        begin
          reg9 <= (~&wire3);
        end
      else
        begin
          if ({(wire2[(2'h3):(2'h2)] ?
                  $signed((((8'hb8) ? wire4 : wire0) ?
                      (^~wire6) : $signed((8'ha7)))) : (8'hbc))})
            begin
              reg9 <= $signed(wire3);
              reg10 <= (({wire8[(3'h6):(1'h1)]} ?
                      (|{(wire8 ? wire5 : (8'ha1))}) : (~wire2)) ?
                  wire2[(2'h3):(1'h1)] : ($unsigned(({wire8, wire7} ?
                          wire2[(3'h4):(3'h4)] : (8'h9c))) ?
                      $signed((+wire5)) : $unsigned(wire6)));
            end
          else
            begin
              reg9 <= (((!$signed($unsigned(wire1))) ?
                      (8'ha2) : (!($signed(reg9) ^~ (wire5 ? reg10 : wire4)))) ?
                  wire6[(2'h2):(2'h2)] : ((~&reg9) && $signed(wire8)));
              reg10 <= {({($signed(wire4) >>> wire0)} ?
                      wire5[(2'h2):(1'h0)] : (~$signed($signed(reg10))))};
              reg11 <= wire2[(3'h4):(2'h3)];
            end
        end
      reg12 <= ((~|wire7) ? $unsigned(reg11[(2'h3):(2'h2)]) : wire2);
    end
  assign wire13 = (^wire5[(2'h3):(1'h1)]);
  assign wire14 = wire13[(3'h6):(3'h4)];
  assign wire15 = reg9;
  assign wire16 = ($signed($unsigned((!wire2[(3'h4):(1'h1)]))) ?
                      (~^(($signed((8'ha3)) - {wire8}) ?
                          {(reg10 ? wire1 : reg10),
                              (wire15 >>> wire4)} : $signed(wire2[(2'h2):(2'h2)]))) : {($signed($unsigned(wire6)) ?
                              wire4[(1'h1):(1'h0)] : (!(^wire4))),
                          $signed((-$signed(wire6)))});
  assign wire17 = wire16;
  assign wire18 = $unsigned(($signed($signed(wire0)) == ($unsigned($signed(wire16)) ^~ ($signed(wire13) >>> (reg11 <= wire6)))));
  assign wire19 = {wire4[(1'h0):(1'h0)],
                      (reg12 ?
                          ((wire5 ?
                              reg12[(1'h1):(1'h0)] : (~|wire16)) >> ($signed(wire1) ?
                              (8'ha4) : wire13[(4'hb):(3'h6)])) : reg10[(5'h10):(4'h8)])};
  assign wire20 = wire13[(4'hb):(1'h0)];
  assign wire21 = (~$unsigned($signed($unsigned($unsigned(wire16)))));
  assign wire22 = (($signed(((8'ha4) + wire13[(4'ha):(3'h7)])) << (wire0 ?
                      {(~(8'hb4))} : $unsigned($signed(wire0)))) & wire1);
  always
    @(posedge clk) begin
      reg23 <= $unsigned($unsigned((8'hbc)));
      reg24 <= (((wire15[(2'h3):(2'h3)] * (wire21 << wire18)) && {(~&$signed(wire19)),
          ($signed(wire13) ?
              $signed(reg10) : (wire19 ^~ (8'ha0)))}) & wire19[(2'h3):(2'h2)]);
    end
  assign wire25 = ((reg23 ? $unsigned(reg10) : (8'hb7)) ?
                      (-reg24) : (wire5[(2'h3):(2'h3)] ?
                          wire17 : (wire16[(4'hf):(2'h2)] ?
                              wire2[(1'h1):(1'h1)] : $unsigned(wire3[(1'h0):(1'h0)]))));
  assign wire26 = wire6;
  assign wire27 = {(wire5[(2'h3):(1'h0)] ?
                          $signed($signed(((8'hac) ~^ reg12))) : wire17[(2'h2):(1'h0)]),
                      $unsigned($signed($unsigned((^wire20))))};
  assign wire28 = ($signed(wire25) ?
                      ((!({(8'ha4), wire4} ?
                          (wire25 - reg10) : wire14[(1'h1):(1'h1)])) * $signed(wire21)) : (((~&reg11) == $signed(wire18[(1'h1):(1'h0)])) ?
                          (+wire26[(1'h0):(1'h0)]) : $signed(((reg9 || wire18) ^~ wire0[(2'h2):(1'h1)]))));
endmodule
