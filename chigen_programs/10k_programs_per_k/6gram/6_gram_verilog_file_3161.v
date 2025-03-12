// Seed: 1151850886
module module_0 (
    input wire id_0,
    input supply1 id_1,
    output supply0 id_2,
    input supply1 id_3,
    output supply0 id_4,
    input tri1 id_5,
    input uwire id_6,
    input wire id_7,
    output wor sample,
    output tri1 id_9,
    input supply0 id_10,
    output wand id_11,
    input wand id_12
    , id_16,
    output wor id_13,
    output tri0 id_14
);
  assign module_0 = 1'b0;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    output wor id_2,
    output logic id_3,
    input supply1 id_4,
    output tri0 id_5,
    input wor id_6,
    output wire id_7,
    input tri1 id_8,
    input uwire id_9,
    output logic id_10
    , id_23,
    input supply1 id_11,
    input wor id_12,
    input tri id_13,
    input tri0 id_14,
    input uwire id_15,
    output tri id_16,
    input supply1 id_17,
    output uwire id_18,
    input wor id_19,
    output logic id_20,
    output tri1 id_21
);
  task id_24;
    input logic id_25;
    begin : LABEL_0
      id_3 = id_4;
      case (id_25)
        -1: id_10 = -1'd0 | id_24;
        default: {id_25, -1} = id_15;
      endcase
      id_20 <= id_25;
    end
  endtask
  module_0 modCall_1 (
      id_0,
      id_9,
      id_18,
      id_19,
      id_2,
      id_12,
      id_0,
      id_17,
      id_16,
      id_21,
      id_6,
      id_5,
      id_4,
      id_7,
      id_21
  );
  assign modCall_1.id_5 = 0;
  assign id_23 = (-1) & id_12;
endmodule
