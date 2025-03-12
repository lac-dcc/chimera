// Seed: 2380884708
module module_0 (
    input  supply1 id_0,
    input  supply0 id_1,
    input  supply0 id_2,
    input  supply0 id_3,
    input  supply0 id_4,
    output logic   id_5
);
  logic id_7;
  always begin : LABEL_0
    id_5 = id_1;
    id_5 = -1;
  end
endmodule
module module_1 #(
    parameter id_1 = 32'd57
) (
    input tri1 id_0,
    input tri0 _id_1,
    input wand id_2,
    output supply1 id_3,
    input tri id_4,
    input wire id_5,
    output tri1 id_6,
    input tri0 id_7,
    output tri id_8,
    output logic id_9,
    output logic id_10,
    output tri id_11,
    input wire id_12
    , id_18,
    input wire id_13,
    output wor id_14,
    output wire id_15
    , id_19,
    input supply0 id_16
);
  wire [1 'b0 -  1 : id_1] id_20;
  module_0 modCall_1 (
      id_4,
      id_2,
      id_13,
      id_5,
      id_0,
      id_10
  );
  assign id_11 = {id_12(1) {!id_19}};
  assign id_18 = id_7;
  task id_21;
    begin : LABEL_0
      id_10 = id_1;
      if (1)
        if (1) id_9 <= 1;
        else id_9 <= id_18;
    end
  endtask
endmodule
