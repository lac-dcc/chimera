// Seed: 1271707721
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
    id_11
);
  inout wire id_11;
  output wire id_10;
  inout wire id_9;
  output wire id_8;
  inout wire id_7;
  input wire id_6;
  output wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  output wire id_1;
  wand id_12;
  wire id_13;
  wire id_14;
  always @(posedge 1) begin : LABEL_0
    id_9 <= id_6;
  end
endmodule
module module_1 (
    output supply1 id_0,
    output logic id_1,
    input uwire id_2,
    input tri1 id_3,
    input supply1 id_4,
    input tri1 id_5
);
  reg id_7;
  reg id_8;
  initial begin : LABEL_0
    #1;
    #1 id_7 = 1;
    id_8 <= id_7;
  end
  assign id_0 = 1;
  wire id_9;
  assign id_7 = 1;
  module_0 modCall_1 (
      id_9,
      id_9,
      id_9,
      id_9,
      id_9,
      id_7,
      id_9,
      id_9,
      id_8,
      id_9,
      id_9
  );
  initial begin : LABEL_0
    id_7 <= id_8;
    id_7 <= 1;
    wait ((1));
    id_1 <= 1'd0 == !id_4;
  end
endmodule
