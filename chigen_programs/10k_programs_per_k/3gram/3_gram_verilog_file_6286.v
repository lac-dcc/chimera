// Seed: 185931620
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8
);
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  input wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9;
  for (id_10 = 1; 1; id_6 = id_3#(1)) begin : LABEL_0
    assign id_4 = 1;
    id_11(
        .id_0(id_8), .id_1(~id_4)
    );
  end
endmodule
module module_1 ();
  always @(*) id_1 = 1;
  module_0 modCall_1 (
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1,
      id_1
  );
  assign modCall_1.id_10 = 0;
  assign id_1 = 1;
  always @(*);
  wire id_2;
endmodule
