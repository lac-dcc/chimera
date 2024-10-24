module top
#(parameter param22 = {((&(((7'h40) ? (8'ha6) : (8'hbf)) + ((8'hbc) ? (8'ha1) : (8'had)))) >= ((((8'h9c) || (8'hba)) ? ((8'hbb) ? (8'haa) : (8'had)) : ((7'h42) * (7'h40))) & {((8'hb3) ? (8'hba) : (8'hbc)), (+(8'hba))}))}, 
parameter param23 = param22)
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hda):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(4'hf):(1'h0)] wire3;
  input wire signed [(3'h5):(1'h0)] wire2;
  input wire signed [(5'h15):(1'h0)] wire1;
  input wire signed [(2'h3):(1'h0)] wire0;
  wire signed [(4'he):(1'h0)] wire21;
  wire signed [(2'h3):(1'h0)] wire20;
  wire signed [(4'hc):(1'h0)] wire14;
  wire [(4'hc):(1'h0)] wire13;
  wire [(5'h14):(1'h0)] wire12;
  wire [(5'h10):(1'h0)] wire11;
  wire [(4'hd):(1'h0)] wire10;
  wire signed [(3'h5):(1'h0)] wire9;
  wire [(4'h9):(1'h0)] wire8;
  wire signed [(5'h13):(1'h0)] wire7;
  wire signed [(5'h14):(1'h0)] wire6;
  wire [(2'h2):(1'h0)] wire5;
  wire [(5'h14):(1'h0)] wire4;
  reg signed [(2'h3):(1'h0)] reg19 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg18 = (1'h0);
  reg signed [(2'h2):(1'h0)] reg17 = (1'h0);
  reg [(5'h14):(1'h0)] reg16 = (1'h0);
  reg [(5'h12):(1'h0)] reg15 = (1'h0);
  assign y = {wire21,
                 wire20,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire6,
                 wire5,
                 wire4,
                 reg19,
                 reg18,
                 reg17,
                 reg16,
                 reg15,
                 (1'h0)};
  assign wire4 = (((!{wire2[(2'h2):(1'h1)],
                     $unsigned((8'h9d))}) + (wire2[(3'h5):(3'h5)] ?
                     $unsigned(wire1[(1'h0):(1'h0)]) : {$unsigned(wire0),
                         (~wire1)})) ~^ {$signed(wire3), wire1});
  assign wire5 = wire3;
  assign wire6 = wire5[(1'h1):(1'h0)];
  assign wire7 = wire4[(4'hd):(1'h0)];
  assign wire8 = (~|$signed($unsigned(wire2)));
  assign wire9 = $signed(wire7[(5'h10):(3'h5)]);
  assign wire10 = wire9;
  assign wire11 = ($unsigned(({$unsigned((8'hbe)),
                      wire6[(3'h4):(3'h4)]} < ($signed(wire3) ~^ (-wire2)))) ^~ (+(((wire0 ?
                          (8'h9c) : (8'hb4)) ?
                      (|wire7) : wire4[(3'h5):(3'h5)]) < wire9)));
  assign wire12 = (-(($unsigned(wire3) != (^~((8'hb4) > wire7))) >>> $signed(wire7)));
  assign wire13 = $unsigned((+$signed(({wire5} ?
                      (~|wire4) : (wire10 && wire7)))));
  assign wire14 = {$unsigned(wire4[(5'h13):(4'h9)]),
                      $unsigned((~$unsigned($unsigned((8'haa)))))};
  always
    @(posedge clk) begin
      if ($unsigned(wire7[(4'hb):(3'h5)]))
        begin
          reg15 <= (wire6[(1'h0):(1'h0)] ?
              ($signed(wire6) <<< {{(wire2 ? wire7 : wire9)},
                  ((-wire12) != (~|wire8))}) : {$signed((wire11[(4'he):(3'h5)] ?
                      $unsigned((7'h41)) : (wire7 ? (7'h43) : wire13)))});
          if (((+$signed(wire2)) ? {$unsigned(wire0[(1'h0):(1'h0)])} : wire13))
            begin
              reg16 <= $signed(wire3[(4'hc):(3'h6)]);
              reg17 <= $signed((~|(^~$signed(wire14))));
              reg18 <= (($signed($unsigned((wire4 != wire13))) ?
                      wire12[(5'h12):(1'h0)] : wire9[(2'h3):(2'h3)]) ?
                  (-(((-reg17) ^ wire2[(2'h3):(1'h1)]) > $signed((|wire0)))) : wire9);
              reg19 <= reg17[(2'h2):(1'h0)];
            end
          else
            begin
              reg16 <= $signed(($signed((~^wire10)) | (reg16[(4'ha):(3'h4)] ?
                  wire10 : $signed((|wire4)))));
            end
        end
      else
        begin
          reg15 <= ((!((reg18 ? (wire8 ? wire3 : wire1) : {reg17, wire2}) ?
                  $signed($signed(wire14)) : (~$signed(wire14)))) ?
              (|wire11) : (^$signed((8'hb9))));
          reg16 <= (-(reg17 >>> wire3[(3'h4):(1'h1)]));
        end
    end
  assign wire20 = (reg17 <= ($unsigned(wire1) ^~ ((-(wire9 >>> (8'hb3))) || (-((8'hbd) ?
                      (8'hb7) : wire10)))));
  assign wire21 = wire6;
endmodule
