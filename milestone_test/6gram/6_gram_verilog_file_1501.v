// Seed: 3833375952
`timescale 1 ps / 1ps
module module_0 #(
    parameter id_1 = 32'd69,
    parameter id_2 = 32'd67
) (
    _id_1,
    _id_2
);
  output _id_2;
  input _id_1;
  assign id_1[id_1] = id_1[id_1 : 1];
  genvar id_3;
  assign id_2 = id_3;
  assign id_3[id_2[id_1]] = 1;
  assign id_2 = 1'b0;
  initial begin
    id_1 = 1'b0;
    id_2 = 1'd0;
  end
  always #(1) begin
    if (id_1) begin
      if (id_2) begin
        id_3 <= !id_3;
        for (id_2 = 1'b0; 1; id_2 = 1)
        @(posedge 1) begin
          id_1 <= 1 | id_1;
        end
      end
    end
  end
  assign id_3 = 'b0;
  always @(posedge "") begin
    id_3 <= 1 - ~id_1;
    id_1 = id_1;
  end
  logic id_4;
  type_0 id_5 (
      .id_0(id_2),
      .id_1(id_3),
      .id_2(id_1),
      .id_3(id_3),
      .id_4(1),
      .id_5(id_3),
      .id_6(1),
      .id_7(id_2),
      .id_8(1'b0)
  );
  logic id_6;
endmodule
