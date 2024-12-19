// Seed: 1133820809
module module_0 (
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
  output wire id_12;
  output wire id_11;
  output wire id_10;
  output wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  output wire id_1;
  wire id_14 = id_8;
  assign id_1 = (1) << 1;
  wire id_15;
  assign id_4 = $display(id_15, id_15);
  assign module_1.type_11 = 0;
endmodule
module module_1 (
    input  logic id_0,
    input  tri1  id_1,
    input  tri0  id_2,
    output logic id_3,
    input  uwire id_4,
    output logic id_5
);
  logic id_7;
  tri0  id_8;
  module_0 modCall_1 (
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8,
      id_8
  );
  always @(posedge id_7 or posedge id_0) begin : LABEL_0
    if (1) begin : LABEL_0
      id_8 = 1;
      id_3 += id_7;
      id_5 <= id_0;
      disable id_9;
      if (1) begin : LABEL_0
        id_3 <= id_7;
      end else disable id_10;
    end
  end
endmodule
