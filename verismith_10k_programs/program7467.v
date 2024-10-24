module top
#(parameter param17 = (~^((&{((8'ha8) >> (8'hb9)), ((8'h9f) ? (8'hac) : (7'h40))}) ? ((!{(8'hb4), (8'hab)}) ? (((8'haa) ^ (8'hbc)) ? (~&(8'hba)) : ((8'h9f) < (8'h9c))) : ((~|(8'hb6)) != ((8'hb3) ? (8'hbf) : (8'hb3)))) : (8'h9f))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h9d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h13):(1'h0)] wire3;
  input wire [(2'h2):(1'h0)] wire2;
  input wire signed [(5'h10):(1'h0)] wire1;
  input wire [(4'hd):(1'h0)] wire0;
  wire signed [(5'h11):(1'h0)] wire16;
  wire signed [(5'h10):(1'h0)] wire15;
  wire signed [(5'h13):(1'h0)] wire14;
  wire [(4'hb):(1'h0)] wire13;
  wire signed [(3'h4):(1'h0)] wire12;
  wire signed [(4'ha):(1'h0)] wire11;
  wire signed [(4'hc):(1'h0)] wire10;
  wire [(5'h11):(1'h0)] wire9;
  wire signed [(4'h8):(1'h0)] wire8;
  reg [(3'h5):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h10):(1'h0)] reg5 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg4 = (1'h0);
  assign y = {wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire9,
                 wire8,
                 reg7,
                 reg6,
                 reg5,
                 reg4,
                 (1'h0)};
  always
    @(posedge clk) begin
      reg4 <= ((+(((wire2 <<< wire0) ? (~wire0) : wire0) ?
              {$signed((8'haa)), $signed((8'hb2))} : $unsigned(wire0))) ?
          $unsigned((($signed(wire0) ? {wire1} : wire2[(1'h0):(1'h0)]) ?
              $signed(wire1) : $signed($signed(wire0)))) : (wire3 & (~(~^wire3))));
    end
  always
    @(posedge clk) begin
      reg5 <= wire0;
      reg6 <= (((wire2[(1'h1):(1'h0)] ?
              reg5[(4'h9):(1'h1)] : $unsigned((^reg5))) ?
          wire0 : $signed((!(wire1 >>> reg5)))) ^~ (~^((reg5 >= wire2) > wire2)));
      reg7 <= $signed(({(reg6[(4'hb):(2'h3)] >> (wire0 >= (8'h9e))),
              $unsigned((~&(8'ha5)))} ?
          {$signed(reg6[(4'ha):(2'h3)]),
              $signed((|wire3))} : {$unsigned(reg5)}));
    end
  assign wire8 = $signed(reg4);
  assign wire9 = wire2[(1'h0):(1'h0)];
  assign wire10 = $unsigned(wire8);
  assign wire11 = wire2[(1'h0):(1'h0)];
  assign wire12 = wire1[(4'hf):(4'he)];
  assign wire13 = {$signed((-(~|(wire10 && wire3)))),
                      $unsigned((((~wire1) >>> $unsigned(wire2)) ?
                          wire0 : (wire12[(3'h4):(1'h1)] < (&reg7))))};
  assign wire14 = $unsigned(wire2);
  assign wire15 = {($signed($signed((wire0 ? wire9 : wire1))) ?
                          reg7[(1'h1):(1'h1)] : $signed((~|reg4)))};
  assign wire16 = wire15[(1'h0):(1'h0)];
endmodule
