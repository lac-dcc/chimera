module top  (y, clk, wire0, wire1, wire2, wire3, wire4);
  output wire [(32'h5b):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h12):(1'h0)] wire0;
  input wire signed [(4'he):(1'h0)] wire1;
  input wire signed [(4'hd):(1'h0)] wire2;
  input wire signed [(5'h14):(1'h0)] wire3;
  input wire signed [(4'he):(1'h0)] wire4;
  wire signed [(5'h14):(1'h0)] wire37;
  wire signed [(5'h15):(1'h0)] wire7;
  wire signed [(3'h4):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire35;
  reg signed [(5'h13):(1'h0)] reg5 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire37, wire7, wire8, wire35, reg5, reg6, (1'h0)};
  always
    @(posedge clk) begin
      reg5 <= wire1;
      reg6 <= (((~^$unsigned((wire4 ? wire2 : reg5))) || {wire1,
          wire4[(4'h9):(3'h6)]}) < wire0);
    end
  assign wire7 = wire0;
  assign wire8 = (-$unsigned($signed(wire0)));
  module9 #() modinst36 (.wire11(reg5), .wire13(wire1), .clk(clk), .y(wire35), .wire10(wire0), .wire12(wire3));
  assign wire37 = wire2;
endmodule

module module9
#(parameter param34 = {(((((8'hb3) + (8'hae)) ? (|(8'hb6)) : ((8'hbe) ? (7'h41) : (8'hb1))) | ({(8'hb0)} ? (~(8'ha8)) : {(8'ha5)})) ^~ ((((8'ha2) + (8'hb5)) ? (!(8'h9d)) : (|(8'hb5))) ? (((8'hbd) ? (8'ha7) : (7'h41)) >> ((8'haa) ? (8'haf) : (8'hb2))) : {((7'h44) ? (8'h9f) : (8'ha7)), (8'hbe)}))})
(y, clk, wire13, wire12, wire11, wire10);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'he):(1'h0)] wire13;
  input wire [(5'h14):(1'h0)] wire12;
  input wire signed [(4'ha):(1'h0)] wire11;
  input wire signed [(5'h12):(1'h0)] wire10;
  wire signed [(5'h15):(1'h0)] wire20;
  wire [(4'ha):(1'h0)] wire19;
  wire signed [(4'he):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire14;
  reg [(3'h6):(1'h0)] reg33 = (1'h0);
  reg signed [(4'ha):(1'h0)] reg32 = (1'h0);
  reg [(4'hd):(1'h0)] reg31 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg30 = (1'h0);
  reg [(4'h8):(1'h0)] reg29 = (1'h0);
  reg [(5'h13):(1'h0)] reg28 = (1'h0);
  reg [(4'hb):(1'h0)] reg27 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg26 = (1'h0);
  reg [(5'h12):(1'h0)] reg25 = (1'h0);
  reg [(2'h2):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg23 = (1'h0);
  reg signed [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(4'he):(1'h0)] reg21 = (1'h0);
  reg [(5'h10):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg16 = (1'h0);
  reg signed [(4'he):(1'h0)] reg15 = (1'h0);
  assign y = {wire20,
                 wire19,
                 wire17,
                 wire14,
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
                 reg18,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire14 = wire13;
  always
    @(posedge clk) begin
      reg15 <= ((|(wire12[(4'ha):(1'h1)] ?
              ((wire13 >= wire11) - wire14) : (((8'haa) && wire10) << $unsigned(wire13)))) ?
          (wire14 & $signed(wire10[(5'h12):(5'h10)])) : wire14);
      reg16 <= (8'h9c);
    end
  assign wire17 = $unsigned($signed(({wire12, $unsigned(wire11)} ?
                      (|(&wire10)) : wire12[(5'h14):(4'hb)])));
  always
    @(posedge clk) begin
      reg18 <= (|(wire14 ?
          ($unsigned($signed(wire14)) ?
              (8'hb7) : (reg16 ?
                  (wire10 ? wire14 : wire12) : $signed(wire12))) : reg15));
    end
  assign wire19 = (($unsigned($signed($unsigned(reg18))) >= (~(~^(^~wire13)))) * reg15[(4'ha):(3'h4)]);
  assign wire20 = $unsigned({$signed($unsigned(reg16))});
  always
    @(posedge clk) begin
      reg21 <= wire13;
      reg22 <= ($signed((($unsigned(reg16) ?
          (&wire14) : $signed(wire11)) == $unsigned((8'ha7)))) << {{(^(+reg21)),
              wire20[(4'hb):(3'h5)]},
          {($signed(wire20) ? $signed(wire13) : $unsigned((8'hb0)))}});
      if ($unsigned($signed((8'hae))))
        begin
          if ((|reg16))
            begin
              reg23 <= (+(~reg21));
              reg24 <= ($unsigned((7'h41)) != ({$unsigned((~&reg21))} ?
                  wire11[(2'h2):(1'h0)] : wire14));
            end
          else
            begin
              reg23 <= (-(8'hb3));
              reg24 <= $signed({wire19});
              reg25 <= (~^(($signed(wire17) <= $signed((reg24 ^ wire20))) != $signed((|wire10[(2'h3):(2'h2)]))));
              reg26 <= {(&$unsigned($unsigned((reg25 == wire12)))),
                  ({{((8'hb6) ? reg22 : reg22), (^~wire19)},
                          $signed((!reg15))} ?
                      $signed(wire11[(2'h2):(2'h2)]) : $signed((reg16[(1'h0):(1'h0)] ~^ (wire17 ?
                          wire19 : (8'ha7)))))};
              reg27 <= $signed((~^reg21));
            end
          reg28 <= $signed((^~$signed($unsigned($unsigned((8'ha9))))));
          if ({reg16[(1'h0):(1'h0)],
              ((($signed(wire20) ?
                      reg16[(2'h2):(1'h1)] : (reg25 ? reg16 : reg24)) ?
                  wire20 : wire17[(4'h9):(3'h4)]) + reg25)})
            begin
              reg29 <= (~&(-(((reg21 ?
                  wire12 : reg15) ^~ $signed((7'h44))) | $signed($unsigned(reg28)))));
              reg30 <= ((($signed($unsigned(wire20)) - ($signed(wire20) != (^reg29))) ^~ {($signed((8'hb2)) ?
                          (reg18 ? wire11 : reg18) : ((7'h40) - reg28)),
                      $unsigned($signed(wire20))}) ?
                  (8'hb4) : reg24);
            end
          else
            begin
              reg29 <= (~^(({$signed(reg28)} <= $unsigned({reg29, reg18})) ?
                  wire10 : ({$unsigned(reg16), $unsigned(reg25)} ?
                      $unsigned(reg23[(1'h1):(1'h0)]) : $signed(reg23))));
              reg30 <= ($unsigned($unsigned(((~|reg21) ?
                      reg26[(4'h8):(1'h0)] : reg15[(4'he):(4'ha)]))) ?
                  $signed((~^wire13[(2'h3):(2'h2)])) : reg27);
              reg31 <= wire12[(2'h3):(1'h0)];
            end
        end
      else
        begin
          reg23 <= ($unsigned(reg30[(1'h0):(1'h0)]) ?
              $unsigned($unsigned((wire13[(1'h1):(1'h0)] ?
                  $unsigned((8'hbf)) : (|reg31)))) : (|($signed(wire20[(4'hd):(4'hb)]) >> $unsigned({(8'h9f)}))));
          reg24 <= ($unsigned(wire14[(3'h6):(2'h3)]) ?
              ($unsigned({(reg16 ? reg30 : wire12),
                  (reg28 ?
                      reg21 : reg27)}) == reg28) : $unsigned($signed((8'ha5))));
        end
      reg32 <= reg27[(3'h7):(2'h2)];
      reg33 <= ((~^$signed(({wire10} ?
          {reg30, reg23} : wire14[(5'h14):(4'hc)]))) && reg24[(1'h1):(1'h1)]);
    end
endmodule
