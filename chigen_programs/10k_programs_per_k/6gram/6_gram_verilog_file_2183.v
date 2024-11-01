// Seed: 4292297646
module module_0;
  tri1 id_1;
  always
  fork
    id_2(1, 1);
    for (id_1 = 1; id_1; id_1 = id_1) begin
      fork
        #1 id_1 = id_2;
      join
    end
    #1;
  join
  id_3(
      .id_0(1'h0 == id_2), .id_1(id_1), .id_2(1), .id_3(1'b0), .id_4(id_1), .id_5(1), .id_6(id_2)
  );
  assign id_1 = 1 ? id_1 : 1;
endmodule
module module_1 (
    input tri1 id_0,
    output tri0 id_1,
    output tri id_2,
    output tri0 id_3,
    input tri0 id_4,
    input supply1 id_5,
    output supply0 id_6,
    input supply1 id_7,
    output tri id_8,
    input uwire id_9,
    inout uwire id_10,
    input wire id_11,
    input supply1 id_12,
    output supply1 id_13,
    input supply0 id_14,
    input supply0 id_15,
    input wor id_16,
    output wire id_17,
    output tri0 id_18
);
  wire id_20;
  wire id_21 = 1;
  module_0();
endmodule
