// Seed: 3611012221
module module_0 (
    input supply0 id_0,
    output supply1 id_1,
    input tri id_2,
    output wand id_3,
    input supply0 id_4,
    input supply1 id_5,
    output tri1 id_6,
    output wire id_7,
    output wire id_8,
    output tri0 id_9,
    input wire id_10,
    input wire id_11,
    output wand id_12,
    input tri0 id_13,
    input tri id_14,
    output uwire id_15,
    input supply0 id_16
);
  wire id_18, id_19, id_20;
  id_21(
      {1, -1, -1, id_0, id_5} - id_4
  );
  tri0 id_22, id_23;
  always $unsigned(8);
  ;
  wire id_24;
  assign id_22 = 1;
  wire id_25, id_26, id_27;
  parameter id_28 = 1 || 1;
endmodule
module module_1 #(
    parameter id_10 = 32'd82,
    parameter id_12 = 32'd22,
    parameter id_2  = 32'd82,
    parameter id_29 = 32'd17,
    parameter id_7  = 32'd30
) (
    input wor id_0,
    input supply0 id_1#(
        ._id_10(1),
        .id_11 (1),
        ._id_12(-1),
        .id_13 (1)
    ),
    input tri0 _id_2,
    input wor id_3,
    input tri1 id_4,
    input wand id_5,
    output uwire id_6,
    input wor _id_7,
    output tri0 id_8
);
  wire [1 'h0 : id_2] id_14, id_15;
  assign id_8 = {1, 1, -1, -1'b0} / id_2;
  always id_11 <= id_1;
  struct packed {
    enum id_16 [-1] {id_17} id_18;
    logic id_19;
    struct packed {logic id_20;} id_21;
    logic id_22;
    logic [id_10 : id_12] id_23;
    logic id_24 = 1;
  } id_25[(  id_7  ) : 1];
  wire id_26 = id_3, id_27;
  wire id_28, _id_29;
  module_0 modCall_1 (
      id_5,
      id_6,
      id_5,
      id_8,
      id_4,
      id_0,
      id_6,
      id_6,
      id_6,
      id_8,
      id_4,
      id_1,
      id_6,
      id_5,
      id_1,
      id_8,
      id_5
  );
  wire [1 : id_29] id_30;
endmodule
