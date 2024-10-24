module top  (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h4c):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h11):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire [(4'hd):(1'h0)] wire1;
  input wire signed [(5'h14):(1'h0)] wire0;
  wire [(4'ha):(1'h0)] wire36;
  wire signed [(5'h10):(1'h0)] wire33;
  wire signed [(3'h5):(1'h0)] wire32;
  wire [(4'he):(1'h0)] wire31;
  wire [(3'h6):(1'h0)] wire30;
  wire [(2'h3):(1'h0)] wire28;
  reg signed [(4'hc):(1'h0)] reg35 = (1'h0);
  reg [(4'h9):(1'h0)] reg34 = (1'h0);
  assign y = {wire36,
                 wire33,
                 wire32,
                 wire31,
                 wire30,
                 wire28,
                 reg35,
                 reg34,
                 (1'h0)};
  module4 #() modinst29 (wire28, clk, wire2, wire3, wire1, wire0);
  assign wire30 = wire0[(5'h14):(5'h14)];
  assign wire31 = (|$unsigned($unsigned({wire0[(4'h9):(1'h1)]})));
  assign wire32 = $unsigned($unsigned(wire31[(2'h2):(1'h0)]));
  assign wire33 = (-($unsigned($unsigned($signed((8'hbd)))) ?
                      {$unsigned($signed(wire1)),
                          wire31[(4'ha):(2'h3)]} : {(^(wire0 ? wire32 : wire2)),
                          ($signed(wire32) ?
                              ((8'ha4) && wire1) : (wire31 >>> wire30))}));
  always
    @(posedge clk) begin
      reg34 <= (($unsigned((wire3 ? $signed(wire28) : wire30)) ?
              wire3 : {$signed($signed(wire28))}) ?
          (((8'hb2) <<< ({(8'ha6)} ^~ wire3[(4'ha):(4'h9)])) >>> $signed((~&(wire31 >>> wire1)))) : $signed(wire31));
      reg35 <= wire30;
    end
  assign wire36 = wire28[(1'h0):(1'h0)];
endmodule

module module4  (y, clk, wire8, wire7, wire6, wire5);
  output wire [(32'hef):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(2'h3):(1'h0)] wire8;
  input wire signed [(5'h11):(1'h0)] wire7;
  input wire [(4'hd):(1'h0)] wire6;
  input wire [(5'h14):(1'h0)] wire5;
  wire signed [(5'h11):(1'h0)] wire19;
  wire signed [(5'h14):(1'h0)] wire16;
  wire signed [(5'h12):(1'h0)] wire15;
  wire signed [(3'h4):(1'h0)] wire14;
  wire signed [(4'hc):(1'h0)] wire13;
  wire signed [(3'h6):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(5'h14):(1'h0)] wire9;
  reg [(4'hc):(1'h0)] reg27 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg26 = (1'h0);
  reg [(4'h9):(1'h0)] reg25 = (1'h0);
  reg signed [(4'he):(1'h0)] reg24 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg20 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg18 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg17 = (1'h0);
  assign y = {wire19,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 reg27,
                 reg26,
                 reg25,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg18,
                 reg17,
                 (1'h0)};
  assign wire9 = (((wire7 - $unsigned((~&wire5))) ^ wire7) * (|$unsigned($signed((&wire8)))));
  assign wire10 = ((wire6[(2'h3):(1'h0)] ?
                          $signed($unsigned({wire9})) : $signed({$unsigned(wire8)})) ?
                      (({wire6[(1'h1):(1'h1)],
                          wire5} - (((8'ha1) == wire5) >>> (8'hb5))) <<< wire7) : ((~^(8'ha4)) ?
                          $signed(wire7[(3'h4):(3'h4)]) : wire8[(2'h3):(1'h0)]));
  assign wire11 = $signed($signed($signed(wire8)));
  assign wire12 = $unsigned($unsigned($unsigned($signed({wire9}))));
  assign wire13 = (8'hb1);
  assign wire14 = {(wire6[(4'ha):(3'h5)] & wire6[(4'hc):(2'h2)]),
                      {$unsigned(({wire8, wire13} > (~^wire10))),
                          $signed($unsigned(wire9[(4'he):(4'he)]))}};
  assign wire15 = ((7'h43) ?
                      wire14 : (~|{($signed(wire13) >> ((7'h41) ?
                              (7'h43) : (8'haf))),
                          ($unsigned(wire14) >= wire12[(1'h0):(1'h0)])}));
  assign wire16 = (wire10[(1'h0):(1'h0)] & ((wire13[(4'hb):(2'h3)] ?
                      ((&wire9) ?
                          ((8'hb5) ?
                              wire11 : wire11) : $signed((7'h43))) : $unsigned(wire13)) >= (~$signed((^wire15)))));
  always
    @(posedge clk) begin
      reg17 <= $signed($signed({wire6}));
      reg18 <= $unsigned(((wire15[(4'hf):(4'hb)] ?
          {$signed(wire15),
              ((8'hb4) ?
                  wire10 : wire6)} : (^$unsigned(reg17))) << ($unsigned((wire10 ~^ wire11)) ?
          $unsigned((+wire12)) : wire8)));
    end
  assign wire19 = $unsigned(wire10[(2'h2):(1'h1)]);
  always
    @(posedge clk) begin
      reg20 <= wire15;
    end
  always
    @(posedge clk) begin
      if ((((~^($unsigned(reg20) || wire11[(4'hc):(4'ha)])) ^~ reg18) ?
          ((((wire19 ? (8'hbf) : wire9) ?
                  (~|wire13) : wire16[(3'h7):(3'h7)]) <= ({wire12} && {wire5,
                  reg20})) ?
              $unsigned($signed($unsigned(wire12))) : $signed(($signed(reg17) ?
                  $signed(wire10) : $unsigned(reg18)))) : reg18[(2'h2):(2'h2)]))
        begin
          reg21 <= {wire15};
          if (($signed(($unsigned(wire13) >>> ((~^wire19) & $unsigned(reg17)))) ?
              $signed(wire5[(4'hd):(3'h5)]) : wire14[(2'h3):(1'h0)]))
            begin
              reg22 <= (+(+(((-wire6) ^ $signed(wire10)) ?
                  ($unsigned(wire14) ?
                      wire12 : (wire8 ? wire9 : wire12)) : (reg18 ?
                      reg18 : $signed((8'haa))))));
            end
          else
            begin
              reg22 <= (($signed($signed((wire19 ?
                      wire5 : reg18))) >> wire8[(2'h2):(2'h2)]) ?
                  $signed({(wire12[(1'h0):(1'h0)] ~^ wire6[(2'h3):(2'h2)])}) : $signed($unsigned((!(wire10 ?
                      wire9 : wire19)))));
              reg23 <= wire16[(2'h2):(1'h0)];
              reg24 <= ((reg23 ?
                  $signed($signed((8'hb3))) : (((wire8 < (8'ha6)) && (~reg17)) * (reg20[(4'hf):(4'h8)] ?
                      (wire11 ? reg23 : (8'hb0)) : (reg22 ?
                          reg21 : reg21)))) & (($signed(wire19[(2'h2):(1'h1)]) ?
                  (((7'h42) ? reg21 : (8'had)) - {(8'hb0),
                      wire16}) : $signed((wire8 + wire13))) && ((!{(8'hae),
                  (8'hb3)}) || (reg21[(3'h4):(1'h1)] ?
                  $unsigned(wire16) : wire14))));
            end
        end
      else
        begin
          if ((8'h9f))
            begin
              reg21 <= reg20[(1'h1):(1'h0)];
              reg22 <= reg18[(1'h0):(1'h0)];
            end
          else
            begin
              reg21 <= $unsigned((($signed((!(8'hbe))) ?
                  (reg18 ?
                      (wire12 ?
                          wire15 : reg24) : (wire11 >= reg21)) : wire12) ^~ reg18[(1'h1):(1'h1)]));
              reg22 <= ({(~$unsigned(wire15)),
                      $signed({$signed(wire14), wire12})} ?
                  (reg18[(1'h1):(1'h0)] ?
                      ((~|(wire7 ?
                          wire9 : wire8)) & reg18[(2'h2):(1'h0)]) : $signed((8'ha7))) : $signed(wire15[(4'hb):(3'h4)]));
              reg23 <= (^reg22[(4'h9):(3'h6)]);
              reg24 <= $signed((~|$unsigned($unsigned($signed(wire12)))));
              reg25 <= ($signed(wire13) < $signed((^~wire14)));
            end
          reg26 <= $signed($signed(($signed((reg18 + reg24)) >= reg23[(2'h3):(1'h1)])));
        end
      reg27 <= $signed($signed($signed(($signed(wire13) + reg25))));
    end
endmodule
