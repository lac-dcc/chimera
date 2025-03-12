// Seed: 383407860
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  output wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  assign module_1.id_1 = 0;
  input wire id_2;
  inout wire id_1;
  wire id_8;
  wire id_9;
endmodule
module module_1 #(
    parameter id_0 = 32'd21
) (
    input  uwire _id_0,
    output uwire id_1,
    output uwire id_2
);
  assign id_1 = id_0;
  assign id_2 = id_0;
  wire id_4;
  ;
  wire [id_0 : id_0] id_5;
  not primCall (id_2, id_4);
  logic id_6 = id_0;
  assign id_4 = 1;
  wire [1 : id_0] id_7;
  assign id_7 = id_6;
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_4,
      id_7,
      id_4,
      id_5,
      id_4,
      id_5,
      id_6
  );
  assign id_6 = id_0 ^ -1 ^ -1;
endmodule
