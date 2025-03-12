// Seed: 288270334
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  assign module_2.id_7 = 0;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
endmodule
module module_1 (
    id_1,
    id_2
);
  inout wire id_2;
  not primCall (id_1, id_2);
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_2,
      id_1,
      id_2,
      id_2,
      id_2
  );
  logic id_3;
endmodule
module module_2 #(
    parameter id_3 = 32'd57,
    parameter id_5 = 32'd73
) (
    input wand id_0,
    input supply0 id_1,
    input supply0 id_2,
    input wand _id_3,
    input uwire id_4,
    input wire _id_5
);
  generate
    struct packed {
      logic id_7;
      logic [id_3 : id_5] id_8;
    } [-1 : id_5] id_9 = -1 == 1;
  endgenerate
  module_0 modCall_1 (
      id_7,
      id_8,
      id_9,
      id_7,
      id_8,
      id_8
  );
endmodule
