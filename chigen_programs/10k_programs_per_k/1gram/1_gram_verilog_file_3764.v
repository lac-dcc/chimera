// Seed: 1102402698
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  output wire id_5;
  inout wire id_4;
  output wire id_3;
  inout wire id_2;
  input wire id_1;
endmodule
module module_1;
  wire id_1, id_2;
  module_0 modCall_1 (
      id_2,
      id_1,
      id_1,
      id_2,
      id_2
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd40
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  not primCall (id_3, id_2);
  inout wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_2,
      id_3
  );
  output wire id_1;
  wire [id_4 : id_4] id_5, id_6;
endmodule
