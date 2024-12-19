// Seed: 4082443228
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  inout wire id_2;
  output wire id_1;
  wire id_6;
  assign id_2 = 1'b0 == id_5;
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
    id_9
);
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  output wire id_2;
  input wire id_1;
  always @(posedge 1'b0 or posedge id_7) begin : LABEL_0
    for (id_3 = id_3; id_1; id_8 = !id_4) begin : LABEL_0
      id_4 = id_6;
    end
    id_2 <= id_4;
    if (1) begin : LABEL_0
      id_3 = id_5;
      id_8 <= 1;
      disable id_10;
    end
  end
  module_0 modCall_1 (
      id_10,
      id_3,
      id_10,
      id_10,
      id_5
  );
  id_11(
      .id_0(id_4), .id_1(id_3 - id_1)
  );
endmodule
