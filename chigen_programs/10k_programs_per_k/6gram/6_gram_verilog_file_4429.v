// Seed: 2937744886
module module_0;
  wire id_1;
  reg  id_2;
  assign id_1 = !id_2;
  wire id_3;
  wire id_4;
  always @(*) id_2 <= 1'h0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  always #1 begin
    id_2 = 1;
    id_4 <= 1;
    if (id_6 & 1) begin
      id_2 <= 1'b0;
    end else begin
      $display(1, 1);
      if (id_1[1'd0 : 1]) id_2 <= id_5;
    end
  end
  module_0();
endmodule
