// Seed: 890917635
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  output wire id_4;
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  supply1 id_6;
  wire id_7;
  assign id_5 = 1;
  assign id_3 = -1;
  assign id_6.id_1 = -1;
  wire id_8;
  assign id_6 = -1'b0 + 1;
  wire id_9;
endmodule
module module_1;
  wire id_2, id_3, id_4, id_5;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4
  );
  assign modCall_1.id_6 = 0;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  not primCall (id_4, id_1);
  module_0 modCall_1 (
      id_4,
      id_3,
      id_4,
      id_4,
      id_4
  );
endmodule
