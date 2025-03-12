// Seed: 1111916761
module module_0 (
    output tri1 id_0,
    output tri id_1,
    input wor id_2,
    input tri0 id_3,
    input wor id_4,
    input supply1 id_5,
    input tri0 id_6,
    input wor id_7,
    output tri1 id_8,
    output tri0 id_9,
    input uwire id_10,
    output tri1 id_11
    , id_37,
    output wand id_12,
    input supply1 id_13,
    output tri1 id_14,
    output uwire id_15,
    output uwire id_16,
    output wire id_17,
    input tri1 id_18,
    output wire id_19,
    input wire id_20,
    input supply1 id_21,
    input tri1 id_22,
    output tri1 id_23,
    input wor id_24,
    output logic id_25,
    input wor id_26,
    input uwire id_27,
    output tri1 id_28,
    input supply1 id_29,
    output logic id_30,
    input wor id_31,
    input wor id_32,
    output supply0 id_33,
    input tri id_34,
    input tri0 id_35
);
  initial begin : LABEL_0
    case (id_7)
      1: id_30 = id_6;
      default: id_25 <= {id_35 == id_18, -1, id_5 == 1, 1 != {id_26, id_10}, 1, -1, 1, -1'd0, 1};
    endcase
  end
  logic [1 : (  -1  )] id_38;
  assign module_1.id_2 = 0;
  assign id_16 = 1;
endmodule
module module_1 (
    input  wand  id_0,
    input  wire  id_1,
    input  uwire id_2,
    input  uwire id_3,
    input  tri   id_4,
    input  wor   id_5,
    output wor   id_6,
    output logic id_7
);
  always_ff @(posedge -1'd0 or negedge 1) begin : LABEL_0
    forever
    #1 begin : LABEL_1
      disable id_9;
    end
  end
  wire id_10;
  module_0 modCall_1 (
      id_6,
      id_6,
      id_1,
      id_0,
      id_4,
      id_2,
      id_5,
      id_1,
      id_6,
      id_6,
      id_3,
      id_6,
      id_6,
      id_1,
      id_6,
      id_6,
      id_6,
      id_6,
      id_1,
      id_6,
      id_3,
      id_3,
      id_2,
      id_6,
      id_5,
      id_7,
      id_2,
      id_5,
      id_6,
      id_0,
      id_7,
      id_0,
      id_0,
      id_6,
      id_3,
      id_1
  );
  wire id_11;
  assign id_7 = id_0;
  wor id_12 = -1;
  initial begin : LABEL_2
    id_7#(.id_2(1)) <= id_1;
  end
endmodule
