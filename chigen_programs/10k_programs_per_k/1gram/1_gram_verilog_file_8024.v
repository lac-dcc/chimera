// Seed: 1974821354
module module_0 (
    id_1,
    id_2,
    id_3
);
  inout wire id_3;
  input wire id_2;
  inout logic [7:0] id_1;
  assign id_1[1] = -1'b0;
  wire id_4, id_5;
  bit id_6, id_7, id_8, id_9, id_10, id_11, id_12, id_13;
  assign id_7 = id_2 < id_12;
  assign id_9 = -1'b0;
  parameter id_14 = -1;
  assign module_1.id_3 = 0;
  localparam id_15 = id_14;
  logic [7:0][-1] id_16;
  wire id_17;
  ;
  for (id_18 = id_18; 1; id_12 = id_18) wire [-1 : -1 'b0] id_19;
  logic id_20;
  always begin : LABEL_0
    id_6 <= 1;
  end
endmodule
module module_1 #(
    parameter id_2 = 32'd28
) (
    input supply1 id_0,
    output logic id_1,
    input tri0 _id_2,
    input wand id_3
);
  wire  id_5;
  logic id_6;
  ;
  wire id_7;
  ;
  module_0 modCall_1 (
      id_6,
      id_7,
      id_5
  );
  assign id_6[(~id_2) : 1'h0] = id_2;
  wire id_8;
  always id_1 = -1;
endmodule
