// Seed: 902193286
module module_0 (
    input supply1 id_0,
    input uwire id_1,
    input tri id_2
);
  assign id_4[1] = 1;
endmodule
module module_1 (
    output tri id_0,
    input supply1 id_1,
    output wire id_2,
    input uwire id_3
    , id_6,
    output logic id_4
);
  always @(posedge id_1)
    if (id_3) id_2 = id_6;
    else begin
      id_4 <= 1 - ~id_6;
    end
  id_7(
      .id_0(id_4), .id_1(id_0), .id_2(1), .id_3(id_3)
  );
  wire id_8;
  module_0(
      id_1, id_6, id_6
  );
  wire id_9;
endmodule
