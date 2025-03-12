// Seed: 3124488261
module module_0 (
    output uwire id_0,
    input  uwire id_1
);
  logic [-1 : -1] id_3 = id_1;
  assign id_0 = id_1 == {id_1, id_3};
  assign module_1.id_1 = 0;
  always @({id_3,
    -1 - -1
  } or |id_1)
  begin : LABEL_0
    id_3 <= -1;
  end
endmodule
module module_1 (
    output tri   id_0,
    input  uwire id_1
);
  logic id_3 = 1;
  module_0 modCall_1 (
      id_0,
      id_1
  );
  assign id_0 = -1;
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    .id_9(id_4),
    id_5,
    id_6,
    id_7,
    id_8
);
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  input wire id_4;
  output wire id_3;
  inout wand id_2;
  input wire id_1;
  assign id_2 = id_1 > id_9;
endmodule
module module_3 #(
    parameter id_1 = 32'd97,
    parameter id_3 = 32'd2,
    parameter id_8 = 32'd17
) (
    _id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    _id_8
);
  input wire _id_8;
  module_2 modCall_1 (
      id_7,
      id_5,
      id_7,
      id_7,
      id_7,
      id_4,
      id_5,
      id_7
  );
  inout wire id_7;
  inout logic [7:0] id_6;
  inout wire id_5;
  inout wire id_4;
  output wire _id_3;
  output wire id_2;
  input wire _id_1;
  assign id_6[-1'b0] = 1;
  logic [-1 : id_3] id_9 = id_9[{id_1, 1} : id_8];
endmodule
