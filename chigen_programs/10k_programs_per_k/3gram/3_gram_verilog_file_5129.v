// Seed: 1328999366
module module_0 (
    input uwire id_0,
    input supply0 id_1,
    output wire id_2
);
  wire id_4;
  assign module_1.id_8 = 0;
endmodule
macromodule module_1 (
    output wire id_0,
    output tri id_1,
    input tri0 id_2,
    input logic id_3,
    output supply0 id_4
    , id_12,
    output wire id_5,
    input tri id_6,
    input tri0 id_7,
    output tri id_8,
    input wor id_9,
    input tri1 id_10
);
  logic id_13;
  reg   id_14;
  module_0 modCall_1 (
      id_6,
      id_10,
      id_5
  );
  id_15(
      .id_0(id_14), .id_1(id_0), .id_2(id_13)
  );
  generate
    always @(posedge !1) id_13 = 1;
  endgenerate
  assign id_13 = id_3;
  wire id_16;
  always_latch #1 id_14 <= id_13;
  assign id_16 = 1'd0;
  always @(1) $display(id_10);
  assign id_1 = 1;
endmodule
