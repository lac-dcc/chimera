// Seed: 3604296450
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_6;
  supply0 id_7, id_8, id_9;
  supply0 id_10 = 1 + id_9(1'b0 - 1'd0, 1, !id_8, 1);
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_4;
  bufif0 primCall (id_3, id_4, id_2);
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3
  );
  assign modCall_1.id_8 = 0;
endmodule
