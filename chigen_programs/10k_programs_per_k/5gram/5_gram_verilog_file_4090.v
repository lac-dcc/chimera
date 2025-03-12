// Seed: 1747254451
module module_0 (
    input uwire id_0,
    output tri0 id_1,
    output supply1 id_2
);
  wire id_4;
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input uwire id_0,
    input tri0 id_1,
    input supply1 id_2,
    output supply0 id_3
);
  assign id_3 = id_2;
  module_0 modCall_1 (
      id_2,
      id_3,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  output wire id_12;
  inout wire id_11;
  input wire id_10;
  output wire id_9;
  output wire id_8;
  output wire id_7;
  input wire id_6;
  output wire id_5;
  inout wire id_4;
  input wire id_3;
  inout uwire id_2;
  input wire id_1;
  initial $clog2(13);
  ;
  assign id_2 = 1;
endmodule
module module_3 #(
    parameter id_1 = 32'd81,
    parameter id_2 = 32'd14
) (
    _id_1,
    _id_2,
    id_3
);
  inout wire id_3;
  module_2 modCall_1 (
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3,
      id_3
  );
  inout wire _id_2;
  input wire _id_1;
  localparam id_4 = -1 != {-1 != 1, -1};
  struct packed {
    logic [id_2 : 1] id_5;
    logic [1 : 1] id_6;
  } [-1 : (  id_1  <  -1 'b0 )  **  -1]
      id_7 = id_1, id_8;
endmodule
