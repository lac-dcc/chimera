module top
#(parameter param26 = ((((((7'h44) ? (8'hbf) : (8'ha8)) >>> (&(8'h9e))) ? (((7'h42) << (8'hb9)) ? (+(7'h40)) : {(8'h9c), (8'hb2)}) : (~&((7'h40) >>> (8'hbf)))) <<< ({(~^(8'hb8)), (~(8'hb5))} >= (~|(+(8'hb7))))) ? {{((^~(8'hbd)) && ((8'hb4) < (8'haf)))}} : ((({(8'ha0), (7'h40)} ? (^(8'hb3)) : (~^(8'hb7))) ? ((+(8'ha3)) ? {(8'h9f), (8'hbb)} : ((8'ha6) ? (8'hb5) : (8'ha9))) : (((8'hba) ? (8'hb0) : (8'haa)) ? (!(8'hb5)) : ((8'ha1) ? (8'haf) : (8'hb5)))) ? ((((7'h41) != (8'hae)) ? ((8'hb5) ? (8'h9d) : (7'h42)) : {(8'hb3)}) ? (|((8'hb1) ? (8'ha3) : (8'h9c))) : {((8'hb1) ? (8'hb2) : (8'hae)), {(8'hb8)}}) : ((!((8'hb6) ? (8'ha1) : (8'ha8))) << (((8'hb2) ? (8'hae) : (8'ha8)) ? {(8'h9e), (8'hbe)} : ((8'hba) | (8'hbf)))))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hf7):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(3'h6):(1'h0)] wire3;
  input wire [(5'h10):(1'h0)] wire2;
  input wire signed [(3'h4):(1'h0)] wire1;
  input wire [(5'h14):(1'h0)] wire0;
  wire [(3'h4):(1'h0)] wire25;
  wire [(3'h4):(1'h0)] wire15;
  wire signed [(4'ha):(1'h0)] wire14;
  wire [(4'h8):(1'h0)] wire13;
  wire signed [(5'h10):(1'h0)] wire12;
  wire signed [(5'h12):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire signed [(4'hd):(1'h0)] wire9;
  wire signed [(5'h14):(1'h0)] wire8;
  wire signed [(5'h12):(1'h0)] wire7;
  wire [(4'hb):(1'h0)] wire5;
  wire signed [(4'hc):(1'h0)] wire4;
  reg signed [(5'h15):(1'h0)] reg24 = (1'h0);
  reg signed [(4'hd):(1'h0)] reg23 = (1'h0);
  reg [(3'h5):(1'h0)] reg22 = (1'h0);
  reg [(3'h6):(1'h0)] reg21 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg20 = (1'h0);
  reg signed [(4'h8):(1'h0)] reg19 = (1'h0);
  reg [(2'h2):(1'h0)] reg18 = (1'h0);
  reg [(3'h6):(1'h0)] reg17 = (1'h0);
  reg [(3'h7):(1'h0)] reg16 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg6 = (1'h0);
  assign y = {wire25,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire5,
                 wire4,
                 reg24,
                 reg23,
                 reg22,
                 reg21,
                 reg20,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg6,
                 (1'h0)};
  assign wire4 = ($signed((8'ha1)) ?
                     (((wire1[(2'h3):(1'h1)] || wire3) <<< {$signed(wire1)}) ?
                         {({wire3} + wire1[(1'h1):(1'h0)])} : $unsigned((!$unsigned(wire0)))) : (~(&(7'h44))));
  assign wire5 = (wire1 <= wire2);
  always
    @(posedge clk) begin
      reg6 <= ((~^wire2) <<< wire0[(3'h6):(3'h5)]);
    end
  assign wire7 = ($unsigned(($unsigned($signed((8'hae))) && $unsigned(wire5[(4'hb):(3'h6)]))) << $signed(((^(wire4 ?
                         (8'hbb) : wire1)) ?
                     wire0[(5'h13):(4'hd)] : $signed($unsigned(wire2)))));
  assign wire8 = {$signed((+({wire0} < $unsigned(wire0)))), wire3};
  assign wire9 = wire1[(1'h1):(1'h1)];
  assign wire10 = ((((((8'hbd) ? wire1 : wire3) <= ((8'hab) ? wire8 : wire1)) ?
                      wire7[(3'h5):(1'h1)] : wire9[(4'h9):(2'h2)]) - ((^{wire2}) + wire0[(5'h14):(5'h13)])) * (wire1 != wire1));
  assign wire11 = {wire9};
  assign wire12 = wire3[(2'h2):(2'h2)];
  assign wire13 = (7'h40);
  assign wire14 = (($unsigned((8'ha3)) | wire1) << ($signed($signed($signed(wire10))) ?
                      wire1[(3'h4):(3'h4)] : $signed(wire0[(3'h7):(2'h3)])));
  assign wire15 = $unsigned((wire13 < $unsigned($unsigned({(8'had)}))));
  always
    @(posedge clk) begin
      if (wire12)
        begin
          reg16 <= wire5;
          if ((wire1 ^ (((^wire15[(3'h4):(1'h1)]) != $unsigned((~^reg6))) ~^ ((wire5[(3'h7):(1'h0)] > (8'hbf)) ^~ $signed($signed(wire12))))))
            begin
              reg17 <= $unsigned($signed(wire5[(4'ha):(1'h0)]));
              reg18 <= (!$unsigned((&(&(reg6 ? wire11 : (8'hbb))))));
              reg19 <= reg6;
              reg20 <= (wire15 ?
                  wire2[(3'h5):(2'h2)] : ((&(~^$signed(wire10))) ?
                      {wire1,
                          (wire1[(3'h4):(1'h1)] ?
                              (wire12 ~^ reg18) : (wire4 <<< (8'hbc)))} : $unsigned($signed((wire2 ?
                          (8'hbc) : wire15)))));
              reg21 <= ($unsigned($unsigned((wire11[(1'h1):(1'h1)] >= reg19))) ?
                  wire9[(4'hd):(4'hd)] : wire14[(2'h3):(1'h0)]);
            end
          else
            begin
              reg17 <= reg21[(3'h4):(2'h2)];
              reg18 <= ({$unsigned((reg19[(3'h4):(3'h4)] && wire11)),
                  $unsigned(wire10)} >> wire10[(4'hc):(2'h2)]);
            end
          reg22 <= (({$signed(((8'h9e) ~^ reg18))} ?
              (-wire3) : {{wire15, (~|wire8)},
                  $signed(reg18)}) || $signed((|wire1)));
          reg23 <= (+$unsigned(reg22));
        end
      else
        begin
          reg16 <= wire15[(2'h2):(1'h1)];
          reg17 <= wire11[(4'hf):(4'hf)];
          if ((wire0[(4'ha):(2'h3)] ^~ ({$signed(wire10[(4'h9):(3'h7)]),
                  $signed($unsigned(wire8))} ?
              $unsigned((~&(wire15 ?
                  wire15 : wire0))) : (^~wire2[(3'h6):(2'h3)]))))
            begin
              reg18 <= (((~^wire2) ?
                  reg21[(3'h4):(3'h4)] : wire12) <= {(((wire0 ?
                          wire4 : wire10) * (~|reg16)) ?
                      ($signed((8'hb7)) >>> wire9[(3'h4):(3'h4)]) : $unsigned((wire10 < wire13))),
                  wire1});
            end
          else
            begin
              reg18 <= ($signed((-$unsigned(wire2[(3'h4):(3'h4)]))) ?
                  wire5 : $unsigned(((!(8'hbd)) != (wire7 >>> {reg16,
                      wire11}))));
            end
          reg19 <= reg22[(2'h2):(2'h2)];
          reg20 <= {wire11, $unsigned((~|wire8[(4'hb):(4'ha)]))};
        end
      reg24 <= ($signed(($signed(wire4[(2'h3):(2'h2)]) == wire7[(4'ha):(4'h9)])) ?
          {reg19[(3'h5):(2'h3)],
              ({$unsigned(wire10), $unsigned(wire9)} ?
                  (!$unsigned(wire7)) : (!reg18))} : reg18[(2'h2):(2'h2)]);
    end
  assign wire25 = $signed(wire11[(4'h8):(3'h5)]);
endmodule
