module top
#(parameter param28 = ((({((7'h40) ? (8'ha2) : (8'hb1))} ? (((7'h43) ? (8'ha0) : (8'ha7)) < (7'h43)) : {{(7'h42)}}) ? ({((8'hb2) - (8'hbc))} ? ({(8'hac)} ? {(8'hbb)} : ((8'h9e) == (8'hb9))) : ({(7'h40)} ? ((8'ha0) || (8'hb7)) : {(8'hba)})) : {({(8'hba)} ? ((8'ha7) <<< (8'haf)) : (8'hbb)), (((8'ha8) >= (8'h9e)) - ((8'hbb) && (8'ha8)))}) << (~|((-((8'hb0) ? (7'h43) : (8'hb3))) ? (+((8'hbe) ? (8'hbe) : (8'ha3))) : (8'had)))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'he9):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h7):(1'h0)] wire3;
  input wire [(4'hc):(1'h0)] wire2;
  input wire signed [(4'ha):(1'h0)] wire1;
  input wire signed [(5'h12):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire27;
  wire signed [(4'hc):(1'h0)] wire24;
  wire [(3'h6):(1'h0)] wire23;
  wire [(3'h5):(1'h0)] wire22;
  wire signed [(4'he):(1'h0)] wire12;
  wire signed [(4'hb):(1'h0)] wire11;
  wire signed [(3'h5):(1'h0)] wire10;
  wire [(5'h10):(1'h0)] wire9;
  wire [(4'he):(1'h0)] wire8;
  wire signed [(2'h3):(1'h0)] wire7;
  reg [(3'h7):(1'h0)] reg26 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg25 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg21 = (1'h0);
  reg [(4'ha):(1'h0)] reg20 = (1'h0);
  reg [(5'h15):(1'h0)] reg19 = (1'h0);
  reg [(4'hc):(1'h0)] reg18 = (1'h0);
  reg [(5'h12):(1'h0)] reg17 = (1'h0);
  reg [(5'h12):(1'h0)] reg16 = (1'h0);
  reg [(2'h3):(1'h0)] reg15 = (1'h0);
  reg [(4'he):(1'h0)] reg14 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg13 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg6 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg5 = (1'h0);
  reg [(3'h4):(1'h0)] reg4 = (1'h0);
  assign y = {wire27,
                 wire24,
                 wire23,
                 wire22,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 reg26,
                 reg25,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 reg14,
                 reg13,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= wire3[(3'h6):(2'h3)];
      reg5 <= (+reg4[(3'h4):(1'h0)]);
      reg6 <= $signed(reg4);
    end
  assign wire7 = wire1;
  assign wire8 = (8'hb7);
  assign wire9 = (^~(wire8[(3'h4):(1'h0)] && $signed($unsigned($unsigned(reg4)))));
  assign wire10 = wire7[(2'h3):(2'h2)];
  assign wire11 = (&(reg4 < (~&wire2)));
  assign wire12 = ($unsigned((-wire7[(2'h2):(2'h2)])) && reg4[(2'h3):(1'h1)]);
  always
    @(posedge clk) begin
      if (((!($unsigned((^wire2)) ?
              $signed((wire9 & wire12)) : (wire10[(3'h5):(1'h0)] ?
                  (8'hbf) : reg4))) ?
          $signed(reg5) : wire7))
        begin
          reg13 <= ($signed((($unsigned(wire1) && (wire3 || reg6)) <= $unsigned((wire3 - wire3)))) ?
              (~^(!(+(reg6 ?
                  wire3 : reg5)))) : ($unsigned(wire1[(1'h0):(1'h0)]) ?
                  ($unsigned((wire12 ?
                      wire2 : reg5)) - $signed(wire1)) : (!(8'hb0))));
          reg14 <= reg4[(2'h2):(1'h0)];
          reg15 <= ($signed({wire9, (~&$signed(wire7))}) ?
              ((^$signed(reg14)) - wire3) : (^$unsigned(wire1[(4'h9):(1'h1)])));
        end
      else
        begin
          reg13 <= ((wire9 <<< wire10) ^ (reg6[(1'h0):(1'h0)] >> $unsigned(wire1)));
          reg14 <= wire11;
          if (wire1)
            begin
              reg15 <= {wire8, (!$signed((8'haf)))};
              reg16 <= $signed($unsigned($signed(wire2[(4'hc):(4'h8)])));
              reg17 <= (!$unsigned((wire2[(3'h6):(3'h4)] ?
                  $unsigned(wire10[(3'h5):(2'h3)]) : (wire7[(2'h2):(1'h0)] * $unsigned(reg6)))));
            end
          else
            begin
              reg15 <= $unsigned($signed(((wire12[(4'hc):(3'h4)] ?
                  wire7 : $unsigned(wire2)) ^~ (((8'ha2) ? wire1 : reg14) ?
                  (~^reg5) : (&reg17)))));
              reg16 <= reg17;
            end
          reg18 <= reg14;
          if ($unsigned(wire8))
            begin
              reg19 <= (+$unsigned(wire11));
              reg20 <= (!wire11);
              reg21 <= ((&reg16[(4'hc):(3'h5)]) ?
                  $signed(reg19[(4'h9):(3'h6)]) : wire7[(1'h0):(1'h0)]);
            end
          else
            begin
              reg19 <= reg18;
              reg20 <= (~&$unsigned($unsigned(reg14)));
            end
        end
    end
  assign wire22 = ($unsigned($signed({(8'hb2), $signed(reg21)})) ?
                      (wire8 ?
                          wire11 : (|$unsigned($signed(wire12)))) : {$unsigned($unsigned((reg5 || (7'h42)))),
                          ($signed((wire12 ? reg16 : reg17)) ?
                              (reg17 ?
                                  reg19 : ((8'hb0) ?
                                      reg17 : wire7)) : reg21[(2'h3):(2'h3)])});
  assign wire23 = reg19;
  assign wire24 = (^(+(wire3 ~^ (reg13[(2'h2):(1'h0)] >>> (wire1 ?
                      (8'hb7) : reg5)))));
  always
    @(posedge clk) begin
      reg25 <= $signed($signed(wire0));
      reg26 <= reg14;
    end
  assign wire27 = (~|(^~wire2[(3'h6):(2'h2)]));
endmodule
