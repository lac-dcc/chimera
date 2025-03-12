// Seed: 341505210
module module_0 (
    input wand  id_0,
    input tri1  id_1,
    input tri1  id_2,
    input uwire id_3
);
  wire id_5;
endmodule
module module_1 (
    input wor id_0,
    output supply1 id_1,
    output wor id_2,
    input wire id_3,
    input uwire id_4,
    input supply0 id_5,
    input tri0 id_6
);
  wire id_8;
  module_0 modCall_1 (
      id_6,
      id_5,
      id_5,
      id_0
  );
  assign modCall_1.id_2 = 0;
endmodule
module module_2 (
    output logic id_0,
    input tri id_1,
    input supply1 id_2,
    input supply1 id_3,
    output logic id_4,
    input wor id_5
);
  always @(posedge -1 or posedge 1) begin : LABEL_0
    if (1) begin : LABEL_1
      if (-1)
        if (1) begin : LABEL_2
          assume (id_2);
        end
    end else begin : LABEL_3
      #1 begin : LABEL_4
        id_0 = id_2;
        id_4 = new;
      end
      assume (-1);
    end
  end
  module_0 modCall_1 (
      id_2,
      id_5,
      id_2,
      id_1
  );
  assign modCall_1.id_0 = 0;
  localparam id_7 = -1;
  assign id_4 = id_0++;
  integer id_8;
endmodule
