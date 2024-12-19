// Seed: 4077973980
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_1,
      id_1,
      id_3,
      id_1,
      id_3
  );
endmodule
module module_1 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  input wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_2,
      id_1
  );
  wire id_4;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  input wire id_7;
  output wire id_6;
  inout wire id_5;
  output wire id_4;
  output wire id_3;
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  id_8 :
  assert property (@(posedge id_1) 1)
  else $display(1);
endmodule
