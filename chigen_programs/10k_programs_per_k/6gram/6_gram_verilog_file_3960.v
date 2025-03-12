// Seed: 4100779167
module module_0 (
    id_1,
    id_2,
    id_3,
    id_4
);
  input wire id_4;
  inout wire id_3;
  output wire id_2;
  output wire id_1;
  logic id_5;
  ;
endmodule
module module_1 (
    output uwire id_0,
    input  wor   id_1,
    output tri1  id_2
);
  wire id_4;
  nor primCall (id_2, id_4, id_1);
  module_0 modCall_1 (
      id_4,
      id_4,
      id_4,
      id_4
  );
endmodule
module module_0 #(
    parameter id_11 = 32'd39,
    parameter id_28 = 32'd4,
    parameter id_29 = 32'd65,
    parameter id_33 = 32'd86
) (
    id_1,
    id_2,
    id_3,
    id_4,
    id_5,
    id_6,
    id_7,
    id_8,
    module_2,
    id_10,
    _id_11,
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
    id_24,
    id_25,
    id_26,
    id_27
);
  inout wire id_27;
  input wire id_26;
  output wire id_25;
  output wire id_24;
  output wire id_23;
  input wire id_22;
  output wire id_21;
  inout wire id_20;
  input wire id_19;
  inout wire id_18;
  input wire id_17;
  input wire id_16;
  module_0 modCall_1 (
      id_1,
      id_8,
      id_27,
      id_20
  );
  inout wire id_15;
  input wire id_14;
  output tri0 id_13;
  input wire id_12;
  input wire _id_11;
  inout wire id_10;
  input wire id_9;
  inout wire id_8;
  output wire id_7;
  output wire id_6;
  input wire id_5;
  input wire id_4;
  input wire id_3;
  output logic [7:0] id_2;
  inout uwire id_1;
  logic _id_28;
  parameter id_29 = -1;
  logic id_30 [id_11 : id_28];
  wire  id_31;
  wire  id_32;
  localparam id_33 = -1;
  assign id_2[-1&1&-1&-1] = id_16;
  generate
    for (id_34 = 1; 1; id_34 = id_1) begin : LABEL_0
      if (id_29) wire id_35;
      ;
      if (id_29 == 1) begin : LABEL_1
        assign id_32 = id_27;
        defparam id_33.id_33 = 1 != id_29;
        wire id_36;
        ;
        assign id_13 = 1 + 1;
      end else begin : LABEL_2
        defparam id_29.id_29 = -1'b0;
        assign id_1 = -1;
        wire id_37;
        ;
      end
      wire id_38;
      ;
    end
  endgenerate
endmodule
