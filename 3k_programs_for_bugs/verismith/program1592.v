module top
#(parameter param40 = ((((((8'hb9) ? (8'hbc) : (8'hba)) ^~ {(7'h41), (8'ha4)}) ? (((8'hbd) | (7'h42)) < (&(8'h9c))) : (~|(!(8'hb9)))) ? ((((7'h40) ? (8'ha2) : (8'hbf)) * ((8'hae) && (8'had))) >= {(~&(8'hbd)), (|(8'ha6))}) : {(^((8'ha2) ? (8'hbd) : (8'hab))), {((8'hb7) > (8'haa))}}) ? ({((^(8'hbe)) || {(8'h9f), (8'hae)}), ({(8'hb9)} ? (!(8'ha1)) : ((8'ha9) ? (8'ha9) : (8'hb7)))} ? ((((8'h9d) * (8'hba)) ? ((8'ha0) ? (8'hb6) : (8'ha7)) : (8'hb6)) ? ((~&(8'ha7)) && (^~(8'ha0))) : (((8'hac) ^ (8'h9e)) << ((8'h9c) ? (7'h44) : (7'h43)))) : ((((8'hb8) && (8'haf)) < ((8'hab) ^ (8'hb4))) ^ ({(8'ha3)} != (^(7'h40))))) : (8'hbf)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'h41):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hc):(1'h0)] wire4;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(5'h14):(1'h0)] wire2;
  input wire [(5'h14):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire signed [(3'h4):(1'h0)] wire39;
  wire [(4'hf):(1'h0)] wire37;
  wire [(3'h6):(1'h0)] wire36;
  wire signed [(4'hc):(1'h0)] wire32;
  reg signed [(3'h5):(1'h0)] reg38 = (1'h0);
  reg signed [(4'he):(1'h0)] reg35 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg34 = (1'h0);
  assign y = {wire39, wire37, wire36, wire32, reg38, reg35, reg34, (1'h0)};
  module5 #() modinst33 (.wire6(wire2), .wire9(wire1), .y(wire32), .clk(clk), .wire8(wire4), .wire7(wire0));
  always
    @(posedge clk) begin
      reg34 <= $signed((&(((&wire0) < (wire0 ? wire1 : wire3)) ?
          {(wire4 && wire1),
              ((7'h44) ? wire1 : wire3)} : wire4[(1'h0):(1'h0)])));
      reg35 <= (wire32 ? $unsigned((8'hae)) : (8'ha6));
    end
  assign wire36 = $signed(({reg34, wire1} ?
                      (~&$unsigned(reg35)) : ((!wire32[(3'h6):(2'h2)]) > (8'h9d))));
  assign wire37 = $signed(($unsigned($signed((wire3 ?
                      reg35 : wire3))) ^~ (reg35 != (wire3[(4'h8):(1'h0)] << (wire36 >> (8'hb2))))));
  always
    @(posedge clk) begin
      reg38 <= $unsigned({((wire32[(2'h3):(2'h3)] ?
                  ((8'h9f) ? wire36 : reg35) : (8'hb8)) ?
              (wire3[(4'hd):(3'h4)] ?
                  wire1 : $unsigned((8'haa))) : $unsigned(wire37)),
          wire0});
    end
  assign wire39 = {wire3};
endmodule

module module5
#(parameter param31 = ((7'h44) <= ((((8'ha6) >> (~^(8'ha9))) ? (((8'hae) ? (8'haf) : (8'hbc)) << (~^(8'hb9))) : (((8'ha5) ? (8'hb6) : (8'ha7)) <<< (+(7'h40)))) & ((((8'hb4) ? (8'haf) : (8'hb5)) ? ((8'h9d) + (7'h44)) : ((8'haa) ~^ (8'hb4))) ? {((8'hb3) | (8'hbe))} : (((8'ha2) > (8'hb4)) ? ((8'hb5) * (7'h44)) : (~^(8'hac)))))))
(y, clk, wire9, wire8, wire7, wire6);
  output wire [(32'heb):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(4'he):(1'h0)] wire9;
  input wire [(4'hc):(1'h0)] wire8;
  input wire signed [(2'h3):(1'h0)] wire7;
  input wire signed [(5'h14):(1'h0)] wire6;
  wire signed [(5'h10):(1'h0)] wire16;
  wire [(2'h2):(1'h0)] wire15;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(4'he):(1'h0)] wire11;
  wire [(4'hc):(1'h0)] wire10;
  reg signed [(5'h13):(1'h0)] reg30 = (1'h0);
  reg signed [(5'h11):(1'h0)] reg29 = (1'h0);
  reg [(4'hd):(1'h0)] reg28 = (1'h0);
  reg signed [(2'h3):(1'h0)] reg27 = (1'h0);
  reg [(4'hf):(1'h0)] reg26 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg25 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg24 = (1'h0);
  reg signed [(3'h4):(1'h0)] reg23 = (1'h0);
  reg [(3'h7):(1'h0)] reg22 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg21 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg signed [(4'he):(1'h0)] reg18 = (1'h0);
  reg signed [(5'h15):(1'h0)] reg17 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
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
                 reg17,
                 (1'h0)};
  assign wire10 = wire6[(4'hc):(4'h9)];
  assign wire11 = $signed(((wire9[(2'h2):(1'h0)] ?
                          wire7 : $signed(wire9[(3'h5):(3'h4)])) ?
                      (~|$signed((wire10 ?
                          (8'hb8) : wire8))) : (|{$unsigned(wire10)})));
  assign wire12 = wire7;
  assign wire13 = $signed(wire11);
  assign wire14 = wire13;
  assign wire15 = wire12;
  assign wire16 = (|{((wire9 ? wire12 : (wire7 ? wire15 : wire11)) ?
                          (wire12 << ((8'h9c) ? wire9 : wire7)) : {(wire9 ?
                                  wire11 : wire11)})});
  always
    @(posedge clk) begin
      if (((((wire11[(4'ha):(1'h1)] ? (+wire8) : $signed(wire13)) ?
                  $unsigned($unsigned(wire16)) : (~&wire10)) ?
              wire7 : (~|($signed(wire16) * {wire9}))) ?
          {$signed(($signed(wire9) < (wire6 ? wire10 : wire6))),
              {{(wire15 << wire7), $signed(wire8)},
                  $signed($signed((8'had)))}} : ((^~$signed($unsigned((8'hb5)))) ?
              wire6[(4'he):(1'h0)] : $unsigned(wire6))))
        begin
          if ({$signed(wire13[(3'h6):(1'h1)]), wire13[(1'h0):(1'h0)]})
            begin
              reg17 <= ($signed((wire16[(3'h5):(2'h2)] == (wire11 ?
                  wire8 : ((8'hbe) <= wire9)))) < wire11);
            end
          else
            begin
              reg17 <= wire6;
              reg18 <= wire8;
              reg19 <= (8'hbd);
            end
          reg20 <= ($unsigned({$unsigned($signed(reg18))}) ?
              ({reg17} ?
                  wire16 : ($signed($unsigned((8'hae))) ?
                      ($signed((8'ha9)) + wire8[(4'h9):(3'h5)]) : reg17)) : (wire6 == (^~(&wire15[(1'h1):(1'h0)]))));
          reg21 <= $signed(reg17[(5'h15):(4'hf)]);
          if (reg21)
            begin
              reg22 <= wire13;
              reg23 <= (!({reg18} ?
                  ($unsigned({wire9}) & (8'h9e)) : (wire10[(2'h3):(2'h2)] ?
                      ((wire10 * reg19) != $unsigned(wire12)) : reg20)));
            end
          else
            begin
              reg22 <= (reg19[(5'h14):(4'h8)] ?
                  $unsigned(wire10) : ({reg21} ? wire8 : reg17[(1'h1):(1'h0)]));
              reg23 <= reg20;
              reg24 <= $signed(wire11);
              reg25 <= (!$signed((reg23 | reg23)));
              reg26 <= reg18[(4'h9):(3'h6)];
            end
          if (((7'h43) == wire10[(2'h2):(1'h1)]))
            begin
              reg27 <= (reg24 >>> {(~reg18), {$unsigned((!(8'h9f))), (8'hbb)}});
            end
          else
            begin
              reg27 <= ($signed($signed($unsigned((&wire16)))) ^ wire14[(4'h8):(1'h0)]);
              reg28 <= $unsigned(((((reg27 ?
                  reg18 : wire13) ^ reg25[(3'h5):(3'h4)]) - $unsigned(reg23[(1'h0):(1'h0)])) ~^ ((8'ha8) ?
                  (((8'h9f) | (8'hb6)) > (wire7 ?
                      wire10 : wire7)) : (-(+reg24)))));
              reg29 <= {$unsigned((8'hb5))};
            end
        end
      else
        begin
          if ((reg21[(3'h5):(3'h5)] ?
              (~|{((8'hbe) ?
                      (reg25 >> reg25) : (~&reg27))}) : $signed($unsigned($unsigned((reg27 || wire15))))))
            begin
              reg17 <= ((wire9 ?
                  (wire13[(1'h1):(1'h0)] ?
                      wire7[(1'h1):(1'h1)] : reg29[(5'h10):(3'h5)]) : $signed($unsigned($unsigned((8'ha4))))) && ($signed(reg26) != ($unsigned(wire15) ?
                  $signed((wire16 == (8'h9c))) : (~&(reg21 & reg19)))));
              reg18 <= (((7'h42) ?
                      $unsigned($signed(reg18[(1'h0):(1'h0)])) : reg21[(1'h1):(1'h1)]) ?
                  (~$unsigned(wire6[(4'h9):(1'h0)])) : ($signed(reg18) ~^ (wire12 ?
                      reg17[(4'he):(1'h1)] : wire7[(1'h0):(1'h0)])));
              reg19 <= ((+reg18) ?
                  reg21 : (reg19[(4'h8):(3'h5)] ?
                      $signed($unsigned((wire6 + (8'hb8)))) : ((reg18 ?
                              reg22 : (reg28 + (8'ha0))) ?
                          (^~reg25) : wire15[(2'h2):(1'h1)])));
              reg20 <= (-$unsigned((reg25 << $unsigned((wire14 ?
                  wire12 : wire13)))));
              reg21 <= $unsigned(wire14[(3'h7):(2'h2)]);
            end
          else
            begin
              reg17 <= wire6[(3'h6):(2'h2)];
            end
          reg22 <= reg26;
        end
      reg30 <= reg19[(3'h7):(1'h1)];
    end
endmodule
