module top #(parameter param18 = (8'h9e)) (y, clk, wire3, wire2, wire1, wire0);
  output wire [(32'hae):(32'h0)] y;
  input wire [(1'h0):(1'h0)] clk;
  input wire [(2'h3):(1'h0)] wire3;
  input wire [(5'h11):(1'h0)] wire2;
  input wire signed [(5'h11):(1'h0)] wire1;
  input wire [(3'h7):(1'h0)] wire0;
  wire signed [(5'h13):(1'h0)] wire16;
  wire signed [(4'hb):(1'h0)] wire10;
  wire signed [(2'h2):(1'h0)] wire9;
  wire [(5'h11):(1'h0)] wire8;
  wire [(2'h3):(1'h0)] wire7;
  wire [(5'h13):(1'h0)] wire4;
  reg [(3'h5):(1'h0)] reg17 = (1'h0);
  reg signed [(4'hc):(1'h0)] reg15 = (1'h0);
  reg signed [(5'h13):(1'h0)] reg14 = (1'h0);
  reg [(5'h11):(1'h0)] reg13 = (1'h0);
  reg [(5'h11):(1'h0)] reg12 = (1'h0);
  reg [(5'h12):(1'h0)] reg11 = (1'h0);
  reg signed [(4'h9):(1'h0)] reg6 = (1'h0);
  reg signed [(3'h5):(1'h0)] reg5 = (1'h0);
  assign y = {wire16,
                 wire10,
                 wire9,
                 wire8,
                 wire7,
                 wire4,
                 reg17,
                 reg15,
                 reg14,
                 reg13,
                 reg12,
                 reg11,
                 reg6,
                 reg5,
                 (1'h0)};
  assign wire4 = wire1[(4'hf):(4'hf)];
  always
    @(posedge clk) begin
      reg5 <= ((+($unsigned(wire1[(2'h2):(1'h0)]) ?
          (~^wire1) : (wire4[(1'h0):(1'h0)] ?
              wire3[(1'h0):(1'h0)] : (wire4 < wire3)))) && wire0);
      reg6 <= $signed(wire3);
    end
  assign wire7 = reg6;
  assign wire8 = $unsigned($signed($unsigned((-(!wire4)))));
  assign wire9 = wire3;
  assign wire10 = (({(&wire2)} ?
                          (wire8[(3'h7):(1'h0)] ?
                              (~&(-(8'hb8))) : $unsigned((wire1 ?
                                  wire8 : (8'h9d)))) : $signed(wire4[(3'h4):(1'h0)])) ?
                      wire7[(2'h3):(2'h2)] : (8'hbd));
  always
    @(posedge clk) begin
      reg11 <= wire7[(2'h2):(1'h0)];
    end
  always
    @(posedge clk) begin
      reg12 <= $signed($signed((wire3[(1'h0):(1'h0)] ?
          $unsigned((wire0 ? reg6 : wire3)) : $signed($signed(reg6)))));
      reg13 <= wire8[(4'hc):(3'h6)];
      reg14 <= ($signed((8'ha4)) ?
          {(~|(|$unsigned(wire0))),
              {(wire3[(1'h1):(1'h0)] && (-wire4)),
                  {(|wire10),
                      wire8}}} : (wire8[(5'h10):(3'h4)] || {$unsigned((|reg12))}));
    end
  always
    @(posedge clk) begin
      reg15 <= (^$signed((({wire1, reg14} ?
              (wire2 || reg5) : $unsigned(reg11)) ?
          (wire4[(3'h4):(1'h1)] || wire3) : ((reg5 && wire10) && {wire3}))));
    end
  assign wire16 = (^(~|((|(wire7 ? wire0 : wire0)) >= (&{reg5}))));
  always
    @(posedge clk) begin
      reg17 <= (8'hae);
    end
endmodule
