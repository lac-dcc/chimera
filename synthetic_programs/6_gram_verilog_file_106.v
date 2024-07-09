module module_0;
  assign id_1 = 1;
  logic id_2;
  logic id_3 (
      .id_2(id_2),
      ~id_2[1]
  );
  assign id_1 = 1 ? {1{id_2}} : id_2;
  logic id_4 (
      .id_3(id_3),
      id_2
  );
  logic id_5;
  assign id_3 = id_5;
  assign id_1 = id_2;
  logic id_6;
  logic [~  id_2 : id_6] id_7;
  assign id_6 = id_5;
  id_8  id_9;
  logic id_10;
  assign id_4[id_9] = id_2[id_3 : id_1];
  id_11 id_12;
  logic id_13;
  assign id_10 = id_8;
  assign id_11 = 1;
  id_14 id_15 (
      .id_2(1),
      .id_8(id_5),
      .id_1(id_3)
  );
  id_16 id_17 (
      .id_7 (id_11[id_1]),
      .id_14(1),
      .id_7 (id_13),
      .id_3 (id_14 & (~id_8) & id_15[id_11] & 1 & id_15 & id_11)
  );
  id_18 id_19 ();
  input id_20;
  id_21 id_22 (
      .id_18(1),
      .id_2 (id_15)
  );
  logic id_23;
  always @(posedge id_16 or posedge (id_19)) begin
    id_2[id_10[id_17]] = id_21 & id_9;
    id_7 = id_20;
  end
endmodule
