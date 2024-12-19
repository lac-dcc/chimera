// Seed: 692697237
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  inout wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  wire id_6;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    id_9,
    id_10
);
  inout wire id_10;
  output wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  always @(posedge id_4 or posedge 1'd0) begin : LABEL_0
    id_5 = 1'd0;
  end
  nor primCall (id_5, id_6, id_10, id_4, id_8, id_7, id_3);
  module_0 modCall_1 (
      id_7,
      id_6,
      id_5,
      id_10,
      id_6
  );
endmodule
