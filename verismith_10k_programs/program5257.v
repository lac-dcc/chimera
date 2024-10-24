module top
#(parameter param12 = ({((((7'h41) >= (8'hae)) | (-(8'haa))) ^ (((8'h9e) || (8'ha7)) ? (~|(8'h9f)) : ((8'haa) ^ (8'hb8))))} != (((~|(|(7'h42))) * (|((8'ha2) ? (7'h41) : (8'ha0)))) ? ((((8'h9e) ? (7'h40) : (8'hb3)) ^~ ((8'hb9) >>> (7'h42))) >>> ((~&(8'h9e)) & {(8'hbf), (8'haf)})) : ({((8'hba) ? (8'hb0) : (8'ha8))} != (((8'h9c) ? (8'ha5) : (8'h9e)) ? ((8'ha4) ? (8'h9e) : (7'h42)) : {(8'hb9)})))))
(y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'h8d):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire signed [(5'h15):(1'h0)] wire3;
  input wire signed [(4'h9):(1'h0)] wire2;
  input wire signed [(5'h13):(1'h0)] wire1;
  input wire signed [(4'hc):(1'h0)] wire0;
  wire [(5'h12):(1'h0)] wire11;
  wire [(5'h13):(1'h0)] wire9;
  wire signed [(5'h13):(1'h0)] wire8;
  wire signed [(5'h11):(1'h0)] wire4;
  reg [(5'h12):(1'h0)] reg10 = (1'h0);
  reg signed [(5'h12):(1'h0)] reg7 = (1'h0);
  reg signed [(4'hb):(1'h0)] reg6 = (1'h0);
  reg signed [(5'h14):(1'h0)] reg5 = (1'h0);
  assign y = {wire11, wire9, wire8, wire4, reg10, reg7, reg6, reg5, (1'h0)};
  assign wire4 = $unsigned(((8'ha0) ? wire3 : wire0));
  always
    @(posedge clk) begin
      reg5 <= $signed($unsigned($signed((8'hb4))));
      reg6 <= reg5;
      reg7 <= wire2;
    end
  assign wire8 = reg7;
  assign wire9 = (|wire2);
  always
    @(posedge clk) begin
      reg10 <= wire3[(4'he):(4'he)];
    end
  assign wire11 = (^wire1[(5'h11):(4'hf)]);
endmodule
