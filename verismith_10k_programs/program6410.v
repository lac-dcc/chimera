module top  (y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'hd8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire signed [(4'h8):(1'h0)] wire3;
  input wire signed [(5'h13):(1'h0)] wire2;
  input wire [(4'h9):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire signed [(4'h9):(1'h0)] wire46;
  wire [(4'ha):(1'h0)] wire40;
  wire signed [(2'h2):(1'h0)] wire37;
  wire [(4'hf):(1'h0)] wire36;
  wire signed [(4'h8):(1'h0)] wire34;
  wire signed [(4'hf):(1'h0)] wire9;
  wire [(3'h4):(1'h0)] wire8;
  wire signed [(4'hf):(1'h0)] wire7;
  wire [(4'hd):(1'h0)] wire6;
  wire signed [(3'h4):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg47 = (1'h0);
  reg [(3'h4):(1'h0)] reg45 = (1'h0);
  reg [(3'h5):(1'h0)] reg44 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg43 = (1'h0);
  reg [(4'hd):(1'h0)] reg42 = (1'h0);
  reg [(5'h15):(1'h0)] reg41 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg39 = (1'h0);
  reg [(5'h15):(1'h0)] reg38 = (1'h0);
  assign y = {wire46,
                 wire40,
                 wire37,
                 wire36,
                 wire34,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 reg47,
                 reg45,
                 reg44,
                 reg43,
                 reg42,
                 reg41,
                 reg39,
                 reg38,
                 (1'h0)};
  assign wire5 = ($unsigned((&(-(wire4 ?
                     (7'h40) : wire3)))) * ((wire0[(4'hc):(3'h7)] ?
                     $unsigned(wire4[(3'h6):(3'h6)]) : wire1[(2'h2):(1'h1)]) ^ (^(^(wire1 ?
                     wire3 : (8'ha6))))));
  assign wire6 = (!($signed((^(~^wire5))) ~^ $unsigned(((wire2 || wire2) || $signed((8'hb2))))));
  assign wire7 = wire4;
  assign wire8 = $unsigned(wire4[(3'h7):(1'h0)]);
  assign wire9 = wire2;
  module10 #() modinst35 (wire34, clk, wire3, wire0, wire6, wire4);
  assign wire36 = {$unsigned(wire2)};
  assign wire37 = $unsigned({$unsigned(wire34)});
  always
    @(posedge clk) begin
      reg38 <= {{(($signed(wire0) ^ wire7) != ((8'hab) ?
                  wire1 : (wire2 ~^ wire2)))}};
    end
  always
    @(posedge clk) begin
      reg39 <= $unsigned($signed((8'ha1)));
    end
  assign wire40 = ((^~(~|(|(wire9 ? wire36 : wire2)))) && ({$unsigned(((8'ha9) ?
                          wire6 : wire0))} >>> reg39[(5'h13):(5'h10)]));
  always
    @(posedge clk) begin
      reg41 <= reg38;
      reg42 <= wire34[(1'h1):(1'h1)];
      reg43 <= wire1[(1'h0):(1'h0)];
      reg44 <= reg38[(1'h0):(1'h0)];
      reg45 <= wire36[(4'hb):(3'h6)];
    end
  assign wire46 = $unsigned(($signed($signed((^reg43))) ?
                      wire40 : $unsigned($unsigned({wire7, reg39}))));
  always
    @(posedge clk) begin
      reg47 <= wire7;
    end
endmodule

module module10
#(parameter param32 = (^((^(((8'ha5) - (8'ha3)) ? (+(8'ha4)) : ((8'hb3) ? (8'haf) : (7'h40)))) ~^ (+{((8'ha5) ? (8'haf) : (8'hb2)), ((8'hbc) ~^ (8'hac))}))), 
parameter param33 = (({(~&{param32})} ? (~^(~(param32 << (7'h43)))) : (~((param32 ? param32 : param32) ? param32 : param32))) ? (^param32) : ((((param32 ~^ param32) ? (-param32) : (+param32)) | param32) >>> {((param32 ? param32 : param32) || (^(8'hb2)))})))
(y, clk, wire14, wire13, wire12, wire11);
  output wire [(32'he8):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'h8):(1'h0)] wire14;
  input wire signed [(4'hb):(1'h0)] wire13;
  input wire [(4'hd):(1'h0)] wire12;
  input wire signed [(3'h4):(1'h0)] wire11;
  wire [(4'hf):(1'h0)] wire31;
  wire signed [(4'hc):(1'h0)] wire30;
  wire [(4'hf):(1'h0)] wire29;
  wire [(4'h9):(1'h0)] wire28;
  wire [(4'he):(1'h0)] wire27;
  wire [(3'h6):(1'h0)] wire17;
  wire [(5'h14):(1'h0)] wire16;
  wire signed [(5'h11):(1'h0)] wire15;
  reg signed [(4'hc):(1'h0)] reg26 = (1'h0);
  reg [(5'h14):(1'h0)] reg25 = (1'h0);
  reg [(4'h9):(1'h0)] reg24 = (1'h0);
  reg [(4'he):(1'h0)] reg23 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg22 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg21 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg20 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  assign y = {wire31,
                 wire30,
                 wire29,
                 wire28,
                 wire27,
                 wire17,
                 wire16,
                 wire15,
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
  assign wire15 = ((!{{{wire14, wire13}, (wire14 ? wire11 : wire14)},
                      wire12[(1'h0):(1'h0)]}) <= (8'hb4));
  assign wire16 = ((~({(^~wire14)} >> (^(-wire15)))) <= wire11[(1'h0):(1'h0)]);
  assign wire17 = wire13;
  always
    @(posedge clk) begin
      if ($signed(($signed((&wire15)) ?
          {wire16[(5'h10):(4'hf)], wire11} : ((|$unsigned(wire15)) ?
              $unsigned($unsigned((8'hae))) : wire15[(4'hc):(4'hc)]))))
        begin
          if (wire14[(3'h5):(3'h4)])
            begin
              reg18 <= $unsigned((~&((8'haf) + (8'hae))));
              reg19 <= $unsigned(((8'ha5) ?
                  (($signed(wire13) != wire11[(3'h4):(2'h3)]) | wire13[(4'hb):(3'h6)]) : (^wire14[(3'h4):(1'h0)])));
              reg20 <= reg18[(4'h9):(1'h1)];
            end
          else
            begin
              reg18 <= ($signed(wire14[(2'h3):(2'h3)]) ?
                  (!{(|(wire12 ? reg19 : reg18))}) : (~(-((wire17 ?
                          (8'hb1) : reg20) ?
                      $unsigned(wire15) : reg20[(2'h2):(2'h2)]))));
              reg19 <= $signed($signed(reg20));
              reg20 <= (~(~|(~&$unsigned($signed(wire15)))));
              reg21 <= $signed(reg18[(1'h0):(1'h0)]);
              reg22 <= (^$signed((!({wire17, wire14} ?
                  wire17 : (reg20 ? reg20 : (8'ha7))))));
            end
          reg23 <= wire16;
          reg24 <= {{$signed((!{wire17})),
                  ($signed((wire17 ? reg18 : (8'h9c))) ^ ((reg23 <= reg19) ?
                      $signed(reg19) : wire15[(5'h11):(5'h11)]))}};
        end
      else
        begin
          reg18 <= $unsigned(reg22[(3'h7):(1'h1)]);
          reg19 <= ({{$unsigned(wire17[(3'h6):(1'h1)]),
                      $signed($unsigned(wire16))},
                  (^$signed((wire15 * reg24)))} ?
              ($unsigned(wire13) ?
                  $signed(((wire11 ? wire13 : reg20) ?
                      {(8'hb9),
                          reg22} : (wire15 << reg23))) : wire14[(2'h3):(1'h0)]) : (8'hb7));
          reg20 <= reg22;
          if (($signed((wire16 ?
              ($unsigned(reg23) ?
                  ((7'h42) ?
                      wire14 : wire12) : $unsigned(reg18)) : $signed((reg18 & wire16)))) >> (~^reg19)))
            begin
              reg21 <= {wire12, reg22[(2'h3):(1'h1)]};
              reg22 <= (!$unsigned($unsigned({(reg21 ? (8'hac) : reg19)})));
              reg23 <= (((+reg24[(3'h4):(3'h4)]) <= $signed(reg23[(4'h9):(3'h7)])) ?
                  (((^~$signed(reg23)) && ($unsigned(reg19) ?
                          (reg24 ? reg21 : reg22) : $unsigned(wire17))) ?
                      $unsigned(($signed(wire12) | (wire11 ?
                          reg23 : wire17))) : $signed(((reg19 ? reg18 : reg24) ?
                          ((8'ha3) < reg19) : reg21[(4'hb):(3'h4)]))) : wire17[(3'h4):(1'h0)]);
            end
          else
            begin
              reg21 <= reg24;
              reg22 <= (-reg24);
              reg23 <= wire12[(2'h3):(2'h3)];
            end
          reg24 <= (-wire11);
        end
      if ({(-((wire16[(5'h14):(5'h12)] + (wire12 & reg22)) > $signed(wire15[(4'hb):(4'h8)]))),
          ((^~$signed($unsigned(reg23))) <= $unsigned($signed((~&wire11))))})
        begin
          reg25 <= ($signed(reg18[(4'hb):(2'h2)]) * ($signed(reg20[(2'h2):(2'h2)]) >> {$unsigned((reg22 | (7'h43)))}));
        end
      else
        begin
          reg25 <= $signed($signed(wire16[(5'h14):(5'h14)]));
          reg26 <= ((+$signed($signed((reg18 << reg21)))) ?
              (-$signed(reg21)) : ({$unsigned((reg21 >= (8'hb5))),
                  ($signed(reg24) ?
                      wire14[(3'h5):(2'h2)] : (~&reg23))} >>> reg19));
        end
    end
  assign wire27 = $signed($signed((((reg25 >> reg24) ?
                      {wire17, reg21} : $signed(reg18)) && (|(7'h41)))));
  assign wire28 = reg23;
  assign wire29 = ((-reg20[(2'h2):(1'h0)]) <= (wire16 || $signed((~^{reg18,
                      reg26}))));
  assign wire30 = {($signed(reg26) ?
                          wire17[(1'h0):(1'h0)] : (((^wire27) >= wire14[(3'h4):(2'h2)]) >= {(reg22 <= reg24),
                              reg25})),
                      reg26[(3'h5):(3'h4)]};
  assign wire31 = reg26;
endmodule
