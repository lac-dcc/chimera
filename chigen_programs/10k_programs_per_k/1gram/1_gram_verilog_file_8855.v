// Seed: 792088374
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
endmodule
module module_1 #(
    parameter id_1 = 32'd9
) (
    output logic   id_0,
    input  supply1 _id_1
);
  wire [id_1 : id_1] id_3;
  wire id_4;
  module_0 modCall_1 (
      id_4,
      id_3,
      id_3,
      id_3
  );
  reg id_5;
  always_comb begin : LABEL_0
    if (1) begin : LABEL_1
      id_5 = id_4;
    end
    id_0 = -1;
    force id_5 = id_5;
  end
endmodule
module module_2 #(
    parameter id_13 = 32'd34,
    parameter id_3  = 32'd32,
    parameter id_9  = 32'd90
) (
    id_1,
    id_2,
    _id_3[id_3 :-1],
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    _id_9#(id_10.id_11),
    id_12,
    _id_13
);
  inout wire id_11;
  inout wire id_10;
  inout wire _id_9;
  input wire id_8;
  inout logic [7:0] id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  inout logic [7:0] _id_3;
  output wire id_2;
  inout wire id_1;
  wire [id_13 : id_9] id_14;
  wire id_15;
  assign id_7[1] = -1;
  module_0 modCall_1 (
      id_14,
      id_5,
      id_4,
      id_12
  );
  assign id_12 = -1 !=? id_13;
endmodule
