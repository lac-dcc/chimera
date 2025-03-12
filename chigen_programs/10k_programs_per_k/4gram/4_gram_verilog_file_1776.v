// Seed: 4030060027
module module_0 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  wire id_3;
  wire id_4;
  ;
  wire id_5;
endmodule
module module_1 (
    id_1,
    id_2
);
  output wire id_2;
  output wire id_1;
  module_0 modCall_1 (
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_4 = 32'd26
) (
    id_1,
    id_2,
    id_3,
    _id_4,
    id_5,
    id_6
);
  output wire id_6;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  inout wire id_5;
  input wire _id_4;
  output wire id_3;
  inout wire id_2;
  output logic [7:0] id_1;
  wire id_7;
  assign id_1[id_4] = (id_2);
endmodule
