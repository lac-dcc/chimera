// Seed: 1587383474
module module_0 (
    id_1
);
  input wire id_1;
  wire id_2;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  inout wire id_1;
  wire id_7;
  or primCall (id_4, id_1, id_7, id_2, id_3);
  module_0 modCall_1 (id_1);
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wire id_2;
  output wire id_1;
  always force id_1 = 1'd0;
  module_0 modCall_1 (id_4);
  always
    if (1'b0) id_1 <= id_6;
    else id_1 <= 1;
endmodule
