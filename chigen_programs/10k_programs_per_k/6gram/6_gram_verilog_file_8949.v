// Seed: 4023759482
module module_0 (
    input supply1 id_0,
    output wire id_1,
    output supply1 id_2
);
  assign id_2 = id_0;
  assign module_1.id_2 = 0;
endmodule
module module_1 (
    output tri0 id_0,
    input tri0 id_1,
    input supply1 id_2,
    output supply1 id_3
);
  always @* begin : LABEL_0
    $signed(90);
    ;
  end
  module_0 modCall_1 (
      id_2,
      id_0,
      id_3
  );
endmodule
module module_2 (
    id_1,
    id_2,
    id_3,
    id_4
);
  output wire id_4;
  input wire id_3;
  input wire id_2;
  inout wire id_1;
  assign id_1 = id_1;
endmodule
module module_3 #(
    parameter id_19 = 32'd96,
    parameter id_6  = 32'd24
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    _id_6,
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
    _id_19,
    id_20,
    id_21,
    id_22,
    id_23,
    id_24,
    id_25
);
  output wire id_25;
  output logic [7:0] id_24;
  inout wire id_23;
  inout wire id_22;
  input wire id_21;
  output wire id_20;
  inout wire _id_19;
  output wire id_18;
  input wire id_17;
  output wire id_16;
  output wire id_15;
  input wire id_14;
  input wire id_13;
  inout wire id_12;
  input logic [7:0] id_11;
  output wire id_10;
  inout wire id_9;
  module_2 modCall_1 (
      id_22,
      id_12,
      id_14,
      id_5
  );
  inout wire id_8;
  inout wire id_7;
  input wire _id_6;
  output wire id_5;
  output wire id_4;
  output wire id_3;
  output wire id_2;
  input wire id_1;
  assign id_24[id_19] = id_11[id_6 :-1'b0==1] + -1;
endmodule
