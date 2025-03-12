// Seed: 4028181091
module module_0 (
    id_1,
    id_2
);
  input wire id_2;
  input wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd49
);
  wire _id_1;
  wire id_2;
  wire [id_1 : -1  -  1] id_3;
  module_0 modCall_1 (
      id_3,
      id_2
  );
endmodule
module module_2;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1
  );
endmodule
module module_3 #(
    parameter id_4 = 32'd15
) (
    id_1,
    id_2,
    id_3,
    _id_4
);
  inout wire _id_4;
  output uwire id_3;
  inout reg id_2;
  output wire id_1;
  wire [id_4 : 1] id_5;
  module_0 modCall_1 (
      id_5,
      id_5
  );
  always_latch begin : LABEL_0
    id_2 = (id_3++) <-> 1;
  end
endmodule
