// Seed: 1211610696
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  inout wire id_6;
  input wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_3,
      id_6
  );
  output wire id_1;
  logic id_7;
  ;
endmodule
module module_2 #(
    parameter id_3 = 32'd14
) (
    id_1,
    id_2
);
  inout wire id_2;
  output logic [7:0] id_1;
  assign id_1[-1] = id_2;
  wire _id_3;
  module_0 modCall_1 (
      id_2,
      id_2
  );
  wire id_4;
  ;
  wire [id_3  .  sum : -1] id_5;
endmodule
