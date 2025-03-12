// Seed: 1009950993
module module_0 (
    output tri1  id_0,
    input  wor   id_1,
    output uwire id_2
);
  assign id_0 = id_1;
endmodule
module module_1 #(
    parameter id_8 = 32'd99
) (
    input wand id_0,
    output logic id_1,
    output supply1 id_2,
    input wand id_3,
    output logic id_4,
    input supply0 id_5,
    output uwire id_6,
    input tri id_7,
    input tri0 _id_8,
    output logic id_9,
    output uwire id_10,
    input tri1 id_11
);
  wire [id_8 : id_8] id_13;
  logic id_14;
  module_0 modCall_1 (
      id_6,
      id_11,
      id_2
  );
  assign modCall_1.id_0 = 0;
  initial
    @(*)
      if (1) begin : LABEL_0
        id_9 = 1;
        id_9 = -1 & id_5;
        begin : LABEL_1
          begin : LABEL_2
            id_1 <= #1 1;
            id_4 <= -1'b0 == 1;
          end
        end
        id_4 <= id_8;
      end
  wire id_15, id_16;
  assign id_13 = id_5;
  wire id_17;
  union packed {
    logic id_18;
    logic id_19;
    logic id_20;
    logic id_21;
    event id_22;
    logic id_23;
    logic id_24;
  } id_25;
  ;
endmodule
