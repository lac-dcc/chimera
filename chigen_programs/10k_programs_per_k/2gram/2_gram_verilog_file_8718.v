// Seed: 1575917102
module module_0 (
    id_1#(
        .id_2(id_3),
        .id_4(id_5)
    ),
    id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_5;
  output tri0 id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  logic id_10;
  ;
  assign id_4 = id_8 - id_8[$realtime];
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = id_1;
  module_0 modCall_1 (
      id_4,
      id_1,
      id_1,
      id_2,
      id_1
  );
  generate
    assign id_4 = (id_3.id_3);
  endgenerate
endmodule
