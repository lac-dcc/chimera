// Seed: 2996461027
module module_0 (
    output tri0 id_0,
    input tri0 id_1,
    output supply0 id_2,
    input uwire id_3,
    output supply1 id_4,
    input tri id_5,
    output supply1 id_6,
    output tri id_7,
    output wand id_8,
    input wor id_9
);
endmodule
module module_1 (
    output logic id_0,
    input tri1 id_1,
    input uwire id_2,
    output tri0 id_3,
    input wire id_4,
    inout tri1 id_5,
    input wire id_6,
    input wand id_7,
    input tri0 id_8,
    output tri1 id_9,
    input supply0 id_10,
    input tri0 id_11,
    input wor id_12,
    input tri0 id_13,
    input supply1 id_14,
    input tri id_15,
    input tri0 id_16
    , id_21,
    input supply1 id_17,
    input tri0 id_18,
    input supply0 id_19
);
  assign id_0 = 1;
  nor (
      id_9,
      id_19,
      id_12,
      id_2,
      id_15,
      id_5,
      id_8,
      id_22,
      id_7,
      id_21,
      id_6,
      id_18,
      id_1,
      id_16,
      id_17,
      id_4,
      id_14
  );
  wire id_22;
  module_0(
      id_9, id_10, id_9, id_19, id_9, id_19, id_21, id_3, id_3, id_13
  );
  wire id_23;
  supply1 id_24;
  assign id_24 = id_21 ? id_21 : id_11;
  wor  id_25;
  wire id_26;
  assign id_25 = id_8;
  initial begin
    if (1) begin
      id_0 <= ~id_13;
      $display(1);
    end
  end
  id_27(
      .id_0(id_13), .id_1(id_16 == id_7), .id_2(id_1 ==? 1), .id_3()
  );
endmodule
