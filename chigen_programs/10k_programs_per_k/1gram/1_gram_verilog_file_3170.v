// Seed: 2921092732
module module_0 (
    id_1,
    id_2
);
  inout wire id_2;
  inout wire id_1;
  assign module_1.id_0 = 0;
endmodule
module module_1 (
    input tri0 id_0#(.id_2(1))
);
  assign id_2 = id_0;
  module_0 modCall_1 (
      id_2,
      id_2
  );
endmodule
module module_2 #(
    parameter id_21 = 32'd74,
    parameter id_5  = 32'd44,
    parameter id_6  = 32'd96
) (
    id_1,
    id_2,
    id_3,
    id_4[-1 : 1],
    _id_5,
    _id_6,
    id_7[id_6 :-1],
    id_8,
    id_9[1|1'd0 :-1],
    id_10,
    id_11,
    id_12,
    id_13
);
  output wire id_13;
  input wire id_12;
  input wire id_11;
  input wire id_10;
  inout logic [7:0] id_9;
  inout wire id_8;
  inout logic [7:0] id_7;
  inout wire _id_6;
  input wire _id_5;
  output logic [7:0] id_4;
  output wire id_3;
  inout wire id_2;
  module_0 modCall_1 (
      id_2,
      id_8
  );
  output wire id_1;
  wire [id_5 : 1] id_14;
  wire id_15, id_16, id_17;
  parameter id_18#(
      .id_19(~{1{1}}),
      .id_20(id_19),
      .id_21(id_18),
      .id_22(id_20 ? -1 : id_21)
  ) = -1 !=? id_19 != id_18;
  wire id_23, id_24;
  wire  id_25;
  defparam id_21 = 1;
  logic id_26;
  ;
  wire id_27;
endmodule
