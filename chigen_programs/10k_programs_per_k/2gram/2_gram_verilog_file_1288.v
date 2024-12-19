// Seed: 165535335
module module_0 (
    id_1,
    id_2,
    id_3
);
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_5;
  tri1 id_6;
  assign id_5 = id_4;
  initial id_6 = 1;
  wire id_7;
  wire id_8, id_9 = 1, id_10, id_11, id_12, id_13, id_14;
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
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  inout wire id_12;
  output wire id_11;
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
  id_14(
      id_11
  );
  always
  fork
    $display(id_8[1]);
    if (!id_9)
      @(negedge id_14) begin : LABEL_0
        assign id_2 = id_2;
      end
    else begin : LABEL_0
      id_11[1] = id_10;
    end
  join_none
  module_0 modCall_1 (
      id_3,
      id_4,
      id_6
  );
  assign modCall_1.id_8 = 0;
  wire id_15;
endmodule
