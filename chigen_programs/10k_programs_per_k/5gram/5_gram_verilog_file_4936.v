// Seed: 1576647209
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  assign id_2 = id_1 == 1;
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
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  final begin : LABEL_0
    if (id_3)
      if (id_6) id_6 <= 1'b0;
      else if (1) begin : LABEL_0
        if ("") id_3 <= #1 1;
        else begin : LABEL_0
          id_5 <= 1'h0;
          id_4 = id_8;
        end
      end
  end
  always id_2 <= #id_7 1'h0;
  assign id_1 = id_10 == 1 && ({id_6, 1, id_2 == id_9}) || id_6;
  module_0 modCall_1 (
      id_7,
      id_7,
      id_10,
      id_7
  );
  assign modCall_1.id_1 = 0;
endmodule
