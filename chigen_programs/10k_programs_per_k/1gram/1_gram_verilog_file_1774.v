// Seed: 4112613384
module module_0 (
    input wor id_0,
    input uwire id_1,
    output tri1 id_2,
    input tri1 id_3,
    output tri1 id_4,
    input uwire id_5,
    input tri0 id_6,
    input tri id_7,
    input supply1 id_8,
    input tri id_9,
    input wor id_10,
    input tri1 id_11,
    output uwire id_12,
    output tri id_13,
    output tri id_14,
    output wor id_15
);
endmodule
module module_1 (
    input  wand  id_0,
    input  logic id_1,
    input  wire  id_2,
    input  tri0  id_3,
    input  logic id_4,
    output wire  id_5,
    output logic id_6
);
  logic id_8;
  if (id_4)
    always begin : LABEL_0
      id_6 = id_2 * ((id_1));
      id_6 = ~id_8 && 1;
    end
  else always id_6 <= 1 | id_1;
  nmos (id_2);
  module_0 modCall_1 (
      id_2,
      id_0,
      id_5,
      id_0,
      id_5,
      id_3,
      id_0,
      id_2,
      id_3,
      id_3,
      id_0,
      id_0,
      id_5,
      id_5,
      id_5,
      id_5
  );
  assign modCall_1.type_21 = 0;
  id_9 :
  assert property (@(negedge id_8) id_1) begin : LABEL_0
    begin : LABEL_0
      id_8 <= 1;
    end
    `define pp_10 0
  end else id_6 <= 1'd0;
  tri0 id_11;
  assign id_11 = 1;
  assign id_9  = 1;
  id_12(
      .id_0(1), .id_1(1)
  );
endmodule
