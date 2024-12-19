// Seed: 2154797648
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout wire id_1;
  wire id_4;
  initial begin : LABEL_0
    cover (id_2);
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
    id_10,
    id_11
);
  output wire id_11;
  input wire id_10;
  input wire id_9;
  input wire id_8;
  inout wire id_7;
  inout wire id_6;
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  module_0 modCall_1 (
      id_1,
      id_7,
      id_7
  );
  always
    casex (id_1)
      1: begin : LABEL_0
        id_7 = id_5;
      end
      1: id_2 <= id_8;
    endcase
  wire id_12;
  wire id_13;
endmodule
