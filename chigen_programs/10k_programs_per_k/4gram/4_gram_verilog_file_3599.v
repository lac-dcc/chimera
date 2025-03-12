// Seed: 185724623
module module_0 #(
    parameter id_14 = 32'd30
) (
    input wand id_0,
    output wire id_1,
    output uwire id_2,
    input tri1 id_3,
    output tri id_4,
    input wand id_5,
    input tri id_6,
    input uwire id_7,
    output supply0 id_8,
    input supply0 id_9
    , id_13,
    output supply1 id_10,
    input wor id_11
);
  wire _id_14;
  wire [1 : id_14] id_15;
  assign id_4 = -1;
  assign id_2 = id_5;
  initial
    #(-1) begin : LABEL_0
      $clog2(10);
      ;
    end
endmodule
module module_1 #(
    parameter id_1 = 32'd90,
    parameter id_3 = 32'd59
) (
    output logic id_0,
    output supply0 _id_1,
    input wire id_2,
    input supply1 _id_3,
    output wor id_4,
    input wand id_5,
    input tri id_6,
    input uwire id_7,
    output uwire id_8,
    output wor id_9,
    input wor id_10
);
  integer [id_3 : id_1] id_12 = 1;
  wire [1 : id_3] id_13;
  wire id_14;
  uwire id_15 = 1;
  module_0 modCall_1 (
      id_7,
      id_9,
      id_8,
      id_5,
      id_8,
      id_7,
      id_7,
      id_6,
      id_4,
      id_5,
      id_4,
      id_10
  );
  assign modCall_1.id_9 = 0;
  wire id_16;
  ;
  wire id_17;
  parameter id_18 = -1'b0;
  task id_19();
    begin : LABEL_0
      id_0 <= (-1);
    end
  endtask
endmodule
