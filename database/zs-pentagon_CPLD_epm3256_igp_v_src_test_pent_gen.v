// This program was cloned from: https://github.com/MikhaelKaa/zs-pentagon
// License: MIT License

`timescale 1 ns / 1 ns

module test_pent_gen;
//rval = 71;
//`timescale 71 ns / 71 ns
// timescale 71.42857ns

reg _clk14m = 0;
wire _C1, _C25, _C2, _C31, _C3, _B1, _B2, _B3, _B4, _B5, _B6, _SSI;


//устанавливаем экземпляр тестируемого модуля
pent_gen pent_gen_inst(
  .clk14m(_clk14m),
  .C1(_C1),
  .C25(_C25),
  .C2(_C2),
  .C31(_C31),
  .C3(_C3),
  .B1(_B1),
  .B2(_B2),
  .B3(_B3),
  .B4(_B4),
  .B5(_B5),
  .B6(_B6),
  .SSI(_SSI)
);



initial
begin
  //rval = 71;
  //#0 rval = 71;
  //_clk14m = 0;
end

//моделируем сигнал тактовой частоты
always
  #35 _clk14m = ~_clk14m;

//от начала времени...
/*initial
  begin
    iorq_ = 1;
    #1;
    rd_ = 1;
    #1;
    adr_ = 16'h0000;
    #1;
    iorq_ = 0;
    #1;
    rd_ = 0;
    #1;
    adr_ = 16'h0000;
    #1;
    iorq_ = 0;
    #1;
    rd_ = 0;
    #1;
    adr_ = 16'hfadf;
    #1;
    iorq_ = 1;
    #1;
    rd_ = 0;
    #1;
    adr_ = 16'hfadf;
    #1;
    iorq_ = 0;
    #1;
    rd_ = 1;
    #1;
    adr_ = 16'hfadf;
    #1;
    iorq_ = 0;
    #1;
    rd_ = 0;
    #1;
    adr_ = 16'hfbdf;
    #1;
    iorq_ = 1;
    #1;
    rd_ = 0;
    #1;
    adr_ = 16'hfbdf;
    #1;
    iorq_ = 0;
    #1;
    rd_ = 1;
    #1;
    adr_ = 16'hfbdf;
end*/

//заканчиваем симуляцию в момент времени "40000000" - несколько кадров
initial
begin
  #40000000 $finish;
end

//создаем файл VCD для последующего анализа сигналов
initial
begin
  $dumpfile("test_pent.vcd");
  $dumpvars(0, pent_gen_inst);
end

//наблюдаем на некоторыми сигналами системы
//initial
//$monitor($stime,, _clk14m,, _C1,, _C25,, _C2,, _C31,, _C3,, _B1,, _B2,, _B3,, _B4,, _B4,, _B5,, _B6);

endmodule
