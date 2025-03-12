// Seed: 2864643528
module module_0 (
    id_1
);
  output wire id_1;
  wire [1 : -1] id_2;
endmodule
module module_1 #(
    parameter id_6 = 32'd42,
    parameter id_8 = 32'd29
) (
    input supply1 id_0,
    input tri0 id_1,
    input wire id_2,
    input wire id_3
    , id_13,
    input supply0 id_4,
    output supply1 id_5,
    input tri0 _id_6,
    input tri0 id_7,
    input tri1 _id_8,
    output logic id_9,
    input tri0 id_10,
    output tri id_11
);
  logic id_14, id_15;
  logic id_16;
  always @(-1 or posedge 1 == id_13) begin : LABEL_0
    id_14 <= #1 id_1;
    id_9  <= id_13[id_8];
    id_9#(
        .id_6 (-1),
        .id_10(1)
    ) = 1'b0;
    id_13[id_6 :-1] <= 1 * 1;
  end
  wire [-1 'b0 : -1  -  -1] id_17;
  struct packed {
    logic id_18;
    logic [-1 : -1] id_19;
  } id_20;
  nor primCall (
      id_9, id_18, id_17, id_15, id_20, id_3, id_4, id_13, id_7, id_16, id_1, id_10, id_14
  );
  if ((1)) begin : LABEL_1
    wire id_21;
    assign id_16 = id_20.id_18;
    assign id_20 = id_7;
  end else assign id_20.id_18[1] = -1;
  module_0 modCall_1 (id_19);
endmodule
