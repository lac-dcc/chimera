// Seed: 3632239393
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  tri1 id_5 = id_2 + 1'b0;
  if (1'b0) begin : LABEL_0
    assign id_4 = (1);
  end
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
  input wire id_9;
  input wire id_8;
  input wire id_7;
  inout wire id_6;
  output wire id_5;
  output wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final @(posedge -id_6) @(posedge id_6++or posedge 1) id_10 = #1 id_7;
  initial @(id_10 or posedge id_2) id_4[1] <= id_3;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_6,
      id_6
  );
endmodule
