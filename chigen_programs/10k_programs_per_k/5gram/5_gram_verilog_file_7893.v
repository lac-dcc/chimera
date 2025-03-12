// Seed: 3693774744
module module_0 (
    output wand  id_0,
    input  uwire id_1,
    input  wor   id_2
);
  logic id_4;
  ;
  wire id_5;
  wire id_6;
endmodule
module module_1 (
    output wor id_0,
    input supply0 id_1,
    output supply0 id_2,
    input tri1 id_3,
    input tri1 id_4
);
  wire id_6;
  module_0 modCall_1 (
      id_2,
      id_4,
      id_3
  );
endmodule
module module_2 #(
    parameter id_13 = 32'd10
) (
    output wire id_0,
    input wand id_1
    , id_15,
    input supply0 id_2,
    output wire id_3,
    output tri id_4,
    input supply1 id_5,
    input wor id_6,
    output tri1 id_7,
    output wor id_8
    , id_16,
    input supply0 id_9,
    input uwire id_10,
    input wand id_11,
    output tri id_12,
    input wire _id_13
);
  wire [id_13 : id_13] id_17;
  module_0 modCall_1 (
      id_0,
      id_10,
      id_2
  );
  task id_18;
    begin : LABEL_0
      #1;
      id_16 <= 1;
      case (-1)
        -1: id_18 = -1'd0;
        (-1'b0): ;
      endcase
    end
  endtask
endmodule
