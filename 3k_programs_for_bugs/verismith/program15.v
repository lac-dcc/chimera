module top
#(parameter param19 = (((!(~((8'hab) ? (8'hb5) : (7'h40)))) || {(^~((8'ha7) ? (8'ha6) : (8'hab)))}) ? ((~^(|(~&(8'hab)))) + ((((8'hbb) ? (8'ha4) : (8'hb8)) > (8'hb9)) ^~ ({(8'haa)} ? ((7'h41) ? (8'haa) : (7'h44)) : (~(8'hb9))))) : (~^((((8'hb0) ? (8'hb7) : (8'hb2)) ? ((8'hb8) ? (8'ha3) : (8'hb1)) : {(8'hb5), (8'hbf)}) ? {((8'ha3) ? (8'hb6) : (7'h40)), ((8'ha8) ^ (7'h40))} : (((8'ha3) ? (8'ha1) : (7'h41)) || ((8'ha0) <<< (8'hb9)))))), 
parameter param20 = ((7'h43) < (^param19)))
(y, clk, wire4, wire3, wire2, wire1, wire0);
  output wire [(32'he5):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(5'h12):(1'h0)] wire4;
  input wire signed [(3'h4):(1'h0)] wire3;
  input wire signed [(2'h3):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(3'h7):(1'h0)] wire0;
  wire signed [(3'h6):(1'h0)] wire18;
  wire [(5'h14):(1'h0)] wire17;
  wire [(5'h12):(1'h0)] wire16;
  wire [(4'hf):(1'h0)] wire15;
  wire signed [(5'h12):(1'h0)] wire14;
  wire signed [(4'hf):(1'h0)] wire13;
  wire signed [(5'h11):(1'h0)] wire12;
  wire signed [(4'hd):(1'h0)] wire11;
  wire signed [(5'h13):(1'h0)] wire10;
  wire signed [(5'h14):(1'h0)] wire5;
  reg [(5'h14):(1'h0)] reg9 = (1'h0);
  reg signed [(4'hf):(1'h0)] reg8 = (1'h0);
  reg [(5'h15):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  assign y = {wire18,
                 wire17,
                 wire16,
                 wire15,
                 wire14,
                 wire13,
                 wire12,
                 wire11,
                 wire10,
                 wire5,
                 reg9,
                 reg8,
                 reg7,
                 reg6,
                 (1'h0)};
  assign wire5 = (~wire4);
  always
    @(posedge clk) begin
      reg6 <= $unsigned({$signed($unsigned($unsigned(wire2)))});
      reg7 <= wire2;
      reg8 <= (~^{(^$signed(wire0[(2'h3):(1'h1)]))});
      reg9 <= {($signed($signed($signed(reg8))) ?
              (((+(8'ha6)) ^ wire3[(1'h0):(1'h0)]) ^~ reg8) : ((-$signed(reg7)) ?
                  (wire3 ? $signed(wire2) : {wire1}) : reg8))};
    end
  assign wire10 = (($signed($unsigned((+wire5))) >= wire1[(4'h8):(4'h8)]) || (^~$signed($unsigned($unsigned(wire2)))));
  assign wire11 = $unsigned(reg7);
  assign wire12 = (!wire2);
  assign wire13 = $signed(({(~^wire5[(5'h14):(4'hd)])} && wire10));
  assign wire14 = $signed({wire11[(3'h5):(2'h2)]});
  assign wire15 = reg9[(2'h3):(2'h2)];
  assign wire16 = wire3[(2'h2):(1'h0)];
  assign wire17 = $unsigned(wire5);
  assign wire18 = wire1;
endmodule
