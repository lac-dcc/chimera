// Seed: 3943115910
module module_0 (
    input tri1 id_0,
    input supply0 id_1,
    input tri0 id_2
);
  always @(id_1) begin : LABEL_0
    if (id_0 === 1)
      #1 begin : LABEL_0
        if (1) begin : LABEL_0
          id_4 <= 1;
        end else $display(id_0, {id_2{id_1}});
      end
    else $display(1);
  end
  assign module_1.id_3 = 0;
endmodule
module module_1 (
    input tri id_0,
    input wor id_1,
    output supply1 id_2,
    output tri id_3,
    output wire id_4,
    input supply0 id_5,
    input tri id_6,
    input wor id_7
);
  wire id_9;
  module_0 modCall_1 (
      id_0,
      id_1,
      id_1
  );
endmodule
