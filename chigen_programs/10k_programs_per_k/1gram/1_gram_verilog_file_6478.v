// Seed: 405744822
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  input wire id_3;
  inout wire id_2;
  output uwire id_1;
  assign id_1 = -1;
  struct packed {logic id_5;} id_6;
  ;
  logic id_7, id_8;
endmodule
module module_1;
  wire id_1;
  ;
  assign id_1 = id_1;
  logic id_2;
  ;
  logic id_3;
  module_0 modCall_1 (
      id_3,
      id_2,
      id_2,
      id_1
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd17
) (
    id_1,
    id_2
);
  input logic [7:0] id_2;
  output reg id_1;
  always id_1 = id_2;
  wire _id_3;
  wire id_4, id_5[-1 : id_3];
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4
  );
  always repeat (id_3) id_1 = {id_5{id_2[1 : 1]}};
  assign id_3 = id_5;
  always #1 $signed(id_3);
  ;
endmodule
