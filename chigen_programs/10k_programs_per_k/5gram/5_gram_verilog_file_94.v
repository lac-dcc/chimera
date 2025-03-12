// Seed: 1802667104
module module_0 (
    input supply1 id_0,
    input supply1 id_1,
    output tri0 id_2,
    input uwire id_3
);
  wire id_5;
  assign module_1.id_4 = 0;
endmodule
module module_1 #(
    parameter id_4 = 32'd55
) (
    output logic id_0,
    output supply0 id_1
    , id_7,
    input tri1 id_2,
    output tri id_3,
    input tri _id_4,
    output tri id_5
);
  assign id_7 = id_2;
  or primCall (id_1, id_7, id_2);
  always @(posedge id_7[id_4 :-1] | 1) begin : LABEL_0
    id_0 <= id_4 <= (id_7[1<id_4] ~^ id_4 != -1'd0);
  end
  module_0 modCall_1 (
      id_2,
      id_2,
      id_3,
      id_2
  );
  wire id_8;
endmodule
