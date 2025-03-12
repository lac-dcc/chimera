// Seed: 3492208851
module module_0 (
    input wand id_0,
    input supply1 id_1,
    output uwire id_2
    , id_13,
    input tri0 id_3,
    input tri1 id_4,
    output wor id_5,
    output tri1 id_6,
    input tri1 id_7,
    output uwire id_8,
    input supply1 id_9,
    input wand id_10,
    output tri id_11
);
  parameter id_14 = 1 | 1 | 1;
  wire id_15;
  assign id_8 = 1;
  assign module_1._id_2 = 0;
endmodule
module module_1 #(
    parameter id_2 = 32'd92
) (
    output logic id_0,
    output tri0 id_1,
    input wor _id_2,
    output logic id_3,
    input supply1 id_4
    , id_7,
    output wand id_5
);
  wire [id_2 : id_2] id_8;
  notif1 primCall (id_0, id_8, id_4);
  always @(negedge id_4) begin : LABEL_0
    id_3 <= id_2;
    id_0 = -1;
  end
  logic id_9;
  ;
  module_0 modCall_1 (
      id_4,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5,
      id_1,
      id_4,
      id_5,
      id_4,
      id_4,
      id_5
  );
endmodule
