// Seed: 268285901
module module_0 (
    input uwire id_0,
    output supply0 id_1,
    input wand id_2,
    input wor id_3,
    input wand id_4,
    output tri1 id_5,
    output uwire id_6,
    input wor id_7,
    input wire id_8,
    input wire id_9,
    output supply1 id_10,
    input wor id_11,
    input wand id_12,
    output tri0 id_13,
    output wand id_14,
    output tri1 id_15,
    input wand id_16,
    input supply0 id_17,
    input wire id_18,
    input tri0 id_19,
    output wire id_20
);
  logic id_22;
  assign id_22 = id_7;
  assign id_20 = (id_7) == "";
  assign module_1.id_0 = 0;
  always @(id_0 ? -1 : id_11) begin : LABEL_0
    id_22 = 1;
  end
endmodule
module module_1 #(
    parameter id_2 = 32'd95,
    parameter id_7 = 32'd36
) (
    input supply0 id_0,
    input supply1 id_1,
    input tri0 _id_2,
    output uwire id_3,
    output tri0 id_4
    , id_10,
    input wor id_5,
    input tri id_6,
    input supply1 _id_7,
    input wor id_8
);
  task id_11;
    begin : LABEL_0
      id_11 <= id_7 ? -1'b0 : id_8;
    end
  endtask
  logic [id_7 : id_2] id_12;
  ;
  module_0 modCall_1 (
      id_5,
      id_4,
      id_1,
      id_8,
      id_8,
      id_4,
      id_4,
      id_1,
      id_1,
      id_1,
      id_4,
      id_0,
      id_8,
      id_3,
      id_3,
      id_4,
      id_6,
      id_6,
      id_6,
      id_5,
      id_4
  );
endmodule
