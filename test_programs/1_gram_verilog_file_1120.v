// Seed: 871520311
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
  inout wire id_8;
  input wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  inout wire id_3;
  input wire id_2;
  output wire id_1;
  wire id_9, id_10;
  wire id_11, id_12;
  wire id_13;
endmodule
module module_1 (
    id_1
);
  input wire id_1;
  wire id_2;
  wire id_3, id_4;
  module_0 modCall_1 (
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_4,
      id_3,
      id_2
  );
endmodule
module module_2 (
    output supply1 id_0
);
  bit id_2, id_3 = {1{id_3}};
  tri1 id_4;
  initial begin : LABEL_0
    id_2 = id_3;
    if (1) begin : LABEL_0
      begin : LABEL_0
        id_3 <= -1;
        id_3 <= #(-1 - id_2) -1;
      end
    end else id_3 <= id_3;
  end
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4,
      id_4
  );
  assign id_0 = 1;
  wire id_5;
  assign id_3 = 1;
  logic [7:0] id_6, id_7, id_8;
  id_9(
      .id_0(1'b0),
      .id_1(id_4 >= -1),
      .id_2(id_4),
      .id_3(""),
      .id_4(!id_7[1]),
      .id_5(id_0),
      .id_6(-1),
      .id_7(1)
  );
  wire id_10;
endmodule
