// Seed: 256020320
module module_0 (
    input tri0 id_0,
    input tri1 id_1,
    input tri0 id_2,
    input tri id_3,
    input uwire id_4,
    input uwire id_5,
    input wire id_6,
    input supply1 id_7,
    output tri id_8,
    input tri0 id_9,
    output supply1 id_10,
    input supply0 id_11,
    input supply1 id_12,
    input tri0 id_13,
    id_15
);
  wire id_16;
  assign module_1.id_7 = 0;
endmodule
module module_1 (
    input tri0 id_0,
    input supply1 id_1,
    output supply0 id_2,
    output wire id_3,
    output wire id_4
);
  uwire id_6, id_7;
  assign id_4 = -1'b0;
  id_8(
      {(id_7), 1'b0}, 1
  );
  module_0 modCall_1 (
      id_1,
      id_0,
      id_0,
      id_0,
      id_0,
      id_1,
      id_1,
      id_0,
      id_3,
      id_0,
      id_3,
      id_0,
      id_1,
      id_1
  );
  always $display(id_0);
  wire id_9;
endmodule
