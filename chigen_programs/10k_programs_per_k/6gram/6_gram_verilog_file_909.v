// Seed: 3805479937
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6
);
  input wire id_6;
  input wire id_5;
  inout wire id_4;
  inout wire id_3;
  input wire id_2;
  input wire id_1;
  wire id_7;
  wire id_8;
  tri0 id_9 = 1;
  wire id_10;
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20
);
  output wire id_20;
  inout wire id_19;
  inout wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  input wire id_13;
  inout wire id_12;
  input wire id_11;
  output wire id_10;
  inout wire id_9;
  inout wire id_8;
  inout wire id_7;
  output wire id_6;
  output wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  always @(posedge id_18)
    if ($display(id_9 === 1'b0)) id_9 <= 1 >= id_1;
    else begin : LABEL_0
      fork
        id_5 <= id_15;
        #1;
        id_21;
      join
    end
  module_0 modCall_1 (
      id_21,
      id_16,
      id_7,
      id_8,
      id_3,
      id_3
  );
  assign modCall_1.id_4 = 0;
endmodule
