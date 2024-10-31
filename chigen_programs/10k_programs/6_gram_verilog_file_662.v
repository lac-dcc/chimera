// Seed: 1108864759
module module_0 (
    output tri id_0,
    input supply0 id_1,
    output uwire id_2,
    input tri id_3,
    input tri id_4,
    output tri0 id_5,
    output supply1 id_6,
    input tri1 id_7,
    input uwire id_8,
    output tri1 id_9,
    input tri1 id_10,
    output wor id_11,
    output wire id_12,
    input supply1 id_13,
    input supply1 id_14,
    output supply1 id_15,
    output wire id_16
    , id_18
);
  wor id_19;
  tri id_20;
  always @((1'b0 - id_13)) begin
    id_16 = 1;
    id_12 = 1 & (id_8 ? !id_20 < id_19 : id_10);
    assume #1  (1)
    else $display(id_14 == id_1, id_4, -id_8);
  end
endmodule
module module_1 (
    output tri1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input wor id_3,
    output uwire id_4,
    input wor id_5
);
  always @(posedge 1) begin
    id_4 += id_1;
  end
  module_0(
      id_2,
      id_5,
      id_2,
      id_1,
      id_1,
      id_2,
      id_4,
      id_5,
      id_3,
      id_0,
      id_5,
      id_0,
      id_2,
      id_3,
      id_3,
      id_4,
      id_0
  );
endmodule
