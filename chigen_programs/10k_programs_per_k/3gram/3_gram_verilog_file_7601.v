// Seed: 3088208089
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
endmodule
module module_1;
  wire id_1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1
  );
endmodule
module module_2 #(
    parameter id_3 = 32'd94,
    parameter id_6 = 32'd93
) (
    id_1,
    id_2,
    _id_3,
    id_4,
    id_5,
    _id_6,
    id_7,
    id_8,
    id_9
);
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  inout wire _id_6;
  input wire id_5;
  inout wire id_4;
  output wire _id_3;
  output wire id_2;
  output wire id_1;
  logic [(  id_3  ) : -1 'b0] id_10 = 1 + id_8;
  module_0 modCall_1 (
      id_2,
      id_7,
      id_7,
      id_10
  );
  assign {id_4, 1} = -1;
  logic [id_6 : 1] id_11;
  ;
  specify
    (id_12 => id_13) = (id_12, 1  : id_13  : 1);
    (id_14 => id_15) = (1, 1  : -1'b0 : 1);
    if (id_5) (id_16 => id_17) = (-1, id_5  : id_7  : id_7);
    $width(posedge id_18, id_5);
    if (id_18) (posedge id_19 => (id_20 +: id_19)) = (id_14 + id_20  : -1  : 1'h0, id_10);
  endspecify
endmodule
