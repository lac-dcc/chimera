// Seed: 2879880620
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7
);
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  output wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(*) begin : LABEL_0
    release id_3;
  end
endmodule
module module_1 #(
    parameter id_3 = 32'd80
) (
    id_1,
    id_2
);
  inout wire id_2;
  inout uwire id_1;
  always disable _id_3;
  wire id_4;
  wire [-1 : id_3] id_5;
  or primCall (id_1, id_4, id_5, id_2, id_6);
  logic id_6;
  ;
  assign id_6 = 1;
  module_0 modCall_1 (
      id_5,
      id_5,
      id_6,
      id_5,
      id_5,
      id_2,
      id_1
  );
  assign id_1 = id_4 == id_5;
endmodule
