// Seed: 1573732852
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign id_2 = 1;
  wire id_3;
  rpmos (1, id_2, id_4, id_2, id_4, id_1);
  assign module_2.id_3 = 0;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_1 = id_2;
  not primCall (id_3, id_2);
  assign id_1 = "";
  module_0 modCall_1 (
      id_3,
      id_3
  );
  wire id_5 = id_3;
  wire id_6;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  assign id_3 = 1;
  module_0 modCall_1 (
      id_3,
      id_3
  );
  wire id_5;
  wire id_6;
  timeunit 1ps;
endmodule
