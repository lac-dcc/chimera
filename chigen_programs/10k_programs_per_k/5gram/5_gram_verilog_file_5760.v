// Seed: 2870380199
module module_0 (
    output wire id_0
    , id_4,
    output tri0 id_1,
    output wire id_2
);
  assign module_1.id_10 = 0;
  always @(id_4 or posedge id_4)
    #1 begin : LABEL_0
      deassign id_1;
    end
endmodule
module module_1 #(
    parameter id_24 = 32'd95
) (
    output logic id_0,
    output supply0 id_1,
    output supply0 id_2,
    output tri1 id_3,
    input wand id_4,
    output wor id_5,
    input uwire id_6
    , id_23,
    input tri id_7,
    output tri1 id_8,
    output supply1 id_9,
    input supply1 id_10,
    output uwire id_11,
    output logic id_12,
    input tri id_13,
    output wire id_14,
    output tri id_15,
    output supply1 id_16,
    output wor id_17,
    output tri1 id_18,
    output wire id_19
    , _id_24,
    input supply0 id_20,
    input wire id_21
);
  integer id_25;
  ;
  task id_26(input [id_24 : -1] id_27);
    begin : LABEL_0
      id_12 <= (1'b0) | 1;
      id_0  <= -1;
      disable id_28;
    end
  endtask
  and primCall (id_14, id_6, id_4, id_13, id_26, id_25, id_20, id_23, id_29, id_7, id_21);
  wire id_29;
  module_0 modCall_1 (
      id_19,
      id_11,
      id_14
  );
endmodule
