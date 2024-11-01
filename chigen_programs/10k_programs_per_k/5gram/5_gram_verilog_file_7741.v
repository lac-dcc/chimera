// Seed: 2229282417
module module_0 (
    output supply1 id_0,
    input tri id_1,
    input wor id_2,
    output supply0 id_3,
    input supply1 id_4,
    input wand id_5,
    output supply1 id_6,
    input supply0 id_7,
    input tri1 id_8,
    output tri id_9,
    input wand id_10,
    output supply1 id_11,
    output wand id_12
);
  task id_14;
    begin
      id_0 = id_7;
    end
  endtask
  wire id_15;
endmodule
module module_1 (
    input tri id_0,
    input tri id_1,
    output supply1 id_2,
    output wire id_3,
    input wire id_4,
    input tri1 id_5
);
  assign id_2 = {id_0, 1};
  specify
    specparam id_7 = 1 - id_0;
    (id_8 => id_9) = 1;
    $setup(negedge id_10, id_11, id_5);
    (negedge id_12 => (id_13 +: id_8 < id_13)) = (1, 1);
    (posedge id_14 => (id_15 +: 1)) = (id_12, 1);
    (id_16 => id_17) = (id_12  : 1'b0 - id_15  : id_4);
  endspecify module_0(
      id_3, id_11, id_13, id_16, id_1, id_4, id_8, id_12, id_16, id_7, id_9, id_9, id_10
  );
endmodule
