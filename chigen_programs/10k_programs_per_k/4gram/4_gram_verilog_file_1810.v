// Seed: 1608478868
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_2 = 1;
  generate
    always begin
      $display(1, id_3, 1);
    end
  endgenerate
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13,
    id_14
);
  inout wire id_14;
  input wire id_13;
  input wire id_12;
  input wire id_11;
  inout wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  assign id_10 = id_6++ ? 1'b0 : 1;
  nand (id_4, id_12, id_15, id_13, id_9, id_7, id_3, id_10, id_5, id_11, id_8, id_14, id_2, id_6);
  id_15(
      .id_0(id_10), .id_1(), .id_2(id_5)
  ); module_0(
      id_8, id_6, id_9
  );
endmodule
