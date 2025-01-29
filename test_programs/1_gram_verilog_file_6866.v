// Seed: 4218795439
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
    id_13,
    id_14,
    id_15,
    id_16,
    id_17,
    id_18,
    id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24
);
  output wire id_24;
  output wire id_23;
  input wire id_22;
  output wire id_21;
  input wire id_20;
  output wire id_19;
  input wire id_18;
  inout wire id_17;
  inout wire id_16;
  inout wire id_15;
  inout wire id_14;
  inout wire id_13;
  input wire id_12;
  inout wire id_11;
  input wire id_10;
  input wire id_9;
  output wire id_8;
  input wire id_7;
  input wire id_6;
  inout wire id_5;
  output wire id_4;
  input wire id_3;
  output wire id_2;
  inout wire id_1;
  wire id_25;
endmodule
module module_1 (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5
);
  inout wire id_5;
  input wire id_4;
  input wire id_3;
  inout wire id_2;
  input wire id_1;
  initial
    #1 begin : LABEL_0
      if (id_1) begin : LABEL_0
        fork
          id_5 += 1;
        join
      end else;
      id_5 = new;
    end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2,
      id_2,
      id_2,
      id_1,
      id_2,
      id_4,
      id_3,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_2,
      id_4,
      id_2,
      id_1,
      id_2,
      id_4,
      id_2,
      id_2
  );
  initial id_2 = 1 * -1;
endmodule
