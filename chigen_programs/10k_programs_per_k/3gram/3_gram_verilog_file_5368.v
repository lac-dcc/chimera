// Seed: 287213468
module module_0 (
    input wire id_0,
    output supply1 id_1
    , id_24,
    input supply1 id_2
    , id_25,
    output wire id_3,
    output logic id_4,
    input wire id_5,
    output wor id_6,
    input tri0 id_7,
    input tri0 id_8,
    input wand id_9,
    input wor id_10,
    input wor id_11,
    input wor id_12,
    input uwire id_13,
    input wire id_14,
    input tri0 id_15,
    input supply0 id_16,
    input tri1 id_17,
    input wand id_18,
    input uwire id_19,
    output tri0 id_20,
    output wor id_21,
    input supply1 id_22
);
  wire id_26;
  assign id_3 = id_7;
  always @(id_14 or posedge !1) id_4 <= 1'b0;
  id_27(
      .id_0(1'b0), .id_1("")
  );
endmodule
module module_1 (
    output supply0 id_0,
    output logic   id_1,
    input  logic   id_2,
    input  supply0 id_3,
    input  uwire   id_4
);
  always @(id_2 or negedge (1));
  module_0 modCall_1 (
      id_3,
      id_0,
      id_4,
      id_0,
      id_1,
      id_3,
      id_0,
      id_4,
      id_3,
      id_4,
      id_4,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_3,
      id_3,
      id_3,
      id_4,
      id_0,
      id_0,
      id_4
  );
  assign modCall_1.id_21 = 0;
  tri id_6;
  wor id_7;
  always  @  (  1  or  negedge  (  id_7  )  or  posedge  1  or  negedge  1  or  negedge  1 'b0 ,  1  ,  posedge  1  ,  1 'h0 ,  posedge  id_4  -  (  !  id_3  )  )
  fork
    id_1 <= {1{id_2}};
  join
  initial begin : LABEL_0
    id_7 = id_4;
  end
  always @(posedge id_3 or posedge id_6) begin : LABEL_0
    id_7 = 1;
  end
endmodule
