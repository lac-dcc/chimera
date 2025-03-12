// Seed: 2318506556
module module_0 (
    input tri id_0,
    input supply1 id_1,
    output supply1 id_2,
    input tri0 id_3,
    input wand id_4,
    inout wire id_5,
    input supply1 id_6,
    input wand id_7,
    input tri0 id_8,
    output tri0 id_9,
    input wand id_10,
    output tri1 id_11
);
  wire id_13;
endmodule
module module_1 #(
    parameter id_16 = 32'd2
) (
    output supply0 id_0,
    input uwire id_1,
    output logic id_2,
    output tri1 id_3,
    input wire id_4,
    input tri0 id_5,
    output uwire id_6,
    input wand id_7,
    output supply1 id_8,
    inout tri1 id_9,
    input wand id_10
);
  always @(id_10 or posedge 1 < id_5) begin : LABEL_0
    $signed(23);
    ;
    id_2 <= id_10;
    `define pp_12 0
  end
  bit id_13;
  always_latch @(-1 or id_5 - 1)
    if (-1) begin : LABEL_1
      $unsigned(87);
      ;
    end else if (1) id_13 <= -1;
    else id_2 = 1;
  localparam id_14 = 1, id_15 = (1), id_16 = 1, id_17 = (id_4);
  module_0 modCall_1 (
      id_9,
      id_10,
      id_0,
      id_5,
      id_1,
      id_9,
      id_5,
      id_4,
      id_5,
      id_3,
      id_5,
      id_8
  );
  assign modCall_1.id_2 = 0;
  parameter id_18 = id_16;
  wire [id_16 : -1 'b0] id_19;
endmodule
